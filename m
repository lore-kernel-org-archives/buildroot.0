From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:33:51 +0200
Subject: [Buildroot] mips64/uclibc toolchain issue
Message-ID: <20151018153351.1c5e36f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For the autobuilders, I've tried to build the following toolchain
configuration:

BR2_mips64el=y
BR2_mips_64r2=y
BR2_MIPS_NABI64=y
# BR2_MIPS_SOFT_FLOAT is not set
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_23_X=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

and it fails with:

  CC libc/sysdeps/linux/common/_exit.os
libc/sysdeps/linux/mips/swapcontext.S: Assembler messages:
libc/sysdeps/linux/mips/swapcontext.S:110: Error: Illegal operands `s.d fs6,(30*8+296)($4)'
libc/sysdeps/linux/mips/swapcontext.S:111: Error: Illegal operands `s.d fs7,(31*8+296)($4)'
libc/sysdeps/linux/mips/swapcontext.S:149: Error: Illegal operands `l.d fs6,(30*8+296)($2)'
libc/sysdeps/linux/mips/swapcontext.S:150: Error: Illegal operands `l.d fs7,(31*8+296)($2)'
  CC libc/sysdeps/linux/common/access.os
make[1]: *** [libc/sysdeps/linux/mips/swapcontext.os] Error 1
make[1]: *** Waiting for unfinished jobs....
libc/sysdeps/linux/mips/getcontext.S: Assembler messages:
libc/sysdeps/linux/mips/getcontext.S:101: Error: Illegal operands `s.d fs6,(30*8+296)($4)'
libc/sysdeps/linux/mips/getcontext.S:102: Error: Illegal operands `s.d fs7,(31*8+296)($4)'
make[1]: *** [libc/sysdeps/linux/mips/getcontext.os] Error 1
  CC libc/sysdeps/linux/common/acct.os
libc/sysdeps/linux/mips/setcontext.S: Assembler messages:
libc/sysdeps/linux/mips/setcontext.S:99: Error: Illegal operands `l.d fs6,(30*8+296)($2)'
libc/sysdeps/linux/mips/setcontext.S:100: Error: Illegal operands `l.d fs7,(31*8+296)($2)'
make[1]: *** [libc/sysdeps/linux/mips/setcontext.os] Error 1
make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-1.0.6'
make: *** [/opt/toolchain-build/build/uclibc-1.0.6/.stamp_built] Error 2
make: Leaving directory `/home/test/toolchains/build/buildroot'

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
