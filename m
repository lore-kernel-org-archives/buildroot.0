From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 8 Oct 2018 11:51:35 +0530
Subject: [Buildroot] Qt5 build issues with glibc arm64 buildroot compiler
Message-ID: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Any one tried of building Qt5 on arm64 with glibc buildroot native
compiler. I'm observing build issues as below, let me know If I missed
something?

BR2_TOOLCHAIN_BUILDROOT_GLIBC
BR2_TOOLCHAIN_BUILDROOT_CXX
BR2_PACKAGE_QT5
BR2_PACKAGE_QT5BASE_EXAMPLES
BR2_PACKAGE_QT5BASE_GUI
BR2_PACKAGE_QT5BASE_EGLFS

Build log:
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/common/sse2'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-msse2 -g -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o sse2.o sse2.cpp
aarch64-buildroot-linux-gnu-g++.br_real: error: unrecognized command
line option ?-msse2?
Makefile:192: recipe for target 'sse2.o' failed
make[1]: *** [sse2.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/common/sse2'
sse2 disabled.
checking for ipc_sysv...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/ipc_sysv'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o ipc.o ipc.cpp
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-Wl,-O1 -o ipc_sysv ipc.o   -lrt -lpthread -ldl
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/ipc_sysv'
ipc_sysv enabled.
checking for mtdev...
Project ERROR: mtdev development package not found
mtdev disabled.
checking for dlopen...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/dlopen'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o dlopen.o dlopen.cpp
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-Wl,-O1 -o dlopen dlopen.o   -lrt -lpthread -ldl
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/dlopen'
dlopen enabled.
checking for DB2...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/db2'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o db2.o db2.cpp
db2.cpp:34:10: fatal error: sqlcli.h: No such file or directory
 #include <sqlcli.h>
          ^~~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'db2.o' failed
make[1]: *** [db2.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/db2'
DB2 disabled.
checking for InterBase...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/ibase'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o ibase.o ibase.cpp
ibase.cpp:34:10: fatal error: ibase.h: No such file or directory
 #include <ibase.h>
          ^~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'ibase.o' failed
make[1]: *** [ibase.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/ibase'
InterBase disabled.
checking for OCI...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/oci'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o oci.o oci.cpp
oci.cpp:34:10: fatal error: oci.h: No such file or directory
 #include <oci.h>
          ^~~~~~~
compilation terminated.
Makefile:192: recipe for target 'oci.o' failed
make[1]: *** [oci.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/oci'
OCI disabled.
checking for ODBC...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/odbc'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o odbc.o odbc.cpp
odbc.cpp:37:10: fatal error: sql.h: No such file or directory
 #include <sql.h>
          ^~~~~~~
compilation terminated.
Makefile:192: recipe for target 'odbc.o' failed
make[1]: *** [odbc.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/odbc'
ODBC disabled.
checking for iODBC...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/iodbc'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o iodbc.o iodbc.cpp
iodbc.cpp:34:10: fatal error: sql.h: No such file or directory
 #include <sql.h>
          ^~~~~~~
compilation terminated.
Makefile:192: recipe for target 'iodbc.o' failed
make[1]: *** [iodbc.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/iodbc'
iODBC disabled.
checking for SQLite2...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/sqlite2'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o sqlite2.o
sqlite2.cpp
sqlite2.cpp:34:10: fatal error: sqlite.h: No such file or directory
 #include <sqlite.h>
          ^~~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'sqlite2.o' failed
make[1]: *** [sqlite2.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/sqlite2'
SQLite2 disabled.
checking for TDS...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/tds'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o tds.o tds.cpp
tds.cpp:34:10: fatal error: sybfront.h: No such file or directory
 #include <sybfront.h>
          ^~~~~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'tds.o' failed
make[1]: *** [tds.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/tds'
TDS disabled.
checking for libproxy...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/common/libproxy'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o libproxy.o
libproxy.cpp
libproxy.cpp:36:10: fatal error: proxy.h: No such file or directory
 #include <proxy.h>
          ^~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'libproxy.o' failed
make[1]: *** [libproxy.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/common/libproxy'
libproxy disabled.
checking for PulseAudio...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/pulseaudio'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I../../../mkspecs/devices/linux-buildroot-g++ -o pulseaudio.o
pulseaudio.cpp
pulseaudio.cpp:34:10: fatal error: pulse/pulseaudio.h: No such file or directory
 #include <pulse/pulseaudio.h>
          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'pulseaudio.o' failed
make[1]: *** [pulseaudio.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/pulseaudio'
PulseAudio disabled.
checking for OpenGL ES 2.0...
make[1]: Entering directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/opengles2'
/home/jagan/work/code/buildroot-relic/output/host/bin/aarch64-buildroot-linux-gnu-g++
-c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os
--sysroot=/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot
-O2 -O3 -Wall -W -fPIC  -I.
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/freetype2
-I/home/jagan/work/code/buildroot-relic/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include
-I../../../mkspecs/devices/linux-buildroot-g++ -o opengles2.o
opengles2.cpp
opengles2.cpp:38:12: fatal error: GLES2/gl2.h: No such file or directory
   #include <GLES2/gl2.h>
            ^~~~~~~~~~~~~
compilation terminated.
Makefile:192: recipe for target 'opengles2.o' failed
make[1]: *** [opengles2.o] Error 1
make[1]: Leaving directory
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/config.tests/unix/opengles2'
OpenGL ES 2.0 disabled.
The OpenGL ES 2.0 functionality test failed!
 You might need to modify the include and library search paths by editing
 QMAKE_INCDIR_OPENGL_ES2, QMAKE_LIBDIR_OPENGL_ES2 and QMAKE_LIBS_OPENGL_ES2 in
 /home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/mkspecs/devices/linux-buildroot-g++.
package/pkg-generic.mk:219: recipe for target
'/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/.stamp_configured'
failed
make: *** [/home/jagan/work/code/buildroot-relic/output/build/qt5base-5.6.3/.stamp_configured]
Error 1

Jagan.

-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
