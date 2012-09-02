From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Sun, 2 Sep 2012 20:06:46 +0200
Subject: [Buildroot] Problems building Busybox 1.20.1 with Buildroot 2012.05
Message-ID: <CAMPeO9x61f+1fU+qdOTQav3MEbqZRG8X2SR+WLjeQgHRWxsC4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to build a Buildroot toolchain using configuration files for
Buildroot and uClibc downloaded from the official forum.

During the full building process with Buildroot, I get the next error in
Busybox building, and I'm blocked there:


...
...
LINK    busybox_unstripped
Trying libraries: crypt m
Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
Output of:
/home/larcen/Escritorio/datos/
Master/PFM/fuente-arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-pipe -mfpu=vfp -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/toolchain/linux/include
-Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused
-Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes
-Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition
-fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer
-ffunction-sections -fdata-sections -fno-guess-branch-probability
-funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1
-falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped
-Wl,--sort-common -Wl,--sort-section,alignment -Wl,--gc-sections
-Wl,--start-group applets/built-in.o archival/lib.a
archival/libarchive/lib.a console-tools/lib.a coreutils/lib.a
coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a
editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a
loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a
networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a
printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a
sysklogd/lib.a util-linux/lib.a util-linux/volume_id/lib.a
archival/built-in.o archival/libarchive/built-in.o console-tools/built-in.o
coreutils/built-in.o coreutils/libcoreutils/built-in.o
debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o
findutils/built-in.o init/built-in.o libbb/built-in.o libpwdgrp/built-in.o
loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o
modutils/built-in.o networking/built-in.o networking/libiproute/built-in.o
networking/udhcp/built-in.o printutils/built-in.o procps/built-in.o
runit/built-in.o selinux/built-in.o shell/built-in.o sysklogd/built-in.o
util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group
-Wl,--start-group -lcrypt -lm -Wl,--end-group
==========
networking/lib.a(nslookup.o): In function `nslookup_main':
nslookup.c:(.text.nslookup_main+0x2c): undefined reference to `__res_init'
nslookup.c:(.text.nslookup_main+0x54): undefined reference to `__res_state'
nslookup.c:(.text.nslookup_main+0x78): undefined reference to `__res_state'
nslookup.c:(.text.nslookup_main+0x8c): undefined reference to `__res_state'
collect2: error: ld devolvi? el estado de salida 1
make[1]: *** [busybox_unstripped] Error 1
make[1]: se sale del directorio
`/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/build/busybox-1.20.1'
make: ***
[/home/larcen/Escritorio/datos/Master/PFM/fuente-arm/buildroot/output/build/busybox-1.20.1/.stamp_built]
Error 2



I have tried to find where the problem could be, but I couldn't. I have
changed Busybox, GCC and uClibc versions but nothing works. I have changed
the machine too, from my x86_64 Debian Testing to a x86 Debian Stable one,
with no result. I have reviewed the configuration files but changes have
not worked.

Please, could you help me to find where the problem is??

Thanks in advance, David.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120902/d2b1e868/attachment.html>
