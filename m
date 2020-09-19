From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:11:47 +0200
Subject: [Buildroot] [git commit] package/qt5: bump version to 5.15.1
Message-ID: <20200919130449.9B58E85EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fa4eb375c7ebcafbb9f7eeabe27adfc9508923e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5base:
 - remove 0005-evdevkeyboard-fix-input_event-time-related-compile.patch
   (upstream [1])
 - remove 0006-evdevtouch-fix-input_event-time-related-compile.patch
   (upstream [2])
 - remove 0007-qimage_conversions-arm-neon-draw-helper-only-availab.patch
   (upstream [3])

qt5declarative:
 - remove 0002-examples-fix-parallel-install.patch
   (superseeded by upstream commit [4])

qt5imageformats:
 - remove 0001-fix-build-on-Arch-Linux.patch
   (upstream [5])

qt5tools:
 - rebased 0001-Disable-designer-tool-fixes-configure-error.patch

qt5webengine:
 - remove 0002-fix-bison-3.7.patch (upstream [6])
 - now unconditionally needs libxkbcommon

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=c5b8b662105cc5ced968da9f567fe1134c52d6b5
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=71fb4d081c7f3675939ac8c62063631a18175fd1
[3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=2246f270ffd3875cad8c334fdf4878be48620514
[4] https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=1f0b3a54ffa2ab0dc0cdff1345980ea68d749d24
[5] https://code.qt.io/cgit/qt/qtimageformats.git/commit/?id=704868db61be1542c2d9e2b75ead00c45c56cc36
[6] https://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?h=80-based&id=1a53f5995697f5ac6fd501dbdc0ee39c9488ee66

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5.mk                                 |   2 +-
 package/qt5/qt53d/qt53d.hash                       |   4 +-
 ...oard-fix-input_event-time-related-compile.patch |  57 -------
 ...ouch-fix-input_event-time-related-compile.patch |  57 -------
 ...ersions-arm-neon-draw-helper-only-availab.patch |  58 -------
 package/qt5/qt5base/qt5base.hash                   |   4 +-
 package/qt5/qt5charts/qt5charts.hash               |   4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
 .../0002-examples-fix-parallel-install.patch       | 190 ---------------------
 package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
 .../0001-fix-build-on-Arch-Linux.patch             |  37 ----
 package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
 package/qt5/qt5location/qt5location.hash           |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |   4 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash |   4 +-
 package/qt5/qt5script/qt5script.hash               |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
 package/qt5/qt5svg/qt5svg.hash                     |   4 +-
 ...sable-designer-tool-fixes-configure-error.patch |  23 ++-
 package/qt5/qt5tools/qt5tools.hash                 |   4 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash             |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
 package/qt5/qt5webengine/0002-fix-bison-3.7.patch  |  56 ------
 package/qt5/qt5webengine/Config.in                 |   1 +
 package/qt5/qt5webengine/qt5webengine.hash         |   4 +-
 package/qt5/qt5webengine/qt5webengine.mk           |   2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
 package/qt5/qt5webview/qt5webview.hash             |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
 37 files changed, 71 insertions(+), 520 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index a2572be097..0a961e6125 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index b660692982..0d66fa4db5 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qt3d-everywhere-src-5.15.0.tar.xz.sha256
-sha256  61856f0c453b79e98b7a1e65ea8f59976fa78230ffa8dec959b5f4b45383dffd  qt3d-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qt3d-everywhere-src-5.15.1.tar.xz.sha256
+sha256  29aac2c38b6b2fb1e7d54829ff8b4c9aae12a70ffab9707c7388f1e134dd9411  qt3d-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
deleted file mode 100644
index 1ed397870c..0000000000
--- a/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From e3821efb37d64d599760b82beac024804188b824 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 4 May 2020 23:17:45 +0200
-Subject: [PATCH] evdevkeyboard: fix input_event time related compile
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ???void QEvdevKeyboardHandler::switchLed(int, bool)???:
-  evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
-       ::gettimeofday(&led_ie.time, 0);
-                              ^~~~
-                              type
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Upstream: https://github.com/qt/qtbase/commit/c5b8b662105cc5ced968da9f567fe1134c52d6b5
----
- .../input/evdevkeyboard/qevdevkeyboardhandler.cpp   | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
-index 3555763b..de37f5e2 100644
---- a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
-+++ b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
-@@ -58,6 +58,14 @@
- #include <linux/input.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#endif
-+
-+#ifndef input_event_usec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- QT_BEGIN_NAMESPACE
- 
- Q_LOGGING_CATEGORY(qLcEvdevKey, "qt.qpa.input")
-@@ -149,8 +157,11 @@ void QEvdevKeyboardHandler::switchLed(int led, bool state)
- {
-     qCDebug(qLcEvdevKey, "switchLed %d %d", led, int(state));
- 
-+    struct timeval tv;
-+    ::gettimeofday(&tv, 0);
-     struct ::input_event led_ie;
--    ::gettimeofday(&led_ie.time, 0);
-+    led_ie.input_event_sec = tv.tv_sec;
-+    led_ie.input_event_usec = tv.tv_usec;
-     led_ie.type = EV_LED;
-     led_ie.code = led;
-     led_ie.value = state;
--- 
-2.26.2
-
diff --git a/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
deleted file mode 100644
index a24ac4f184..0000000000
--- a/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c9adb999cdb21f991f2c70b1d3b40e16d4fed2c0 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 4 May 2020 23:19:25 +0200
-Subject: [PATCH] evdevtouch: fix input_event time related compile
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  evdevtouch/qevdevtouchhandler.cpp: In member function ???void QEvdevTouchScreenData::processInputEvent(input_event*)???:
-  evdevtouch/qevdevtouchhandler.cpp:579:29: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
-           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
-                               ^~~~
-                               type
-  evdevtouch/qevdevtouchhandler.cpp:579:49: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
-           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
-                                                   ^~~~
-                                                   type
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Upstream: https://github.com/qt/qtbase/commit/71fb4d081c7f3675939ac8c62063631a18175fd1
----
- .../input/evdevtouch/qevdevtouchhandler.cpp            | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
-index c51db59e..94a9b103 100644
---- a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
-+++ b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
-@@ -58,6 +58,14 @@
- #include <linux/input.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#endif
-+
-+#ifndef input_event_usec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #include <math.h>
- 
- #if QT_CONFIG(mtdev)
-@@ -576,7 +584,7 @@ void QEvdevTouchScreenData::processInputEvent(input_event *data)
- 
-         // update timestamps
-         m_lastTimeStamp = m_timeStamp;
--        m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
-+        m_timeStamp = data->input_event_sec + data->input_event_usec / 1000000.0;
- 
-         m_lastTouchPoints = m_touchPoints;
-         m_touchPoints.clear();
--- 
-2.26.2
-
diff --git a/package/qt5/qt5base/0007-qimage_conversions-arm-neon-draw-helper-only-availab.patch b/package/qt5/qt5base/0007-qimage_conversions-arm-neon-draw-helper-only-availab.patch
deleted file mode 100644
index 6c2080a669..0000000000
--- a/package/qt5/qt5base/0007-qimage_conversions-arm-neon-draw-helper-only-availab.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 78d94321149f8e10e5270516082cb37a5b91e327 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 10 May 2020 22:26:43 +0200
-Subject: [PATCH] qimage_conversions: arm neon draw helper only available for
- little endian
-
-Fixes:
-
-  qimage_conversions.cpp:(.text+0x2598): undefined reference to `storeRGB32FromARGB32PM_neon(unsigned char*, unsigned int const*, int, int, QVector<unsigned int> const*, QDitherInfo*)'
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/gui/image/qimage_conversions.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/gui/image/qimage_conversions.cpp b/src/gui/image/qimage_conversions.cpp
-index 97a5f89e..5fc5aba1 100644
---- a/src/gui/image/qimage_conversions.cpp
-+++ b/src/gui/image/qimage_conversions.cpp
-@@ -119,7 +119,7 @@ void qGamma_correct_back_to_linear_cs(QImage *image)
-  *****************************************************************************/
- 
- // The drawhelper conversions from/to RGB32 are passthroughs which is not always correct for general image conversion
--#if !defined(__ARM_NEON__)
-+#if !defined(__ARM_NEON__) || !(Q_BYTE_ORDER == Q_LITTLE_ENDIAN)
- static void QT_FASTCALL storeRGB32FromARGB32PM(uchar *dest, const uint *src, int index, int count,
-                                                const QVector<QRgb> *, QDitherInfo *)
- {
-@@ -149,7 +149,7 @@ static const uint *QT_FASTCALL fetchRGB32ToARGB32PM(uint *buffer, const uchar *s
- #ifdef QT_COMPILER_SUPPORTS_SSE4_1
- extern void QT_FASTCALL storeRGB32FromARGB32PM_sse4(uchar *dest, const uint *src, int index, int count,
-                                                     const QVector<QRgb> *, QDitherInfo *);
--#elif defined(__ARM_NEON__)
-+#elif defined(__ARM_NEON__) && (Q_BYTE_ORDER == Q_LITTLE_ENDIAN)
- extern void QT_FASTCALL storeRGB32FromARGB32PM_neon(uchar *dest, const uint *src, int index, int count,
-                                                     const QVector<QRgb> *, QDitherInfo *);
- #endif
-@@ -181,7 +181,7 @@ void convert_generic(QImageData *dest, const QImageData *src, Qt::ImageConversio
-                 store = storeRGB32FromARGB32PM_sse4;
-             else
-                 store = storeRGB32FromARGB32PM;
--#elif defined(__ARM_NEON__)
-+#elif defined(__ARM_NEON__) && (Q_BYTE_ORDER == Q_LITTLE_ENDIAN)
-             store = storeRGB32FromARGB32PM_neon;
- #else
-             store = storeRGB32FromARGB32PM;
-@@ -289,7 +289,7 @@ bool convert_generic_inplace(QImageData *data, QImage::Format dst_format, Qt::Im
-                 store = storeRGB32FromARGB32PM_sse4;
-             else
-                 store = storeRGB32FromARGB32PM;
--#elif defined(__ARM_NEON__)
-+#elif defined(__ARM_NEON__) && (Q_BYTE_ORDER == Q_LITTLE_ENDIAN)
-             store = storeRGB32FromARGB32PM_neon;
- #else
-             store = storeRGB32FromARGB32PM;
--- 
-2.26.2
-
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index a32723f37a..91b9f19999 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.tar.xz.sha256
-sha256  9e7af10aece15fa9500369efde69cb220eee8ec3a6818afe01ce1e7d484824c5  qtbase-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtbase-everywhere-src-5.15.1.tar.xz.sha256
+sha256  33960404d579675b7210de103ed06a72613bfc4305443e278e2d32a3eb1f3d8c  qtbase-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 1fa59915e4..5d81af78ee 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtcharts-everywhere-src-5.15.0.tar.xz.sha256
-sha256  44a24fc16abcaf9ae97ecf3215f6f3b44ebdb3b73bcb4ed3549a51519e4883a7  qtcharts-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtcharts-everywhere-src-5.15.1.tar.xz.sha256
+sha256  a59efbf095bf8a62c29f6fe90a3e943bbc7583d1d2fed16681675b923c45ef3b  qtcharts-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 644210b2e4..59c948320f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtconnectivity-everywhere-src-5.15.0.tar.xz.sha256
-sha256  f911fb8f8bf3a9958785d0378d25ced8989047938b7138d619854a94fa0b27dd  qtconnectivity-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtconnectivity-everywhere-src-5.15.1.tar.xz.sha256
+sha256  53c30039d4f2301a1a66c646690436e1f8cce0a3fd212ca0783f346a115d8016  qtconnectivity-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
deleted file mode 100644
index 7005104701..0000000000
--- a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From ceccffbee9d674044641dd6a1010715b86eda254 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 26 May 2020 20:16:44 +0200
-Subject: [PATCH] examples: fix parallel install
-
-Installing qt5declarative examples on fast/multicore machines sometimes
-fails with a variation of the following error messages:
-
-  - Cannot touch [...]/chapter5-listproperties/app.qml: No such file or directory
-  - Error copying [...]/chapter2-methods/app.qml: Destination file exists
-
-Fix it by using OTHER_FILES instead of a seperate qml files install target.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Rebased for Qt5.15.0]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- .../extending-qml/chapter1-basics/chapter1-basics.pro     | 8 +++-----
- .../extending-qml/chapter2-methods/chapter2-methods.pro   | 8 +++-----
- .../extending-qml/chapter3-bindings/chapter3-bindings.pro | 8 +++-----
- .../chapter4-customPropertyTypes.pro                      | 8 +++-----
- .../chapter5-listproperties/chapter5-listproperties.pro   | 8 +++-----
- examples/qmltest/qmltest/qmltest.pro                      | 7 ++++---
- examples/quick/imageprovider/imageprovider.pro            | 7 ++++---
- .../quick/imageresponseprovider/imageresponseprovider.pro | 7 ++++---
- .../quick/scenegraph/simplematerial/simplematerial.pro    | 6 +++---
- 9 files changed, 30 insertions(+), 37 deletions(-)
-
-diff --git a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
-index 1f777d2e..7c50dc31 100644
---- a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
-+++ b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
-@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
- 
- RESOURCES += chapter1-basics.qrc
- 
--DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter1-basics
--target.path = $$DESTPATH
-+target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter1-basics
- 
--qml.files = *.qml
--qml.path = $$DESTPATH
-+OTHER_FILES += *.qml
- 
--INSTALLS += target qml
-+INSTALLS += target
-diff --git a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
-index 264f028f..8947b4e0 100644
---- a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
-+++ b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
-@@ -10,10 +10,8 @@ SOURCES += piechart.cpp \
- 
- RESOURCES += chapter2-methods.qrc
- 
--DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter2-methods
--target.path = $$DESTPATH
-+target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter2-methods
- 
--qml.files = *.qml
--qml.path = $$DESTPATH
-+OTHER_FILES += *.qml
- 
--INSTALLS += target qml
-+INSTALLS += target
-diff --git a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
-index 152f17ce..ffe632ee 100644
---- a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
-+++ b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
-@@ -10,10 +10,8 @@ SOURCES += piechart.cpp \
- 
- RESOURCES += chapter3-bindings.qrc
- 
--DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter3-bindings
--target.path = $$DESTPATH
-+target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter3-bindings
- 
--qml.files = *.qml
--qml.path = $$DESTPATH
-+OTHER_FILES += *.qml
- 
--INSTALLS += target qml
-+INSTALLS += target
-diff --git a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
-index e277f746..29911eae 100644
---- a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
-+++ b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
-@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
- 
- RESOURCES += chapter4-customPropertyTypes.qrc
- 
--DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter4-customPropertyTypes
--target.path = $$DESTPATH
-+target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter4-customPropertyTypes
- 
--qml.files = *.qml
--qml.path = $$DESTPATH
-+OTHER_FILES += *.qml
- 
--INSTALLS += target qml
-+INSTALLS += target
-diff --git a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
-index edbd3c23..0db640a7 100644
---- a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
-+++ b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
-@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
- 
- RESOURCES += chapter5-listproperties.qrc
- 
--DESTPATH = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter5-listproperties
--target.path = $$DESTPATH
-+target.path = $$[QT_INSTALL_EXAMPLES]/qml/tutorials/extending-qml/chapter5-listproperties
- 
--qml.files = *.qml
--qml.path = $$DESTPATH
-+OTHER_FILES += *.qml
- 
--INSTALLS += target qml
-+INSTALLS += target
-diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
-index b5893c5a..bade497d 100644
---- a/examples/qmltest/qmltest/qmltest.pro
-+++ b/examples/qmltest/qmltest/qmltest.pro
-@@ -19,8 +19,9 @@ QT += qml qmltest
- macx: CONFIG -= app_bundle
- 
- target.path = $$[QT_INSTALL_EXAMPLES]/qmltest/qmltest
--qml.files = tst_basic.qml tst_item.qml
--qml.path = $$[QT_INSTALL_EXAMPLES]/qmltest/qmltest
--INSTALLS += target qml
-+
-+OTHER_FILES += tst_basic.qml tst_item.qml
-+
-+INSTALLS += target
- 
- }
-diff --git a/examples/quick/imageprovider/imageprovider.pro b/examples/quick/imageprovider/imageprovider.pro
-index e54469b0..05938079 100644
---- a/examples/quick/imageprovider/imageprovider.pro
-+++ b/examples/quick/imageprovider/imageprovider.pro
-@@ -10,8 +10,9 @@ SOURCES += imageprovider.cpp
- EXAMPLE_FILES = imageprovider-example.qml
- 
- target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
--qml.files = ImageProviderCore/qmldir
--qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageprovider/ImageProviderCore
--INSTALLS = target qml
-+
-+OTHER_FILES += ImageProviderCore/qmldir
-+
-+INSTALLS = target
- 
- CONFIG += install_ok  # Do not cargo-cult this!
-diff --git a/examples/quick/imageresponseprovider/imageresponseprovider.pro b/examples/quick/imageresponseprovider/imageresponseprovider.pro
-index 8be4dbb6..678a6756 100644
---- a/examples/quick/imageresponseprovider/imageresponseprovider.pro
-+++ b/examples/quick/imageresponseprovider/imageresponseprovider.pro
-@@ -10,8 +10,9 @@ SOURCES += imageresponseprovider.cpp
- EXAMPLE_FILES = imageresponseprovider-example.qml
- 
- target.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
--qml.files = ImageResponseProviderCore/qmldir
--qml.path = $$[QT_INSTALL_EXAMPLES]/quick/imageresponseprovider/ImageResponseProviderCore
--INSTALLS = target qml
-+
-+OTHER_FILES += ImageResponseProviderCore/qmldir
-+
-+INSTALLS = target
- 
- CONFIG += install_ok  # Do not cargo-cult this!
-diff --git a/examples/quick/scenegraph/simplematerial/simplematerial.pro b/examples/quick/scenegraph/simplematerial/simplematerial.pro
-index 131af459..76a21ab3 100644
---- a/examples/quick/scenegraph/simplematerial/simplematerial.pro
-+++ b/examples/quick/scenegraph/simplematerial/simplematerial.pro
-@@ -11,10 +11,10 @@ SOURCES += \
- RESOURCES += simplematerial.qrc
- 
- target.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/simplematerial
--qml.files = main.qml
--qml.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/simplematerial
- 
--INSTALLS += target qml
-+OTHER_FILES += main.qml
-+
-+INSTALLS += target
- 
- HEADERS += \
-     simplematerialitem.h
--- 
-2.26.2
-
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index b7bed2a11c..9033f6a6bf 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtdeclarative-everywhere-src-5.15.0.tar.xz.sha256
-sha256  9c3c93fb7d340b2f7d738d12408c047318c78973cb45bfc5ff6b3a57e1fef699  qtdeclarative-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtdeclarative-everywhere-src-5.15.1.tar.xz.sha256
+sha256  7e30f0ccba61f9d71720b91d7f7523c23677f23cd96065cb71df1b0df329d768  qtdeclarative-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 5bdc3ba7f3..d2ea24d74a 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtgraphicaleffects-everywhere-src-5.15.0.tar.xz.sha256
-sha256  0d2ea4bc73b9df13a4b739dcbc1e3c7b298c7e682f7f9252b232e3bde7b63eda  qtgraphicaleffects-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtgraphicaleffects-everywhere-src-5.15.1.tar.xz.sha256
+sha256  f4a4d3e1c6d8b0b200b6759ebb615344275957d56d2ef6a33641f853120466d1  qtgraphicaleffects-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch b/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch
deleted file mode 100644
index c348c65260..0000000000
--- a/package/qt5/qt5imageformats/0001-fix-build-on-Arch-Linux.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 704868db61be1542c2d9e2b75ead00c45c56cc36 Mon Sep 17 00:00:00 2001
-From: "Evgeniy A. Dushistov" <dushistov@mail.ru>
-Date: Sat, 15 Aug 2020 15:09:08 +0300
-Subject: fix build on Arch Linux
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-qtimageformats/src/plugins/imageformats/jp2/qjp2handler.cpp:844:41:
-error: no declaration of ??pow??
-  844 |     const double jasperRate = minRate + pow((double(quality) / double(maxQuality)), 2) * maxRate;
-
-Pick-to: 5.15
-Change-Id: I085996c2db2251903b2a3e52e6e648831637c8f9
-Reviewed-by: Shawn Rutledge <shawn.rutledge@qt.io>
-[Retrieved from:
-https://code.qt.io/cgit/qt/qtimageformats.git/commit/?id=704868db61be1542c2d9e2b75ead00c45c56cc36]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/plugins/imageformats/jp2/qjp2handler.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/plugins/imageformats/jp2/qjp2handler.cpp b/src/plugins/imageformats/jp2/qjp2handler.cpp
-index 4311d26..05c7bc1 100644
---- a/src/plugins/imageformats/jp2/qjp2handler.cpp
-+++ b/src/plugins/imageformats/jp2/qjp2handler.cpp
-@@ -45,6 +45,7 @@
- #include "qcolor.h"
- 
- #include <jasper/jasper.h>
-+#include <math.h> // for pow
- 
- QT_BEGIN_NAMESPACE
- 
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 64249269a7..3808787cba 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtimageformats-everywhere-src-5.15.0.tar.xz.sha256
-sha256  83f32101b1a898fcb8ed6f11a657d1125484ac0c2223014b61849d9010efebc8  qtimageformats-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtimageformats-everywhere-src-5.15.1.tar.xz.sha256
+sha256  75e72b4c11df97af3ff64ed26df16864ce1220a1cc730e49074ab9d72f658568  qtimageformats-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index b871c74944..051b36ecd3 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtlocation-everywhere-src-5.15.0.tar.xz.sha256
-sha256  c68b0778a521e5522641c41b1778999dd408ebfda1e0de166a83743268be5f3f  qtlocation-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtlocation-everywhere-src-5.15.1.tar.xz.sha256
+sha256  093af763a70d126c4b9f6a22ebf8218fe95dc0151e40666b2389fdf55c9f1a2c  qtlocation-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 2338471849..2fab59d0da 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtmultimedia-everywhere-src-5.15.0.tar.xz.sha256
-sha256  0708d867697f392dd3600c5c1c88f5c61b772a5250a4d059dca67b844af0fbd7  qtmultimedia-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtmultimedia-everywhere-src-5.15.1.tar.xz.sha256
+sha256  ed6e75bec9c98559c0fbc91ff746185b1e1845139b2c7a5a843e1e8880697d99  qtmultimedia-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index c00c1cd978..36ec675d50 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquickcontrols-everywhere-src-5.15.0.tar.xz.sha256
-sha256  7072cf4cd27e9f18b36b1c48dec7c79608cf87ba847d3fc3de133f220ec1acee  qtquickcontrols-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquickcontrols-everywhere-src-5.15.1.tar.xz.sha256
+sha256  0172f88779305aae57f3842538e91361ae9bc5ca2275ee5ce9d455309f0f2c7e  qtquickcontrols-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index cdb05dbd01..ffce270c16 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquickcontrols2-everywhere-src-5.15.0.tar.xz.sha256
-sha256  839abda9b58cd8656b2e5f46afbb484e63df466481ace43318c4c2022684648f  qtquickcontrols2-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquickcontrols2-everywhere-src-5.15.1.tar.xz.sha256
+sha256  e902b3baf9fe02a5bd675fc71118e282bb6a128c94f45be6f65d7d6db991f2af  qtquickcontrols2-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index 8a013ce9d6..8318044bd2 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquicktimeline-everywhere-src-5.15.0.tar.xz.sha256
-sha256  16ffeb733ba15815121fca5705ed5220ce0a0eb2ec0431ad0d55da9426a03c00  qtquicktimeline-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquicktimeline-everywhere-src-5.15.1.tar.xz.sha256
+sha256  15665d489a6a29ff406a5fe2b4ac14ab102fb6e43864e115432be065da073cca  qtquicktimeline-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 824b43c650..972099ce9d 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtscript-everywhere-src-5.15.0.tar.xz.sha256
-sha256  02dc21b309621876a89671be27cea86a58e74a96aa28da65fe1b37a3aad29373  qtscript-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtscript-everywhere-src-5.15.1.tar.xz.sha256
+sha256  0a62152835363a9cc20558d0c2953ec03426324138578baa18fc2cc4d62b18ca  qtscript-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 35060bc264..494cd525be 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtscxml-everywhere-src-5.15.0.tar.xz.sha256
-sha256  9c3a72bf5ebd07553b0049cc1943f04cff93b7e53bde8c81d652422dbf12ff72  qtscxml-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtscxml-everywhere-src-5.15.1.tar.xz.sha256
+sha256  2289f8c1b51ac368cc0ba8a6a987b44d2c97b43697b00e64582e43afedffcd2b  qtscxml-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 817caa7634..9f3001d42c 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtsensors-everywhere-src-5.15.0.tar.xz.sha256
-sha256  12b17ed6cbe6c49c8ab71958bc5d8ad1c42bf20e2fa72613ede11001e98144da  qtsensors-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtsensors-everywhere-src-5.15.1.tar.xz.sha256
+sha256  8096b9ffe737434f9564432048f622f6be795619da4e1ed362ce26dddb2cea00  qtsensors-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 7bc3222c43..19a9c67744 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtserialbus-everywhere-src-5.15.0.tar.xz.sha256
-sha256  cee067c84d025e221b83d109b58ea16c4d2dc0af0aea45cc6724acd33a1b7379  qtserialbus-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtserialbus-everywhere-src-5.15.1.tar.xz.sha256
+sha256  9ee220826032ae1f8e68d9ec7dddc10ddc4c2e0a771d34009ae307b07eeca751  qtserialbus-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index d93f7d789d..66e1a6b0be 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtserialport-everywhere-src-5.15.0.tar.xz.sha256
-sha256  ba19369069a707dffddca8d9c477bb2bb4aa26630dfee6792254c4bf9bd57a67  qtserialport-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtserialport-everywhere-src-5.15.1.tar.xz.sha256
+sha256  3605130148936ec3fd632bc13c70873d74ef9a8a0b28b17f3be917d848cfb8d9  qtserialport-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index a3f04a098b..ba64d4bf3d 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtsvg-everywhere-src-5.15.0.tar.xz.sha256
-sha256  ee4d287e2e205ca8c08921b9cbe0fc58bf46be080b5359ad4d7fbdee44aeee0d  qtsvg-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtsvg-everywhere-src-5.15.1.tar.xz.sha256
+sha256  308160223c0bd7492d56fb5d7b7f705bfb130947ac065bf39280ec6d7cbe4f6a  qtsvg-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
index 20c5e2a470..f90952254f 100644
--- a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
+++ b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
@@ -1,4 +1,4 @@
-From a70da8d731b969305096a0213b70659dc641591a Mon Sep 17 00:00:00 2001
+From 34894c12122b2026aa595b42fe84a4648a6b7992 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 17 Dec 2019 11:01:59 +0100
 Subject: [PATCH] Disable designer tool (fixes configure error).
@@ -11,10 +11,12 @@ Fixes:
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Rebased for Qt5.15.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.15.1]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  src/linguist/linguist/linguist.pro | 2 +-
- src/src.pro                        | 3 ---
- 2 files changed, 1 insertion(+), 4 deletions(-)
+ src/src.pro                        | 5 +----
+ 2 files changed, 2 insertions(+), 5 deletions(-)
 
 diff --git a/src/linguist/linguist/linguist.pro b/src/linguist/linguist/linguist.pro
 index d083896..7d74cfc 100644
@@ -27,20 +29,23 @@ index d083896..7d74cfc 100644
  DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII
  
 diff --git a/src/src.pro b/src/src.pro
-index 5c256ea..6d079be 100644
+index 8ed567b..d784808 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -7,10 +7,7 @@ qtHaveModule(widgets) {
+@@ -6,12 +6,9 @@ qtHaveModule(widgets) {
+     } else {
          QT_FOR_CONFIG += widgets
          qtConfig(pushbutton):qtConfig(toolbutton) {
-             SUBDIRS = assistant \
--                      designer \
-                       pixeltool
+-            SUBDIRS = designer \
+-                      pixeltool
++            SUBDIRS = pixeltool
+ 
+             !static|contains(QT_PLUGINS, qtsqlite): SUBDIRS += assistant
 -
 -            linguist.depends = designer
          }
          qtHaveModule(quick):qtConfig(thread):qtConfig(toolbutton): SUBDIRS += distancefieldgenerator
      }
 -- 
-2.26.2
+2.28.0
 
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index b816a92d38..0aa7bd9cf0 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qttools-everywhere-src-5.15.0.tar.xz.sha256
-sha256  ddbcb49aab3a2e3672582c6e2e7bec0058feff790f67472343c79e2895e0e437  qttools-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qttools-everywhere-src-5.15.1.tar.xz.sha256
+sha256  c98ee5f0f980bf68cbf0c94d62434816a92441733de50bd9adbe9b9055f03498  qttools-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index c0c7fed086..5043b80529 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtvirtualkeyboard-everywhere-src-5.15.0.tar.xz.sha256
-sha256  f22f9204ab65578d9c8aa832a8a39108f826e00a7d391c7884ff490c587f34be  qtvirtualkeyboard-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtvirtualkeyboard-everywhere-src-5.15.1.tar.xz.sha256
+sha256  8cf62c4f0662f3f4b52b32f9d2cf1845a636d3df663869a98d47dfe748eb1c3d  qtvirtualkeyboard-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index f10c58b71a..271ef2583f 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwayland-everywhere-src-5.15.0.tar.xz.sha256
-sha256  084133e10bfbd32a28125639660c59975f23457bba6a79b30a25802cec76a9fb  qtwayland-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwayland-everywhere-src-5.15.1.tar.xz.sha256
+sha256  e2ff47b874f283a952efd6a8aaf5e8cdc462b5216dda1051b60fc6e80ac657b6  qtwayland-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index a86ca89d06..ec3c79b87d 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebchannel-everywhere-src-5.15.0.tar.xz.sha256
-sha256  ea80510b363e6f92ce99932f06d176e43459c4a5159fe97b5ef96fcfbab5ed4f  qtwebchannel-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebchannel-everywhere-src-5.15.1.tar.xz.sha256
+sha256  7f3ef8e626d932bbc121810661a62ece3955ab982340676a19001417e2faf9fc  qtwebchannel-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/0002-fix-bison-3.7.patch b/package/qt5/qt5webengine/0002-fix-bison-3.7.patch
deleted file mode 100644
index 040c0cc8b7..0000000000
--- a/package/qt5/qt5webengine/0002-fix-bison-3.7.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1a53f5995697f5ac6fd501dbdc0ee39c9488ee66 Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@qt.io>
-Date: Fri, 14 Aug 2020 16:38:48 +0200
-Subject: Fix bison 3.7
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Do a replace run inspired by newer versions of the script.
-
-Fixes: QTBUG-86018
-Change-Id: Ib1dc771e22a662aff0fae842d135ad58fad08bc1
-Reviewed-by: Michael Br??ning <michael.bruning@qt.io>
-[upstream: https://code.qt.io/cgit/qt/qtwebengine-chromium.git/commit/?h=80-based&id=1a53f5995697f5ac6fd501dbdc0ee39c9488ee66]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../blink/renderer/build/scripts/rule_bison.py        | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/chromium/third_party/blink/renderer/build/scripts/rule_bison.py b/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
-index f75e25fd23f..7e0767e951a 100755
---- a/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
-+++ b/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py
-@@ -45,6 +45,19 @@ from utilities import abs
- 
- from blinkbuild.name_style_converter import NameStyleConverter
- 
-+def modify_file(path, prefix_lines, suffix_lines, replace_list=[]):
-+    prefix_lines = map(lambda s: s + '\n', prefix_lines)
-+    suffix_lines = map(lambda s: s + '\n', suffix_lines)
-+    with open(path, 'r') as f:
-+        old_lines = f.readlines()
-+    for i in range(len(old_lines)):
-+        for src, dest in replace_list:
-+            old_lines[i] = old_lines[i].replace(src, dest)
-+    new_lines = prefix_lines + old_lines + suffix_lines
-+    with open(path, 'w') as f:
-+        f.writelines(new_lines)
-+
-+
- assert len(sys.argv) == 4 or len(sys.argv) == 5
- 
- inputFile = abs(sys.argv[1])
-@@ -115,3 +128,9 @@ print >>outputHFile, '#define %s' % headerGuard
- print >>outputHFile, outputHContents
- print >>outputHFile, '#endif  // %s' % headerGuard
- outputHFile.close()
-+
-+common_replace_list = [(inputRoot + '.hh',
-+                        inputRoot + '.h')]
-+modify_file(
-+    outputCpp, [], [],
-+    replace_list=common_replace_list)
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 9879345e1e..4e923c7f31 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 418621d219..faabac39d3 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebengine-everywhere-src-5.15.0.tar.xz.sha256
-sha256  c38e2fda7ed1b7d5a90f26abf231ec0715d78a5bc39a94673d8e39d75f04c5df  qtwebengine-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebengine-everywhere-src-5.15.1.tar.xz.sha256
+sha256  f903e98fe3cd717161252710125fce011cf882ced96c24968b0c38811fbefdf2  qtwebengine-everywhere-src-5.15.1.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 9101f35937..64c9c96cc2 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -7,7 +7,7 @@
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
 QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
-QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp \
+QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx libxkbcommon opus webp \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
 QT5WEBENGINE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index fc92672993..820950dfe2 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebsockets-everywhere-src-5.15.0.tar.xz.sha256
-sha256  87c2f6542778f9b65b3f208740c1d0db643fd0bede21404b9abb265355da5092  qtwebsockets-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebsockets-everywhere-src-5.15.1.tar.xz.sha256
+sha256  5f30053a0a794676ce7d7521f6b789409cc449a7e90cab547d871fc07a61dd7e  qtwebsockets-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index c3f8692632..2e23ddb0af 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebview-everywhere-src-5.15.0.tar.xz.sha256
-sha256  b87ea205ce79c6b438ebe596e91fa80ba11f6aac7e89ffbf52b337d0fc8d6660  qtwebview-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebview-everywhere-src-5.15.1.tar.xz.sha256
+sha256  426852a3f569da82aa84dfd7f06c6aeb06488a927b66342a612401b41392b260  qtwebview-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 4d898aaa62..e5680f55ff 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtx11extras-everywhere-src-5.15.0.tar.xz.sha256
-sha256  c72b6c188284facddcf82835af048240e721dc8d6d9e8a7bd71d76fd876881a1  qtx11extras-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtx11extras-everywhere-src-5.15.1.tar.xz.sha256
+sha256  f7cd7c475a41840209808bf8b1de1c6587c3c74e5ae3b0969760b9ed35159e59  qtx11extras-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 07104f0ede..011444a27f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtxmlpatterns-everywhere-src-5.15.0.tar.xz.sha256
-sha256  2752cf2aa25ebfda89c3736457e27b3d0c7c7ed290dcfd52c209f9f905998507  qtxmlpatterns-everywhere-src-5.15.0.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtxmlpatterns-everywhere-src-5.15.1.tar.xz.sha256
+sha256  6859d440ce662f3679ce483ebb5a552b619a32517cb1a52a38f967b377857745  qtxmlpatterns-everywhere-src-5.15.1.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
