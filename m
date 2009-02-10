From: Aric D. Blumer <aric@sdgsystems.com>
Date: Tue, 10 Feb 2009 12:27:54 -0500
Subject: [Buildroot] 2009.02-rc4 released
In-Reply-To: <87ljsf7f2f.fsf@macbook.be.48ers.dk>
References: <87ljsf7f2f.fsf@macbook.be.48ers.dk>
Message-ID: <4991B91A.4060208@sdgsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> . . .
>
> Please give it a spin and report back issues to the mailing list or
> the bug tracker.
>   

I'm having a strange dependency problem with rc4 where it reinstalls
gmp-4.2.2-host and recompiles mpfr-2.3.2-host every time I run make. 
Condensed transcript below.


Checking build system dependencies:
BUILDROOT_DL_DIR clean:                Ok
CC clean:                    Ok
CXX clean:                    Ok
CPP clean:                    Ok
CFLAGS clean:                    Ok
INCLUDES clean:                    Ok
CXXFLAGS clean:                    Ok
which installed:                Ok
sed works:                    Ok (/bin/sed)
GNU make version '3.81':            Ok
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.3.2':            Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.3.2':            Ok
awk installed:                    Ok
bash installed:                    Ok
bison installed:                Ok
flex installed:                    Ok
gettext installed:                Ok
makeinfo installed:                Ok
Build system dependencies:            Ok

rm -rf
/home/aric/c/buildroot-2009.02-rc4/project_build_i686/reflash/buildroot-config
mkdir -p /home/aric/c/buildroot-2009.02-rc4/project_build_i686/reflash
cp -dpRf package/config/buildroot-config
/home/aric/c/buildroot-2009.02-rc4/project_build_i686/reflash/buildroot-config
/usr/bin/make -j4 -C
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host
install
make[1]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
/usr/bin/make  install-recursive
make[2]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'

. . . (Bunch of /usr/bin/make install-whatever here)

make[3]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host/doc'
make[4]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host/doc'
make[4]: Nothing to be done for `install-exec-am'.
test -z
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info" ||
mkdir -p -- .
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info"
 /usr/bin/install -c -m 644
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2/doc/gmp.info'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info/gmp.info'
 /usr/bin/install -c -m 644
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2/doc/gmp.info-1'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info/gmp.info-1'
 /usr/bin/install -c -m 644
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2/doc/gmp.info-2'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info/gmp.info-2'
 install-info
--info-dir='/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/info/gmp.info'
make[4]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host/doc'
make[3]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host/doc'
make[3]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
make[4]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
test -z
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib" ||
mkdir -p -- .
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib"
test -z
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/include" ||
mkdir -p -- .
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/include"
test -z
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/include" ||
mkdir -p -- .
"/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/include"
 /bin/sh ./libtool --mode=install /usr/bin/install -c  'libgmp.la'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib/libgmp.la'
/usr/bin/make  install-data-hook
 /usr/bin/install -c -m 644 'gmp.h'
'/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/include/gmp.h'
make[5]: Entering directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'

+-------------------------------------------------------------+
| CAUTION:                                                    |
|                                                             |
| If you have not already run "make check", then we strongly  |
| recommend you do so.                                        |
|                                                             |
| GMP has been carefully tested by its authors, but compilers |
| are all too often released with serious bugs.  GMP tends to |
| explore interesting corners in compilers and has hit bugs   |
| on quite a few occasions.                                   |
|                                                             |
+-------------------------------------------------------------+

make[5]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
/usr/bin/install -c .libs/libgmp.lai
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib/libgmp.la
/usr/bin/install -c .libs/libgmp.a
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib/libgmp.a
chmod 644
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib/libgmp.a
ranlib
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib/libgmp.a
PATH="$PATH:/sbin" ldconfig -n
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
make[4]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
make[3]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
make[2]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
make[1]: Leaving directory
`/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp-4.2.2-host'
mkdir -p
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/mpfr-2.3.2-host
(cd
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/mpfr-2.3.2-host; \
       
PATH="/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/bin:/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/bin:/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin:/home/aric/software/bin:/sbin:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/aric/bin:/usr/sbin"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld " NM="/usr/bin/nm"
CC="/usr/lib/ccache/gcc " GCC="/usr/lib/ccache/gcc "
CXX="/usr/lib/ccache/g++ " CPP="/usr/bin/cpp "
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/lib/ccache/gcc" GCC_FOR_BUILD="/usr/lib/ccache/gcc"
CXX_FOR_BUILD="/usr/lib/ccache/g++" LD_FOR_BUILD="/usr/bin/ld"
FC_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar"
AS_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
CC_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc"
LD_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
NM_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
RANLIB_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ranlib"
STRIP_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-strip"
OBJCOPY_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-objcopy"
OBJDUMP_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-objdump"
DEFAULT_ASSEMBLER="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
DEFAULT_LINKER="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
ORIGINAL_AS_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-as"
ORIGINAL_LD_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ld"
ORIGINAL_NM_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-nm"
ORIGINAL_OBJDUMP_FOR_TARGET="/home/aric/c/buildroot-2009.02-rc4/build_i686/staging_dir/usr/bin/i686-linux-uclibc-objdump"
\
       
/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/mpfr-2.3.2/configure
\
       
--prefix="/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/mpfr" \
        --build=i386-pc-linux-gnu \
        --host=i386-pc-linux-gnu \
        --disable-shared \
        --enable-static \
       
--with-gmp=/home/aric/c/buildroot-2009.02-rc4/toolchain_build_i686/gmp \
        --disable-nls \
    )
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
. . .
