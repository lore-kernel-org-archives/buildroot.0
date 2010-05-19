From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 19 May 2010 11:17:38 +0200
Subject: [Buildroot] problem building QT for geode (386) this linker was not
	configured to use sysroots
Message-ID: <8B32C9F6FB7E4B6EA47B95D0CD2BAE8D@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I checked the my config and i do use the --sysroot.
I think the build is using the ld on my host, not the one build by
buildroot. (see end of log )
(i have the same problem with QT 4.5.3 
 
Is there something missing in the makefile ?
 
Johan
 
 rm -rf /home/johan/buildroot/output/build/buildroot-config
mkdir -p /home/johan/buildroot/output/build
cp -dpRf package/config/buildroot-config
/home/johan/buildroot/output/build/buildroot-config
/usr/bin/make -j1 CFLAGS="-Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/johan/buildroot/output/staging/usr/include
-I/home/johan/buildroot/output/staging/include
--sysroot=/home/johan/buildroot/output/staging/ -isysroot
/home/johan/buildroot/output/staging" OS=i586
CC=/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gc
c BASE=/home/johan/buildroot/output/target/usr -C
/home/johan/buildroot/output/build/lmbench-3.0-a9/src install
make[1]: Entering directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[2]: Entering directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[2]: Entering directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[2]: Nothing to be done for `opt'.
make[2]: Leaving directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[2]: Entering directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
if [ ! -d /home/johan/buildroot/output/target/usr ]; then mkdir
/home/johan/buildroot/output/target/usr; fi
if [ ! -d /home/johan/buildroot/output/target/usr/bin ]; then mkdir
/home/johan/buildroot/output/target/usr/bin; fi
if [ ! -d /home/johan/buildroot/output/target/usr/include ]; then mkdir
/home/johan/buildroot/output/target/usr/include; fi
if [ ! -d /home/johan/buildroot/output/target/usr/lib ]; then mkdir
/home/johan/buildroot/output/target/usr/lib; fi
cp ../bin/i586/bw_file_rd ../bin/i586/bw_mem ../bin/i586/bw_mmap_rd
../bin/i586/bw_pipe ../bin/i586/bw_tcp ../bin/i586/bw_unix ../bin/i586/hello
../bin/i586/lat_select ../bin/i586/lat_pipe ../bin/i586/lat_rpc
../bin/i586/lat_syscall ../bin/i586/lat_tcp ../bin/i586/lat_udp
../bin/i586/lat_mmap ../bin/i586/mhz ../bin/i586/lat_proc
../bin/i586/lat_pagefault ../bin/i586/lat_connect ../bin/i586/lat_fs
../bin/i586/lat_sig ../bin/i586/lat_mem_rd ../bin/i586/lat_ctx
../bin/i586/lat_sem ../bin/i586/memsize ../bin/i586/lat_unix
../bin/i586/lmdd ../bin/i586/timing_o ../bin/i586/enough ../bin/i586/msleep
../bin/i586/loop_o ../bin/i586/lat_fifo ../bin/i586/lmhttp
../bin/i586/lat_http ../bin/i586/lat_fcntl ../bin/i586/disk
../bin/i586/lat_unix_connect ../bin/i586/flushdisk ../bin/i586/lat_ops
../bin/i586/line ../bin/i586/tlb ../bin/i586/par_mem ../bin/i586/par_ops
../bin/i586/stream /home/johan/buildroot/output/target/usr/bin
cp bench.h lib_mem.h lib_tcp.h lib_udp.h stats.h timing.h
/home/johan/buildroot/output/target/usr/include
cp ../bin/i586/lmbench.a
/home/johan/buildroot/output/target/usr/lib/libmbench.a
cd ../doc; env MAKEFLAGS="w -- O=../bin/i586 LDLIBS=-lm CFLAGS=-Os\ -pipe\
-Os\ \ -mtune=geode\ -march=geode\ -D_LARGEFILE_SOURCE\
-D_LARGEFILE64_SOURCE\ -D_FILE_OFFSET_BITS=64\
-I/home/johan/buildroot/output/staging/usr/include\
-I/home/johan/buildroot/output/staging/include\
--sysroot=/home/johan/buildroot/output/staging/\ -isysroot\
/home/johan/buildroot/output/staging\ -DHAVE_off64_t\ -DHAVE_lseek64\
-DRUSAGE\ -DHAVE_uint=1\ -DHAVE_int64_t=1\ -DHAVE_pmap_clnt_h\
-DHAVE_socklen_t\ -DHAVE_DRAND48\ -DHAVE_SCHED_SETAFFINITY=1 OS=i586
CC=/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gc
c BASE=/home/johan/buildroot/output/target/usr" make
CC="/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-g
cc" OS="i586" BASE="/home/johan/buildroot/output/target/usr" install
make[3]: Entering directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/doc'
for f in bargraph.1 graph.1 lmbench.3 reporting.3 results.3 timing.3
lmbench.8 mhz.8 cache.8 line.8 tlb.8 lmdd.8 lat_proc.8 lat_mmap.8 lat_ctx.8
lat_syscall.8 lat_pipe.8 lat_http.8 lat_tcp.8 lat_udp.8 lat_rpc.8
lat_connect.8 lat_fs.8 lat_ops.8 lat_pagefault.8 lat_mem_rd.8 lat_select.8
lat_fifo.8 lat_fcntl.8 lat_sig.8 lat_unix.8 lat_unix_connect.8 bw_file_rd.8
bw_mem.8 bw_mmap_rd.8 bw_pipe.8 bw_tcp.8 bw_unix.8 par_ops.8 par_mem.8; do \
  for s in 1 2 3 4 5 6 7 8 9; do \
   if [ ! -d /home/johan/buildroot/output/target/usr/man/man${s} ]; then \
    mkdir -p /home/johan/buildroot/output/target/usr/man/man${s}; \
   fi; \
   base=`basename ${f} .${s}`; \
   if [ "${base}.${s}" = "$f" ]; then \
    cp $f /home/johan/buildroot/output/target/usr/man/man${s}/; \
   fi; \
  done; \
 done
make[3]: Leaving directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/doc'
make[2]: Leaving directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
make[1]: Leaving directory
`/home/johan/buildrootx86/output/build/lmbench-3.0-a9/src'
[ -f
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/Makefi
le ] && /usr/bin/make -j1 -C
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2
confclean
make:
[/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.conf
igured] Error 1 (ignored)
# Fix compiler path
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_CC/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_CC =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_CXX/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_CXX =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-g++'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_LINK/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_LINK =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-g++'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_LINK_SHLIB/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_LINK_SHLIB =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-g++'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_AR/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_AR =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ar
cqs'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_OBJCOPY/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_OBJCOPY =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-objco
py'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_RANLIB/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_RANLIB =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-ranli
b'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_STRIP/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_STRIP =
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-strip
'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_CFLAGS/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_CFLAGS = -Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/johan/buildroot/output/staging/usr/include
-I/home/johan/buildroot/output/staging/include
--sysroot=/home/johan/buildroot/output/staging/ -isysroot
/home/johan/buildroot/output/staging'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_CXXFLAGS/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_CXXFLAGS = -Os -pipe -Os  -mtune=geode
-march=geode -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I/home/johan/buildroot/output/staging/usr/include
-I/home/johan/buildroot/output/staging/include
--sysroot=/home/johan/buildroot/output/staging/ -isysroot
/home/johan/buildroot/output/staging'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e '/QMAKE_LFLAGS/d'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
/home/johan/buildroot/output/toolchain/bin/sed -i -e
'/include.*qws.conf/aQMAKE_LFLAGS =
-L/home/johan/buildroot/output/staging/lib
-L/home/johan/buildroot/output/staging/usr/lib
--sysroot=/home/johan/buildroot/output/staging/'
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/mkspec
s/qws/linux-x86-g++/qmake.conf
[ -f package/qt/qconfig-myfile.h ] && cp package/qt/qconfig-myfile.h \
 
/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2//src/c
orelib/global/
make:
[/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.conf
igured] Error 1 (ignored)
(cd /home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2; \
  PKG_CONFIG_SYSROOT_DIR="/home/johan/buildroot/output/staging" \
  PKG_CONFIG="/home/johan/buildroot/output/host/usr/bin/pkg-config" \
  PKG_CONFIG_PATH="/home/johan/buildroot/output/staging/usr/lib/pkgconfig:"
\
  ./configure \
  -silent \
  -force-pkg-config \
  -embedded x86 \
   \
   -opensource -confirm-license -largefile -no-qt3support -depths 8,16,32
-qt-gfx-linuxfb -no-gfx-transformed -no-gfx-qvfb -no-gfx-vnc
-no-gfx-multiscreen -no-gfx-directfb -no-mouse-pc -no-mouse-linuxtp
-no-mouse-linuxinput -no-mouse-tslib -no-mouse-qvfb -no-kbd-tty
-no-kbd-linuxinput -no-kbd-qvfb -release -shared -little-endian -no-gif
-no-libmng -qt-zlib -no-libjpeg -no-libpng -no-libtiff -no-freetype
-no-openssl -no-sql-sqlite -no-xmlpatterns -no-multimedia -no-audio-backend
-no-phonon -no-phonon-backend -no-svg -no-webkit -script -no-scripttools
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
  -hostprefix /home/johan/buildroot/output/staging/usr \
  -fast \
  -no-rpath \
  -nomake examples \
  -nomake demos \
 )
 
This is the Qt for Embedded Linux Open Source Edition.
 
You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.
You are also licensed to use this software under the terms of
the GNU General Public License (GPL) versions 3.
 
You have already accepted the terms of the  license.
 
Creating qmake. Please wait...
make[1]: Entering directory
`/home/johan/buildrootx86/output/build/qt-everywhere-opensource-src-4.6.2/qm
ake'
g++ -o
"/home/johan/buildrootx86/output/build/qt-everywhere-opensource-src-4.6.2/bi
n/qmake" project.o property.o main.o makefile.o unixmake2.o unixmake.o
mingw_make.o option.o winmakefile.o projectgenerator.o meta.o makefiledeps.o
metamakefile.o xmloutput.o pbuilder_pbx.o borland_bmake.o msvc_dsp.o
msvc_vcproj.o msvc_nmake.o msvc_objectmodel.o symmake.o
initprojectdeploy_symbian.o symmake_abld.o symmake_sbsv2.o qtextcodec.o
qutfcodec.o qstring.o qtextstream.o qiodevice.o qmalloc.o qglobal.o
qbytearray.o qbytearraymatcher.o qdatastream.o qbuffer.o qlist.o qfile.o
qfsfileengine_unix.o qfsfileengine_iterator_unix.o qfsfileengine.o
qfsfileengine_iterator.o qregexp.o qvector.o qbitarray.o qdir.o
qdiriterator.o quuid.o qhash.o qfileinfo.o qdatetime.o qstringlist.o
qabstractfileengine.o qtemporaryfile.o qmap.o qmetatype.o qsettings.o
qlibraryinfo.o qvariant.o qvsnprintf.o qlocale.o qlinkedlist.o qurl.o
qnumeric.o qcryptographichash.o qxmlstream.o qxmlutils.o
-L/home/johan/buildroot/output/staging/lib
-L/home/johan/buildroot/output/staging/usr/lib
--sysroot=/home/johan/buildroot/output/staging/
/usr/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status
make[1]: ***
[/home/johan/buildrootx86/output/build/qt-everywhere-opensource-src-4.6.2/bi
n/qmake] Error 1
make[1]: Leaving directory
`/home/johan/buildrootx86/output/build/qt-everywhere-opensource-src-4.6.2/qm
ake'
make: ***
[/home/johan/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.conf
igured] Error 2

 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100519/b66291a1/attachment-0001.htm>
