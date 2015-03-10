From: Jan Erichsen <jan@erichsen-web.de>
Date: Tue, 10 Mar 2015 07:16:21 +0100
Subject: [Buildroot] php-cgi not executing .php-file
Message-ID: <4318ea066b1d4331be3d63f7f2357bad@webmail-alfa3071.alfahosting-server.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi everyone, 

I have got a problem with my php-cgi. It is not executing the php-file,
but echos out the source code instead. 

# php-cgi -T -f /var/www/index.php
X-Powered-By: PHP/5.5.22
Content-type: text/html

<?php

echo "Hello from Nios II";

?>
Elapsed time: 0.025940 sec

I am running it on an Altera DE2-115 Board using Nios II as processor. I
used an external toolchain to build the system (toolchain-mmu/x86-linux2
from Nios II Linux Tarball @
ftp://ftp.altera.com/outgoing/nios2-linux/20120802/). 

My settings in buildroot are as follow: 

[*] php
 Extensions --->
 [*] Session
 [*] zlib
 [*] JSON
 [*] sockets
 [*] Posix
 Interface (CGI) --> 

Using the same php-file on debian it is parsed correctly: 

root at debian:/# php-cgi -T -f /media/sf_shared/index.php 
X-Powered-By: PHP/5.4.36-0+deb7u3
Content-type: text/html

Hello from Nios II
Elapsed time: 0.002488 sec

What could be the problem here?
If you need more information please let me know. 

With best regards, 

Jan 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150310/a643b019/attachment.html>
