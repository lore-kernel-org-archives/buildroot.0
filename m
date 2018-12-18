From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Dec 2018 16:20:28 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-5EFNUpEd7k@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #8 from Patrick Koller <koller@stettbacher.ch> ---
Hi Peter

Thanks for your reply. No, I did not use the ccache nor were there any errors
in the qt5webengine unpack/configure steps.

Nevertheless, after a "make clean" (Which I also made before my last post)
shows now the "qt5wayland" first:

**************************************************
>>> qt5wayland 5.11.2 Building
PATH="/home/patrickk/tmp/buildroot/a/output/host/bin:/home/patrickk/tmp/buildroot/a/output/host/sbin:/home/patrickk/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
/usr/bin/make -j9 -C
/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2
make[1]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2'
cd src/ && ( test -e Makefile ||
/home/patrickk/tmp/buildroot/a/output/host/bin/qmake -o Makefile
/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/src.pro
CONFIG+=wayland-compositor ) && /usr/bin/make -f Makefile 
make[2]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src'
cd qtwaylandscanner/ && ( test -e Makefile ||
/home/patrickk/tmp/buildroot/a/output/host/bin/qmake -o Makefile
/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/qtwaylandscanner/qtwaylandscanner.pro
CONFIG+=wayland-compositor ) && /usr/bin/make -f Makefile 
make[3]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/qtwaylandscanner'
make[3]: Nothing to be done for 'first'.
make[3]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/qtwaylandscanner'
cd client/ && ( test -e Makefile ||
/home/patrickk/tmp/buildroot/a/output/host/bin/qmake -o Makefile
/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/client/client.pro
CONFIG+=wayland-compositor ) && /usr/bin/make -f Makefile 
cd compositor/ && ( test -e Makefile ||
/home/patrickk/tmp/buildroot/a/output/host/bin/qmake -o Makefile
/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/compositor/compositor.pro
CONFIG+=wayland-compositor ) && /usr/bin/make -f Makefile 
make[3]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/client'
/home/patrickk/tmp/buildroot/a/output/host/bin/arm-linux-gnueabihf-g++ -c -pipe
-march=armv7-a -mfpu=neon -DLINUX=1 -DEGL_API_FB=1 -mfloat-abi=hard
--sysroot=/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot
-O2 -std=c++1y -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions
-Wall -W -Wvla -D_REENTRANT -fPIC -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT
-DQT_BUILD_WAYLANDCLIENT_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER
-DQT_DEPRECATED_WARNINGS -DQT_DISABLE_DEPRECATED_BEFORE=0x050000
-DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG
-DQT_GUI_LIB -DQT_CORE_LIB -DQT_FONTDATABASE_SUPPORT_LIB
-DQT_EVENTDISPATCHER_SUPPORT_LIB -DQT_THEME_SUPPORT_LIB
-DQT_SERVICE_SUPPORT_LIB -DQT_GUI_LIB -DQT_DBUS_LIB -DQT_CORE_LIB -I.
-I../shared -Ihardwareintegration -Ishellintegration -Iinputdeviceintegration
-Iglobal -I../../include -I../../include/QtWaylandClient
-I../../include/QtWaylandClient/5.11.2
-I../../include/QtWaylandClient/5.11.2/QtWaylandClient -isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/5.11.2/QtGui
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/5.11.2/QtCore
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtFontDatabaseSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtFontDatabaseSupport/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtFontDatabaseSupport/5.11.2/QtFontDatabaseSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtEventDispatcherSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtEventDispatcherSupport/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtEventDispatcherSupport/5.11.2/QtEventDispatcherSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtThemeSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtThemeSupport/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtThemeSupport/5.11.2/QtThemeSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtServiceSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtServiceSupport/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtServiceSupport/5.11.2/QtServiceSupport
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtDBus
-I.moc -isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/patrickk/tmp/buildroot/a/output/host/mkspecs/devices/linux-imx6-g++ -o
.obj/qwaylanddisplay.o qwaylanddisplay.cpp
make[3]: Entering directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/compositor'
/home/patrickk/tmp/buildroot/a/output/host/bin/arm-linux-gnueabihf-g++ -c -pipe
-march=armv7-a -mfpu=neon -DLINUX=1 -DEGL_API_FB=1 -mfloat-abi=hard
--sysroot=/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot
-O2 -std=c++1y -fvisibility=hidden -fvisibility-inlines-hidden -fno-exceptions
-Wall -W -Wvla -D_REENTRANT -fPIC -DQT_WAYLAND_COMPOSITOR_QUICK
-DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_BUILD_WAYLANDCOMPOSITOR_LIB
-DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT
-DQT_USE_QSTRINGBUILDER -DQT_DEPRECATED_WARNINGS
-DQT_DISABLE_DEPRECATED_BEFORE=0x050000 -DQT_NO_EXCEPTIONS
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_QUICK_LIB
-DQT_GUI_LIB -DQT_QML_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -I. -I../shared
-Iglobal -Iwayland_wrapper -Icompositor_api -Iextensions -I../../include
-I../../include/QtWaylandCompositor -I../../include/QtWaylandCompositor/5.11.2
-I../../include/QtWaylandCompositor/5.11.2/QtWaylandCompositor -isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQuick/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQuick/5.11.2/QtQuick
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/5.11.2/QtGui
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQml/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQml/5.11.2/QtQml
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/5.11.2
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/5.11.2/QtCore
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQuick
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtGui
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtQml
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtNetwork
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore
-I.moc -isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-isystem
/home/patrickk/tmp/buildroot/a/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/patrickk/tmp/buildroot/a/output/host/mkspecs/devices/linux-imx6-g++ -o
.obj/qwaylandxdgshellv6.o extensions/qwaylandxdgshellv6.cpp
qwaylanddisplay.cpp: In member function ?void
QtWaylandClient::QWaylandDisplay::addRegistryListener(QtWaylandClient::RegistryListener,
void*)?:
qwaylanddisplay.cpp:315:35: error: could not convert ?{listener, data}? from
?<brace-enclosed initializer list>? to
?QtWaylandClient::QWaylandDisplay::Listener?
     Listener l = { listener, data };
                                   ^
Makefile:1435: recipe for target '.obj/qwaylanddisplay.o' failed
make[3]: *** [.obj/qwaylanddisplay.o] Error 1
make[3]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/client'
Makefile:73: recipe for target 'sub-client-make_first' failed
make[2]: *** [sub-client-make_first] Error 2
make[2]: *** Waiting for unfinished jobs....
extensions/qwaylandxdgshellv6.cpp: In member function ?uint
QWaylandXdgToplevelV6::sendConfigure(const QSize&, const
QVector<QWaylandXdgToplevelV6::State>&)?:
extensions/qwaylandxdgshellv6.cpp:957:100: error: no matching function for call
to
?QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(<brace-enclosed
initializer list>)?
    
d->m_pendingConfigures.append(QWaylandXdgToplevelV6Private::ConfigureEvent{states,
size, serial});
                                                                               
                    ^
extensions/qwaylandxdgshellv6.cpp:957:100: note: candidates are:
In file included from extensions/qwaylandxdgshellv6.cpp:38:0:
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent()
     struct ConfigureEvent {
            ^
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 0
arguments, 3 provided
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(const
QWaylandXdgToplevelV6Private::ConfigureEvent&)
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 1 argument,
3 provided
extensions/qwaylandxdgshellv6_p.h:137:12: note:
QWaylandXdgToplevelV6Private::ConfigureEvent::ConfigureEvent(QWaylandXdgToplevelV6Private::ConfigureEvent&&)
extensions/qwaylandxdgshellv6_p.h:137:12: note:   candidate expects 1 argument,
3 provided
Makefile:3517: recipe for target '.obj/qwaylandxdgshellv6.o' failed
make[3]: *** [.obj/qwaylandxdgshellv6.o] Error 1
make[3]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src/compositor'
Makefile:98: recipe for target 'sub-compositor-make_first' failed
make[2]: *** [sub-compositor-make_first] Error 2
make[2]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/src'
Makefile:46: recipe for target 'sub-src-make_first' failed
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2'
package/pkg-generic.mk:229: recipe for target
'/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/.stamp_built'
failed
make: ***
[/home/patrickk/tmp/buildroot/a/output/build/qt5wayland-5.11.2/.stamp_built]
Error 2
**************************************************

Does anybody have an idea, why this happens?
Thanks in advance.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
