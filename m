From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 20 Dec 2007 14:35:18 +0000
Subject: [Buildroot] Build error
Message-ID: <476A7DA6.7000102@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I am trying to build for an arm target. I have successfully built an 
image with just the basic packages selected by default. However I then 
add in the qtopia4 package and nothing else and get this error when 
trying to link the kernel:

rm -f
/home/willw/buildroot/project_build_arm/badger/_fakeroot."rootfs".arm.tar
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os -pipe
-I/home/willw/buildroot/build_arm/staging_dir/usr/include
-I/home/willw/buildroot/build_arm/staging_dir/include
--sysroot=/home/willw/buildroot/build_arm/staging_dir/ -isysroot
/home/willw/buildroot/build_arm/staging_dir -mtune=arm1136jf-s"
INSTALL_MOD_PATH=/home/willw/buildroot/project_build_arm/badger/root
CROSS_COMPILE=/home/willw/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi- 

LDFLAGS="-L/home/willw/buildroot/build_arm/staging_dir/lib
-L/home/willw/buildroot/build_arm/staging_dir/usr/lib
--sysroot=/home/willw/buildroot/build_arm/staging_dir/"
LZMA="/home/willw/buildroot/toolchain_build_arm/bin/lzma"  \
                 -C
/home/willw/buildroot/project_build_arm/badger/linux-2.6.19.2 zImage
make[1]: Entering directory
`/home/willw/buildroot/project_build_arm/badger/linux-2.6.19.2'
   CHK     include/linux/version.h
make[2]: `include/asm-arm/mach-types.h' is up to date.
   CHK     include/linux/utsrelease.h
   CHK     include/linux/compile.h
   GEN     usr/initramfs_data.cpio.gz
   AS      usr/initramfs_data.o
   LD      usr/built-in.o
   GEN     .version
   CHK     include/linux/compile.h
   UPD     include/linux/compile.h
   CC      init/version.o
   LD      init/built-in.o
   LD      .tmp_vmlinux1
init/built-in.o: In function `init':
calibrate.c:(.text+0x68): relocation truncated to fit: R_ARM_CALL
against symbol `spawn_ksoftirqd' defined in .init.text section in
kernel/built-in.o
calibrate.c:(.text+0x6c): relocation truncated to fit: R_ARM_CALL
against symbol `sched_init_smp' defined in .init.text section in
kernel/built-in.o
calibrate.c:(.text+0x70): relocation truncated to fit: R_ARM_CALL
against symbol `populate_rootfs' defined in .init.text section in
init/built-in.o
calibrate.c:(.text+0x78): relocation truncated to fit: R_ARM_CALL
against symbol `usermodehelper_init' defined in .init.text section in
kernel/built-in.o
calibrate.c:(.text+0x7c): relocation truncated to fit: R_ARM_CALL
against symbol `driver_init' defined in .init.text section in
drivers/built-in.o
calibrate.c:(.text+0x80): relocation truncated to fit: R_ARM_CALL
against symbol `sysctl_init' defined in .init.text section in
kernel/built-in.o
calibrate.c:(.text+0x194): relocation truncated to fit: R_ARM_CALL
against symbol `prepare_namespace' defined in .init.text section in
init/built-in.o
init/built-in.o: In function `loglevel':
calibrate.c:(.init.text+0x174): relocation truncated to fit: R_ARM_CALL
against symbol `get_option' defined in .text section in
lib/lib.a(cmdline.o)
init/built-in.o: In function `maxcpus':
calibrate.c:(.init.text+0x1a8): relocation truncated to fit: R_ARM_CALL
against symbol `get_option' defined in .text section in
lib/lib.a(cmdline.o)
init/built-in.o: In function `unknown_bootoption':
calibrate.c:(.init.text+0x1d8): relocation truncated to fit: R_ARM_CALL
against symbol `strlen' defined in .text section in lib/lib.a(string.o)
calibrate.c:(.init.text+0x214): additional relocation overflows omitted
from the output
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory
`/home/willw/buildroot/project_build_arm/badger/linux-2.6.19.2'
make: ***
[/home/willw/buildroot/binaries/badger/linux-kernel-2.6.19.2-arm] Error
2

Can someone explain what the errors mean? It appears to be an error when 
linking the kernel but how can adding a package cause this?

Any help is much appreciated.

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
