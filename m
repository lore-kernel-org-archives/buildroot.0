From: Paul Jones <paul.jones@iwtech.com.au>
Date: Tue, 06 Apr 2010 20:45:31 +1000
Subject: [Buildroot] QT Mysql plugin
Message-ID: <4BBB10CB.9060706@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone managed to get this to compile? When the configure test tries
to link against the mysql libraries it uses the host ones rather than
the target ones. I've tried adding the -L option to ./configure but
nothing happened.


/media/stuff/kisssroot/output/toolchain/bin/sed -i -e '/QMAKE_LFLAGS/d'
/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspecs/qws/linux-arm-g++/qmake.conf
/media/stuff/kisssroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_LFLAGS =
-L/media/stuff/kisssroot/output/staging/lib
-L/media/stuff/kisssroot/output/staging/usr/lib
--sysroot=/media/stuff/kisssroot/output/staging/'
/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspecs/qws/linux-arm-g++/qmake.conf
[ -f package/qt/qconfig-myfile.h ] && cp package/qt/qconfig-myfile.h \
       
/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2//src/corelib/global/
make:
[/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
Error 1 (ignored)
(cd
/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2; \
        PKG_CONFIG_SYSROOT_DIR="/media/stuff/kisssroot/output/staging" \
        PKG_CONFIG="/media/stuff/kisssroot/output/host/usr/bin/pkg-config" \
       
PKG_CONFIG_PATH="/media/stuff/kisssroot/output/staging/usr/lib/pkgconfig:" \
        ./configure \
        -silent \
        -force-pkg-config \
        -embedded arm \
         \
         -opensource -confirm-license -v -L
/media/stuff/kisssroot/output/staging/lib -L
/media/stuff/kisssroot/output/staging/usr/lib -largefile -no-qt3support
-depths 8,16,32 -qt-gfx-linuxfb -no-gfx-transformed -no-gfx-qvfb
-no-gfx-vnc -no-gfx-multiscreen -no-gfx-directfb -no-mouse-pc
-no-mouse-linuxtp -qt-mouse-linuxinput -qt-mouse-tslib -no-mouse-qvfb
-qt-kbd-tty -qt-kbd-linuxinput -no-kbd-qvfb -release -shared
-little-endian -no-gif -no-libmng -system-zlib -system-libjpeg
-system-libpng -no-libtiff -no-freetype -no-openssl -qt-sql-mysql
-no-sql-sqlite -no-xmlpatterns -no-multimedia -no-audio-backend
-no-phonon -no-phonon-backend -no-svg -webkit -script -no-scripttools
-javascript-jit -no-stl \
        -no-gfx-qnx \
        -no-kbd-qnx \
        -no-mouse-qnx \
        -no-xinerama \
        -no-cups \
        -no-nis \
        -no-accessibility \
        -no-separate-debug-info \
        -prefix /usr \
        -hostprefix /media/stuff/kisssroot/output/staging/usr \
        -fast \
        -no-rpath \
        -examplesdir  /media/stuff/kisssroot/output/target/usr/share/qt4 \
        -demosdir  /media/stuff/kisssroot/output/target/usr/share/qt4 \
    )
Determining system architecture... (Linux:2.6.31-gentoo-r10:x86_64)
    64-bit AMD 80x86 (x86_64)
    'arm' is supported
    'x86_64' is supported
System architecture: 'arm'
Host architecture: 'x86_64'

You have asked to use pkg-config and are cross-compiling.
Please make sure you have a correctly set-up pkg-config
environment!

Precompiled-headers support enabled.
Symbol visibility control enabled.

This is the Qt for Embedded Linux Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.

You have already accepted the terms of the  license.

Creating qmake. Please wait...
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
gmake[1]: Nothing to be done for `first'.
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
floatmath auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/floatmath'
compiling floatmath.cpp
floatmath.cpp:44: warning: unused parameter 'argc'
floatmath.cpp:44: warning: unused parameter 'argv'
linking floatmath
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/floatmath'
floatmath enabled.
mmx auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mmx'
compiling mmx.cpp
cc1plus: error: unrecognized command line option "-mmmx"
gmake[1]: *** [mmx.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mmx'
mmx disabled.
3dnow auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/3dnow'
compiling 3dnow.cpp
cc1plus: error: unrecognized command line option "-m3dnow"
gmake[1]: *** [3dnow.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/3dnow'
3dnow disabled.
sse auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/sse'
compiling sse.cpp
cc1plus: error: unrecognized command line option "-msse"
gmake[1]: *** [sse.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/sse'
sse disabled.
sse2 auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/sse2'
compiling sse2.cpp
cc1plus: error: unrecognized command line option "-msse2"
gmake[1]: *** [sse2.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/sse2'
sse2 disabled.
neon auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/neon'
compiling neon.cpp
In file included from neon.cpp:42:
/media/stuff/kisssroot/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.4/include/arm_neon.h:35:2:
error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp
-mfpu=neon) to use arm_neon.h
neon.cpp: In function 'int main(int, char**)':
neon.cpp:46: error: 'int32x4_t' was not declared in this scope
neon.cpp:46: error: expected `;' before 'null'
neon.cpp:49: error: 'null' was not declared in this scope
neon.cpp:49: error: 'vst1q_lane_s32' was not declared in this scope
gmake[1]: *** [neon.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/neon'
neon disabled.
DB2 auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/db2'
compiling db2.cpp
db2.cpp:42:20: error: sqlcli.h: No such file or directory
db2.cpp:43:21: error: sqlcli1.h: No such file or directory
gmake[1]: *** [db2.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/db2'
DB2 disabled.
InterBase auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/ibase'
compiling ibase.cpp
ibase.cpp:42:19: error: ibase.h: No such file or directory
gmake[1]: *** [ibase.o] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/ibase'
InterBase disabled.
MySQL (thread-safe) auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql_r'
compiling ../mysql/mysql.cpp
linking mysql_r
/usr/lib64/mysql/libmysqlclient_r.so: file not recognized: File format
not recognized
collect2: ld returned 1 exit status
gmake[1]: *** [mysql_r] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql_r'
MySQL (thread-safe) disabled.
MySQL (thread-unsafe) auto-detection... ()
gmake[1]: Entering directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql'
compiling mysql.cpp
linking mysql
/usr/lib64/mysql/libmysqlclient.so: file not recognized: File format not
recognized
collect2: ld returned 1 exit status
gmake[1]: *** [mysql] Error 1
gmake[1]: Leaving directory
`/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/config.tests/unix/mysql'
MySQL (thread-unsafe) disabled.
MySQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: ***
[/media/stuff/kisssroot/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
Error 101
