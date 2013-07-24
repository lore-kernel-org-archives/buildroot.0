From: Anna Fischer (novero/Bochum) <Anna.Fischer@novero.com>
Date: Wed, 24 Jul 2013 12:02:23 +0200
Subject: [Buildroot] Problems building for ucLinux/ARM with elf2flt enabled
Message-ID: <CBB26B88EF85F6489575628B28ECBE6D432860618A@ablexc01.internal.novero.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build a ucLinux system for an ARM platform (no-MMU), but when trying to enabled elf2flt in the menuconfig I get the following error:

/home/buildroot-2013.05/output/build/host-binutils-2.21.1/bfd/libbfd.a(compress.o): In function `bfd_compress_section_contents':
compress.c:(.text+0x25): undefined reference to `compressBound'
/home//buildroot-2013.05/output/build/host-binutils-2.21.1/bfd/libbfd.a(compress.o): In function `bfd_get_full_section_contents':
compress.c:(.text+0x226): undefined reference to `inflateEnd'
compress.c:(.text+0x37a): undefined reference to `inflateInit_'
compress.c:(.text+0x3b0): undefined reference to `inflate'
compress.c:(.text+0x3bf): undefined reference to `inflateReset'
collect2: ld returned 1 exit status
make[1]: *** [elf2flt] Error 1
make[1]: Leaving directory `/home/buildroot-2013.05/output/toolchain/elf2flt'
make: *** [/home/buildroot-2013.05/output/toolchain/elf2flt/elf2flt] Error 2

It seems like it is missing libz? But I don't quite understand why, because I definitely have it installed on the system. Anyone ever seen this before?

I'm using the buildroot internal toolchain, uClibc-0.9.33.2, gcc-4.7.3, linux-3.8, and this is buildroot-2013.05. I have attached my .config as well. My build host is Ubuntu 64-bit.

Thanks for any pointers.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 32645 bytes
Desc: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130724/4ec04577/attachment-0001.obj>
