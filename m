From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 4 Sep 2013 14:37:29 +0200
Subject: [Buildroot] running make uclibc-menuconfig fails if the ccache is
	enabled
Message-ID: <3F8CB6BE81D541A8AC9D3FF801EFC125@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
When executing  a make uclibc-menuconfig before anything has been build fails if the ccache is enabled in the config file.
 
It's mandatory to make changes to the configuration of uclibc before anything is build.

 
Changing dir to /home/brcopy
mkdir -p /home/brcopy/output/target
rsync -a \
  --exclude .empty --exclude .svn --exclude .git \
  --exclude .hg --exclude=CVS --exclude '*~' \
  "/home/brcopy/board/karo/skeleton"/ /home/brcopy/output/target/
cp support/misc/target-dir-warning.txt /home/brcopy/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
touch /home/brcopy/output/build/.root
>>> uclibc 0.9.33.2 Extracting
xzcat /home/johan/dl/uClibc-0.9.33.2.tar.xz | tar --strip-components=1 -C /home/brcopy/output/build/uclibc-0.9.33.2  -xf -
>>> uclibc 0.9.33.2 Patching package//uclibc
 
Applying uclibc-0001-bits-time.h-sync-with-glibc-2.16.patch using patch: 
patching file libc/sysdeps/linux/common/bits/time.h
 
Applying uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CLOEXE.patch using patch: 
patching file libc/sysdeps/linux/common/bits/socket.h
 
Applying uclibc-0003-Add-dup3-syscall.patch using patch: 
patching file include/unistd.h
patching file libc/sysdeps/linux/common/dup3.c
 
Applying uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch using patch: 
patching file libc/sysdeps/linux/alpha/bits/kernel_types.h
patching file libc/sysdeps/linux/arm/bits/kernel_types.h
patching file libc/sysdeps/linux/avr32/bits/kernel_types.h
patching file libc/sysdeps/linux/bfin/bits/kernel_types.h
patching file libc/sysdeps/linux/c6x/bits/kernel_types.h
patching file libc/sysdeps/linux/cris/bits/kernel_types.h
patching file libc/sysdeps/linux/e1/bits/kernel_types.h
patching file libc/sysdeps/linux/h8300/bits/kernel_types.h
patching file libc/sysdeps/linux/hppa/bits/kernel_types.h
patching file libc/sysdeps/linux/i386/bits/kernel_types.h
patching file libc/sysdeps/linux/ia64/bits/kernel_types.h
patching file libc/sysdeps/linux/m68k/bits/kernel_types.h
patching file libc/sysdeps/linux/microblaze/bits/kernel_types.h
patching file libc/sysdeps/linux/mips/bits/kernel_types.h
patching file libc/sysdeps/linux/nios2/bits/kernel_types.h
patching file libc/sysdeps/linux/powerpc/bits/kernel_types.h
patching file libc/sysdeps/linux/sh/bits/kernel_types.h
patching file libc/sysdeps/linux/sh64/bits/kernel_types.h
patching file libc/sysdeps/linux/sparc/bits/kernel_types.h
patching file libc/sysdeps/linux/v850/bits/kernel_types.h
patching file libc/sysdeps/linux/x86_64/bits/kernel_types.h
patching file libc/sysdeps/linux/xtensa/bits/kernel_types.h
 
Applying uclibc-0005-Patch-from-OpenWRT-for-avr32.patch using patch: 
patching file libc/sysdeps/linux/avr32/bits/atomic.h
 
Applying uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch using patch: 
patching file libc/sysdeps/linux/arm/clone.S
 
Applying uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch using patch: 
patching file libc/sysdeps/linux/arm/clone.S
 
Applying uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch using patch: 
patching file ldso/ldso/arm/dl-startup.h
patching file ldso/ldso/arm/resolve.S
patching file libc/string/arm/_memcpy.S
patching file libc/string/arm/memcmp.S
patching file libc/string/arm/memset.S
patching file libc/string/arm/strcmp.S
patching file libc/string/arm/strlen.S
patching file libc/sysdeps/linux/arm/__longjmp.S
patching file libc/sysdeps/linux/arm/bits/arm_asm.h
patching file libc/sysdeps/linux/arm/bits/arm_bx.h
patching file libc/sysdeps/linux/arm/clone.S
patching file libc/sysdeps/linux/arm/mmap64.S
patching file libc/sysdeps/linux/arm/syscall-eabi.S
patching file libc/sysdeps/linux/arm/sysdep.h
patching file libc/sysdeps/linux/arm/vfork.S
 
Applying uclibc-0009-mips64-fix-n64-interp.patch using patch: 
patching file Rules.mak
Hunk #1 succeeded at 118 (offset -20 lines).
 
Applying uclibc-0010-Rules.mak-fix-breakage-from-603af30d.patch using patch: 
patching file Rules.mak
Hunk #1 succeeded at 121 (offset -20 lines).
 
Applying uclibc-0011-libc-add-non-standard-execvpe-function.patch using patch: 
patching file include/unistd.h
Hunk #1 succeeded at 568 (offset -51 lines).
patching file libc/unistd/exec.c
patching file libc/unistd/execvpe.c
 
Applying uclibc-0012-libc-stdlib-add-mkostemp-helpers.patch using patch: 
patching file include/stdlib.h
patching file libc/stdlib/Makefile.in
Hunk #1 succeeded at 12 with fuzz 1.
patching file libc/stdlib/mkostemp.c
patching file libc/stdlib/mkostemp64.c
cp -f /home/brcopy/board/karo/uClibc-0.9.33.config /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/CROSS_COMPILER_PREFIX/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'CROSS_COMPILER_PREFIX="/home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-"' >>
/home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/TARGET_arm/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'TARGET_arm=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/TARGET_ARCH/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'TARGET_ARCH="arm"' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/KERNEL_HEADERS/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'KERNEL_HEADERS="/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include"' >>
/home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/RUNTIME_PREFIX/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'RUNTIME_PREFIX="/"' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/DEVEL_PREFIX/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'DEVEL_PREFIX="/usr"' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/SHARED_LIB_LOADER_PREFIX/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'SHARED_LIB_LOADER_PREFIX="/lib"' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/CONFIG_ARM_CORTEXA8/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'CONFIG_ARM_CORTEXA8=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/CONFIG_ARM_.ABI/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/CONFIG_ARM_EABI/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'CONFIG_ARM_EABI=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/USE_BX/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'USE_BX=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/ARCH_LITTLE_ENDIAN/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'ARCH_LITTLE_ENDIAN=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/ARCH_WANTS_LITTLE_ENDIAN/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'ARCH_WANTS_LITTLE_ENDIAN=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/ARCH_BIG_ENDIAN/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# ARCH_BIG_ENDIAN is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/ARCH_WANTS_BIG_ENDIAN/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# ARCH_WANTS_BIG_ENDIAN is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_LFS/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_LFS=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_IPV6/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_IPV6=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_RPC/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_RPC=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_FULL_RPC/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_FULL_RPC=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_REENTRANT_RPC/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_REENTRANT_RPC=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_FPU/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_FPU=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_FLOATS/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_FLOATS=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_SSP/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# UCLIBC_HAS_SSP is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_BUILD_SSP/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# UCLIBC_BUILD_SSP is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_THREADS/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_THREADS=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/LINUXTHREADS_NEW/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# LINUXTHREADS_NEW is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/LINUXTHREADS_OLD/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# LINUXTHREADS_OLD is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_THREADS_NATIVE/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_THREADS_NATIVE=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/PTHREADS_DEBUG_SUPPORT/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'PTHREADS_DEBUG_SUPPORT=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_LOCALE/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_LOCALE=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_BUILD_ALL_LOCALE/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# UCLIBC_BUILD_ALL_LOCALE is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_BUILD_MINIMAL_LOCALE/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_BUILD_MINIMAL_LOCALE=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_BUILD_MINIMAL_LOCALES/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_BUILD_MINIMAL_LOCALES="en_US"' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_PREGENERATED_LOCALE_DATA/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# UCLIBC_PREGENERATED_LOCALE_DATA is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/DOWNLOAD_PREGENERATED_LOCALE_DATA/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# DOWNLOAD_PREGENERATED_LOCALE_DATA is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_XLOCALE/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_XLOCALE=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_GLIBC_DIGIT_GROUPING/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo '# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
/bin/sed -i -e '/UCLIBC_HAS_WCHAR/d' /home/brcopy/output/build/uclibc-0.9.33.2/.config
echo 'UCLIBC_HAS_WCHAR=y' >> /home/brcopy/output/build/uclibc-0.9.33.2/.config
yes "" | /usr/bin/make -j1 -C /home/brcopy/output/build/uclibc-0.9.33.2 ARCH="arm"
CROSS_COMPILE="/home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-" UCLIBC_EXTRA_CFLAGS=" "
HOSTCC="/home/brcopy/output/host/usr/bin/ccache /usr/bin/gcc"
PREFIX=/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot DEVEL_PREFIX=/usr/
RUNTIME_PREFIX=/home/brcopy/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot oldconfig
make[1]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[1]: Entering directory `/home/brcopy/output/build/uclibc-0.9.33.2'
make[1]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[1]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
  MKDIR include/config
make[2]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[2]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[2]: /home/brcopy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
  HOSTCC-o extra/config/conf.o
/bin/sh: /home/brcopy/output/host/usr/bin/ccache: No such file or directory
make[2]: *** [../../extra/config/conf.o] Error 127
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory `/home/brcopy/output/build/uclibc-0.9.33.2'
make: *** [/home/brcopy/output/build/uclibc-0.9.33.2/.stamp_patched] Error 2

Regards ,Johan
