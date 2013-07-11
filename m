From: laurent barattero <lolotremolo@gmail.com>
Date: Thu, 11 Jul 2013 17:21:41 +0200
Subject: [Buildroot] beaglebone using default beaglebone_defconfig (error:
 busybox_unstripped uses VFP register arguments... ...does not), 
Message-ID: <CAJG6REzrBV_wR3-Wa5nrnfOn6r=Q_UERjFfyRpLBdd_44_e-Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello, my only experience with buildroot is my successful test with
raspberry last week after reading an article of Pierre Ficheux. i 'm a
newbie and i'm not sure what i say.

it seems there is a problem with the beaglebone. I tried to change options to
the beaglebone_defconfig but I do not succeed.

suddenly I prefer to show you the problem with the default config.

$ git clone git://git.buildroot.net/buildroot
$ cd buildroot
$ make beaglebone_defconfig
$ make
...
==========
libbb/lib.a(inet_common.o): In function `INET_rresolve':
inet_common.c:(.text.INET_rresolve+0xcc): warning: gethostbyaddr is
obsolescent, use getaddrinfo() instead.
libbb/lib.a(inet_common.o): In function `INET_resolve':
inet_common.c:(.text.INET_resolve+0x5c): warning: gethostbyname is
obsolescent, use getnameinfo() instead.
debianutils/lib.a(mktemp.o): In function `mktemp_main':
mktemp.c:(.text.mktemp_main+0x98): warning: the use of `mktemp' is
dangerous, better use `mkstemp'
/home/lolo/code/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
error: busybox_unstripped uses VFP register arguments,
/home/lolo/code/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libm.so
does not
/home/lolo/code/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
failed to merge target specific data of file
/home/lolo/code/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libm.so
/home/lolo/code/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
error: busybox_unstripped uses VFP register arguments,
/home/lolo/code/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/uclibc_nonshared.a(atexit.os)
does not
/home/lolo/code/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
failed to merge target specific data of file
/home/lolo/code/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/uclibc_nonshared.a(atexit.os)
collect2: erreur: ld a retourn? 1 code d'?tat d'ex?cution
make[1]: *** [busybox_unstripped] Erreur 1
make[1] : on quitte le r?pertoire ?
/home/lolo/code/buildroot/output/build/busybox-1.21.1 ?
make: ***
[/home/lolo/code/buildroot/output/build/busybox-1.21.1/.stamp_built] Erreur
2
==========

I'm still not very comfortable with the cross-compiler and the kernel patch
s.
all help is welcome. it's more cool to learn with a system that works

thank you.

Laurent
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130711/313bcd87/attachment.html>
