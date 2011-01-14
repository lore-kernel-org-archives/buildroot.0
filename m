From: Daniele Salvatore Albano <info@daccii.it>
Date: Fri, 14 Jan 2011 09:41:17 +0100
Subject: [Buildroot] Nginx support
Message-ID: <4D300C2D.2070705@daccii.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i'm trying to compile nginx using buildroot but i got some blocking 
problems. While nginx is really a fast, lightweight and modular 
webserver, it uses an hand made build script that doesn't support cross 
compiling.

To compile it using buildroot i've made some modification to the bash 
scripts that handle the build, but:
- the build script tries to start every feature that needs to be checked 
(some c code passed externally from other scripts);
- the build script tries to start some c compiled code to determine the 
length of int, long and long long.

While, i think, i can fix the first (i just need to let the code to know 
if it is testing and include or not), i don't know how to fix the second.

Someone can give me an hint? Where i can get these architecture specific 
informations?


Thank you!

Best Regards,
Daniele

-- 
Daniele Salvatore Albano
____________________________________________________________
                                         |
Daniele Salvatore Albano                | web site:
  IT Consultant                          | http://www.daccii.it
  Website Design and Development         |
  Software Engineer and Developer        | e-mail:
  Linux Servers SetUp And Administration | info at daccii.it
  Embedded Network Solutions             | d.albano at gmail.com

Ai sensi del D.Lgs. 196/2003 si precisa che le informazioni contenute in questo messaggio sono riservate ed a uso esclusivo del destinatario. Qualora il messaggio in parola Le fosse pervenuto per errore, La invitiamo ad eliminarlo senza copiarlo e a non inoltrarlo a terzi, dandocene gentilmente comunicazione. Grazie.
Pursuant to Legislative Decree No. 196/2003, you are hereby informed that this message contains confidential information intended only for the use of the addressee. If you are not the addressee, and have received this message by mistake, please delete it and immediately notify us. You may not copy or disseminate this message to anyone. Thank you.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: info.vcf
Type: text/x-vcard
Size: 287 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110114/092af3cf/attachment-0001.vcf>
