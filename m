From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Jul 2019 19:36:45 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qt5: bump latest version to
 5.12.4
In-Reply-To: <20190710173645.15459-1-ps.report@gmx.net>
References: <20190710173645.15459-1-ps.report@gmx.net>
Message-ID: <20190710173645.15459-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5multimedia:
- remove 0001-Fix-compile-failure-with-gstreamer-0-10.patch (taken from
  upstream [1])

qt5webengine:
- add one additional license hash
  (src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc)

[1] https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=935967a453b47ae7c8e9ad3d94eef3813eab58db

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix patch title (missing package prefix)
  - rebased on current master
  - remove upstream committed qt5multimedia patch
  - change update from 5.12.3 to 5.12.4
  - update qt5webengine license hash list
---
 package/qt5/qt5.mk                            |  2 +-
 package/qt5/qt53d/qt53d.hash                  |  4 +--
 ...tbase-Fix-build-error-when-using-EGL.patch |  0
 ...ble-conversion-enable-for-microblaze.patch |  0
 .../qt5base/{5.12.2 => 5.12.4}/qt5base.hash   |  4 +--
 package/qt5/qt5canvas3d/qt5canvas3d.hash      |  4 +--
 package/qt5/qt5charts/qt5charts.hash          |  4 +--
 .../{5.12.2 => 5.12.4}/qt5connectivity.hash   |  4 +--
 ...gtexture-fix-debug-build-with-uclibc.patch |  0
 .../qt5/qt5declarative/qt5declarative.hash    |  4 +--
 .../qt5graphicaleffects.hash                  |  4 +--
 .../qt5/qt5imageformats/qt5imageformats.hash  |  4 +--
 package/qt5/qt5location/qt5location.hash      |  4 +--
 ...-compile-failure-with-gstreamer-0-10.patch | 36 -------------------
 package/qt5/qt5multimedia/qt5multimedia.hash  |  4 +--
 .../qt5quickcontrols/qt5quickcontrols.hash    |  4 +--
 .../{5.12.2 => 5.12.4}/qt5quickcontrols2.hash |  4 +--
 package/qt5/qt5script/qt5script.hash          |  4 +--
 package/qt5/qt5scxml/qt5scxml.hash            |  4 +--
 package/qt5/qt5sensors/qt5sensors.hash        |  4 +--
 .../{5.12.2 => 5.12.4}/qt5serialbus.hash      |  4 +--
 .../{5.12.2 => 5.12.4}/qt5serialport.hash     |  4 +--
 package/qt5/qt5svg/qt5svg.hash                |  4 +--
 package/qt5/qt5tools/qt5tools.hash            |  4 +--
 .../qt5virtualkeyboard.hash                   |  4 +--
 package/qt5/qt5wayland/qt5wayland.hash        |  4 +--
 package/qt5/qt5webchannel/qt5webchannel.hash  |  4 +--
 .../{5.12.2 => 5.12.4}/qt5webengine.hash      |  5 +--
 package/qt5/qt5websockets/qt5websockets.hash  |  4 +--
 .../{5.12.2 => 5.12.4}/qt5x11extras.hash      |  4 +--
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  4 +--
 31 files changed, 54 insertions(+), 89 deletions(-)
 rename package/qt5/qt5base/{5.12.2 => 5.12.4}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
 rename package/qt5/qt5base/{5.12.2 => 5.12.4}/0004-double-conversion-enable-for-microblaze.patch (100%)
 rename package/qt5/qt5base/{5.12.2 => 5.12.4}/qt5base.hash (81%)
 rename package/qt5/qt5connectivity/{5.12.2 => 5.12.4}/qt5connectivity.hash (74%)
 rename package/qt5/qt5declarative/{5.12.2 => 5.12.4}/0001-qsgtexture-fix-debug-build-with-uclibc.patch (100%)
 delete mode 100644 package/qt5/qt5multimedia/5.12.2/0001-Fix-compile-failure-with-gstreamer-0-10.patch
 rename package/qt5/qt5quickcontrols2/{5.12.2 => 5.12.4}/qt5quickcontrols2.hash (66%)
 rename package/qt5/qt5serialbus/{5.12.2 => 5.12.4}/qt5serialbus.hash (71%)
 rename package/qt5/qt5serialport/{5.12.2 => 5.12.4}/qt5serialport.hash (74%)
 rename package/qt5/qt5virtualkeyboard/{5.12.2 => 5.12.4}/qt5virtualkeyboard.hash (78%)
 rename package/qt5/qt5webengine/{5.12.2 => 5.12.4}/qt5webengine.hash (99%)
 rename package/qt5/qt5x11extras/{5.12.2 => 5.12.4}/qt5x11extras.hash (74%)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 4e738c75db..247748ca4d 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@

 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.12
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).4
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 5c0eac7c34..6cf05c0ba4 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qt3d-everywhere-src-5.12.2.tar.xz.sha256
-sha256 d4036e7ac146ba78784dde0dd99e8182372b7c38e832e33b61fed4187de0ad06 qt3d-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qt3d-everywhere-src-5.12.4.tar.xz.sha256
+sha256 cfad2e16f40fa07f8be59fa29c0c246743ee67db417ca29772a92f36fa322af3 qt3d-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch b/package/qt5/qt5base/5.12.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.2/0001-qtbase-Fix-build-error-when-using-EGL.patch
rename to package/qt5/qt5base/5.12.4/0001-qtbase-Fix-build-error-when-using-EGL.patch
diff --git a/package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.12.4/0004-double-conversion-enable-for-microblaze.patch
similarity index 100%
rename from package/qt5/qt5base/5.12.2/0004-double-conversion-enable-for-microblaze.patch
rename to package/qt5/qt5base/5.12.4/0004-double-conversion-enable-for-microblaze.patch
diff --git a/package/qt5/qt5base/5.12.2/qt5base.hash b/package/qt5/qt5base/5.12.4/qt5base.hash
similarity index 81%
rename from package/qt5/qt5base/5.12.2/qt5base.hash
rename to package/qt5/qt5base/5.12.4/qt5base.hash
index c6758471f6..5e507ccc0a 100644
--- a/package/qt5/qt5base/5.12.2/qt5base.hash
+++ b/package/qt5/qt5base/5.12.4/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtbase-everywhere-src-5.12.2.tar.xz.sha256
-sha256 562c095a59c95f393762ec53bc05c0d80fad1758fd5ff7a5231967d1a98d56c1 qtbase-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtbase-everywhere-src-5.12.4.tar.xz.sha256
+sha256 20fbc7efa54ff7db9552a7a2cdf9047b80253c1933c834f35b0bc5c1ae021195 qtbase-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index fc36119164..6173ec7453 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcanvas3d-everywhere-src-5.12.2.tar.xz.sha256
-sha256 5e74b083294956505945621f6f56a3d7a314502277a109d6fb6b25c74dea2dca qtcanvas3d-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtcanvas3d-everywhere-src-5.12.4.tar.xz.sha256
+sha256 d7e0e8aa542d077a929fb7700411ca9de1f65ae4748d64168d2e7533facd7869 qtcanvas3d-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 5ec0c07790..25d821700a 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcharts-opensource-src-2.1.3.tar.xz.mirrorlist
 sha256 f636a9b1c255f678f11b36cd73abc807d16dae0c31ecbc75c09524703aae7d2f  qtcharts-opensource-src-2.1.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtcharts-everywhere-src-5.12.2.tar.xz.sha256
-sha256 11d88d3e0ec86730219f7c2efa17f696ec8766415c488b208bfcb8f3c3a68a31 qtcharts-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtcharts-everywhere-src-5.12.4.tar.xz.sha256
+sha256 06ff68a80dc377847429cdd87d4e46465e1d6fbc417d52700a0a59d197669c9e qtcharts-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash b/package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash
similarity index 74%
rename from package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
rename to package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash
index 180d18f016..3afaffa9c8 100644
--- a/package/qt5/qt5connectivity/5.12.2/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/5.12.4/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtconnectivity-everywhere-src-5.12.2.tar.xz.sha256
-sha256 15eb21a1c102408e43c7204a82ad144e97ebe05dc4a15edb0900cd49762a226e qtconnectivity-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtconnectivity-everywhere-src-5.12.4.tar.xz.sha256
+sha256 749d05242b9fae12e80f569fb6b918dc011cb191eeb05147cbde474ca6b173ef qtconnectivity-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch b/package/qt5/qt5declarative/5.12.4/0001-qsgtexture-fix-debug-build-with-uclibc.patch
similarity index 100%
rename from package/qt5/qt5declarative/5.12.2/0001-qsgtexture-fix-debug-build-with-uclibc.patch
rename to package/qt5/qt5declarative/5.12.4/0001-qsgtexture-fix-debug-build-with-uclibc.patch
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 422b45249f..e1c24c93c7 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtdeclarative-everywhere-src-5.12.2.tar.xz.sha256
-sha256 470568745602e7fa21cdca42b1641162e4257cfeb7a2dcf8af24538c9516cc5b qtdeclarative-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtdeclarative-everywhere-src-5.12.4.tar.xz.sha256
+sha256 614105ed73079d67d81b34fef31c9934c5e751342e4b2e0297128c8c301acda7 qtdeclarative-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index b46c68542c..7abdfa117e 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtgraphicaleffects-everywhere-src-5.12.2.tar.xz.sha256
-sha256 429398b6c661897b3c7cd62fb3657a2de60ad9152578edeeca0abde6e7ae5a86 qtgraphicaleffects-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtgraphicaleffects-everywhere-src-5.12.4.tar.xz.sha256
+sha256 0bc38b168fa724411984525173d667aa47076c8cbd4eeb791d0da7fe4b9bdf73 qtgraphicaleffects-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index da656554cb..bf7a06d017 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtimageformats-everywhere-src-5.12.2.tar.xz.sha256
-sha256 1ea757728f205deb6b3f5873f5c7c3129cded5993077500a9fb249559bee7a9c qtimageformats-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtimageformats-everywhere-src-5.12.4.tar.xz.sha256
+sha256 2dee25c3eea90d172cbd40f41450153322b902da1daa7d2370a55124b2307bb3 qtimageformats-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 2a52e1f116..656243eca5 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtlocation-everywhere-src-5.12.2.tar.xz.sha256
-sha256 a31f27f457ac57e7203ae808b95ba0053d182e22425de03840af761e343d8bef qtlocation-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtlocation-everywhere-src-5.12.4.tar.xz.sha256
+sha256 127b40bd7679fead3fb98f4c9c1d71dde9d6d416e90a6000129b61a5f128b3a0 qtlocation-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/5.12.2/0001-Fix-compile-failure-with-gstreamer-0-10.patch b/package/qt5/qt5multimedia/5.12.2/0001-Fix-compile-failure-with-gstreamer-0-10.patch
deleted file mode 100644
index 8bb1f582c7..0000000000
--- a/package/qt5/qt5multimedia/5.12.2/0001-Fix-compile-failure-with-gstreamer-0-10.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 935967a453b47ae7c8e9ad3d94eef3813eab58db Mon Sep 17 00:00:00 2001
-From: Richard Oehlinger <richard.oehlinger@adbsafegate.com>
-Date: Mon, 18 Mar 2019 10:15:13 +0100
-Subject: [PATCH] Fix compile failure with gstreamer 0.10
-
-This fixes an compile failure introduced in commit 67c4ec55.
-
-Fixes: QTBUG-74475
-Change-Id: I0dabb72f8b5cdd75336b15515381ff9d9442788f
-Reviewed-by: VaL Doroshchuk <valentyn.doroshchuk@qt.io>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/qt/qtmultimedia/commit/935967a453b47ae7c8e9ad3d94eef3813eab58db]
----
- src/gsttools/qgstreamerplayersession.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/gsttools/qgstreamerplayersession.cpp b/src/gsttools/qgstreamerplayersession.cpp
-index f21c94c5c..9858f61c9 100644
---- a/src/gsttools/qgstreamerplayersession.cpp
-+++ b/src/gsttools/qgstreamerplayersession.cpp
-@@ -402,9 +402,14 @@ void QGstreamerPlayerSession::setPipeline(GstElement *pipeline)
-
-     if (m_renderer) {
-         auto it = gst_bin_iterate_sinks(GST_BIN(pipeline));
-+#if GST_CHECK_VERSION(1,0,0)
-         GValue data = { 0, 0 };
-         while (gst_iterator_next (it, &data) == GST_ITERATOR_OK) {
-             auto child = static_cast<GstElement*>(g_value_get_object(&data));
-+#else
-+       GstElement *child = nullptr;
-+       while (gst_iterator_next(it, reinterpret_cast<gpointer *>(&child)) == GST_ITERATOR_OK) {
-+#endif
-             if (QLatin1String(GST_OBJECT_NAME(child)) == QLatin1String("qtvideosink")) {
-                 m_renderer->setVideoSink(child);
-                 break;
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 8c150cce40..927123e83c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtmultimedia-everywhere-src-5.12.2.tar.xz.sha256
-sha256 5d3c90c546e64abf523432a3df5e7a3f1b5ad72e7d0b5ea6260729fbefeb30f5 qtmultimedia-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtmultimedia-everywhere-src-5.12.4.tar.xz.sha256
+sha256 7c0759ab6fca2480b10b71a35beeffe0b847adeff5af94eacd1a4531d033423d qtmultimedia-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index c7944c89ba..a3a01364ce 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols-everywhere-src-5.12.2.tar.xz.sha256
-sha256 9b5c87605d08849927dd09bf9b03a939511461372b7e20004abe1116cf9fc73e qtquickcontrols-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtquickcontrols-everywhere-src-5.12.4.tar.xz.sha256
+sha256 32d4c2505337c67b0bac26d7f565ec8fabdc616e61247e98674820769dda9858 qtquickcontrols-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash
similarity index 66%
rename from package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
rename to package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash
index 25ae01a67d..b5e897654f 100644
--- a/package/qt5/qt5quickcontrols2/5.12.2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/5.12.4/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtquickcontrols2-everywhere-src-5.12.2.tar.xz.sha256
-sha256 1fbd703612a2c0257861e07a2b709f6fbad00cb6df70a1c2c1fafa9de522e549 qtquickcontrols2-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtquickcontrols2-everywhere-src-5.12.4.tar.xz.sha256
+sha256 9a447eed38bc8c7d7be7bc407317f58940377c077ddca74c9a641b1ee6200331 qtquickcontrols2-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 4683dce90b..c40b842f3f 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscript-everywhere-src-5.12.2.tar.xz.sha256
-sha256 f8717d51072b4d4455755ae081e45f23f3d0ce25602f96231dd7703bd818a2e6 qtscript-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtscript-everywhere-src-5.12.4.tar.xz.sha256
+sha256 7adb3fe77638c7a6f2a26bca850b0ff54f5fb7e5561d2e4141d14a84305c2b6a qtscript-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 437d18891b..5a4b58a0ad 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtscxml-everywhere-src-5.12.2.tar.xz.sha256
-sha256 69592542fdf4b2efe6a6378ecb1bfdda9e7f48007e191d7f77a0009e213a8623 qtscxml-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtscxml-everywhere-src-5.12.4.tar.xz.sha256
+sha256 696fb72a62018151275fe589fc80cb160d2becab9a3254321d40e2e11a0ad4f8 qtscxml-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:

diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index f297d2aa2a..69db8df051 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsensors-everywhere-src-5.12.2.tar.xz.sha256
-sha256 758a131ad86c4b8b8364e48d659a680ed12d03c091c5ab2958d06b7b0aa2e50c qtsensors-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtsensors-everywhere-src-5.12.4.tar.xz.sha256
+sha256 95873c7ea5960008d6eb41368ca64d68fbd05594ca8c2cd848b1612fc4aec0a9 qtsensors-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash b/package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash
similarity index 71%
rename from package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
rename to package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash
index 098f05f2bb..d81c73d86b 100644
--- a/package/qt5/qt5serialbus/5.12.2/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/5.12.4/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialbus-everywhere-src-5.12.2.tar.xz.sha256
-sha256 16bfee0be81805d82d4f9c04425b5bc2678ca01fa1617fc72613a893438aaa48 qtserialbus-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtserialbus-everywhere-src-5.12.4.tar.xz.sha256
+sha256 69d56905f43ee13e670750e8f46d373835fae81d6343baa7c4004d2a2c6311fc qtserialbus-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/5.12.2/qt5serialport.hash b/package/qt5/qt5serialport/5.12.4/qt5serialport.hash
similarity index 74%
rename from package/qt5/qt5serialport/5.12.2/qt5serialport.hash
rename to package/qt5/qt5serialport/5.12.4/qt5serialport.hash
index 66ddf16f35..6b93cf5c27 100644
--- a/package/qt5/qt5serialport/5.12.2/qt5serialport.hash
+++ b/package/qt5/qt5serialport/5.12.4/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtserialport-everywhere-src-5.12.2.tar.xz.mirrorlist
-sha256 72163cedda4c6fa787db8666bec6b5057272dc87bf8de6addba3440dd472bd7f qtserialport-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtserialport-everywhere-src-5.12.4.tar.xz.mirrorlist
+sha256 bf487df8a9fb2eddf103842b57a75b17ef4c498ee40306ae9997017c82b0ad39 qtserialport-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 4f06a21d86..54523ea5a4 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtsvg-everywhere-src-5.12.2.tar.xz.sha256
-sha256 ed9f2118a6d33f53e5d9ed18dcd36f252a4fbaf68382a1c4a663ba75b25ae7bd qtsvg-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtsvg-everywhere-src-5.12.4.tar.xz.sha256
+sha256 110812515a73c650e5ebc41305d9a243dadeb21f485aaed773e394dd84ce0d04 qtsvg-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 41c98e733a..2f9af2be6d 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qttools-everywhere-src-5.12.2.tar.xz.sha256
-sha256 4aa3a089794ab1c629b666fffb5da4371351a9e85ea691d5d988c2ff63586005 qttools-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qttools-everywhere-src-5.12.4.tar.xz.sha256
+sha256 3b0e353860a9c0cd4db9eeae5f94fef8811ed7d107e3e5e97e4a557f61bd6eb6 qttools-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash
similarity index 78%
rename from package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
rename to package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash
index 245f2b4a70..10960b1cfa 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.4/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz.sha256
-sha256 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtualkeyboard-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtvirtualkeyboard-everywhere-src-5.12.4.tar.xz.sha256
+sha256 33ac0356f916995fe5a91582e12b4c4f730c705808ea3c14e75c6e350e8131e6 qtvirtualkeyboard-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 2fdcc34382..a511ee6071 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwayland-everywhere-src-5.12.2.tar.xz.sha256
-sha256 b7840692420d106871433eb1b678277f09927d48ec6eb31a1851ee9c60d9df84 qtwayland-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwayland-everywhere-src-5.12.4.tar.xz.sha256
+sha256 2fade959c3927687134c597d85c12ba1af22129a60ab326c2dc77a648e74e6b7 qtwayland-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index e56c7907eb..4712349f79 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebchannel-everywhere-src-5.12.2.tar.xz.sha256
-sha256 8eb9cff9492937daa1bf5d001e39afec68c310ce5596807345e2a555dcc80b8e qtwebchannel-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebchannel-everywhere-src-5.12.4.tar.xz.sha256
+sha256 ab571a1b699e61a86be1a6b8d6ffd998d431c4850cc27e9a21f81fa5923bfdb7 qtwebchannel-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.12.2/qt5webengine.hash b/package/qt5/qt5webengine/5.12.4/qt5webengine.hash
similarity index 99%
rename from package/qt5/qt5webengine/5.12.2/qt5webengine.hash
rename to package/qt5/qt5webengine/5.12.4/qt5webengine.hash
index 57276030a2..232807f0cd 100644
--- a/package/qt5/qt5webengine/5.12.2/qt5webengine.hash
+++ b/package/qt5/qt5webengine/5.12.4/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebengine-everywhere-src-5.12.2.tar.xz.sha256
-sha256 082b1d6e60c1be61881bc8533acc67d9688620d6b3a538417f62b27b34ead493 qtwebengine-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebengine-everywhere-src-5.12.4.tar.xz.sha256
+sha256 fccf5c945412c19c3805323211b504ac8becbf191c638a2dc85ec91abfb1b331 qtwebengine-everywhere-src-5.12.4.tar.xz

 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -41,6 +41,7 @@ sha256 584e795ba5833279c327245594d6dc216fc664144fa3626a0bdf136bc00af76c  src/3rd
 sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/axe-core/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/bazel/LICENSE
 sha256 0518cf49c09398259d54fcfff0b5fd36456162c6439886660e53627b3073ef22  src/3rdparty/chromium/third_party/blanketjs/LICENSE
+sha256 228eadfc94c664f3e31833d7eb2d682127038cb44a0d482b6d6c1026f3fce306  src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE
 sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2
 sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3f4f438a4d..e4286d3239 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtwebsockets-everywhere-src-5.12.2.tar.xz.sha256
-sha256 ab9ce815b1466abe52910c9b50c0f61df8af74f9521574bb534f7f562d0e8c04 qtwebsockets-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtwebsockets-everywhere-src-5.12.4.tar.xz.sha256
+sha256 b471eda2f486d21c51fc3bc53bb8844022117e746d5f15c5eabb82cd37eb2abe qtwebsockets-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash b/package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash
similarity index 74%
rename from package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
rename to package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash
index 1ab741d9e8..a9657493e5 100644
--- a/package/qt5/qt5x11extras/5.12.2/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/5.12.4/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtx11extras-everywhere-src-5.12.2.tar.xz.mirrorlist
-sha256 711f39ddc6237787a5522278be235fe3af547a4674bb265e6dff5c2892fe6084 qtx11extras-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtx11extras-everywhere-src-5.12.4.tar.xz.mirrorlist
+sha256 49cc009eaf4a01ca7dbe12651ef39de9a43860acb674aec372e70b209f9bae1e qtx11extras-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 1113860644..ca47666a0f 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz

-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.2/submodules/qtxmlpatterns-everywhere-src-5.12.2.tar.xz.sha256
-sha256 2e535ec17b542f2a0b87a9db93284666015cc07b6188894ace7e75104c6d860d qtxmlpatterns-everywhere-src-5.12.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.4/submodules/qtxmlpatterns-everywhere-src-5.12.4.tar.xz.sha256
+sha256 0bea1719bb948f65cbed4375cc3e997a6464f35d25b631bafbd7a3161f8f5666 qtxmlpatterns-everywhere-src-5.12.4.tar.xz

 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
--
2.22.0
