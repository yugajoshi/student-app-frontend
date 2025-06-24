FROM node:24-alpine
COPY . /opt/
WORKDIR /opt
RUN npm install
RUN npm run build
COPY dist/* /var/www/localhost/htdocs/
RUN apk update && apk add apache2
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
