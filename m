From: =?ISO-8859-15?Q?Markus_K=F6nigshaus?= <m.koenigshaus@wut.de>
Date: Mon, 18 Jul 2011 13:41:31 +0200
Subject: [Buildroot] Problem with toolchain generation
Message-ID: <4E241BEB.5010203@wut.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I try to generate a ARM - Toolchain for XSCALE ARM. My distro is
OpenSuse 11.4 (gcc 4.5.1 / binutils 2.21). Trying to "make" I get a
resolution error: symbol lookup error in
output/build/host-binutils-2.21:
usr/lib64/gcc/x86_64-suse-linux/4.5/../../../../x86_64-suse-linux/bin/ld: undefined
symbol: elf64_alpha_use_secureplt
collect2: ld returned 127 exit status

To fix this problem I simply comment out HOST_LIB_PATH_bfd in
output/build/host-binutils-2.21/Makefile - Not an elegant solution, but
it works. How can this be fixed?

Regards, Markus


-- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen 
auf Grundlage dieser Aussagen treffen.
Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
Registergericht: Amtsgericht Wuppertal, HRB 6377 
Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110718/dd9f6e13/attachment-0001.html>
