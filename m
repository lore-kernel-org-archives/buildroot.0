From: Grigory Ptashko <gptashko@cmmt.ru>
Date: Wed, 4 Nov 2009 01:24:56 +0300
Subject: [Buildroot] buildroot-2009.08 does not build on Ubuntu 9.10
Message-ID: <4d71bb0f0911031424s5ef63179m24a14c559d5782da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I've recently installed Ubuntu 9.10. Today I downloaded buildroot-2009.08.
It does not build in its default configuration.  I am attaching the output
from make, it is not big since it falis almost right after the build start.
Previously I used buildroot on Ubuntu 8.04LTS. Everything was ok. Can anyone
suggest me anything?

My Ubuntu version is:

trancer at terminal:/etc$ cat lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=9.10
DISTRIB_CODENAME=karmic
DISTRIB_DESCRIPTION="Ubuntu 9.10"


Thank you in advance,
Grigory.

-- 
? ?????????,
???????? ??????

+7 (916) 1489766
gptashko at cmmt.ru
http://www.cmmt.ru
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091104/144a891f/attachment-0001.htm>
-------------- next part --------------
if [ ! -e "/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed" ]; then \
		mkdir -p "/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin"; \
		rm -f "/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed"; \
		ln -sf "/bin/sed" \
			"/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed"; \
	fi

Checking build system dependencies:
BUILDROOT_DL_DIR clean:				Ok
CC clean:					Ok
CXX clean:					Ok
CPP clean:					Ok
CFLAGS clean:					Ok
INCLUDES clean:					Ok
CXXFLAGS clean:					Ok
which installed:				Ok
sed works:					Ok (/bin/sed)
GNU make version '3.81':			Ok
C compiler '/usr/bin/gcc'
C compiler version '4.4.1':			Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.4.1':			Ok
awk installed:					Ok
bash installed:					Ok
bison installed:				Ok
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:		    FALSE


Most likely some packages will fail to build their documentation
Either install 'makeinfo' on your host or fix the respective packages.
Makeinfo can usually be found in the texinfo package for your host.
Build system dependencies:			Ok

mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root
if ! [ -d "/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/bin" ]; then \
		if [ -d "target/generic/target_skeleton" ]; then \
			cp -fa target/generic/target_skeleton/* /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/; \
		fi; \
		if [ -d "" ]; then \
			toolchain/patch-kernel.sh /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root / \*patch\*; \
		fi; \
		touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/.fakeroot.00000; \
	fi
find /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
find /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root -type f -name .empty -print0 | xargs -0 rm -rf
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/.root
rm -rf /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/buildroot-config
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc
cp -dpRf package/config/buildroot-config /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/buildroot-config
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc
echo "" > /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc/issue
echo "" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc/issue
echo "Welcome to Buildroot" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc/issue
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc
echo "uclibc" > /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc/hostname
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc
echo "2009.08" >/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/project_build_i686/uclibc/root/etc/br-version
--2009-11-04 01:09:33--  http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.30.5.tar.bz2
?????????????? ?????? www.kernel.org... 149.20.20.133, 204.152.191.37
??????????????? ?????????? ? www.kernel.org|149.20.20.133|:80... ???????????.
?????? HTTP ??????, ???????? ??????... 200 OK
?????: 59427252 (57M) [application/x-bzip2]
??????????? ? ???????: `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/linux-2.6.30.5.tar.bz2'.

     0K .......... .......... .......... .......... ..........  0% 72,8K 13m17s
	...
 58000K .......... .......... .......... ....                 100%  759K=99s

2009-11-04 01:11:15 (585 KB/s) - `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/linux-2.6.30.5.tar.bz2' ???????? [59427252/59427252]

*** Using kernel-headers generated from kernel source
rm -rf /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux
[ -d /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686 ] || /usr/bin/install -d /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686
bzcat /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/linux-2.6.30.5.tar.bz2 | tar -C /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686   -xf -
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5/.unpacked
toolchain/patch-kernel.sh /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5 toolchain/kernel-headers \
		linux-2.6.30.5-\*.patch{,.gz,.bz2}
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5/.patched
(cd /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5; \
	 /usr/bin/make -j1 ARCH=i386 \
		HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" \
		HOSTCXX="/usr/bin/g++" \
		INSTALL_HDR_PATH=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux headers_install; \
	)
make[1]: ???? ? ??????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5'
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/basic/docproc
  HOSTCC  scripts/basic/hash
  HOSTCC  scripts/unifdef
  INSTALL include/asm-generic (12 files)
  INSTALL include/drm (12 files)
  INSTALL include/linux/byteorder (2 files)
  INSTALL include/linux/can (3 files)
  INSTALL include/linux/dvb (8 files)
  INSTALL include/linux/hdlc (1 file)
  INSTALL include/linux/isdn (1 file)
  INSTALL include/linux/netfilter (57 files)
  INSTALL include/linux/netfilter_arp (2 files)
  INSTALL include/linux/netfilter_bridge (16 files)
  INSTALL include/linux/netfilter_ipv4 (46 files)
  INSTALL include/linux/netfilter_ipv6 (21 files)
  INSTALL include/linux/nfsd (6 files)
  INSTALL include/linux/raid (2 files)
  INSTALL include/linux/spi (1 file)
  INSTALL include/linux/sunrpc (1 file)
  INSTALL include/linux/tc_act (6 files)
  INSTALL include/linux/tc_ematch (4 files)
  INSTALL include/linux/usb (8 files)
  INSTALL include/linux/wimax (1 file)
  INSTALL include/linux (350 files)
  INSTALL include/mtd (6 files)
  INSTALL include/rdma (1 file)
  INSTALL include/sound (9 files)
  INSTALL include/video (3 files)
  INSTALL include (0 file)
  INSTALL include/asm (52 files)
make[1]: ????? ?? ???????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux-2.6.30.5'
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux/.configured
--2009-11-04 01:16:12--  http://www.uclibc.org/downloads/uClibc-0.9.30.1.tar.bz2
?????????????? ?????? www.uclibc.org... 140.211.167.224
??????????????? ?????????? ? www.uclibc.org|140.211.167.224|:80... ???????????.
?????? HTTP ??????, ???????? ??????... 200 OK
?????: 2285137 (2,2M) [application/x-tar]
??????????? ? ???????: `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/uClibc-0.9.30.1.tar.bz2'.

     0K .......... .......... .......... .......... ..........  2% 72,2K 30s
    50K .......... .......... .......... .......... ..........  4%  113K 24s
   100K .......... .......... .......... .......... ..........  6%  222K 19s
   150K .......... .......... .......... .......... ..........  8%  624K 15s
   200K .......... .......... .......... .......... .......... 11%  279K 13s
   250K .......... .......... .......... .......... .......... 13% 1,11M 11s
   300K .......... .......... .......... .......... .......... 15%  286K 10s
   350K .......... .......... .......... .......... .......... 17%  855K 9s
   400K .......... .......... .......... .......... .......... 20%  123K 9s
   450K .......... .......... .......... .......... .......... 22% 1,65M 8s
   500K .......... .......... .......... .......... .......... 24% 2,22M 7s
   550K .......... .......... .......... .......... .......... 26%  295K 7s
   600K .......... .......... .......... .......... .......... 29% 2,23M 6s
   650K .......... .......... .......... .......... .......... 31% 1,02M 6s
   700K .......... .......... .......... .......... .......... 33%  248K 6s
   750K .......... .......... .......... .......... .......... 35% 1019K 5s
   800K .......... .......... .......... .......... .......... 38% 92,7K 6s
   850K .......... .......... .......... .......... .......... 40% 1,27M 5s
   900K .......... .......... .......... .......... .......... 42% 1,22M 5s
   950K .......... .......... .......... .......... .......... 44%  252K 5s
  1000K .......... .......... .......... .......... .......... 47% 1,54M 4s
  1050K .......... .......... .......... .......... .......... 49% 1,94M 4s
  1100K .......... .......... .......... .......... .......... 51% 2,25M 4s
  1150K .......... .......... .......... .......... .......... 53%  643K 3s
  1200K .......... .......... .......... .......... .......... 56%  269K 3s
  1250K .......... .......... .......... .......... .......... 58%  386K 3s
  1300K .......... .......... .......... .......... .......... 60%  321K 3s
  1350K .......... .......... .......... .......... .......... 62%  207K 3s
  1400K .......... .......... .......... .......... .......... 64%  345K 3s
  1450K .......... .......... .......... .......... .......... 67%  374K 2s
  1500K .......... .......... .......... .......... .......... 69%  259K 2s
  1550K .......... .......... .......... .......... .......... 71%  343K 2s
  1600K .......... .......... .......... .......... .......... 73%  312K 2s
  1650K .......... .......... .......... .......... .......... 76%  344K 2s
  1700K .......... .......... .......... .......... .......... 78%  293K 2s
  1750K .......... .......... .......... .......... .......... 80%  252K 1s
  1800K .......... .......... .......... .......... .......... 82%  363K 1s
  1850K .......... .......... .......... .......... .......... 85%  320K 1s
  1900K .......... .......... .......... .......... .......... 87%  273K 1s
  1950K .......... .......... .......... .......... .......... 89%  456K 1s
  2000K .......... .......... .......... .......... .......... 91%  278K 1s
  2050K .......... .......... .......... .......... .......... 94%  257K 0s
  2100K .......... .......... .......... .......... .......... 96%  432K 0s
  2150K .......... .......... .......... .......... .......... 98%  292K 0s
  2200K .......... .......... .......... .                    100%  185K=7,2s

2009-11-04 01:16:21 (308 KB/s) - `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/uClibc-0.9.30.1.tar.bz2' ???????? [2285137/2285137]

mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686
rm -rf /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1
bzcat /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/dl/uClibc-0.9.30.1.tar.bz2 | tar -C /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686   -xf -
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.unpacked
toolchain/patch-kernel.sh /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1 toolchain/uClibc/ \
		uClibc-0.9.30.1-\*.patch \
		uClibc-0.9.30.1-\*.patch.i686

Applying uClibc-0.9.30.1-64bit-strtouq.patch using plaintext: 
patching file libc/stdlib/stdlib.c
patching file include/stdlib.h

Applying uClibc-0.9.30.1-arm-fix-linuxthreads-sysdep.patch using plaintext: 
patching file libpthread/linuxthreads/sysdeps/arm/sysdep-cancel.h
patching file libpthread/linuxthreads/sysdeps/arm/sysdep.h

Applying uClibc-0.9.30.1-c99-ldbl-math.patch using plaintext: 
patching file libm/ldouble_wrappers.c
patching file libm/nan.c
patching file include/math.h
patching file include/tgmath.h
patching file libc/sysdeps/linux/powerpc/bits/wordsize.h
patching file libc/sysdeps/linux/powerpc/bits/mathdef.h
patching file libc/sysdeps/linux/arm/bits/mathdef.h
patching file libc/sysdeps/linux/m68k/bits/mathdef.h
patching file libc/sysdeps/linux/alpha/bits/wordsize.h
patching file libc/sysdeps/linux/alpha/bits/mathdef.h
patching file libc/sysdeps/linux/common/bits/mathdef.h
patching file libc/sysdeps/linux/i386/bits/mathdef.h
patching file libc/sysdeps/linux/nios2/bits/mathdef.h
patching file libc/sysdeps/linux/x86_64/bits/mathdef.h
patching file libc/sysdeps/linux/xtensa/bits/mathdef.h
patching file libc/sysdeps/linux/ia64/bits/mathdef.h
patching file libc/sysdeps/linux/mips/bits/mathdef.h
patching file libc/sysdeps/linux/nios/bits/mathdef.h
patching file libc/sysdeps/linux/sparc/bits/wordsize.h
patching file libc/sysdeps/linux/sparc/bits/mathdef.h
patching file libc/sysdeps/linux/sparc/bits/mathinline.h
patching file libc/sysdeps/linux/sh/bits/mathdef.h

Applying uClibc-0.9.30.1-dl-sysdep-inline.patch using plaintext: 
patching file ldso/ldso/arm/dl-sysdep.h
patching file ldso/ldso/powerpc/dl-sysdep.h
patching file ldso/ldso/sh64/dl-sysdep.h
patching file ldso/ldso/m68k/dl-sysdep.h
patching file ldso/ldso/i386/dl-sysdep.h
patching file ldso/ldso/cris/dl-sysdep.h
patching file ldso/ldso/xtensa/dl-sysdep.h
patching file ldso/ldso/sparc/dl-sysdep.h
patching file ldso/ldso/mips/dl-sysdep.h
patching file ldso/ldso/sh/dl-sysdep.h
patching file ldso/ldso/bfin/dl-sysdep.h

Applying uClibc-0.9.30.1-fix-getaddrinfo.patch using plaintext: 
patching file libc/inet/getaddrinfo.c

Applying uClibc-0.9.30.1-unifdef-getline.patch using plaintext: 
patching file extra/scripts/unifdef.c
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.patched
cp -f  toolchain/uClibc/uClibc-0.9.30.config /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-",g' \
		-e 's,# TARGET_i386 is not set,TARGET_i386=y,g' \
		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"i386\",g' \
		-e 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux\",g' \
		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/linux/include\",g' \
		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
		/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g' \
		/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/UCLIBC_HAS_FLOATS/d' \
		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
		/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/UCLIBC_HAS_THREADS/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/LINUXTHREADS/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/LINUXTHREADS_OLD/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/PTHREADS_DEBUG_SUPPORT/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e '/UCLIBC_HAS_THREADS_NATIVE/d' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "UCLIBC_HAS_THREADS=y" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "# LINUXTHREADS is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "LINUXTHREADS_OLD=y" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
echo "# PTHREADS_DEBUG_SUPPORT is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_GENERIC_386 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_386 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_486 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_586 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_586MMX is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_686 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_PENTIUMII is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_PENTIUMIII is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_PENTIUM4 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_K6 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_K7 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_ELAN is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_CRUSOE is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_WINCHIPC6 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_WINCHIP2 is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_CYRIXIII is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/bin/echo "# CONFIG_NEHEMIAH is not set" >> /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/bin/sed -i -e 's,# CONFIG_686 is not set,CONFIG_686=y,g' /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig
cp -f /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.oldconfig /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.config
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/usr/include
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/usr/lib
mkdir -p /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/lib
/usr/bin/make -j1 -C /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1 \
		PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ \
		HOSTCC="/usr/bin/gcc" \
		oldconfig
make[1]: ???? ? ??????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1'
  MKDIR include/config
/bin/sh: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: No such file or directory
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
/bin/sh: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: No such file or directory
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE    -c conf.c -o conf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE    -c kxgettext.c -o kxgettext.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE    conf.o  zconf.tab.o -lncurses -o conf
#
# configuration written to .config
#
make[1]: ????? ?? ???????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1'
touch /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.config
set -x && /usr/bin/make -j1 -C /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1 \
		PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ \
		DEVEL_PREFIX=/usr/ \
		RUNTIME_PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ \
		HOSTCC="/usr/bin/gcc" headers \
		install_headers
+ /usr/bin/make -j1 -C /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1 PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev/ HOSTCC=/usr/bin/gcc headers install_headers
/bin/sh: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: No such file or directory
make[1]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: ??????? ?? ???????
make[1]: ???? ? ??????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1'
make[1]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: ??????? ?? ???????
  MKDIR include/bits
  GEN include/bits/uClibc_config.h
/bin/sh: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: No such file or directory
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
make[2]: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc: Command not found
  LN include/pthread.h
  LN include/semaphore.h
  LN include/bits/pthreadtypes.h
  LN include/fpu_control.h
  LN include/dl-osinfo.h
  LN include/hp-timing.h
  LN include/bits/cmathcalls.h
  LN include/bits/confname.h
  LN include/bits/dirent.h
  LN include/bits/dlfcn.h
  LN include/bits/elfclass.h
  LN include/bits/environments.h
  LN include/bits/errno.h
  LN include/bits/fenvinline.h
  LN include/bits/getopt.h
  LN include/bits/huge_val.h
  LN include/bits/huge_valf.h
  LN include/bits/huge_vall.h
  LN include/bits/in.h
  LN include/bits/inf.h
  LN include/bits/initspin.h
  LN include/bits/ioctl-types.h
  LN include/bits/ioctls.h
  LN include/bits/ipc.h
  LN include/bits/kernel_sigaction.h
  LN include/bits/local_lim.h
  LN include/bits/locale.h
  LN include/bits/mathcalls.h
  LN include/bits/mqueue.h
  LN include/bits/msq.h
  LN include/bits/nan.h
  LN include/bits/netdb.h
  LN include/bits/poll.h
  LN include/bits/posix1_lim.h
  LN include/bits/posix2_lim.h
  LN include/bits/posix_opt.h
  LN include/bits/resource.h
  LN include/bits/sched.h
  LN include/bits/sem.h
  LN include/bits/shm.h
  LN include/bits/sigaction.h
  LN include/bits/sigcontext.h
  LN include/bits/siginfo.h
  LN include/bits/signum.h
  LN include/bits/sigset.h
  LN include/bits/sigstack.h
  LN include/bits/sigthread.h
  LN include/bits/sockaddr.h
  LN include/bits/socket.h
  LN include/bits/stat.h
  LN include/bits/statfs.h
  LN include/bits/statvfs.h
  LN include/bits/stdio.h
  LN include/bits/stdio_lim.h
  LN include/bits/termios.h
  LN include/bits/time.h
  LN include/bits/types.h
  LN include/bits/typesizes.h
  LN include/bits/uClibc_clk_tck.h
  LN include/bits/uClibc_ctype.h
  LN include/bits/uClibc_errno.h
  LN include/bits/uClibc_fpmax.h
  LN include/bits/uClibc_local_lim.h
  LN include/bits/uClibc_locale.h
  LN include/bits/uClibc_mutex.h
  LN include/bits/uClibc_page.h
  LN include/bits/uClibc_pthread.h
  LN include/bits/uClibc_stdio.h
  LN include/bits/uClibc_touplow.h
  LN include/bits/uClibc_uintmaxtostr.h
  LN include/bits/uClibc_uwchar.h
  LN include/bits/uClibc_va_copy.h
  LN include/bits/uio.h
  LN include/bits/ustat.h
  LN include/bits/utmp.h
  LN include/bits/utmpx.h
  LN include/bits/utsname.h
  LN include/bits/waitflags.h
  LN include/bits/waitstatus.h
  LN include/bits/xopen_lim.h
  LN include/bits/atomic.h
  LN include/bits/byteswap.h
  LN include/bits/endian.h
  LN include/bits/fcntl.h
  LN include/bits/fenv.h
  LN include/bits/kernel_stat.h
  LN include/bits/kernel_types.h
  LN include/bits/mathdef.h
  LN include/bits/mathinline.h
  LN include/bits/mman.h
  LN include/bits/select.h
  LN include/bits/setjmp.h
  LN include/bits/sigcontextinfo.h
  LN include/bits/stackinfo.h
  LN include/bits/syscalls.h
  LN include/bits/uClibc_arch_features.h
  LN include/bits/wchar.h
  LN include/bits/wordsize.h
  LN include/sys/acct.h
  LN include/sys/epoll.h
  LN include/sys/inotify.h
  LN include/sys/prctl.h
  LN include/sys/ptrace.h
  LN include/sys/debugreg.h
  LN include/sys/elf.h
  LN include/sys/io.h
  LN include/sys/perm.h
  LN include/sys/procfs.h
  LN include/sys/reg.h
  LN include/sys/ucontext.h
  LN include/sys/user.h
  LN include/sys/vm86.h
  HOSTCC extra/scripts/unifdef
install -d /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev//usr/include
top_builddir=./ \
	./extra/scripts/install_headers.sh include /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev//usr/include
./extra/scripts/install_headers.sh: line 35: cd: include: No such file or directory
printf '#ifndef _LIBC_INTERNAL_H\n#define _LIBC_INTERNAL_H 1\n#endif\n' > \
		/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev//usr/include/libc-internal.h
echo '/* Dont use _syscall#() macros; use the syscall() function */' > \
		/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev//usr/include/bits/syscalls.h
/bin/sh: /media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc_dev//usr/include/bits/syscalls.h: No such file or directory
make[1]: *** [install_headers] ?????? 1
make[1]: ????? ?? ???????? `/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1'
make: *** [/media/stuff/home/trancer/work/xxx/dev/buildroot-2009.08/toolchain_build_i686/uClibc-0.9.30.1/.configured] ?????? 2
