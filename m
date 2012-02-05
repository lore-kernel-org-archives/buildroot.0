From: Daniele Salvatore Albano <info@daccii.it>
Date: Sun, 05 Feb 2012 15:07:27 +0100
Subject: [Buildroot] connman fails on uclibc
Message-ID: <4F2E8D1F.60600@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to get connman working on uclibc.

I've seen that connman has been commited to git so i've pulled last 
updates and trying with them.

However, i got two problems:
- connman wants uclibc snapshot, but uclibc-0.9.33 sholdn't works fine? 
resolver isn't there?
- connman wants backtrace support that, as far i understand, is a glibc 
specific feature, so i've made a simple patch to avoid using backtrace 
on uclibc, but there isn't any way to have backtrace on uclibc to make 
connman happy?

I'm using ct-ng 1.14.0 patched to support uclibc 0.9.33.

Initially i've compiled the toolchain with only 
UCLIBC_HAS_RESOLVER_SUPPORT without any success because connman 
configure continued to fail (ns_initparse symbol/resolver missing), so 
i've selected UCLIBC_HAS_LIBRESOLV_STUB, but i don't know if it will 
work, i'm yet compiling.

Any ideas?


Best Regards,
Daniele

-- 
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.itechcon.it
  Mobile Software Development            | http://www.daccii.it
  Webapps Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at itechcon.it
  Embedded Network Solutions             | d.albano at itechcon.it

Are you lazy? Take a look to LazyDroid (www.lazydroid.net): android for 
lazy people!

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
