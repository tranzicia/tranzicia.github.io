#!/bin/bash
today=`date +"%d.%m.%Y"`
echo "</article> </main> <footer> \
<p>* updated $today * local trans smolweb * <a>tranziciask@protonmail.com</a> *</p>\
</footer>" > footer.html

for mdfile in md/*.md; do
    filename=$(basename -- "$mdfile")
    base_name="${filename%.md}"
    pandoc "$mdfile" -o "${base_name}.html" 
    temp_file=$(mktemp)
    cat header.html "${base_name}.html" footer.html > "$temp_file"
    mv "$temp_file" "${base_name}.html"
    echo "Processed $mdfile -> ${base_name}.html"
done