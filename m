From: Leonid <Leonid@a-k-a.net>
Date: Wed, 26 Sep 2007 18:11:55 -0700
Subject: [Buildroot] Endianness problem
In-Reply-To: <1190854406.4933.78.camel@elrond.atmel.sweden>
References: <1190854406.4933.78.camel@elrond.atmel.sweden>
Message-ID: <406A31B117F2734987636D6CCC93EE3C023DCDE1@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

I am compiling buildroot for generic arm on i386 PC (see .config file
attached). uClibc compilation fails:

.............................
  LD libuClibc-0.9.29.so
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_udivsi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_udivsi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_divsi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_divsi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_umodsi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_umodsi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_modsi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_modsi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_dvmd_lnx.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_dvmd_lnx.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_muldi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_muldi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_divdi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_divdi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_moddi3.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_moddi3.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld:
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_clz.o): compiled for a little endian
system and target is big endian
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: failed to merge target specific data of file
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/lib/gcc/ar
m-linux-uclibc/4.1.2/libgcc.a(_clz.o)
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: BFD 2.17 assertion fail
/home/leonid/LM150/software/linux/rootfs/buildroot-atmel/toolchain_build
_arm_small/binutils-2.17/bfd/elf32-arm.c:3740
/home/leonid/LM150/software/linux/rootfs/arm-gcc-4.1.2-uclibc/bin/arm-li
nux-uclibc-ld: BFD 2.17 assertion fail
/home/leonid/LM150/software/linux/rootfs/buildroot-atmel/toolchain_build
_arm_small/binutils-2.17/bfd/elf32-arm.c:3740
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/leonid/LM150/software/linux/rootfs/buildroot-atmel/toolchain_buil
d_arm_small/uClibc-0.9.29'
make: ***
[/home/leonid/LM150/software/linux/rootfs/buildroot-atmel/toolchain_buil
d_arm_small/uClibc-0.9.29/lib/libc.a] Error 2

What can be a reason?

Thanks,

Leonid.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dot_config
Type: application/octet-stream
Size: 17589 bytes
Desc: dot_config
Url : http://busybox.net/lists/buildroot/attachments/20070926/2358b8be/attachment-0001.obj 
