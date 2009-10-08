From: myuboot at fastmail.fm <myuboot@fastmail.fm>
Date: Thu, 08 Oct 2009 10:09:32 -0500
Subject: [Buildroot] compile linux-2.6.31 with buildroot-2009.08 error
Message-ID: <1255014572.21050.1338958325@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to a buildroot-2009.08 to compile kernel linux-2.6.31.
Basically I first make menuconfig to set all the configurations, and
then manually select the kernel to be 2.6.31. But I got the following
error - "/asm/war.h:12:17: error: war.h: No suchfile or directory". Has
any seen it before? Any idea how to fix it?

--------------------------------------------------------------------------------------
mv
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/localversion*
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/root/boot
mv: cannot stat
`/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/localversion*':
No such file or directory
make:
[/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/.depend_done]
Error 1 (ignored)
/usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=mips
INSTALL_MOD_PATH=/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/root
CROSS_COMPILE=/home/root123/sources/buildroot-2009.08-k/build_mips/staging_dir/usr/bin/mips-linux-uclibc-
LDFLAGS="-L/home/root123/sources/buildroot-2009.08-k/build_mips/staging_dir/lib
-L/home/root123/sources/buildroot-2009.08-k/build_mips/staging_dir/usr/lib
--sysroot=/home/root123/sources/buildroot-2009.08-k/build_mips/staging_dir/"
LZMA="/home/root123/sources/buildroot-2009.08-k/toolchain_build_mips/bin/lzma"
PATH=/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/u-boot-tools:/home/root123/sources/buildroot-2009.08-k//build_mips/staging_dir/usr/bin:/home/root123/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/stuff/bitbake/bin
-C
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31
prepare
make[1]: Entering directory
`/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31'
scripts/kconfig/conf -s arch/mips/Kconfig
make[1]: Leaving directory
`/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31'
make[1]: Entering directory
`/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31'
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  CHK     include/linux/utsrelease.h
  UPD     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-mips
  CC      kernel/bounds.s
  GEN     include/linux/bounds.h
  CC      arch/mips/kernel/asm-offsets.s
In file included from
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/bitops.h:24,
                 from include/linux/bitops.h:17,
                 from include/linux/kernel.h:15,
                 from include/linux/sched.h:52,
                 from arch/mips/kernel/asm-offsets.c:13:
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:12:17:
error: war.h: No suchfile or directory
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:82:2:
error: #error Check setting of R4600_V1_INDEX_ICACHEOP_WAR for your
platform
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:112:2:
error: #error Check setting of R4600_V1_HIT_CACHEOP_WAR for your
platform
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:128:2:
error: #error Check setting of R4600_V2_HIT_CACHEOP_WAR for your
platform
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:141:2:
error: #error Check setting of R5432_CP0_INTERRUPT_WAR for your platform
/home/root123/sources/buildroot-2009.08-k/project_build_mips/f1/linux-2.6.31/arch/mips/include/asm/war.h:155:2:
error: #error Check setting of BCM1250_M3_WAR for your platform
@
