From: Michel Benoit <murpme@gmail.com>
Date: Thu, 1 Feb 2007 01:09:45 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
Message-ID: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a toolchain with soft floating point enabled for
ARM arm26t target platform.  I'm doing this in order to build u-boot
for my target.

I downloaded the latest verison of buildroot and selected "Use
software floating point by defaul" in buildroot menuconfig and
unselected "Target CPU has a floating point unit (FPU) " in
uclib-menuconfig.

The build stops due to missing symbols while linking uclibc:

make[1]: Entering directory
`/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc'
  LD libuClibc-0.9.29.so
libc/libc_so.a(difftime.os): In function `difftime':
difftime.c:(.text+0x8): undefined reference to `__floatsidf'
difftime.c:(.text+0x2c): undefined reference to `__subdf3'
libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':
_fpmaxtostr.c:(.text+0xd4): undefined reference to `__nedf2'
_fpmaxtostr.c:(.text+0xf8): undefined reference to `__eqdf2'
_fpmaxtostr.c:(.text+0x114): undefined reference to `__divdf3'
_fpmaxtostr.c:(.text+0x120): undefined reference to `__ltdf2'
_fpmaxtostr.c:(.text+0x1c4): undefined reference to `__muldf3'
_fpmaxtostr.c:(.text+0x388): undefined reference to `__gedf2'
_fpmaxtostr.c:(.text+0x430): undefined reference to `__adddf3'
libc/libc_so.a(__psfs_do_numeric.os): In function `__psfs_do_numeric':
__psfs_do_numeric.c:(.text+0x520): undefined reference to `__truncdfsf2'
libc/libc_so.a(strtof.os): In function `strtof':
strtof.c:(.text+0x1c): undefined reference to `__extendsfdf2'
/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_fixunsdfsi.o):
In function `__fixunsdfsi':
libgcc2.c:(.text+0x34): undefined reference to `__fixdfsi'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/home/michel/Projects/sepab/exyplus/sw/bsp/build/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a]
Error 2


Are there any other config options that need to be selected/unselected
in order to get this to work?

Michel
