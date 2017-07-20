From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 09:33:12 +0200
Subject: [Buildroot] [git commit] package/qt5: bump latest version to 5.9.1
Message-ID: <20170720072908.E9DE2817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=854b933705fa42952ab64a3e0b068520a5bca10f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt 5.9 is a Long Term Support version [1]. Some license file changes are
involved, a new dependency on pcre2, and some filename changes.  qt5webkit
popped back into the picture for 5.9.1 after being absent for 5.9.0
"officially." QT5_SNAPSHOTS_SITE is removed with this commit as it is not used
for qtwebkit anymore.

This removes the following patches that have been upstreamed for 5.9.1:

- qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch [2]
- qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch [3]
- qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch [4]
- qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch [5]
- qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch [6]
- qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch [7]

The qt5webkit patches no longer apply to both the LTS and latest
version, so they are moved to per-version directories.

[1] https://www.qt.io/qt5-9/
[2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
[3] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
[4] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=5cc0de2e084cb887a75b076b82cf470ecdcd4dd3
[5] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d
[6] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=18d49808db46add078d9d4bcffaac5361d5c7269
[7] https://code.qt.io/cgit/qt/qtwebkit.git/commit/?id=548380af096f8277e460383c81a4ecdf2b77523f

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>
Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                              |  4 +-
 package/qt5/qt5.mk                                 |  5 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 ...lel-builds-with-qt-freetype-system-libpng.patch | 34 --------
 ...tform-plugin-build-on-big-endian-machines.patch | 97 ----------------------
 ...s-explicit-failure-mode-to-std-atomic-com.patch | 65 ---------------
 ...fs-fix-x11-header-related-compile-failure.patch | 36 --------
 ...4-examples-fix-compile-without-gui-module.patch | 42 ----------
 ...ix-error-attribute-target-crc-is-unknown.patch} |  0
 package/qt5/qt5base/Config.in                      |  8 +-
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5base/qt5base.mk                     |  8 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  0
 .../0002-Remove-TEXTREL-tag-in-x86.patch           |  0
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  0
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  0
 ...de-backtrace-API-for-non-glibc-libraries.patch} |  0
 package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 47 files changed, 71 insertions(+), 338 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index cca04a6..abaa584 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,14 +35,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.8)"
+	bool "Latest (5.9)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.8, which is licensed under
+	  This option builds Qt 5.9, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 47c3e3b..55b16e0 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.8
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION_MAJOR = 5.9
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
-QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 7eaf2cd..5616dcb 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qt3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a21786db6e0f5c6c70213fe1a3530ed3d7f28f28401a0f793970e9bc860ce941 qt3d-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qt3d-opensource-src-5.8.0.tar.xz
-sha256 3a224576fc922195ac0063b5b351cd6b9d13afcde9cec14317be0347d10c8ae5  qt3d-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qt3d-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4f1fe5b812d78987341b854e7f2907f0375dc188cfa6cf9db101b26e9dfd4996 qt3d-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch b/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
deleted file mode 100644
index 8548ef0..0000000
--- a/package/qt5/qt5base/5.8.0/0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 74af93f5298b54bc2327843f390bf202776f2f48 Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@qt.io>
-Date: Tue, 10 Jan 2017 14:18:02 +0100
-Subject: [PATCH] fix parallel builds with -qt-freetype -system-libpng
-
-freetype has no dependency on gui, so it needs to pull in gui's
-configuration manually, as that's where the system libpng is found.
-
-Task-number: QTBUG-58038
-Change-Id: I881495f7d2a8f7c1a45d7d4c9e7698ff1d30f2a9
-Reviewed-by: Joerg Bornemann <joerg.bornemann@qt.io>
-Reviewed-by: Joni Poikelin <joni.poikelin@qt.io>
-
-Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/3rdparty/freetype/freetype.pro | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/3rdparty/freetype/freetype.pro b/src/3rdparty/freetype/freetype.pro
-index 5b1eb92e..390a6da7 100644
---- a/src/3rdparty/freetype/freetype.pro
-+++ b/src/3rdparty/freetype/freetype.pro
-@@ -69,6 +69,7 @@ DEFINES += FT_CONFIG_OPTION_SYSTEM_ZLIB
- include(../zlib_dependency.pri)
- 
- DEFINES += FT_CONFIG_OPTION_USE_PNG
-+include($$OUT_PWD/../../gui/qtgui-config.pri)
- QMAKE_USE_PRIVATE += libpng
- 
- DEFINES += TT_CONFIG_OPTION_SUBPIXEL_HINTING
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch b/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
deleted file mode 100644
index e7d7ee3..0000000
--- a/package/qt5/qt5base/5.8.0/0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 35ee8b53549fab6ebffe289417e1d94298447af7 Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@digia.com>
-Date: Fri, 10 Feb 2017 13:56:58 +0100
-Subject: [PATCH] fix VNC platform plugin build on big-endian machines
-
-Task-number: QTBUG-58734
-Change-Id: I3e44ee4be5003acaba2f1b8ed2658a3ff1bd700e
-Reviewed-by: Lars Knoll <lars.knoll@qt.io>
-Reviewed-by: Dmitry Shachnev <mitya57@gmail.com>
-
-Upstream: http://code.qt.io/cgit/qt/qtbase.git/patch/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/plugins/platforms/vnc/qvncclient.cpp | 6 +++---
- src/plugins/platforms/vnc/qvncscreen.cpp | 7 ++++++-
- src/plugins/platforms/vnc/qvncscreen.h   | 2 +-
- 3 files changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/src/plugins/platforms/vnc/qvncclient.cpp b/src/plugins/platforms/vnc/qvncclient.cpp
-index dae3e83f..58dcfc9b 100644
---- a/src/plugins/platforms/vnc/qvncclient.cpp
-+++ b/src/plugins/platforms/vnc/qvncclient.cpp
-@@ -142,7 +142,7 @@ void QVncClient::convertPixels(char *dst, const char *src, int count) const
-         case 16: {
-             quint16 p = *reinterpret_cast<const quint16*>(src);
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--            if (swapBytes)
-+            if (m_swapBytes)
-                 p = ((p & 0xff) << 8) | ((p & 0xff00) >> 8);
- #endif
-             r = (p >> 11) & 0x1f;
-@@ -484,7 +484,7 @@ void QVncClient::setPixelFormat()
-         m_sameEndian = (QSysInfo::ByteOrder == QSysInfo::BigEndian) == !!m_pixelFormat.bigEndian;
-         m_needConversion = pixelConversionNeeded();
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--        m_swapBytes = qvnc_screen->swapBytes();
-+        m_swapBytes = server()->screen()->swapBytes();
- #endif
-     }
- }
-@@ -639,7 +639,7 @@ bool QVncClient::pixelConversionNeeded() const
-         return true;
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--    if (qvnc_screen->swapBytes())
-+    if (server()->screen()->swapBytes())
-         return true;
- #endif
- 
-diff --git a/src/plugins/platforms/vnc/qvncscreen.cpp b/src/plugins/platforms/vnc/qvncscreen.cpp
-index 34def457..64f1bc0b 100644
---- a/src/plugins/platforms/vnc/qvncscreen.cpp
-+++ b/src/plugins/platforms/vnc/qvncscreen.cpp
-@@ -43,6 +43,7 @@
- #include <QtFbSupport/private/qfbcursor_p.h>
- 
- #include <QtGui/QPainter>
-+#include <QtGui/QScreen>
- #include <QtCore/QRegularExpression>
- 
- 
-@@ -172,14 +173,18 @@ QPixmap QVncScreen::grabWindow(WId wid, int x, int y, int width, int height) con
- }
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--bool QVNCScreen::swapBytes() const
-+bool QVncScreen::swapBytes() const
- {
-+    return false;
-+
-+    /* TODO
-     if (depth() != 16)
-         return false;
- 
-     if (screen())
-         return screen()->frameBufferLittleEndian();
-     return frameBufferLittleEndian();
-+    */
- }
- #endif
- 
-diff --git a/src/plugins/platforms/vnc/qvncscreen.h b/src/plugins/platforms/vnc/qvncscreen.h
-index 785abd6d..0b42c3c7 100644
---- a/src/plugins/platforms/vnc/qvncscreen.h
-+++ b/src/plugins/platforms/vnc/qvncscreen.h
-@@ -73,7 +73,7 @@ public:
-     void clearDirty() { dirtyRegion = QRegion(); }
- 
- #if Q_BYTE_ORDER == Q_BIG_ENDIAN
--    bool swapBytes() const
-+    bool swapBytes() const;
- #endif
- 
-     QStringList mArgs;
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
deleted file mode 100644
index 3a43584..0000000
--- a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c5d7425f8ad391112758db161e3e08f18dc9d299 Mon Sep 17 00:00:00 2001
-From: Marc Mutz <marc.mutz@kdab.com>
-Date: Thu, 26 May 2016 08:30:26 +0200
-Subject: [PATCH] QAtomic: pass explicit failure mode to
- std::atomic::compare_exchange_strong
-
-... in an attempt to avoid GCC 4.8 errors such as
-
-  bits/atomic_base.h:577:70: error: failure memory model cannot be stronger than success memory model for '__atomic_compare_exchange'
-  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);
-                                                                      ^
-
-as seen on Android.
-
-Change-Id: If046e735888cf331d2d6506d8d5ca9aa7402f9ad
-[Bug report: https://bugreports.qt.io/browse/QTBUG-59399
- Patch sent upstream: https://codereview.qt-project.org/#/c/187980/]
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
----
- src/corelib/arch/qatomic_cxx11.h |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/corelib/arch/qatomic_cxx11.h b/src/corelib/arch/qatomic_cxx11.h
-index bb49aae..d6731ec 100644
---- a/src/corelib/arch/qatomic_cxx11.h
-+++ b/src/corelib/arch/qatomic_cxx11.h
-@@ -153,7 +153,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetRelaxed(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_relaxed, std::memory_order_relaxed);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -162,7 +162,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetAcquire(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acquire, std::memory_order_acquire);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -171,7 +171,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetRelease(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_release, std::memory_order_relaxed);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
-@@ -180,7 +180,7 @@ template <typename X> struct QAtomicOps
-     template <typename T>
-     static bool testAndSetOrdered(std::atomic<T> &_q_value, T expectedValue, T newValue, T *currentValue = Q_NULLPTR) Q_DECL_NOTHROW
-     {
--        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel);
-+        bool tmp = _q_value.compare_exchange_strong(expectedValue, newValue, std::memory_order_acq_rel, std::memory_order_acquire);
-         if (currentValue)
-             *currentValue = expectedValue;
-         return tmp;
--- 
-1.7.10.4
-
diff --git a/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch b/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
deleted file mode 100644
index 0e8bcff..0000000
--- a/package/qt5/qt5base/5.8.0/0003-eglfs-fix-x11-header-related-compile-failure.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8902f4d7b7c532592d1a34ad117698d3e380e9e1 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 10 Mar 2017 22:23:06 +0100
-Subject: [PATCH] eglfs: fix x11 header related compile failure
-
-Add egl config and QT_EGL_NO_X11 define (as all other eglfs project
-files do).
-
-Task-number: QTBUG-59427
-Change-Id: Ifbb11eae0fdf0e58c0b7feecb9a7914a889c8f77
-
-Upstream: https://codereview.qt-project.org/188158
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/plugins/platforms/eglfs/eglfs-plugin.pro | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/plugins/platforms/eglfs/eglfs-plugin.pro b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-index cf4863975a..ec229796e5 100644
---- a/src/plugins/platforms/eglfs/eglfs-plugin.pro
-+++ b/src/plugins/platforms/eglfs/eglfs-plugin.pro
-@@ -2,6 +2,11 @@ TARGET = qeglfs
- 
- QT += eglfsdeviceintegration-private
- 
-+CONFIG += egl
-+
-+# Avoid X11 header collision, use generic EGL native types
-+DEFINES += QT_EGL_NO_X11
-+
- SOURCES += $$PWD/qeglfsmain.cpp
- 
- OTHER_FILES += $$PWD/eglfs.json
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch b/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
deleted file mode 100644
index 148ced8..0000000
--- a/package/qt5/qt5base/5.8.0/0004-examples-fix-compile-without-gui-module.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fe8a9bacf781fcf290e04a08f2b8e37d881d58bb Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 27 Apr 2017 22:41:28 +0200
-Subject: [PATCH] examples: fix compile without gui module
-
-Fixes:
-
-  Project ERROR: Could not find feature opengl.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/gui/gui.pro         | 2 +-
- examples/widgets/widgets.pro | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/examples/gui/gui.pro b/examples/gui/gui.pro
-index a4d960d3f5..b8080c2075 100644
---- a/examples/gui/gui.pro
-+++ b/examples/gui/gui.pro
-@@ -6,5 +6,5 @@ CONFIG += no_docs_target
- 
- SUBDIRS += analogclock
- SUBDIRS += rasterwindow
--qtConfig(opengl): \
-+qtHaveModule(gui):qtConfig(opengl): \
-     SUBDIRS += openglwindow
-diff --git a/examples/widgets/widgets.pro b/examples/widgets/widgets.pro
-index 513ddc91f2..cef4936d32 100644
---- a/examples/widgets/widgets.pro
-+++ b/examples/widgets/widgets.pro
-@@ -22,7 +22,7 @@ SUBDIRS       = \
-                 tutorials \
-                 widgets
- 
--qtConfig(opengl): \
-+qtHaveModule(gui):qtConfig(opengl): \
-     SUBDIRS += windowcontainer
- 
- contains(DEFINES, QT_NO_CURSOR): SUBDIRS -= mainwindows
--- 
-2.11.0
-
diff --git a/package/qt5/qt5base/5.8.0/0005-Fix-error-attribute-target-crc-is-unknown.patch b/package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
similarity index 100%
rename from package/qt5/qt5base/5.8.0/0005-Fix-error-attribute-target-crc-is-unknown.patch
rename to package/qt5/qt5base/5.9.1/0001-Fix-error-attribute-target-crc-is-unknown.patch
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 63c7f8f..f5de272 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_QT5BASE
 	bool "qt5base"
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_16
-	select BR2_PACKAGE_PCRE_UTF
+	select BR2_PACKAGE_PCRE if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_16 if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE_UTF if BR2_PACKAGE_QT5_VERSION_5_6
+	select BR2_PACKAGE_PCRE2 if BR2_PACKAGE_QT5_VERSION_LATEST
+	select BR2_PACKAGE_PCRE2_16 if BR2_PACKAGE_QT5_VERSION_LATEST
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 3f6af8a..5d86701 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtbase-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787 qtbase-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtbase-opensource-src-5.8.0.tar.xz
-sha256 c17111ae02a44dc7be1ec2cf979a47ee9e58edf4904041a525c21f4fa53fc005  qtbase-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtbase-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 bc9a21e9f6fff9629019fdf9f989f064751d5073c3a28dc596def92f4d4275c6 qtbase-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c5d2aa1..92633af 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -8,7 +8,7 @@ QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
-QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
+QT5BASE_DEPENDENCIES = host-pkgconf zlib
 QT5BASE_INSTALL_STAGING = YES
 
 # A few comments:
@@ -27,6 +27,12 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5BASE_DEPENDENCIES += pcre
+else
+QT5BASE_DEPENDENCIES += pcre2
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
 
 # Uses libgbm from mesa3d
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 2d84fe4..81386e0 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtcanvas3d-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 d7584d006b03f99692ccabce922e755a6f12bb1ed1fbc99c2b84842b9e0aa0ad qtcanvas3d-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtcanvas3d-opensource-src-5.8.0.tar.xz
-sha256 5446f790f526f582df7790e1e1442357f61aac9c23ea9b00d4a791c9d78ccaa3  qtcanvas3d-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtcanvas3d-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4b8bf09330f03d2b3998f5447991546704715478c54f4f8d82d00bee3047de81 qtcanvas3d-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index d6b841a..b6762f4 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtconnectivity-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1b672923e0703d62f605ccec97b454b1a04c1f0db47f54b687d009e84eabedf9 qtconnectivity-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtconnectivity-opensource-src-5.8.0.tar.xz
-sha256 7b2d01e9d67f6390a9e64bdae62e81a965b0f0b21137cf1a021e08a28bb227f1  qtconnectivity-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtconnectivity-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 40638b715517bff8509fe9fe1e6a4e45e0f66e68920605048e080dd023ae7fd5 qtconnectivity-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 3a0473a..4369a41 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -12,7 +12,7 @@ QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5CONNECTIVITY_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 98a46f1..76f3f02 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtdeclarative-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 0086a986bc36b398ba518c404d08cdff0a0d7978c30aa3fa2ab73d71654209da qtdeclarative-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtdeclarative-opensource-src-5.8.0.tar.xz
-sha256 32941eb9ad12d8735dfc64de8b50b5ab830a6d8705a421c57369de7cb5708a46  qtdeclarative-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtdeclarative-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 d2fe6c9c1a9f19af6e96553c6d75366ab8f397bc232acd67d31476955fee94ff qtdeclarative-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index ffb4079..de8b048 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -12,7 +12,7 @@ QT5DECLARATIVE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index ac4167b..816186b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtgraphicaleffects-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 1e9f0fac2c72a812d396db74b2d9d12f513d2ec9135d5982ca85aee7f00be75e qtgraphicaleffects-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtgraphicaleffects-opensource-src-5.8.0.tar.xz
-sha256 5f2a9b50530ac83d7c2b2ce73fbdf03ac61f83a9521e9d4b796fa17a969dd919  qtgraphicaleffects-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtgraphicaleffects-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 5f86c38e36d9553049cfbe56d4869e73cf8ab920905402cbcafb56dd8a1a59ff qtgraphicaleffects-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 0106b8f..2f6380f 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -12,7 +12,7 @@ QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 0a63523..6e0448a 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtimageformats-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4 qtimageformats-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtimageformats-opensource-src-5.8.0.tar.xz
-sha256 75045eeac11c96194260badbdb4d3e9eb7b7f9972d18d3491230ea820be4606f  qtimageformats-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtimageformats-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 79fee307310a66100bd3d907ea69bd039dcd727c15f27e990167e7a27d1b8a47 qtimageformats-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 6afc918..4046060 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtlocation-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7a8995206ed0220f943a33c037527a1a8243d5386f5ca77bf88152675c28d23a qtlocation-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtlocation-opensource-src-5.8.0.tar.xz
-sha256 48a1e39ed989f0133aeacaa379e9c3958ec9b08c043626bba503619891d21abb  qtlocation-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtlocation-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 4bc43c1df69c5322f982588711d4a65f8408b71a36e43ba19b39d1aae87e1515 qtlocation-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index ffd8a77..3e85272 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtmultimedia-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 cb9a70a7c6c0eb5be4a3fcaf9590863479e95a255308bbf07d5b7aa303bb8caf qtmultimedia-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtmultimedia-opensource-src-5.8.0.tar.xz
-sha256 a8bc044834f95208261915feefe5e2fdb6761b76f0f99e21062963bd9f9d4a07  qtmultimedia-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtmultimedia-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 e48fbe71b4418eb7caba5ef5aa422483fb28d0e894cbc41f3d8b73b3d7fee6e4 qtmultimedia-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 1a5ee10..835142e 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -12,7 +12,7 @@ QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5MULTIMEDIA_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 95657d2..aecc142 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 5ed0f2292be10222dfb1b57a05472798fd759279f65455d91c02ef4fb746102c qtquickcontrols-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols-opensource-src-5.8.0.tar.xz
-sha256 04e70d0ccfd9ba882691a5e8f81e3428ae1b72a76bb9f43ba242f1c33bd7b326  qtquickcontrols-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 520ed0e110f9d0977eb873ea0e05a3d205c9c1b1ad2dd606875708848b21ec2e qtquickcontrols-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 80a3103..fefaba8 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols2-opensource-src-5.8.0.tar.xz
-sha256 b099866ec74f13cf0047274c61f0486d1eba27716fa07b69f682c54d3a4ade1b  qtquickcontrols2-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtquickcontrols2-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 203be0321112d1513b722fce463f9e30d7d00befb33349901d9517f4f13408ff qtquickcontrols2-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 6e369d8..5177d68 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtscript-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 e06ef6b271cae2187b57cd4ffdd6759428fd47f94a060e2ed2af024a8c14110e qtscript-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtscript-opensource-src-5.8.0.tar.xz
-sha256 293ab91d2d189d889dc80609aa259190fb7de636d360e904784a5ce1a45e5ad3  qtscript-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtscript-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 176a08865d5f66437b0f279fc5d7f381f359f20bafbffcebdcac61e86415188f qtscript-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 307ad6f..4abf631 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsensors-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 a7809081aab4f2f0d7a4f40c3abb02e1690bb390d1dd410d7c6c5019a5053427 qtsensors-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsensors-opensource-src-5.8.0.tar.xz
-sha256 3a5d0639ecf8cd30c8ca349c353a8f3c424889b53831e70b6d8c481fc45de796  qtsensors-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsensors-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 5af19397aa8ccd88c1fbb7cda4ee2a583f05bdf8ae090eb616bb276ff2e9e29c qtsensors-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 3e5e485..d4dc47e 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -12,7 +12,7 @@ QT5SENSORS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5SENSORS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index f15945c..c56cfb5 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialbus-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 b39260091691532382935ed51de9ead8e66cfb5f7a6e5410c17cd0695ccaf826 qtserialbus-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialbus-opensource-src-5.8.0.tar.xz
-sha256 58343dd9f2e339d4900a2d4b54ee25ed959cf62bacb012fe61e6b99d7958c10a  qtserialbus-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialbus-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 caa9feefbf1d51b38d6bc923428009d524c0c5eb77f30e4b6d84fec1ce19f3c3 qtserialbus-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 18c590b..7851cd1 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtserialport-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 af76281bad2c2bd283189635316b46091f6712134b845ae1b9e3016eec94f376 qtserialport-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtserialport-opensource-src-5.8.0.tar.xz
-sha256 52317fded73ad0beb0a2ecf93124a8e2dfdcf14270a762c1f4fd06fb075506ad  qtserialport-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtserialport-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 e1fe85bf292929c3a62cb4d21efaaa4e89f70f48ea10914da07d0670ec617a69 qtserialport-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 6855e85..c954efd 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtsvg-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 f7a361bf661b31ae7779513559dd0b774171911bc57f5cfb6bed6878ddc8bc4e qtsvg-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtsvg-opensource-src-5.8.0.tar.xz
-sha256 9873191c211ab4da9c0bc47b1e3549f475db4d448bba3175e0f86b24eefadc89  qtsvg-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtsvg-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 99f294f874b13553e4ed49cd9465580ad0c9b92e29cdfa47b2e4096835c1e2e5 qtsvg-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 541d95b..ae8513f 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qttools-opensource-src-5.8.0.tar.xz
-sha256 95ec8e76d393b6ba26ffff5041fce41946d2bf3aec1402c6533e24d9fc269d83  qttools-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qttools-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 c4eb56cf24a75661b8317b566be37396c90357b4f6730ef12b8c97a7079ca0e8 qttools-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 7f5a75b..3638b74 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -21,7 +21,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5TOOLS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+QT5TOOLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5TOOLS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5TOOLS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index ea30fdb..4e66dc7 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,2 +1,2 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
-sha256 35fdf5b39d930935b6299ac59f347bea89b983e16bd7961fee3f1b8e16f4e21c  qtvirtualkeyboard-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtvirtualkeyboard-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 6b746a6dc3ab54edf3007d0f6a2f8f31281aed03629830f59acfbc8514d6e94c  qtvirtualkeyboard-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 7fd01efb..27c3b0a 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebchannel-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 700efdef5f51bdb77093f4db212afe275ad35a710ea08ba0e9e9cbc8f09f1a52 qtwebchannel-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebchannel-opensource-src-5.8.0.tar.xz
-sha256 5bf5b15413baa235ee2cbfd136ea3b9303b32879b54f9f25bfb4dc96d37d0b4a  qtwebchannel-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebchannel-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 80425f5a6df8784f5221809ffd664486ed38427f514ab4ec174e20456b027000 qtwebchannel-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index acb1bd3..274d25f 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -12,7 +12,7 @@ QT5WEBCHANNEL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
-QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
+QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 else
 QT5WEBCHANNEL_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/5.6.2/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
similarity index 100%
copy from package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
copy to package/qt5/qt5webkit/5.6.2/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
diff --git a/package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch
similarity index 100%
rename from package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
rename to package/qt5/qt5webkit/5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch
diff --git a/package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/5.6.2/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
similarity index 100%
copy from package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
copy to package/qt5/qt5webkit/5.6.2/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
similarity index 100%
rename from package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
rename to package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
diff --git a/package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/5.9.1/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
similarity index 100%
rename from package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
rename to package/qt5/qt5webkit/5.9.1/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 4431e2d..93f0594 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebkit-opensource-src-5.8.0.tar.xz
-sha256 79ae8660086bf92ffb0008b17566270e6477c8fa0daf9bb3ac29404fb5911bec  qtwebkit-opensource-src-5.8.0.tar.xz
+# hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 4136e35..7e9db76 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = $(QT5_SNAPSHOTS_SITE)
+QT5WEBKIT_SITE = $(QT5_SITE)
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index a91e084..c95027b 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebsockets-opensource-src-5.8.0.tar.xz
-sha256 aa110af297d0d3239f346c3ee0cd43621adf463eb62a04941bbfe3fcccb845f5  qtwebsockets-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebsockets-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 01277362430b5a75c19a16ded8cf4c53a3bccddcc0ba2f50648e0f2985f23464 qtwebsockets-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index e93e57b..4cb2aed 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -12,7 +12,7 @@ QT5WEBSOCKETS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
-QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3
+QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
 else
 QT5WEBSOCKETS_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index eb0dc6c..a1ac2b7 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtx11extras-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 71ffde1cfaeec310677b69ecd16cb5992e8885cf3e73b4cec7d6e7a115b40ced qtx11extras-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtx11extras-opensource-src-5.8.0.tar.xz
-sha256 bed7f2b5123a9849ec94afa67db5f296e6f527c6330f47a680c83586d3a4280e  qtx11extras-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtx11extras-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 a63d0e28958331d672dbd0f8c554bdaddbc974a27be37601f7f221a2ef1ad601 qtx11extras-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index c1bb663..bf8c04a 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtxmlpatterns-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 7c6df3eebf188d8ce6822a22cebbc63da5ac27047cf1bd7236d5b988244782cc qtxmlpatterns-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtxmlpatterns-opensource-src-5.8.0.tar.xz
-sha256 7bffa65ea52e54fb1314b45222888612d55eaf51a936a6119b8756266439da04  qtxmlpatterns-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtxmlpatterns-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 b584686496ad1b1b3426d642bd705cab3fc02313b067a33d1b826a27aee29c24 qtxmlpatterns-opensource-src-5.9.1.tar.xz
