From: jiansong chen <ywcjs2008@gmail.com>
Date: Wed, 27 Nov 2013 20:11:43 +0800
Subject: [Buildroot] For buildroot 2013.08.1,
	Qt5OpenGL fails to build with ti-gfx support
Message-ID: <CACyRLLLSdSVu-d29juZRaLncCcd2baQC6VOqhF4y0Cy_ErEw2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Att. I encounter the build failure issue when BR is configured to select
ti-gfx and QT5/eglfs. The build log sequence is as follows. Surprisingly by
nm from the same toolchain, the undefined symbols really appear in the
Qt5Gui library. I cannot figure out what's wrong. If more info is required,
please not hesiate to ask. Any suggestion is welcome. Thanks!

Best Regards,
Simon Chan

Building on:   linux-g++-64
Building for:  devices/linux-buildroot-g++
Architecture:  arm, features: neon
Host architecture: x86_64, features: mmx sse sse2
Platform notes:
            - Also available for Linux: linux-kcc linux-icc linux-cxx

qmake vars .......... styles += mac fusion windows QT_CFLAGS_GLIB =
-pthread
-I/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0
-I/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/glib-2.0/include
-I/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
QT_LIBS_GLIB = -lgthread-2.0 -pthread -lrt
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-lglib-2.0   QMAKE_INCDIR_OPENGL_ES2 =
"/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/GLES2"
QMAKE_LIBDIR_OPENGL_ES2 =
"/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib"
QMAKE_LIBS_OPENGL_ES2 =
"-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib"
"-lGLESv2" "-lGLES_CM" "-lsrv_um" "-lusc" "-lEGL" "-lIMGegl"
QMAKE_INCDIR_LIBUDEV =
/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
QMAKE_LIBS_LIBUDEV =
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-ludev -lrt   DEFINES += QT_NO_XCB QMAKE_INCDIR_EGL =
/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot{includedir}/EGL/
/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr//include
QMAKE_LIBS_EGL =
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr//lib
-lEGL -lGLESv2 -lIMGegl   QMAKE_CFLAGS_DIRECTFB = -D_REENTRANT
-I/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/directfb
QMAKE_LIBS_DIRECTFB = -ldirectfb  -lz -lfusion
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-ldirect -lpthread   PRECOMPILED_DIR = .pch/release-shared OBJECTS_DIR =
.obj/release-shared MOC_DIR = .moc/release-shared RCC_DIR =
.rcc/release-shared UI_DIR = .uic/release-shared sql-drivers =  sql-plugins
=  sqlite qmake switches .........
Build .................. libs
Configuration ..........  cross_compile system-sqlite qpa largefile neon
minimal-config small-config medium-config large-config full-config libudev
evdev directfb linuxfb accessibility egl eglfs opengl opengles2 shared qpa
reduce_exports reduce_relocations clock-gettime clock-monotonic mremap
getaddrinfo ipv6ifname getifaddrs inotify system-jpeg system-png png
freetype system-zlib glib alsa concurrent audio-backend v8 release
Debug .................. no
C++11 support .......... no
pkg-config ............. yes
Qt D-Bus module ........ no
Qt Concurrent code ..... yes
Qt GUI module .......... yes
Qt Widgets module ...... yes
JavaScriptCore JIT ..... To be decided by JavaScriptCore
QML debugging .......... yes
PCH support ............ no
iWMMXt support ......... no
NEON support ........... yes
IPv6 ifname support .... yes
getaddrinfo support .... yes
getifaddrs support ..... yes
Accessibility .......... yes
NIS support ............ no
CUPS support ........... no
Iconv support .......... no
Glib support ........... yes
GStreamer support ...... no
PulseAudio support ..... no
Large File support ..... yes
GIF support ............ plugin
JPEG support ........... plugin (system)
PNG support ............ yes (system)
zlib support ........... system
Session management ..... auto
libudev support ........ yes
Use system proxies ..... no
OpenGL support ......... yes (OpenGL ES 2.x)
OpenVG support ......... no
XShape support ......... auto
XVideo support ......... auto
XSync support .......... auto
Xinerama support ....... runtime
Xcursor support ........ runtime
Xfixes support ......... runtime
Xrandr support ......... runtime
Xi support ............. runtime
Xi2 support ............ auto
MIT-SHM support ........ auto
FontConfig support ..... no
XKB Support ............ auto
GTK theme support ...... no
SQLite support ......... plugin (system)
OpenSSL support ........ no
Alsa support ........... yes
libICU support ......... no
PCRE support ........... system
Xcb support ............ no
Xrender support ........ no
EGLFS support .......... yes
DirectFB support ....... yes
LinuxFB support ........ yes
KMS support ............ no

Qt is now configured for building. Just run 'make'.
Once everything is built, you must run 'make install'.
Qt will be installed into /usr
......
......
rm -f libQt5OpenGL.so.5.0.2 libQt5OpenGL.so libQt5OpenGL.so.5
libQt5OpenGL.so.5.0
/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/bin/arm-linux-gnueabihf-g++
--sysroot=/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
-Wl,--no-undefined -Wl,-O1 -shared -Wl,-Bsymbolic-functions
-Wl,-soname,libQt5OpenGL.so.5 -o libQt5OpenGL.so.5.0.2
.obj/release-shared/qgl.o .obj/release-shared/qglcolormap.o
.obj/release-shared/qglfunctions.o .obj/release-shared/qglpixelbuffer.o
.obj/release-shared/qglframebufferobject.o
.obj/release-shared/qglextensions.o .obj/release-shared/qglpaintdevice.o
.obj/release-shared/qglbuffer.o .obj/release-shared/qglshaderprogram.o
.obj/release-shared/qgraphicsshadereffect.o
.obj/release-shared/qglgradientcache.o
.obj/release-shared/qglengineshadermanager.o
.obj/release-shared/qgl2pexvertexarray.o
.obj/release-shared/qpaintengineex_opengl2.o
.obj/release-shared/qglcustomshaderstage.o
.obj/release-shared/qtextureglyphcache_gl.o .obj/release-shared/qgl_qpa.o
.obj/release-shared/moc_qgl.o .obj/release-shared/moc_qgl_p.o
.obj/release-shared/moc_qglshaderprogram.o
.obj/release-shared/moc_qgraphicsshadereffect_p.o
.obj/release-shared/moc_qglengineshadermanager_p.o
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/build/qt5base-5.0.2/lib
-lQt5Widgets -lQt5Gui -lQt5Core -lrt -ldl -lpthread
-L/home/ASIA/jc19/abserv/linux-buildroot2/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr//lib
-lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
.obj/release-shared/qpaintengineex_opengl2.o: In function
`QGL2PaintEngineEx::QGL2PaintEngineEx()':
qpaintengineex_opengl2.cpp:(.text+0x118c): undefined reference to
`QDashedStrokeProcessor::QDashedStrokeProcessor()'
.obj/release-shared/qpaintengineex_opengl2.o: In function
`QGL2PaintEngineExPrivate::fill(QVectorPath const&)':
qpaintengineex_opengl2.cpp:(.text+0x52bc): undefined reference to
`qTriangulate(QVectorPath const&, QTransform const&, float)'
qpaintengineex_opengl2.cpp:(.text+0x55ac): undefined reference to
`qTriangulate(QVectorPath const&, QTransform const&, float)'
.obj/release-shared/qpaintengineex_opengl2.o: In function
`QGL2PaintEngineExPrivate::stroke(QVectorPath const&, QPen const&)':
qpaintengineex_opengl2.cpp:(.text+0x5ecc): undefined reference to
`QDashedStrokeProcessor::process(QVectorPath const&, QPen const&, QRectF
const&, QFlags<QPainter::RenderHint>)'
qpaintengineex_opengl2.cpp:(.text+0x5f08): undefined reference to
`QTriangulatingStroker::process(QVectorPath const&, QPen const&, QRectF
const&, QFlags<QPainter::RenderHint>)'
qpaintengineex_opengl2.cpp:(.text+0x6204): undefined reference to
`QTriangulatingStroker::process(QVectorPath const&, QPen const&, QRectF
const&, QFlags<QPainter::RenderHint>)'
.obj/release-shared/qgl.o: In function `QGLContext::currentContext()':
qgl.cpp:(.text+0x288c): undefined reference to
`QOpenGLContext::currentContext()'
.obj/release-shared/qglfunctions.o: In function
`QGLFunctions::QGLFunctions(QGLContext const*)':
qglfunctions.cpp:(.text+0x1d0): undefined reference to
`QOpenGLContext::shareGroup() const'
qglfunctions.cpp:(.text+0x200): undefined reference to
`QOpenGLContext::shareGroup() const'
qglfunctions.cpp:(.text+0x20c): undefined reference to
`QOpenGLSharedResource::QOpenGLSharedResource(QOpenGLContextGroup*)'
qglfunctions.cpp:(.text+0x234): undefined reference to
`QOpenGLMultiGroupSharedResource::insert(QOpenGLContext*,
QOpenGLSharedResource*)'
qglfunctions.cpp:(.text+0x2c8): undefined reference to
`QOpenGLMultiGroupSharedResource::QOpenGLMultiGroupSharedResource()'
qglfunctions.cpp:(.text+0x304): undefined reference to
`QOpenGLMultiGroupSharedResource::~QOpenGLMultiGroupSharedResource()'
.obj/release-shared/qglfunctions.o: In function
`QGLFunctions::initializeGLFunctions(QGLContext const*)':
qglfunctions.cpp:(.text+0x464): undefined reference to
`QOpenGLContext::shareGroup() const'
qglfunctions.cpp:(.text+0x494): undefined reference to
`QOpenGLContext::shareGroup() const'
qglfunctions.cpp:(.text+0x4a0): undefined reference to
`QOpenGLSharedResource::QOpenGLSharedResource(QOpenGLContextGroup*)'
qglfunctions.cpp:(.text+0x4c8): undefined reference to
`QOpenGLMultiGroupSharedResource::insert(QOpenGLContext*,
QOpenGLSharedResource*)'
qglfunctions.cpp:(.text+0x55c): undefined reference to
`QOpenGLMultiGroupSharedResource::QOpenGLMultiGroupSharedResource()'
qglfunctions.cpp:(.text+0x598): undefined reference to
`QOpenGLMultiGroupSharedResource::~QOpenGLMultiGroupSharedResource()'
......
collect2: error: ld returned 1 exit status
make[4]: *** [../../lib/libQt5OpenGL.so.5.0.2] Error 1
make[4]: Leaving directory
`/home/ASIA/jc19/abserv/linux-buildroot2/output/build/qt5base-5.0.2/src/opengl'
make[3]: *** [sub-opengl-make_first] Error 2
make[3]: Leaving directory
`/home/ASIA/jc19/abserv/linux-buildroot2/output/build/qt5base-5.0.2/src'
make[2]: *** [sub-src-make_first] Error 2
make[2]: Leaving directory
`/home/ASIA/jc19/abserv/linux-buildroot2/output/build/qt5base-5.0.2'
make[1]: ***
[/home/ASIA/jc19/abserv/linux-buildroot2/output/build/qt5base-5.0.2/.stamp_built]
Error 2
make[1]: Leaving directory `/home/ASIA/jc19/abserv/linux-buildroot2/build'
make: *** [all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131127/135f4ede/attachment.html>
