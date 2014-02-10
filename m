From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2014 12:24:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-09
In-Reply-To: <20140210073010.EB93B100ECC@stock.ovh.net>
References: <20140210073010.EB93B100ECC@stock.ovh.net>
Message-ID: <CAAXf6LWRRpp+WA5J2dV-bPc0te9pBpHN1XBTn=E+Mqqv0of5BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On Mon, Feb 10, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-02-09
> ===============================
>
>         success : 59
>        failures : 1111
>        timeouts : 8
>           TOTAL : 1178
>
> Classification of failures by reason
> ====================================
>
> Makefile.legacy:27: *** "Th... | 994

:-o

Problem is:
"Makefile.legacy:27: *** "The BUILDROOT_DL_DIR environment variable
was renamed to BR2_DL_DIR.".  Stop."
so seems like the autobuilders need to be fixed after the recent change...


>                   aespipe-2.4c | 18
>                    attr-2.4.47 | 18
>                alsa-lib-1.0.26 | 14
>                      apr-1.4.8 | 4
>            argp-standalone-1.3 | 3

These (and possibly others) are caused by my removal of
BR2_HAVE_DOCUMENTATION but already fixed by Peter, problem should be
gone tomorrow.

The symptom of this problem is:

[7m>>> at 3.1.13 Configuring[27m
(cd /home/test/test/1/output/build/at-3.1.13/ && rm -rf config.cache
&& PATH="/home/test/test/1/output/host/bin:/home/test/test/1/output/host/usr/bin:/home/test/test/1/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games"
AR="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-ar"
AS="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-as"
LD="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-ld"
NM="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-nm"
CC="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-gcc"
GCC="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-gcc"
CPP="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-cpp"
CXX="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-g++"
FC="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-gfortran"
RANLIB="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-ranlib"
READELF="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-readelf"
STRIP="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-strip"
OBJCOPY="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-objcopy"
OBJDUMP="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/test/test/1/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/home/test/test/1/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2 -I/home/test/test/1/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/test/test/1/output/host/lib
-L/home/test/test/1/output/host/usr/lib
-Wl,-rpath,/home/test/test/1/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-as"
DEFAULT_LINKER="/home/test/test/1/output/host/usr/bin/nios2-linux-gnu-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/test/test/1/output/host/usr/bin/pkg-config"
PERLLIB="/home/test/test/1/output/host/usr/lib/perl"
STAGING_DIR="/home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure
--target=nios2-buildroot-linux-gnu --host=nios2-buildroot-linux-gnu
--build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr
--sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc
--disable-docs --disable-documentation --with-xmlto=no --with-fop=no
/bin/bash: -c: line 1: syntax error: unexpected end of file
make: *** [/home/test/test/1/output/build/at-3.1.13/.stamp_configured] Error 1


So if you see this error just ignore it.

Best regards,
Thomas
