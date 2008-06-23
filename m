From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 14:22:25 +0200
Subject: [Buildroot] uClibc missing limits.h
Message-ID: <485F9581.2040204@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've found a way for uClibc to find headers that are not in the $(shell $CC -print-file-name=include), but in $(shell $CC -print-file-name=include)-fixed.
According to http://sourceware.org/ml/libc-alpha/2007-03/msg00017.html LIBC should also look in other gcc provided header directories (eg. include-fixed) instead only relying on 'include' to contain all correct headers.

Below is uClibc patch for this (tested on cris).

Best regards,
Hinko
-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.29-use-gcc-include-fixed-dir.patch
Type: text/x-patch
Size: 461 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080623/85c66671/attachment.bin 
