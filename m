From: Daniele Salvatore Albano <info@daccii.it>
Date: Tue, 12 Apr 2011 14:35:33 +0200
Subject: [Buildroot] nginx
In-Reply-To: <4DA41D20.6000001@michaelburghart.de>
References: <4DA41D20.6000001@michaelburghart.de>
Message-ID: <4DA44715.1020006@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 12/04/2011 11:36, Michael Burghart ha scritto:
 > What I urgently need for using nginx as replacement for Apache is:
 > auth_mysql and mod_perl which shoud be possible. Have you tried that 
so far?
 >
 > http://code.svn.wordpress.org/nginx_auth_mysql/
 > http://wiki.nginx.org/NginxEmbeddedPerlModule

Well, while you can replace auth_mysql i think that a "mod_perl" for 
nginx doesn't exists: nginx embedded perl module is used to as an 
internal language to handle special conditions (i mean to write nginx 
config file parts in perl so it can do what you need programmatically).

If nginx_auth_mysql doesn't work, you can give a look to drizzle 
extension, that works with mysql too, to handle authentication.

Here there are links
http://github.com/chaoslawful/drizzle-nginx-module

If you can use pam, here there is a module that ask to pam for 
authentication
http://web.iti.upv.es/~sto/nginx/

(you need pam-mysql in order to use mysql as authentication backend)

In the end there is auth request that authorize an user using a 
subrequest, in this way you could do a little perl script called via web 
(nginx will use a sub-request) that will authorize the client to connect
http://mdounin.ru/hg/ngx_http_auth_request_module

Here some info on how to use it
http://mdounin.ru/hg/ngx_http_auth_request_module/file/a29d74804ff1/README

If mysql will run on the alix i suggest you to use a simple file based 
authentication because will reduce a lot the load of the system.

Regards perl, you need fast-cgi no other way, here some links
http://library.linode.com/web-servers/nginx/perl-fastcgi/debian-5-lenny
http://blog.oddeven.info/nginx-perl-fastcgi-how-to/
http://staff.adams.edu/~cdmiller/posts/nginx-perl-fastcgi/
http://stackoverflow.com/questions/369850/how-can-i-run-perl-scripts-using-fastcgi-on-nginx

Hope this helps,

Best Regards,
Daniele
-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.itechcon.it
  Website Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at itechcon.it
  Embedded Network Solutions             | d.albano at itechcon.it

Ai sensi del D.Lgs. 196/2003 si precisa che le informazioni contenute in 
questo messaggio sono riservate ed a uso esclusivo del destinatario. 
Qualora il messaggio in parola Le fosse pervenuto per errore, La 
invitiamo ad eliminarlo senza copiarlo e a non inoltrarlo a terzi, 
dandocene gentilmente comunicazione. Grazie.
Pursuant to Legislative Decree No. 196/2003, you are hereby informed 
that this message contains confidential information intended only for 
the use of the addressee. If you are not the addressee, and have 
received this message by mistake, please delete it and immediately 
notify us. You may not copy or disseminate this message to anyone. Thank 
you.
