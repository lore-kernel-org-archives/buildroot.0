From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 14 Oct 2007 15:20:55 +0100
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues [was svn commit:
	trunk/buildroot: target/device target/device/Atmel target etc...]
Message-ID: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I thought it was best to split into a new thread, relates to this
thread: http://buildroot.uclibc.org/lists/buildroot/2007-October/005792.html

   That commit introduced gcc 4.2.1 to avr32, which builds ok, but the
compiler still has some bugs, specially the C++ compiler and the
template engine.

   Now I'm trying to get 4.1.2 to build. Previously we had the cryptic
GCC_NO_EXECUTABLES issue during libstdc++-v3 configure. Now, a bit
down the road, I have some install error:

 /bin/sh ../libtool --mode=install /usr/bin/install -c  'libsupc++.la'
'/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libsupc++.la'
 /usr/bin/install -c -m 644
/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libstdc++-v3/libsupc++/new
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2/new
 /usr/bin/install -c -m 644
/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libstdc++-v3/libsupc++/typeinfo
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2/typeinfo
 /usr/bin/install -c -m 644
/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libstdc++-v3/libsupc++/cxxabi.h
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2/cxxabi.h
 /usr/bin/install -c -m 644
/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-avr32-2.0/libstdc++-v3/libsupc++/exception_defines.h
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2/exception_defines.h
/usr/bin/install -c .libs/libsupc++.lai
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libsupc++.la
/usr/bin/install -c .libs/libsupc++.a
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libsupc++.a

chmod 644 /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libsupc++.a
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libsupc++.a
PATH="$PATH:/sbin" ldconfig -n
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib

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
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libsupc++'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libsupc++'
Making install in libmath
make[4]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libmath'
make[5]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libmath'
make[5]: Nothing to be done for `install-exec-am'.
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libmath'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/libmath'
Making install in src
make[4]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/src'
make[5]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/src'
test -z "/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib"
|| mkdir -p -- "/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib"
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar
cru libstdc++_pic.a *.o ../libsupc++/*.o
make[5]: Nothing to be done for `install-data-am'.
 /bin/sh ../libtool --mode=install /usr/bin/install -c  'libstdc++.la'
'/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.la'
/usr/bin/install -c -m 644 libstdc++_pic.a
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib
/usr/bin/install -c .libs/libstdc++.so.6.0.8
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.so.6.0.8
(cd /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib
&& rm -f libstdc++.so.6 && ln -s libstdc++.so.6.0.8 libstdc++.so.6)
(cd /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib
&& rm -f libstdc++.so && ln -s libstdc++.so.6.0.8 libstdc++.so)
/usr/bin/install -c .libs/libstdc++.lai
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.la
/usr/bin/install -c .libs/libstdc++.a
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.a

chmod 644 /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.a
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib/libstdc++.a
PATH="$PATH:/sbin" ldconfig -n
/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc/lib

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
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/src'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/src'
Making install in po
make[4]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/po'
make[5]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/po'
make[5]: Nothing to be done for `install-exec-am'.
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/po'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/po'
Making install in testsuite
make[4]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/testsuite'
make[5]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/testsuite'
make[5]: warning: -jN forced in submake: disabling jobserver mode.
make[5]: Nothing to be done for `install-exec-am'.
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/testsuite'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3/testsuite'
make[4]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3'
true "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc"
"CC_FOR_TARGET=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc"
"CFLAGS=-g -Os" "CXXFLAGS=-g -Os" "CFLAGS_FOR_BUILD="
"CFLAGS_FOR_TARGET=-g -Os" "INSTALL=/usr/bin/install -c"
"INSTALL_DATA=/usr/bin/install -c -m 644"
"INSTALL_PROGRAM=/usr/bin/install -c" "INSTALL_SCRIPT=/usr/bin/install
-c" "LDFLAGS=LDFLAGS+=-Wl,-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib
LDFLAGS+=-Wl,-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/lib
-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib
-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/lib"
"LIBCFLAGS=-g -Os" "LIBCFLAGS_FOR_TARGET=-g -Os" "MAKE=/usr/bin/make"
"MAKEINFO=makeinfo --split-size=5000000 --split-size=5000000  "
"PICFLAG=" "PICFLAG_FOR_TARGET=" "SHELL=/bin/sh" "RUNTESTFLAGS="
"exec_prefix=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir"
"infodir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/info"
"libdir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib"
"includedir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include"
"prefix=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir"
"tooldir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc"
"gxx_include_dir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2"
"AR=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar"
"AS=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/as"
"LD=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/collect-ld"
"RANLIB=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib"
"NM=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/nm"
"NM_FOR_BUILD="
"NM_FOR_TARGET=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
"DESTDIR=" "WERROR=" DO=all multi-do # /usr/bin/make
make[5]: Entering directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3'
true "AR_FLAGS=rc" "CC_FOR_BUILD=/usr/bin/gcc"
"CC_FOR_TARGET=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc"
"CFLAGS=-g -Os" "CXXFLAGS=-g -Os" "CFLAGS_FOR_BUILD="
"CFLAGS_FOR_TARGET=-g -Os" "INSTALL=/usr/bin/install -c"
"INSTALL_DATA=/usr/bin/install -c -m 644"
"INSTALL_PROGRAM=/usr/bin/install -c" "INSTALL_SCRIPT=/usr/bin/install
-c" "LDFLAGS=LDFLAGS+=-Wl,-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib
LDFLAGS+=-Wl,-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/lib
-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib
-L/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/lib"
"LIBCFLAGS=-g -Os" "LIBCFLAGS_FOR_TARGET=-g -Os" "MAKE=/usr/bin/make"
"MAKEINFO=makeinfo --split-size=5000000 --split-size=5000000   "
"PICFLAG=" "PICFLAG_FOR_TARGET=" "SHELL=/bin/sh" "RUNTESTFLAGS="
"exec_prefix=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir"
"infodir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/info"
"libdir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/lib"
"includedir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include"
"prefix=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir"
"tooldir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/avr32-linux-uclibc"
"gxx_include_dir=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/include/c++/4.1.2"
"AR=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar"
"AS=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/as"
"LD=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/collect-ld"
"RANLIB=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib"
"NM=/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/./gcc/nm"
"NM_FOR_BUILD="
"NM_FOR_TARGET=/root/novacomm/buildroot/buildroot-original/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
"DESTDIR=" "WERROR=" DO=install multi-do # /usr/bin/make
make[5]: Nothing to be done for `install-data-am'.
make[5]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3'
make[4]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3'
make[3]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/avr32-linux-uclibc/libstdc++-v3'
make[2]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final'
make[1]: *** [install] Error 2
make[1]: Leaving directory
`/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final'
make: *** [/root/novacomm/buildroot/buildroot-original/toolchain_build_avr32/gcc-4.1.2-final/.installed]
Error 2


Sorry for all of the verbosity, but I can't make much sense out of
those make errors. For one, I can never quite tell exactly which step
failed.
