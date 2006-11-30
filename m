From: Michael Moser <mmoser@moser-engineering.de>
Date: Thu, 30 Nov 2006 23:36:30 +0100
Subject: [Buildroot] Build fails with zlib.h not found
Message-ID: <456F5CEE.7060405@moser-engineering.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I try to build a tool chain and initial filesystem for a xscale
prozessor which uses a jffs2 file system. This fails with the following
messages:

 > make[1]: Entering directory `/home/michael/development/buildroot/toolchain_build_arm/mtd_orig/util'
 > gcc -I../include -O2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
 > mkfs.jffs2.c:68:18: zlib.h: File or Directory not found
 > make[1]: *** [mkfs.jffs2.o] Error 1
 > make[1]: Leaving directory `/home/michael/development/buildroot/toolchain_build_arm/mtd_orig/util'
 > make: *** [/home/michael/development/buildroot/toolchain_build_arm/mtd_orig/util/mkfs.jffs2] Fehler 2

I already tried to change the make file and specifed a path to zlib.h
within the buildroot environment. Then the compilation succeeds but the
linker didn't find a compatible libz

I use gcc 4.1.1 on my development machine.

Can anyone give me some hints?

Regards,
Michael
