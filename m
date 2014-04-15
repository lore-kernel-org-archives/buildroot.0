From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Apr 2014 02:15:00 +0200
Subject: [Buildroot] Commit mtd: fix build against uClibc reverted.
In-Reply-To: <AE1A486A4CE04A45B8F2EDE23B563100@JohanW7>
References: <AE1A486A4CE04A45B8F2EDE23B563100@JohanW7>
Message-ID: <5A37E7B54B044CD8883D891AE8478A5D@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

This is the build output with the offending patch.

PATH="/home/brcpy2/output/host/bin:/home/brcpy2/output/host/usr/bin:/home/brcpy2/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bi
n:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
AR="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ar"
AS="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
LD="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld"
NM="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-nm"
CC="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
GCC="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc"
CPP="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-cpp"
CXX="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++"
FC="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gfortran"
RANLIB="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ranlib"
READELF="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-readelf"
STRIP="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-strip"
OBJCOPY="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar"
AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++"
FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/brcpy2/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/home/brcpy2/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/brcpy2/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/brcpy2/output/host/lib -L/home/brcpy2/output/host/usr/lib -Wl,-rpath,/home/brcpy2/output/host/usr/lib"
FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/brcpy2/output/host/usr/bin/pkg-config"
STAGING_DIR="/home/brcpy2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot" /usr/bin/make -j1
CROSS=/home/brcpy2/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi- BUILDDIR=/home/brcpy2/output/build/mtd-1.5.1
WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C /home/brcpy2/output/build/mtd-1.5.1 /home/brcpy2/output/build/mtd-1.5.1/flashcp
/home/brcpy2/output/build/mtd-1.5.1/flash_erase /home/brcpy2/output/build/mtd-1.5.1/flash_lock
/home/brcpy2/output/build/mtd-1.5.1/flash_unlock /home/brcpy2/output/build/mtd-1.5.1/mtd_debug
/home/brcpy2/output/build/mtd-1.5.1/nanddump /home/brcpy2/output/build/mtd-1.5.1/nandtest
/home/brcpy2/output/build/mtd-1.5.1/nandwrite /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/mtdinfo
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubiattach /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubicrc32
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubidetach /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubiformat
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubimkvol /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubinfo
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubinize /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubirename
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubirmvol /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubirsvol
/home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubiupdatevol /home/brcpy2/output/build/mtd-1.5.1/ubi-utils/ubiblock
/home/brcpy2/output/build/mtd-1.5.1/mkfs.ubifs/mkfs.ubifs
make[1]: Entering directory `/home/brcpy2/output/build/mtd-1.5.1'
  CHK     include/version.h
  CC      flashcp.o
flashcp.c: In function 'main':
flashcp.c:255:2: warning: #warning "Check for smaller erase regions" [-Wcpp]
 #warning "Check for smaller erase regions"
  ^
  CC      lib/libmtd.o
In file included from lib/libmtd.c:40:0:
./include/common.h:110:19: error: static declaration of 'rpmatch' follows non-static declaration
 static inline int rpmatch(const char *resp)




                   ^
In file included from lib/libmtd.c:25:0:
/home/brcpy2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdlib.h:832:12: note: previous declaration of
'rpmatch' was here
 extern int rpmatch (__const char *__response) __THROW __nonnull ((1)) __wur;
            ^
make[1]: *** [/home/brcpy2/output/build/mtd-1.5.1/lib/libmtd.o] Error 1
make[1]: Leaving directory `/home/brcpy2/output/build/mtd-1.5.1'
make: *** [/home/brcpy2/output/build/mtd-1.5.1/.stamp_built] Error 2


-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Sagaert Johan
Verzonden: dinsdag 15 april 2014 1:21
Aan: 'Thomas Petazzoni'
CC: buildroot at busybox.net
Onderwerp: [Buildroot] Commit mtd: fix build against uClibc reverted.

 
Dear ;

Commit mtd: fix build against uClibc
Add a rpmatch() implementation when uClibc is missing one.

Fixes:
http://autobuild.buildroot.net/results/171/17187c3c9ba2b9df2bb6ac103e9a54706f07c28b/


Strange
I had to revert this commit in my build, it yielded the error in mtd it supposed to fix.

This patch seems to be intended for uClibc 0.9.34 but it seems to be applied on my 0.9.33.2

Regards
Sagaert Johan


_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
