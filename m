From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 20:18:51 +0100
Subject: [Buildroot] [git commit] qt5: bump latest version to 5.9.4
Message-ID: <20180227192026.356F081243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee5724ca058419e352cf2271e4339bd9436a9ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5connectivity:
 - removed
 0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
 (upstream comitted [1])

qt5quickcontrols2:
 - removed 0001-Example-flatstyle-needs-widgets-module.patch (upstream
 comitted [2])

qt5webengine:
 - removed 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
 (upstream comitted, reverted and recomitted [3])

[1] https://codereview.qt-project.org/211810
[2] https://codereview.qt-project.org/212583
[3] https://codereview.qt-project.org/209547

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5charts/qt5charts.hash               |  4 +-
 ...rtrate-server-needs-only-core-and-bluetoo.patch | 32 --------
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 ...01-Example-flatstyle-needs-widgets-module.patch | 31 --------
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
 package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 ...ad-libEGL-and-libGLES2-symbols-implicitly.patch | 89 ----------------------
 package/qt5/qt5webengine/qt5webengine.hash         |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 30 files changed, 53 insertions(+), 205 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index f2d60add41..3c03c10066 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5_VERSION_MAJOR = 5.9
-QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_VERSION = $(QT5_VERSION_MAJOR).4
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 18441ead0d..9d629eb540 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qt3d-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 97925132f0583ccd76f5e104c849341df3abba73dd4d9b647622a23bdae6273f qt3d-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qt3d-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 ad18b1c98a100025a96d600008c9478f646432c9e8cf11fb9a405c55f1970550 qt3d-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index c6e694ab39..a72d8cd4da 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtbase-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 9e7c44005e7691dc7c85165bd4510282c47f0163521f4973eab71dbdb39a9982 qtbase-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtbase-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 69e6bde3ab00673a77e1506173551fec7d0cd899fcbf9b1260517db1b61004cf qtbase-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 1664f626cd..68d1691d3d 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcanvas3d-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 5e38b17844af801be57844da0379cc6882750b9019034f4fe884aae70c300abc qtcanvas3d-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcanvas3d-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 ef358503e2f243c2e162c3fef2181707ff3485376198d8e4fcc6d979e6ebed29 qtcanvas3d-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 3a9db5b297..a0c2d0d739 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcharts-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ec1783a81d5715fc48a3276e67b90a66cac3e283ac14fc3bf88b2058994d69e9  qtcharts-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtcharts-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 75f72983fde6720a093d5f065d33f47e77a4bd2188ae9d41ebb9a4fcc459d3e7 qtcharts-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch b/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
deleted file mode 100644
index cb0e8d18b1..0000000000
--- a/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 13c2f56cc9c3bbfe0c96031107e7fafd437703d9 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 18 Nov 2017 21:07:44 +0100
-Subject: [PATCH] Example heartrate-server needs only core and bluetooth module
-
-Fixes compile with disabled gui module.
-
-Task-number: QTBUG-64597
-Change-Id: I376dede3db987e524f97070344cc119e0ee1d187
-
-Upstream: https://codereview.qt-project.org/211810
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/bluetooth/heartrate-server/heartrate-server.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/examples/bluetooth/heartrate-server/heartrate-server.pro b/examples/bluetooth/heartrate-server/heartrate-server.pro
-index 4ccf486c..edd011b9 100644
---- a/examples/bluetooth/heartrate-server/heartrate-server.pro
-+++ b/examples/bluetooth/heartrate-server/heartrate-server.pro
-@@ -1,7 +1,7 @@
- TEMPLATE = app
- TARGET = heartrate-server
- 
--QT += bluetooth
-+QT = core bluetooth
- CONFIG += c++11
- 
- SOURCES += main.cpp
--- 
-2.14.2
-
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index aaa3ef275b..21d0ded4e0 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtconnectivity-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e2891e6e8d91e82e3c4d5667f3146062458067c0b706d65ac0fc7562afce0649 qtconnectivity-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtconnectivity-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 dba750363bf55648a08bc44372f423d31f405f6deac5393f0b76376a3e9e0c8b qtconnectivity-opensource-src-5.9.4.tar.xz
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 6f171ffa40..308a4f0f56 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtdeclarative-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 505f66d2062c1d84ce743a0b4969531e1cf94e30970dc64efffe10f74f989407 qtdeclarative-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtdeclarative-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 dc638a3b207dd2c6607a21415f6dd8d760568535dfe4b485fdb4576c98832d65 qtdeclarative-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 8770d72a19..9a1bbdac32 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtgraphicaleffects-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 790b029bc8bdbb5c9548ecad2ff6e73b7da3deabbdba6bacac4a6aacd3a0f0d9 qtgraphicaleffects-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtgraphicaleffects-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 97f75327d7d20ec02e920f1c86ee2bc4063396833d93215e509e95c58e24b8ef qtgraphicaleffects-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index c56ed7d587..37d0519ed4 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtimageformats-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 d4b309ddbac2275cafadffc62047a26ed8f169bde015925761894843eae725dd qtimageformats-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtimageformats-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 69e17081a8649b7db138073942d07d2e99f78f4b954ccd6aab3a406e92dbddd9 qtimageformats-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 5bb2021e09..3f9ba667c1 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtlocation-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 80fd425cde8747c1fc79aa90994a9caf921d7c79ff41babec692fe43cdc74ce1 qtlocation-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtlocation-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 37ed68b0243a30b836cda79802e3f33404b1792f7b845a25b2e4989dc2fed2a0 qtlocation-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 750c3379ca..5cb253790a 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtmultimedia-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e79558d24ace9b4444d91d807b85778b6a0a592e7d1500ffadf45f7d3b8238a6 qtmultimedia-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtmultimedia-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 4952a00712e209ad34241b22cb338bad2f44c42a77316b3b05389faeee1e4e74 qtmultimedia-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 84890c5612..ca1e217d83 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 300eeebd7d2c243c0123bc2324b5643b3f967c0816aead0ba7b993aeeac0e226 qtquickcontrols-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 16a205a09bfe9d54c38e9ef555e6f1ecd082576ef2a33cb80b6d49a7ccaed98b qtquickcontrols-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch b/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch
deleted file mode 100644
index 17e3b3610e..0000000000
--- a/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 10d92524cd6736c767c9ce55a1d9b9f1a2a69a9f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 25 Nov 2017 22:26:58 +0100
-Subject: [PATCH] Example flatstyle needs widgets module
-
-Fixes compile with disabled widgets module.
-
-Task-number: QTBUG-64761
-Change-Id: I743884d77d51e89061d87cab006bab0cafc9ddb7
-
-Upstream: https://codereview.qt-project.org/212583
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/quickcontrols2/quickcontrols2.pro | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/examples/quickcontrols2/quickcontrols2.pro b/examples/quickcontrols2/quickcontrols2.pro
-index 858759f..8310e9b 100644
---- a/examples/quickcontrols2/quickcontrols2.pro
-+++ b/examples/quickcontrols2/quickcontrols2.pro
-@@ -6,5 +6,6 @@ SUBDIRS += \
-     contactlist \
-     sidepanel \
-     swipetoremove \
--    flatstyle \
-     wearable
-+
-+qtHaveModule(widgets): SUBDIRS += flatstyle
--- 
-2.7.4
-
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 7a6040f34c..15f23b5e4b 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols2-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 21aaa26956ad0ccc3ce86ced7925ceae4b4cef25c6c5ef2f7ded608431420843 qtquickcontrols2-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtquickcontrols2-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 1528a7a356e7073f5eeca93ba6e3330ba708d31c3a8f10dc1ce4546d9557640c qtquickcontrols2-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 66582ad448..bcb37801a8 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscript-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b80bfaaf58f154b68101e438a1881f669cb9974026926be7755adb00af355566 qtscript-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscript-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 4045da078600b5928f8206341c442cc7f5eec8c51f477f7367072ab5c28ee053 qtscript-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index b0d861573c..dbe81ecbb6 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscxml-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 d8f51fa8eddd09fef29d8fad6e570e9ca9403469543ab10cb5cfad738786a81b qtscxml-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtscxml-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 1decc54e157a1492066fe0e7d534c6a9888c096731af7cac9b64c52fd3950b75 qtscxml-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 26e13d60b1..1a78d46770 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsensors-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b95ea20b3d616655435357671558631da6fe6970500b7e6d35d1111f0b8cdac1 qtsensors-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsensors-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 793f3aa056b7ce9ae91acb599eab80525983e5e973bb4a2fdba82776ec9cd458 qtsensors-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 9191fd2198..005fd0b5dc 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialbus-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ef62745e1793515e03fa586171de13eb17ee7699c9eb626f76a4dc5a00c46938 qtserialbus-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialbus-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 ce91402e9781ef6ff37e313ce504b7f6fecb74e83d57d640fcbf82f1133fcbc4 qtserialbus-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 15abf7ac09..04122ef804 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialport-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 4cdd3e9157ec3e91078f993cd28651989fa2429a409e19d398fb9cced231abdf qtserialport-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtserialport-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 0c3d8e2908743c167113ce27be7b685e6f5c827c108107411d0c4c8b2f2b519c qtserialport-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 03659702d6..a94082c4bf 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsvg-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 df6628a60c8fbbcff99e6a24955c29494268d741509a3367a2294031ab4f5df2 qtsvg-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtsvg-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 a2f22732bfd4f0f0204443daaa59448298ab5018750dce4600d01d969355037a qtsvg-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 44856400e7..40176e6aee 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qttools-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 442c38de3e35f9dcc355dadff35436e23a5a7abd7dd1167a3bf6325e3d9284ff qttools-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qttools-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 95aa5782d5a79be22fba36cea4dc2319cf2a2060a3cc1e24e6585b8d98996e87 qttools-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 54ded48dea..81c81edff1 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtvirtualkeyboard-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b9313f744026f0dcf6e1008212880cd34851499d8b6bc9fc9fbaa1e4e52532ff qtvirtualkeyboard-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtvirtualkeyboard-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 bf742a886054f12a73621952879cf7a2182304c498bc31ec8a61ef376b07e1ee qtvirtualkeyboard-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index f03a15ceb9..86dc65179f 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwayland-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 308e8c44b0ad13520868365d72786d3e3f0b384da99ee72ba543cd866f655f6d qtwayland-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwayland-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 3f7496522013e6122bb8dc00d0c3cc7753a44dca94fa3b22096eaa21e6099874 qtwayland-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 188e5ea1f3..f1b69438d8 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebchannel-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 632795b293f1318e9aaa1e124b6a39b1625c8c1e35b0a9f05a02ea0066458358 qtwebchannel-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebchannel-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 90303a72da63f250b6d6731b74827b0a1764904aac790a7264a3f65c94039aa9 qtwebchannel-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch b/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
deleted file mode 100644
index b8ef687f99..0000000000
--- a/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad Mon Sep 17 00:00:00 2001
-From: Viktor Engelmann <viktor.engelmann@qt.io>
-Date: Fri, 7 Jul 2017 12:56:19 +0200
-Subject: [PATCH] Load libEGL and libGLES2 symbols implicitly
-
-Instead of explicitly loading libraries from hard-coded locations,
-we now just call dlopen(NULL, RTLD_LAZY). This returns a handle to
-the host process'es context, which already contains the symbols of
-both these libraries, because we link against them.
-It was necessary to bypass LoadLibrary, because that expects a non-NULL
-file path, so we couldn't pass NULL through that interface.
-
-Task-number: QTBUG-57761
-Change-Id: I29f037dfe542222b5188a33c7727c81a464a87bb
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
-Reviewed-by: Michal Klocek <michal.klocek@qt.io>
-Upstream-Status: Merged
-Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
----
- src/core/surface_factory_qt.cpp | 40 ++++++++--------------------------------
- 1 file changed, 8 insertions(+), 32 deletions(-)
-
-diff --git a/src/core/surface_factory_qt.cpp b/src/core/surface_factory_qt.cpp
-index 36c05ec5..e8be8480 100644
---- a/src/core/surface_factory_qt.cpp
-+++ b/src/core/surface_factory_qt.cpp
-@@ -51,51 +51,27 @@
- #if defined(USE_OZONE)
- 
- #include <EGL/egl.h>
--
--#ifndef QT_LIBDIR_EGL
--#define QT_LIBDIR_EGL "/usr/lib"
--#endif
--#ifndef QT_LIBDIR_GLES2
--#define QT_LIBDIR_GLES2 QT_LIBDIR_EGL
--#endif
-+#include <dlfcn.h>
- 
- namespace QtWebEngineCore {
- 
--base::NativeLibrary LoadLibrary(const base::FilePath& filename) {
--    base::NativeLibraryLoadError error;
--    base::NativeLibrary library = base::LoadNativeLibrary(filename, &error);
--    if (!library) {
--        LOG(ERROR) << "Failed to load " << filename.MaybeAsASCII() << ": " << error.ToString();
--        return NULL;
--    }
--    return library;
--}
--
- bool SurfaceFactoryQt::LoadEGLGLES2Bindings()
- {
--    base::FilePath libEGLPath = QtWebEngineCore::toFilePath(QT_LIBDIR_EGL);
--    libEGLPath = libEGLPath.Append("libEGL.so.1");
--    base::NativeLibrary eglLibrary = LoadLibrary(libEGLPath);
--    if (!eglLibrary)
--        return false;
--
--    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
--    libGLES2Path = libGLES2Path.Append("libGLESv2.so.2");
--    base::NativeLibrary gles2Library = LoadLibrary(libGLES2Path);
--    if (!gles2Library)
-+    base::NativeLibrary eglgles2Library = dlopen(NULL, RTLD_LAZY);
-+    if (!eglgles2Library) {
-+        LOG(ERROR) << "Failed to open EGL/GLES2 context " << dlerror();
-         return false;
-+    }
- 
--    gl::GLGetProcAddressProc get_proc_address = reinterpret_cast<gl::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglLibrary, "eglGetProcAddress"));
-+    gl::GLGetProcAddressProc get_proc_address = reinterpret_cast<gl::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglgles2Library, "eglGetProcAddress"));
-     if (!get_proc_address) {
-         LOG(ERROR) << "eglGetProcAddress not found.";
--        base::UnloadNativeLibrary(eglLibrary);
--        base::UnloadNativeLibrary(gles2Library);
-+        base::UnloadNativeLibrary(eglgles2Library);
-         return false;
-     }
- 
-     gl::SetGLGetProcAddressProc(get_proc_address);
--    gl::AddGLNativeLibrary(eglLibrary);
--    gl::AddGLNativeLibrary(gles2Library);
-+    gl::AddGLNativeLibrary(eglgles2Library);
-     return true;
- }
- 
--- 
-2.13.2
-
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 35acf8da2c..9195c7f3b6 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 45ae1142fd87271c100f4d7889427738e774e86db5d8f6bcf9ceb99d18571d37 qtwebengine-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebengine-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 04b4305489b326bbbfe32b5f1da4a33ae034e54130776e3616b9e6d45a5a8271 qtwebengine-opensource-src-5.9.4.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index e76482bcfe..368be9b497 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebsockets-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ce069dff5b552bc6039bcf17e211d2c8837757e2194773bb54054105866111de qtwebsockets-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtwebsockets-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 72970209f0d4260d11688d3d38d9e953d7fa4309a8a55e2c32726a545333e800 qtwebsockets-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index e835648c52..943577bbd6 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtx11extras-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e4e0bf8cbb629758ab85b72d240d7424642482f602ce414e06deef4e147bf2be qtx11extras-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtx11extras-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 879b18c44550e1be86c29adcca555c92915aab9222c40384beae2f7aa22b22a8 qtx11extras-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index e7f9d60fdd..9c68eae1d8 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtxmlpatterns-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 cf9c66a612a963382f7b4b51ac8ee5e920bd035b26ecb5c5957f8f3d3286f0ba qtxmlpatterns-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.4/submodules/qtxmlpatterns-opensource-src-5.9.4.tar.xz.mirrorlist
+sha256 faf51ad39e5c2b856b38989c79d69253ad74d4b8d3278d4aaa79d3c547047f79 qtxmlpatterns-opensource-src-5.9.4.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
