From: Rae_Samant at emc.com <Rae_Samant@emc.com>
Date: Thu, 20 Sep 2007 13:20:40 -0400
Subject: [Buildroot] EABI option required ?
Message-ID: <7EDF9790847B6B459CE09E1355BE138D2344A5@CORPUSMX10C.corp.emc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
 I am trying to build a toolchain using buildroot and use that toolchain
to build
 Kernel and ramdisk for ARM 926EJ-Sid.

Is EABI option for toolchain required ?
 
 I used option OABI -- resulting in my shell not working.( Kernel comes
up but linuxrc does not execute. Seems that shell does not execute.).
> BR2_ARM_OABI=y
> # BR2_ARM_EABI is not set

 If I use option EABI, then the kernel does not compile:
< # BR2_ARM_OABI is not set
< BR2_ARM_EABI=y

Kernel compile Gives following error:

[root@raes linux-feroceon_2_2_2_NAS_GDP]# make uImage
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  SYMLINK include/asm -> include/asm-arm
  SPLIT   include/linux/autoconf.h -> include/config/*
  CC      scripts/mod/empty.o
cc1: error: invalid option `abi=aapcs-linux'
make[2]: *** [scripts/mod/empty.o] Error 1
make[1]: *** [scripts/mod] Error 2
make: *** [scripts] Error 2

My tools are old:
Buildroot: Daily snapshot of 20060906:
My gcc: 3.4.6
Busybox: 1.2.0

I am using kernel 2.6.12.6 patched with linux-feroceon_2_2_2_NAS_GDP
patch from marvell.
It does not compile with GCC 4.1.2 or later.

Kernel debugging also does not compile
(include/asm-arm/mach-feroceon/debug-macro.S is unavaliable).

The output with Gcc 3.4.6 compiled with is still same:

---------------
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP established hash table entries: 16384 (order: 5, 131072 bytes)
TCP bind hash table entries: 16384 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 16384 bind 16384)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 104K
init started:  BusyBox v1.2.0-svn (2007.09.20-17:56+0000) multi-call
binary
Starting pid 255, console /dev/ttyS0: '/etc/init.d/rcS'
Bummer, could not run '/etc/init.d/rcS': No such file or directory
Starting pid 256, console /dev/ttyS0: '/bin/sh'
Process '-/bin/sh' (pid 256) exited.  Scheduling it for restart.
Starting pid 257, console /dev/ttyS0: '/bin/sh'
(--keeps repeating--)
--------------

Please help me out of this problem if possible.
Thanks very much for kind attention.

Regards,
samant
