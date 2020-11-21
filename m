From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Nov 2020 22:12:28 +0100
Subject: [Buildroot] [PATCH v1 01/31] package/qt5: bump version to 5.15.2
Message-ID: <20201121211258.12068-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base:
  - header.BSD was remove with commit 'Remove license header
    templates from qtbase' ([1])

qt5tools:
  - rebase 0001-Disable-designer-tool-fixes-configure-error.patch

qt5webengine:
  - update 3rdparty license info

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=9ac8b9c92eb01bf755995669ecd7ab3acf21dd7d

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5.mk                            |   2 +-
 package/qt5/qt53d/qt53d.hash                  |   4 +-
 package/qt5/qt5base/qt5base.hash              |   5 +-
 package/qt5/qt5base/qt5base.mk                |   1 -
 package/qt5/qt5charts/qt5charts.hash          |   4 +-
 .../qt5/qt5connectivity/qt5connectivity.hash  |   4 +-
 .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
 .../qt5graphicaleffects.hash                  |   4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
 package/qt5/qt5location/qt5location.hash      |   4 +-
 package/qt5/qt5lottie/qt5lottie.hash          |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
 .../qt5quickcontrols2/qt5quickcontrols2.hash  |   4 +-
 .../qt5quicktimeline/qt5quicktimeline.hash    |   4 +-
 .../qt5remoteobjects/qt5remoteobjects.hash    |   4 +-
 package/qt5/qt5script/qt5script.hash          |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash    |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash  |   4 +-
 package/qt5/qt5svg/qt5svg.hash                |   4 +-
 ...-designer-tool-fixes-configure-error.patch |  10 +-
 package/qt5/qt5tools/qt5tools.hash            |   4 +-
 .../qt5virtualkeyboard.hash                   |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
 package/qt5/qt5webengine/chromium-latest.inc  | 116 ++++++++++------
 package/qt5/qt5webengine/qt5webengine.hash    | 126 ++++++++++++------
 package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
 package/qt5/qt5webview/qt5webview.hash        |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash    |   4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
 33 files changed, 222 insertions(+), 146 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 0a961e6125..db6ccd2b42 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).1
+QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 0d66fa4db5..c726daec61 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qt3d-everywhere-src-5.15.1.tar.xz.sha256
-sha256  29aac2c38b6b2fb1e7d54829ff8b4c9aae12a70ffab9707c7388f1e134dd9411  qt3d-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qt3d-everywhere-src-5.15.2.tar.xz.sha256
+sha256  03ed6a48c813c75296c19f5d721184ab168280b69d2656cf16f877d3d4c55c1d  qt3d-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 91b9f19999..03336e63e6 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtbase-everywhere-src-5.15.1.tar.xz.sha256
-sha256  33960404d579675b7210de103ed06a72613bfc4305443e278e2d32a3eb1f3d8c  qtbase-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtbase-everywhere-src-5.15.2.tar.xz.sha256
+sha256  909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8  qtbase-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
@@ -7,5 +7,4 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
 sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ed308c1fa2..65ca331854 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -97,7 +97,6 @@ QT5BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3
 QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5BASE_LICENSE += , BSD-3-Clause (examples)
-QT5BASE_LICENSE_FILES += header.BSD
 endif
 
 QT5BASE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_QT5BASE_CONFIG_FILE))
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 5d81af78ee..ac66b624cd 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtcharts-everywhere-src-5.15.1.tar.xz.sha256
-sha256  a59efbf095bf8a62c29f6fe90a3e943bbc7583d1d2fed16681675b923c45ef3b  qtcharts-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtcharts-everywhere-src-5.15.2.tar.xz.sha256
+sha256  e0750e4195bd8a8b9758ab4d98d437edbe273cd3d289dd6a8f325df6d13f3d11  qtcharts-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 59c948320f..e53fee0908 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtconnectivity-everywhere-src-5.15.1.tar.xz.sha256
-sha256  53c30039d4f2301a1a66c646690436e1f8cce0a3fd212ca0783f346a115d8016  qtconnectivity-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtconnectivity-everywhere-src-5.15.2.tar.xz.sha256
+sha256  0380327871f76103e5b8c2a305988d76d352b6a982b3e7b3bc3cdc184c64bfa0  qtconnectivity-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 9033f6a6bf..ca7f1fe29f 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtdeclarative-everywhere-src-5.15.1.tar.xz.sha256
-sha256  7e30f0ccba61f9d71720b91d7f7523c23677f23cd96065cb71df1b0df329d768  qtdeclarative-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtdeclarative-everywhere-src-5.15.2.tar.xz.sha256
+sha256  c600d09716940f75d684f61c5bdaced797f623a86db1627da599027f6c635651  qtdeclarative-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index d2ea24d74a..52da93483e 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtgraphicaleffects-everywhere-src-5.15.1.tar.xz.sha256
-sha256  f4a4d3e1c6d8b0b200b6759ebb615344275957d56d2ef6a33641f853120466d1  qtgraphicaleffects-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtgraphicaleffects-everywhere-src-5.15.2.tar.xz.sha256
+sha256  ec8d67f64967d5046410490b549c576f9b9e8b47ec68594ae84aa8870173dfe4  qtgraphicaleffects-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 3808787cba..feeb42bb22 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtimageformats-everywhere-src-5.15.1.tar.xz.sha256
-sha256  75e72b4c11df97af3ff64ed26df16864ce1220a1cc730e49074ab9d72f658568  qtimageformats-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtimageformats-everywhere-src-5.15.2.tar.xz.sha256
+sha256  bf8285c7ce04284527ab823ddc7cf48a1bb79131db3a7127342167f4814253d7  qtimageformats-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 051b36ecd3..6327e69c1f 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtlocation-everywhere-src-5.15.1.tar.xz.sha256
-sha256  093af763a70d126c4b9f6a22ebf8218fe95dc0151e40666b2389fdf55c9f1a2c  qtlocation-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtlocation-everywhere-src-5.15.2.tar.xz.sha256
+sha256  984fcb09e108df49a8dac35d5ce6dffc49caafd2acb1c2f8a5173a6a21f392a0  qtlocation-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index 3af1c6de31..740f9072f2 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtlottie-everywhere-src-5.15.1.tar.xz.sha256
-sha256  845987860c7990035a7cd9a0e7581d210f786e551882df8b5be69f08987f2ba0  qtlottie-everywhere-src-5.15.1.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtlottie-everywhere-src-5.15.2.tar.xz.sha256
+sha256  cec6095ab8f714e609d2ad3ea8c4fd819461ce8793adc42abe37d0f6dc432517  qtlottie-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 2fab59d0da..42b7e0e158 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtmultimedia-everywhere-src-5.15.1.tar.xz.sha256
-sha256  ed6e75bec9c98559c0fbc91ff746185b1e1845139b2c7a5a843e1e8880697d99  qtmultimedia-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtmultimedia-everywhere-src-5.15.2.tar.xz.sha256
+sha256  0c3758810e5131aabcf76e4965e4c18b8911af54d9edd9305d2a8278d8346df5  qtmultimedia-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 36ec675d50..44891b8ee3 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquickcontrols-everywhere-src-5.15.1.tar.xz.sha256
-sha256  0172f88779305aae57f3842538e91361ae9bc5ca2275ee5ce9d455309f0f2c7e  qtquickcontrols-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquickcontrols-everywhere-src-5.15.2.tar.xz.sha256
+sha256  c393fb7384b1f047f10e91a6832cf3e6a4c2a41408b8cb2d05af2283e8549fb5  qtquickcontrols-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index ffce270c16..fb57ff19d0 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquickcontrols2-everywhere-src-5.15.1.tar.xz.sha256
-sha256  e902b3baf9fe02a5bd675fc71118e282bb6a128c94f45be6f65d7d6db991f2af  qtquickcontrols2-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquickcontrols2-everywhere-src-5.15.2.tar.xz.sha256
+sha256  671b6ce5f4b8ecc94db622d5d5fb29ef4ff92819be08e5ea55bfcab579de8919  qtquickcontrols2-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index 8318044bd2..ac97fc319c 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtquicktimeline-everywhere-src-5.15.1.tar.xz.sha256
-sha256  15665d489a6a29ff406a5fe2b4ac14ab102fb6e43864e115432be065da073cca  qtquicktimeline-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquicktimeline-everywhere-src-5.15.2.tar.xz.sha256
+sha256  b9c247227607437acec7c7dd18ad46179d20369c9d22bdb1e9fc128dfb832a28  qtquicktimeline-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index 6575a47c35..c0f1351790 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtremoteobjects-everywhere-src-5.15.1.tar.xz.sha256
-sha256 71b58fdac717645fa6f8b6ecb79b86841c540838877d100fabe2381175c4154e  qtremoteobjects-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtremoteobjects-everywhere-src-5.15.2.tar.xz.sha256
+sha256  6781b6bc90888254ea77ce812736dac00c67fa4eeb3095f5cd65e4b9c15dcfc2  qtremoteobjects-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 972099ce9d..52258facde 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtscript-everywhere-src-5.15.1.tar.xz.sha256
-sha256  0a62152835363a9cc20558d0c2953ec03426324138578baa18fc2cc4d62b18ca  qtscript-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtscript-everywhere-src-5.15.2.tar.xz.sha256
+sha256  a299715369afbd1caa4d7fa2875d442eab91adcaacafce54a36922442624673e  qtscript-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 494cd525be..ffc9fc3f9f 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtscxml-everywhere-src-5.15.1.tar.xz.sha256
-sha256  2289f8c1b51ac368cc0ba8a6a987b44d2c97b43697b00e64582e43afedffcd2b  qtscxml-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtscxml-everywhere-src-5.15.2.tar.xz.sha256
+sha256  60b9590b9a41c60cee7b8a8c8410ee4625f0389c1ff8d79883ec5a985638a7dc  qtscxml-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 9f3001d42c..6e71d9e997 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtsensors-everywhere-src-5.15.1.tar.xz.sha256
-sha256  8096b9ffe737434f9564432048f622f6be795619da4e1ed362ce26dddb2cea00  qtsensors-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtsensors-everywhere-src-5.15.2.tar.xz.sha256
+sha256  3f0011f9e9942cad119146b54d960438f4568a22a274cdad4fae06bb4e0e4839  qtsensors-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 19a9c67744..e31459c4c9 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtserialbus-everywhere-src-5.15.1.tar.xz.sha256
-sha256  9ee220826032ae1f8e68d9ec7dddc10ddc4c2e0a771d34009ae307b07eeca751  qtserialbus-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtserialbus-everywhere-src-5.15.2.tar.xz.sha256
+sha256  aeeb7e5c0d3f8503215b22e1a84c0002ca67cf63862f6e3c6ef44a67ca31bd88  qtserialbus-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 66e1a6b0be..a67d90aa18 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtserialport-everywhere-src-5.15.1.tar.xz.sha256
-sha256  3605130148936ec3fd632bc13c70873d74ef9a8a0b28b17f3be917d848cfb8d9  qtserialport-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtserialport-everywhere-src-5.15.2.tar.xz.sha256
+sha256  59c559d748417306bc1b2cf2315c1e63eed011ace38ad92946af71f23e2ef79d  qtserialport-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index ba64d4bf3d..32a0b679f0 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtsvg-everywhere-src-5.15.1.tar.xz.sha256
-sha256  308160223c0bd7492d56fb5d7b7f705bfb130947ac065bf39280ec6d7cbe4f6a  qtsvg-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtsvg-everywhere-src-5.15.2.tar.xz.sha256
+sha256  8bc3c2c1bc2671e9c67d4205589a8309b57903721ad14c60ea21a5d06acb585e  qtsvg-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
index f90952254f..cf2cd94c28 100644
--- a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
+++ b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
@@ -1,4 +1,4 @@
-From 34894c12122b2026aa595b42fe84a4648a6b7992 Mon Sep 17 00:00:00 2001
+From 22d7a9050b04b021e33430d0f7e3c5ee80c24caa Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 17 Dec 2019 11:01:59 +0100
 Subject: [PATCH] Disable designer tool (fixes configure error).
@@ -13,6 +13,8 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Rebased for Qt5.15.1]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.15.2]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  src/linguist/linguist/linguist.pro | 2 +-
  src/src.pro                        | 5 +----
@@ -29,7 +31,7 @@ index d083896..7d74cfc 100644
  DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII
  
 diff --git a/src/src.pro b/src/src.pro
-index 8ed567b..d784808 100644
+index f2675c7..360de50 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -6,12 +6,9 @@ qtHaveModule(widgets) {
@@ -40,12 +42,12 @@ index 8ed567b..d784808 100644
 -                      pixeltool
 +            SUBDIRS = pixeltool
  
-             !static|contains(QT_PLUGINS, qtsqlite): SUBDIRS += assistant
+             !static|contains(QT_PLUGINS, qsqlite): SUBDIRS += assistant
 -
 -            linguist.depends = designer
          }
          qtHaveModule(quick):qtConfig(thread):qtConfig(toolbutton): SUBDIRS += distancefieldgenerator
      }
 -- 
-2.28.0
+2.29.2
 
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 0aa7bd9cf0..04761f48be 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qttools-everywhere-src-5.15.1.tar.xz.sha256
-sha256  c98ee5f0f980bf68cbf0c94d62434816a92441733de50bd9adbe9b9055f03498  qttools-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qttools-everywhere-src-5.15.2.tar.xz.sha256
+sha256  c189d0ce1ff7c739db9a3ace52ac3e24cb8fd6dbf234e49f075249b38f43c1cc  qttools-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 5043b80529..189ce3b356 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtvirtualkeyboard-everywhere-src-5.15.1.tar.xz.sha256
-sha256  8cf62c4f0662f3f4b52b32f9d2cf1845a636d3df663869a98d47dfe748eb1c3d  qtvirtualkeyboard-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtvirtualkeyboard-everywhere-src-5.15.2.tar.xz.sha256
+sha256  9a3193913be30f09a896e3b8c2f9696d2e9b3f88a63ae9ca8c97a2786b68cf55  qtvirtualkeyboard-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 271ef2583f..24796d2a28 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwayland-everywhere-src-5.15.1.tar.xz.sha256
-sha256  e2ff47b874f283a952efd6a8aaf5e8cdc462b5216dda1051b60fc6e80ac657b6  qtwayland-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwayland-everywhere-src-5.15.2.tar.xz.sha256
+sha256  193732229ff816f3aaab9a5e2f6bed71ddddbf1988ce003fe8dd84a92ce9aeb5  qtwayland-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index ec3c79b87d..dad3cedc09 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebchannel-everywhere-src-5.15.1.tar.xz.sha256
-sha256  7f3ef8e626d932bbc121810661a62ece3955ab982340676a19001417e2faf9fc  qtwebchannel-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebchannel-everywhere-src-5.15.2.tar.xz.sha256
+sha256  127fe79c43b386713f151ed7d411cd81e45e29f9c955584f29736f78c9303ec1  qtwebchannel-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index a10e71f125..a5fdfdc1f1 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -15,7 +15,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/base/third_party/valgrind/LICENSE \
 	src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE \
 	src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE \
-	src/3rdparty/chromium/build/fuchsia/fidlgen_js/third_party/enum34/LICENSE \
 	src/3rdparty/chromium/buildtools/LICENSE \
 	src/3rdparty/chromium/LICENSE \
 	src/3rdparty/chromium/LICENSE.chromium_os \
@@ -31,6 +30,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/angle/src/third_party/volk/LICENSE.md \
 	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/bin/jsonschema/LICENSE \
 	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/contrib/natvis/LICENSE \
 	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/license.txt \
@@ -40,7 +40,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/m4sugar/LICENSE \
 	src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/skeletons/LICENSE \
 	src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE \
-	src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE \
 	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
 	src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE \
 	src/3rdparty/chromium/third_party/arcore-android-sdk/LICENSE \
@@ -111,14 +110,17 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/dawn/LICENSE \
 	src/3rdparty/chromium/third_party/decklink/LICENSE \
 	src/3rdparty/chromium/third_party/devscripts/COPYING \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits_worker/lighthouse/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE_python \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm_modes/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/dagre_layout/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/formatter_worker/acorn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/sdk/wasm_source_map/LICENSES.deps \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/fabricjs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lit-html/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lit-html/package/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/wasmparser/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/abbrev/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/accepts/LICENSE \
@@ -128,9 +130,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ajv/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/amdefine/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-colors/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-wrap/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/anymatch/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/append-transform/license \
@@ -142,6 +144,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assert/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assign-symbols/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/astral-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ast-types/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async-limiter/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/code-frame/LICENSE \
@@ -185,13 +188,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase-keys/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chai/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chardet/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/check-error/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/node_modules/glob-parent/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cipher-base/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cliui/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-width/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/clone/LICENSE \
@@ -240,6 +243,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dezalgo/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diffie-hellman/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff-match-patch/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/di/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.closure-compiler \
@@ -262,10 +266,12 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-promise/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-abstract/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-html/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/LICENSE.BSD \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/node_modules/esprima/LICENSE.BSD \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-plugin-mocha/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-plugin-rulesdir/LICENSE.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-scope/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-utils/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-visitor-keys/LICENSE \
@@ -289,7 +295,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-json-stable-stringify/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-levenshtein/LICENSE.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fd-slicer/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/file-entry-cache/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fileset/LICENSE-MIT \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fill-range/LICENSE \
@@ -298,6 +304,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/ms/license.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/find-up/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flatted/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/LICENSE \
@@ -310,14 +317,14 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-caller-file/LICENSE.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-func-name/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-stream/license \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/node_modules/is-glob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/graceful-fs/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/handlebars/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-binary2/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hash-base/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has/LICENSE-MIT \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-symbols/LICENSE \
@@ -352,7 +359,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extendable/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extglob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-finite/license \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-generator-function/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-glob/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-nan/LICENSE \
@@ -364,6 +371,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-stream/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-symbol/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-api/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-diff/node_modules/minimist/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-coverage/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-hook/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/LICENSE \
@@ -371,6 +379,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/node_modules/supports-color/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/async/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.BSD \
@@ -402,11 +411,14 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/node_modules/minimist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/node_modules/rimraf/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-sourcemap-loader/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/acorn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/async/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/source-map/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lcid/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/levn/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/bin/license-checker \
@@ -420,6 +432,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/strip-bom/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/node_modules/path-exists/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash-deep/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash.memoize/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log4js/LICENSE \
@@ -438,7 +451,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-db/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-types/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimalistic-assert/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimatch/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimist/LICENSE \
@@ -469,8 +482,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-inspect/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-is/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-keys/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/omit-deep-lodash/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/once/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/on-finished/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/node_modules/wordwrap/LICENSE \
@@ -479,7 +493,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/osenv/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-homedir/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-locale/license \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pad/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pako/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parent-module/license \
@@ -491,7 +505,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-browserify/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-dirname/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-exists/license \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-key/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-parse/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/license \
@@ -510,6 +524,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-locate/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/plugin-error/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/prelude-ls/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/private/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process-nextick-args/license.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/progress/LICENSE \
@@ -519,10 +534,12 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pump/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/punycode/LICENSE-MIT.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/ws/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/qs/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring-es3/License.md \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring/License.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ramda/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randombytes/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randomfill/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/range-parser/LICENSE \
@@ -534,6 +551,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-package-json/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/recast/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/recast/node_modules/esprima/LICENSE.BSD \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/redent/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/regexpp/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/remap-istanbul/LICENSE \
@@ -541,9 +560,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-directory/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-main-filename/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/requires-port/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rfdc/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rimraf/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ripemd160/LICENSE \
@@ -560,10 +579,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setimmediate/LICENSE.txt \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setprototypeof/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sha.js/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/signal-exit/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slide/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-adapter/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/LICENSE \
@@ -593,13 +612,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string_decoder/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimleft/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimright/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-bom/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-eof/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-indent/license \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/ansi-regex/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/string-width/license \
@@ -616,6 +635,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/treeify/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/trim-newlines/license \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tslib/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tsutils/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tty-browserify/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-check/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typedarray/LICENSE \
@@ -623,10 +643,22 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-is/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/chai/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/color-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/eslint-plugin/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/eslint-plugin/node_modules/regexpp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/experimental-utils/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/experimental-utils/node_modules/eslint-scope/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/node_modules/glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/node_modules/semver/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typescript/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/eslint-visitor-keys/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/estree/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/filesystem/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/json-schema/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/mocha/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/node/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/puppeteer/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/uglify-js/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ultron/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/universalify/LICENSE \
@@ -691,6 +723,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/axe-core/LICENSE \
 	src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/pyjson5/src/LICENSE \
 	src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE \
+	src/3rdparty/chromium/third_party/dpkg-shlibdeps/LICENSE \
 	src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE \
 	src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE \
 	src/3rdparty/chromium/third_party/espresso/LICENSE \
@@ -715,8 +748,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/fontconfig/src/COPYING \
 	src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT \
 	src/3rdparty/chromium/third_party/fuchsia-sdk/LICENSE \
-	src/3rdparty/chromium/third_party/gestures/gestures/LICENSE \
-	src/3rdparty/chromium/third_party/gestures/LICENSE \
 	src/3rdparty/chromium/third_party/gif_player/LICENSE \
 	src/3rdparty/chromium/third_party/glfw/src/LICENSE.md \
 	src/3rdparty/chromium/third_party/glslang/LICENSE \
@@ -726,12 +757,12 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/googletest/src/googletest/LICENSE \
 	src/3rdparty/chromium/third_party/googletest/src/LICENSE \
 	src/3rdparty/chromium/third_party/google-truth/LICENSE \
-	src/3rdparty/chromium/third_party/gson/LICENSE \
 	src/3rdparty/chromium/third_party/guava/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE \
 	src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE \
 	src/3rdparty/chromium/third_party/hamcrest/LICENSE \
 	src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING \
+	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/ms-use/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.LESSER \
 	src/3rdparty/chromium/third_party/hunspell/COPYING.MPL \
@@ -744,10 +775,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/ijar/LICENSE \
 	src/3rdparty/chromium/third_party/ink/LICENSE \
 	src/3rdparty/chromium/third_party/inspector_protocol/LICENSE \
-	src/3rdparty/chromium/third_party/intellij/LICENSE \
 	src/3rdparty/chromium/third_party/isimpledom/LICENSE \
 	src/3rdparty/chromium/third_party/jacoco/LICENSE \
 	src/3rdparty/chromium/third_party/javalang/LICENSE \
+	src/3rdparty/chromium/third_party/jetifier_standalone/LICENSE \
 	src/3rdparty/chromium/third_party/jinja2/LICENSE \
 	src/3rdparty/chromium/third_party/jsoncpp/LICENSE \
 	src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE \
@@ -764,11 +795,10 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/vector/LICENSE \
 	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE \
 	src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE \
-	src/3rdparty/chromium/third_party/libevdev/LICENSE \
+	src/3rdparty/chromium/third_party/libgav1/src/LICENSE \
 	src/3rdparty/chromium/third_party/libgifcodec/LICENSE.md \
 	src/3rdparty/chromium/third_party/libipp/LICENSE \
 	src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE \
-	src/3rdparty/chromium/third_party/libjpeg/LICENSE \
 	src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md \
 	src/3rdparty/chromium/third_party/libovr/LICENSE \
 	src/3rdparty/chromium/third_party/libpng/LICENSE \
@@ -817,6 +847,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/one_euro_filter/LICENSE \
 	src/3rdparty/chromium/third_party/openh264/src/LICENSE \
 	src/3rdparty/chromium/third_party/openscreen/src/LICENSE \
+	src/3rdparty/chromium/third_party/openscreen/src/third_party/mozilla/LICENSE.txt \
 	src/3rdparty/chromium/third_party/openvr/src/LICENSE \
 	src/3rdparty/chromium/third_party/opus/src/COPYING \
 	src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt \
@@ -847,7 +878,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pymock/LICENSE.txt \
 	src/3rdparty/chromium/third_party/pystache/LICENSE \
 	src/3rdparty/chromium/third_party/Python-Markdown/LICENSE.md \
-	src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE \
+	src/3rdparty/chromium/third_party/pywebsocket3/src/LICENSE \
 	src/3rdparty/chromium/third_party/qcms/src/COPYING \
 	src/3rdparty/chromium/third_party/quic_trace/src/LICENSE \
 	src/3rdparty/chromium/third_party/quic_trace/src/third_party/fonts/LICENSE \
@@ -863,13 +894,14 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/robolectric/licenses/javolution.license.txt \
 	src/3rdparty/chromium/third_party/robolectric/licenses/pivotal.labs.license.txt \
 	src/3rdparty/chromium/third_party/s2cellid/LICENSE \
-	src/3rdparty/chromium/third_party/sfntly/COPYING.txt \
-	src/3rdparty/chromium/third_party/sfntly/src/cpp/COPYING.txt \
+	src/3rdparty/chromium/third_party/schema_org/LICENSE \
 	src/3rdparty/chromium/third_party/shaderc/src/LICENSE \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang \
 	src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools \
 	src/3rdparty/chromium/third_party/simplejson/LICENSE.txt \
 	src/3rdparty/chromium/third_party/sinonjs/LICENSE \
+	src/3rdparty/chromium/third_party/six/LICENSE \
+	src/3rdparty/chromium/third_party/six/src/LICENSE \
 	src/3rdparty/chromium/third_party/skia/include/third_party/skcms/LICENSE \
 	src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE \
 	src/3rdparty/chromium/third_party/skia/LICENSE \
@@ -891,14 +923,16 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/utils/vscode/src/lsp/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/LICENSE \
-	src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms \
-	src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md \
+	src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms \
+	src/3rdparty/chromium/third_party/sqlite/src/LICENSE.md \
+	src/3rdparty/chromium/third_party/subresource-filter-ruleset/LICENSE \
 	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
 	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
 	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
 	src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING \
 	src/3rdparty/chromium/third_party/test_fonts/LICENSE \
 	src/3rdparty/chromium/third_party/tlslite/LICENSE \
+	src/3rdparty/chromium/third_party/turbine/LICENSE \
 	src/3rdparty/chromium/third_party/ub-uiautomator/LICENSE \
 	src/3rdparty/chromium/third_party/unrar/LICENSE \
 	src/3rdparty/chromium/third_party/unrar/src/license.txt \
@@ -912,6 +946,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/web-animations-js/sources/COPYING \
 	src/3rdparty/chromium/third_party/webdriver/COPYING \
 	src/3rdparty/chromium/third_party/webdriver/LICENSE \
+	src/3rdparty/chromium/third_party/webgpu-cts/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/webgpu-cts/src/third_party/jquery/LICENSE.txt \
 	src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/fft4g/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/spl_sqrt_floor/LICENSE \
 	src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
@@ -930,6 +966,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/dat.gui/LICENSE \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/gl-matrix/LICENSE \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md \
+	src/3rdparty/chromium/third_party/weston/LICENSE \
+	src/3rdparty/chromium/third_party/weston/src/COPYING \
+	src/3rdparty/chromium/third_party/weston/src/data/COPYING \
 	src/3rdparty/chromium/third_party/widevine/LICENSE \
 	src/3rdparty/chromium/third_party/woff2/LICENSE \
 	src/3rdparty/chromium/third_party/wuffs/LICENSE \
@@ -941,7 +980,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/tools/grit/third_party/six/LICENSE \
 	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
 	src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE \
-	src/3rdparty/chromium/tools/symsrc/COPYING-pefile \
 	src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE \
 	src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt \
 	src/3rdparty/chromium/v8/LICENSE \
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index faabac39d3..d798c30527 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebengine-everywhere-src-5.15.1.tar.xz.sha256
-sha256  f903e98fe3cd717161252710125fce011cf882ced96c24968b0c38811fbefdf2  qtwebengine-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebengine-everywhere-src-5.15.2.tar.xz.sha256
+sha256  c8afca0e43d84f7bd595436fbe4d13a5bbdb81ec5104d605085d07545b6f91e0  qtwebengine-everywhere-src-5.15.2.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -22,7 +22,6 @@ sha256 538edc6f52c563cf06eca1bac8dd785ff60ef5a371a950265700d5d40386db6e  src/3rd
 sha256 79955cd80438f041387eb080f2675394e36a806b8b17eca63a4bc568d839509e  src/3rdparty/chromium/base/third_party/valgrind/LICENSE
 sha256 c45766baef552c59eeb1fdfbbc690e52e4cd5b135dfd325f21bdfe8ddfe28ce6  src/3rdparty/chromium/base/third_party/xdg_mime/LICENSE
 sha256 18351de3d7e2dc469cc83e77d38a3e25d010251e34eb348bbd1a76275e313997  src/3rdparty/chromium/base/third_party/xdg_user_dirs/LICENSE
-sha256 88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  src/3rdparty/chromium/build/fuchsia/fidlgen_js/third_party/enum34/LICENSE
 sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/buildtools/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/LICENSE
 sha256 212c5a071f61512786b5e5840b3d70c85e017f3f82939ad4d4a870fc48b33477  src/3rdparty/chromium/LICENSE.chromium_os
@@ -38,6 +37,7 @@ sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rd
 sha256 86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE
 sha256 a08ba10adec47027ef8078848729837b1c5a42f140718d7afd65c23f1eeec392  src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE
 sha256 31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE
+sha256 336f505f8d5aa73ea40b4d798dde86953e9c1f6525757f1d7f18120fea09bb1d  src/3rdparty/chromium/third_party/angle/src/third_party/volk/LICENSE.md
 sha256 837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/bin/jsonschema/LICENSE
 sha256 394faaedb93c1da8ecbd61322518834908fee64381117e01a611bf9fac20baa6  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/contrib/natvis/LICENSE
 sha256 a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/license.txt
@@ -47,7 +47,6 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/m4sugar/LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/skeletons/LICENSE
 sha256 bfec18debedcb337f8af53f143ccf0b1575d0b7c30deaee137f10397eca0d353  src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE
 sha256 b23e682fda7310afe43505ed6041919ccff8f9e0c6799ebd7542cbcef11102e3  src/3rdparty/chromium/third_party/apple_apsl/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE
 sha256 584e795ba5833279c327245594d6dc216fc664144fa3626a0bdf136bc00af76c  src/3rdparty/chromium/third_party/arcore-android-sdk/LICENSE
@@ -66,7 +65,7 @@ sha256 663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  src/3rd
 sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hpack/LICENSE
 sha256 16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/html5lib/LICENSE
 sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hyperframe/LICENSE
-sha256 63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE
+sha256 b7529b8c07171a78a8c36c3283905528e4812945d977d125eb926e8ccbf245b6  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE
 sha256 df336397e09e764416fc33b555703b1cdddd3a0cfea8a013ad1cad565c8be2f5  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE
 sha256 60bd7c54856bf9387221bde5ab55d516d7cea15870d0fed69406bcd1c8ec7c9d  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
 sha256 0c125a4dab5ab869473e6491db22f6c0a7f8a4de58588d03bb2b16c0c8ebd7de  src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE
@@ -118,14 +117,17 @@ sha256 2da4494d2a8b5c742afbb905b10621e40129284c977ac138e3081ed0d9d83aed  src/3rd
 sha256 b77e952e3feaebd807d27784988b19fb60f83f9fc9a0c03e6aedbbffd5d6f8ee  src/3rdparty/chromium/third_party/dawn/LICENSE
 sha256 43452b94e6aa0c2d076ad25b87f580c11571689d52f3aa1a1f7bdcab31a0bd15  src/3rdparty/chromium/third_party/decklink/LICENSE
 sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/devscripts/COPYING
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits/lighthouse/LICENSE
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits_worker/lighthouse/LICENSE
 sha256 a3f2fe2ac6b471aa80c737c5d283dd049bdc903a73835ee6d4d2cac02fdd53bf  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE
 sha256 c6daa4e8737d15aa7140b4f7eb82b9d4829bd2fd27132c43e282203b9c67dfc4  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE_python
 sha256 13110d66c514a7890c4b388a353bc08fa094fe13d5ed7f3a222cc0a0caa3fd17  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm_modes/LICENSE
 sha256 9fea307fe830918e12b6822f943f4b59bd7715614efb68e834a141ca758bd5f2  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/dagre_layout/LICENSE
 sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/formatter_worker/acorn/LICENSE
 sha256 f734f7708439c275f3599e2df7de84cd9f360bd13620a30ab376af6c9deb213b  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/sdk/wasm_source_map/LICENSES.deps
+sha256 b60e9b66bf4f9ab3aa5d1d20b18410a632fd624cf4ce3aa1eb839087caf35958  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/fabricjs/LICENSE
+sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lighthouse/LICENSE
+sha256 55efdea1a9fe503ed3cd89c2776d3d2131795defaebea421754b428333fbfba3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lit-html/LICENSE
+sha256 1a5ae5ab221af81b68f4f4c156c0d2e044851272c5e2e6c07d685946557878ea  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/lit-html/package/LICENSE
+sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/third_party/wasmparser/LICENSE
 sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/third_party/devtools-frontend/src/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/abbrev/LICENSE
 sha256 71f83c4c0621102a56d9853812777b85751bce7e9726f686f5b056c1f8a4b0e6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/accepts/LICENSE
@@ -135,9 +137,9 @@ sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rd
 sha256 e85e131fa4ed25538ff1f4962ced1fb6f68b079bd9164a790597a0f30b8fd030  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ajv/LICENSE
 sha256 ea97081f183590d87376f5fe73b7150c79863a73167f47ed87c41e191f89eb0b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/amdefine/LICENSE
 sha256 10e7818a114cf8b702a2263ad424b3cd9d34254df6039e47bb3f412000b0ae00  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-colors/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/license
 sha256 0798f37cff4a3f438c071316e41f94ffe110116a313ab0fc4f8caa07218f1f0f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-wrap/LICENSE
 sha256 5a3b0007c4203f10fe11b3fe8747253eb994f135e10b73e1f88ada941af09c6e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/anymatch/LICENSE
 sha256 0b61ac8491c66669491fdb328200203822b91d2a0461f5cd898fe0944ea97e41  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/append-transform/license
@@ -149,6 +151,7 @@ sha256 e80373b1ed0f33cecc47173b4b0c6afe0d0318b32dbd84116a1a957e3f7f43a8  src/3rd
 sha256 6239c6144c31e58cf925c34483606969c555574d64ffa96518ab5d7f45c75d43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assert/LICENSE
 sha256 0798f37cff4a3f438c071316e41f94ffe110116a313ab0fc4f8caa07218f1f0f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assign-symbols/LICENSE
 sha256 69dee148a2cc470554dfa7142e830662062394d0fe67cddd379aba90dc60d6b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/astral-regex/license
+sha256 a374b737c41b30b1ec04c5fcc17d1b853f008f217cc43a9dbea441abd9afde70  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ast-types/LICENSE
 sha256 d9fed24f132985934fca621c4dc1dfb53e03377a24d0568d424383d7eaa9c0ac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async/LICENSE
 sha256 e5a57cdd72e279910183799153134d0e749a5664fc459c8eacbecf72532b7db3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async-limiter/LICENSE
 sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/code-frame/LICENSE
@@ -192,13 +195,13 @@ sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rd
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase-keys/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase/license
 sha256 b181da80336ff9dd1043fc8be1a764d7382363433319aa872e4d2cb5ce2a3066  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chai/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/license
 sha256 7df1d6cf5b4112cbe277a84269e02ae631603a9a3a21b8328a34c30b8c3dd1ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chardet/LICENSE
 sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/check-error/LICENSE
 sha256 db9ba183d4cbfbaf6c27db2effddbb84b46340c33ed32a066bc0b144a3ea1298  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/LICENSE
 sha256 2c46f1325bd3822a33c1e2c1e49c18d13127ac00f9c8b3b79196c7a126f73cd9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/node_modules/glob-parent/LICENSE
 sha256 cf93ad78cfd5f3523248675aeb2a46e003367596883d4fa26a0c38d553ab0f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cipher-base/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/license
 sha256 2dc0465729366c3a7890dfa9e972a1ba7048a26c02116fb8b419a6a1ac110149  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cliui/LICENSE.txt
 sha256 33fa5470b2195e410b075a32516b6ad27784b8a8ff74ae90cfd60c14b76e6644  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-width/LICENSE
 sha256 3fb0857ef0133928cf72c88dfc464e931486e88778961eedec25585e2321507f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/clone/LICENSE
@@ -247,6 +250,7 @@ sha256 bd47ce7b88c7759630d1e2b9fcfa170a0f1fde522be09e13fb1581a79d090400  src/3rd
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dezalgo/LICENSE
 sha256 db6109f994692150ed82cd904bb053c73b97b23678bf52047f747bfec11e1934  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diffie-hellman/LICENSE
 sha256 152f0fb43e953fcf5c56c5bfa4c834bb96b1603e4026319c613dd3e734f305cf  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff/LICENSE
+sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff-match-patch/LICENSE
 sha256 545278991ee5f1fb4372f913ec44837cff9395175140f8f21118074330a659cb  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/di/LICENSE
 sha256 5c272e206669b79ee20fa89fa8fa888d5b56186f16c55a5614753ad3412e2ae9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.closure-compiler
@@ -269,10 +273,12 @@ sha256 c2c31e096c312163e9a7a908a5209f335eb4c3381d6c404dd1e1b91fe65707fc  src/3rd
 sha256 da852e222c72bc04a0a9046aac35f2e5d33775a8ea9f1d8f59b1cfd195ef9bb0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-promise/LICENSE
 sha256 00d402c2bbe7c67369bd01ce2c16b8ed46ccc949a1ee2d6bb8f9606afa8c7434  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-abstract/LICENSE
 sha256 255aa557a1f55224ce522f311629c0bf20854740a67955cefd798fbd1d3d1ded  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-html/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/license
 sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/LICENSE.BSD
 sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/node_modules/esprima/LICENSE.BSD
 sha256 db83f2ede67f36cfab1ea0721ea2ee97515863e9a65346881f305e430451cc91  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint/LICENSE
+sha256 b67ae8fe5f32d0e6164655de53075cba04bb69c23e7d11efcfed6a0fa265ef64  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-plugin-mocha/LICENSE
+sha256 541c415066b6139f0fb6ad55f633abbc62f0ba6b54543f1ff00c762e76a90239  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-plugin-rulesdir/LICENSE.md
 sha256 d3a724e2ed749f172ff70b62a1d0631b7d4b0ea273782365a3464d4e2d6b6dbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-scope/LICENSE
 sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-utils/LICENSE
 sha256 d8bf34ff6d190640a01e7704ad78253fc181bc128949d71273fbbaa12f33c0b4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-visitor-keys/LICENSE
@@ -296,7 +302,7 @@ sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rd
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-json-stable-stringify/LICENSE
 sha256 942a98cb8846a6354266193f173c1354615827fbb7d67f68399599dff12c4d6a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-levenshtein/LICENSE.md
 sha256 176d95320d565cb034d8323797b6cd6160238f625453687f98aad2085c46c3b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fd-slicer/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/license
 sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/file-entry-cache/LICENSE
 sha256 99513010b6a19894e01864cba86bf98291bef8251a302d90ab1a572d91ebacc8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fileset/LICENSE-MIT
 sha256 35bdd8a44339719441900fb50fbefc5e2dca1ca662cbaed7a687de842c8b70f2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fill-range/LICENSE
@@ -305,6 +311,7 @@ sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rd
 sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/ms/license.md
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/find-up/license
 sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/node_modules/rimraf/LICENSE
 sha256 95a61f61553614db5421a2cefb17c22ff6b2b4b2206f5bc8913d04f72a22b033  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat/LICENSE
 sha256 5097efeab30293dd7e26d6960b6b94f1aeca958d22f1eca3535c482a891e95a9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flatted/LICENSE
 sha256 bfa8a54bb952ccda79f0f1889721d108f5b605babbb2b8a3705ffb52f4132eb7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/LICENSE
@@ -317,14 +324,14 @@ sha256 773e131a7684726005a7e4688a80b4620033bc08499bc1404dd1a1eb3bca725e  src/3rd
 sha256 902dbb4154679fb2b8d7c33878183f45b268d01eae5e5033dddaa8852d45f213  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-caller-file/LICENSE.md
 sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-func-name/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-stream/license
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/license
 sha256 6236fa0b88a4a0cce3dda0367979491b2052b3c8d6b1c10b3668de083e86a7f0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob/LICENSE
 sha256 a2a19c04f527f7582fb2e58887f0a90f403732fc6accd7322287f0f5949b489e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/LICENSE
 sha256 3672fb6ef1c214578dfee689643516c2685f61ab08d130517ca8ea24f383a840  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/node_modules/is-glob/LICENSE
 sha256 2fc5460f1526810979054ecd18cd01349b57f38ea56d1e920afdea34d104540c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/graceful-fs/LICENSE
 sha256 8a48a335d7dcc06e3da2bea89220cfe978394b1bc84a3e628e60bc4864917915  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/handlebars/LICENSE
 sha256 dc1fcc41f783463ed272ada875a7d3d1baf6c6279e5efada2c4ef2ca72db39e1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-binary2/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/license
 sha256 898f204abbbbde58c6230a31842c59aeb8040fbcffa924db28e6d0b1d7631a3a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hash-base/LICENSE
 sha256 4fe5fd7b3318def0b74f8bf8c9276403f01da628fa8888822661519d80f237d3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has/LICENSE-MIT
 sha256 206c1adcf206dc0031b11232f5b054ec5f1662407ab1ca415247921cab2068ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-symbols/LICENSE
@@ -359,7 +366,7 @@ sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rd
 sha256 4922620a5741e9d1bb43dde132021a982ae7c545eed1c6e00b555d6fe978005f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extendable/LICENSE
 sha256 73b5283588baa142c5baaef5f56d3e8fdea7a30b214e8c5737e87640f882453a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extglob/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-finite/license
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/license
 sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-generator-function/LICENSE
 sha256 4cd903859549d4b20b571041f96dfae1136ed079c476126268f9d7cc1b611150  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-glob/LICENSE
 sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-nan/LICENSE
@@ -371,6 +378,7 @@ sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rd
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-stream/license
 sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-symbol/LICENSE
 sha256 b661867c1d66a1b71ee3a6109159874334cd5c182a80d1bcc7353b5a4c6823c6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-api/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-diff/node_modules/minimist/LICENSE
 sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-coverage/LICENSE
 sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-hook/LICENSE
 sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/LICENSE
@@ -378,6 +386,7 @@ sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rd
 sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/node_modules/supports-color/license
 sha256 b661867c1d66a1b71ee3a6109159874334cd5c182a80d1bcc7353b5a4c6823c6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/node_modules/rimraf/LICENSE
 sha256 d38a14ec66572a5588bba501f05eef0874e3ce929f0ddcb749c7557f4fdcb905  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/LICENSE
 sha256 4d3083ec594b158fd6adfdc6c9423ffe0746d2d93cebfb98f1a35b69da78051e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/async/LICENSE
 sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.BSD
@@ -409,11 +418,14 @@ sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rd
 sha256 6e4e577107740b24ebd73cb813be506861d706129e502ca7160683a5cea4c129  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/LICENSE
 sha256 296b9a3c5e4eb7b79a6f1dca9a27ee31e48fe5c9d48a32ec31ac924b65ff287c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/node_modules/minimist/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/node_modules/rimraf/LICENSE
+sha256 2b3adc1e55676b9443f76bdb17e42371de98a4be6abd3ae6e5f3590f6f3e4f6f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-sourcemap-loader/LICENSE
 sha256 3c50a3d2df1468f5e7b723d4c931c1c7ba6775740aa1ef9fa49586ddb7b168fd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/LICENSE
 sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/acorn/LICENSE
 sha256 d9fed24f132985934fca621c4dc1dfb53e03377a24d0568d424383d7eaa9c0ac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/async/LICENSE
 sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/source-map/LICENSE
 sha256 162413c61e0982abe89a06bf7a02ec760dc49a7364d838bd9f01daebb5b95954  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/node_modules/rimraf/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lcid/license
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/levn/LICENSE
 sha256 150d7707d4532d57bdb5718637ff62fff1f075921c5ffaa084df27f900bfea76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/bin/license-checker
@@ -427,6 +439,7 @@ sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rd
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/strip-bom/license
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/node_modules/path-exists/license
+sha256 d778ae0088806b771424967d88efb68f3adb3705c31c3b7c0a052fe2eebd5268  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash-deep/LICENSE
 sha256 f71e8ed126b46346494aad5486874cd8f0aafe95092ed67d2e3cb6110f939abc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash/LICENSE
 sha256 90df9e2220f682e1f77e24b1c0f72d2de18b818096c957a65698e74c41a4826f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash.memoize/LICENSE.txt
 sha256 66da8b277e527c270de6abc57727c58032267d161a81dbac02c3eed45fd13366  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log4js/LICENSE
@@ -445,7 +458,7 @@ sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rd
 sha256 965ef284f7f4c176842ec2e87fa13e79feed777d56d7a21a5a3b38f1bb6dc288  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-db/LICENSE
 sha256 8f2658c03422c408b2b2ce4d151decc3b1a6fd3d86e5ca9433777bccdcdf75a2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime/LICENSE
 sha256 71f83c4c0621102a56d9853812777b85751bce7e9726f686f5b056c1f8a4b0e6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-types/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/license
 sha256 136fee1129ea96ce18b41c26a72f5d4ba196ee41bfd73b55d0b8509cdda148e9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimalistic-assert/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimatch/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimist/LICENSE
@@ -476,8 +489,9 @@ sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rd
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-inspect/LICENSE
 sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-is/LICENSE
 sha256 5640e5cbe2e9f57f6ccfdd8dbfbeadb875495bdbcb69d2666ce3177ccd0942e4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-keys/LICENSE
+sha256 30792070c6ec188caccbadc5ee32c3e33fdc5e9044c2f08cb1d01213e5a01084  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/omit-deep-lodash/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/once/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/license
 sha256 8089bcc08845ec143e5761f4a101a65b8c792a0dedbfeeb90a15560c0b77f768  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/on-finished/LICENSE
 sha256 05991c2e8f070b69ec5b656c2c12fd07cd0153dd157d39b050b82af59b319a01  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/node_modules/wordwrap/LICENSE
@@ -486,7 +500,7 @@ sha256 d25d1d6d28c35cb6f358e2833e405c4e53fec2fa24d156323ddea5cd438d3407  src/3rd
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/osenv/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-homedir/license
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-locale/license
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/license
 sha256 a6859a1cdfa7b6ebcdd52505c41bb72e747675b3e7fe0b908c0ac09280f0ba93  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pad/LICENSE
 sha256 a04665b3b2de56c66730c1f720f528175739e4104f79073614aa611da1e85539  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pako/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parent-module/license
@@ -498,7 +512,7 @@ sha256 11d017c3b9f1ee3f44caf7203035f0461d5b57e0db8ce1bc03a9af34fa7d3f6b  src/3rd
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-browserify/LICENSE
 sha256 9c791b69df62b2264d0a846786f82b00bd6943200a0b10eba66a1ba7a7785fc8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-dirname/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-exists/license
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-key/license
 sha256 3f4609137f65070541b9214300ea0d640af8192857de0eeb2b03403003d9228a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-parse/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/license
@@ -517,6 +531,7 @@ sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rd
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-locate/license
 sha256 f476f01d5da0d8124355eeb79b42b95d2ad2a88d229dbe02b815628760a8cb43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/plugin-error/LICENSE
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/prelude-ls/LICENSE
+sha256 f4bbb78fa28677ad9b9c0a4b7a255e23c0b24e619c873ed66a11d47c16c88114  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/private/LICENSE
 sha256 59a400d04c5078579acc27ddd6452c1bdf763f9506e01364700935fbb1a7c91b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process/LICENSE
 sha256 ecdccbcf39024f624ded480c01c0b25458e1eca8f26ecf040933865ce56d9a4f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process-nextick-args/license.md
 sha256 d7d2a7786de7c7cfd96f920c6f12927d74e1d2a861ca4498bf465c3bc3f4c21c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/progress/LICENSE
@@ -526,10 +541,12 @@ sha256 db6109f994692150ed82cd904bb053c73b97b23678bf52047f747bfec11e1934  src/3rd
 sha256 3fe8d55a98dbf260eace67c00cf9bc53edb46234e840098a0b93df3096b97fb6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pump/LICENSE
 sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/punycode/LICENSE-MIT.txt
 sha256 a1e4522979cd422b42d0b464072eb7d0d218651659f56bf09f8c147384e3f105  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/rimraf/LICENSE
 sha256 3de284c8e6fa7e8437eff6f53695471e0332129a5b42a79361e17b7637de94b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/ws/LICENSE
 sha256 d2f9d2835eb09ccf673e118e4fdc372075437c1787e66c2202912fbe3e5ee9e1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/qs/LICENSE
 sha256 cb72d9714ddc21e758d63f423be0caddf909d23ccbb10a2f5201a870818e4f57  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring-es3/License.md
 sha256 cb72d9714ddc21e758d63f423be0caddf909d23ccbb10a2f5201a870818e4f57  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring/License.md
+sha256 f0606775704212c0b49fb4df8193f7ec190d057551fc857d9f3aaa482b878e29  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ramda/LICENSE.txt
 sha256 ddc0dd5947bd2966b9a4cfde098566b011de0acfbe7814536955636ce9e3eced  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randombytes/LICENSE
 sha256 ddc0dd5947bd2966b9a4cfde098566b011de0acfbe7814536955636ce9e3eced  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randomfill/LICENSE
 sha256 f655e6291356ec0de7a8f0e69f294961a2cea86678ec94588be1e6a492e278ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/range-parser/LICENSE
@@ -541,6 +558,8 @@ sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rd
 sha256 69be713b3d6c33e0dba76c4d23d986d568593abca04ce47d75162af255d6a345  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-package-json/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg-up/license
+sha256 6ca87d1dce5b82873603e566fd83dabe8771fb169013337d4a14bb9bbf794687  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/recast/LICENSE
+sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/recast/node_modules/esprima/LICENSE.BSD
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/redent/license
 sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/regexpp/LICENSE
 sha256 aac9937f6a8dbc3328d2b90ab19691333ec4931634ea808673c897e623a9efc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/remap-istanbul/LICENSE
@@ -548,9 +567,9 @@ sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rd
 sha256 a92e52eb1fa7cd746e3827bf01d3a3589bbc8e1e51348b1da042aad165525ad1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-directory/LICENSE
 sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-main-filename/LICENSE.txt
 sha256 3b2a6a268aa815dec121d614245e03b5c68db1f044d5b525e36db7d5dc7fb9c3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/requires-port/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/license
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/license
 sha256 1ce941682a96c7b898ecd125d0f2e22319758ea6f3adbf498a65d649b0f3f7dd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rfdc/LICENSE
 sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rimraf/LICENSE
 sha256 4847d2fd9ed54cc006dd79f5a14fa5dd35eb8274dca511418166e195e277c05b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ripemd160/LICENSE
@@ -567,10 +586,10 @@ sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rd
 sha256 c4b4ad3a5746f1f5249a6dd90396ec519264e1bb02e01e48a6522c48a3a97cb4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setimmediate/LICENSE.txt
 sha256 76d6d1ea0c268da37dd3c961b4fcfb23dee8417fff9e8786d4d44c585b781b69  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setprototypeof/LICENSE
 sha256 58dcf38be1438f739412b87eb70d64bf00e9976d529bb119f700d8b3167924f0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sha.js/LICENSE
-sha256 e6fdf7ac2af533b4436d99aa75df32aa78690510f7d68a3e73e8576967298d2f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/LICENSE
+sha256 e6fdf7ac2af533b4436d99aa75df32aa78690510f7d68a3e73e8576967298d2f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/license
 sha256 e05b1eaf5b5f99b7ad75cd1f38858ff9a311780b97715ead67936d60bf96aa7e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/signal-exit/LICENSE.txt
-sha256 3dc3b3d3a284d871f7f307655c90fb101d73abbf87bbddeefd2f67883353bdbc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/LICENSE
+sha256 3dc3b3d3a284d871f7f307655c90fb101d73abbf87bbddeefd2f67883353bdbc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/license
 sha256 05dc4d785ac3a488676d3ed10e901b75ad89dafcc63f8e66610fd4a39cc5c7e8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slide/LICENSE
 sha256 56b7b228fde8d638cc7f1c3d0022cf111764083ac4f803b7a50a90388dce3788  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-adapter/LICENSE
 sha256 62e2032a1e1458b1d92a62f5fc51be48e08b95062295c91a9f3bd3686809d37e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/LICENSE
@@ -600,13 +619,13 @@ sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rd
 sha256 11f2aafb37d06b3ee5bdaf06e9811141d0da05263c316f3d627f45c20d43261b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string_decoder/LICENSE
 sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimleft/LICENSE
 sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimright/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-bom/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-eof/license
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-indent/license
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/license
 sha256 37b6932865726cf59cbfb8b32a5c9fd82c834c2deba4d53aa4a6b433ae69cdda  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/LICENSE
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/ansi-regex/license
 sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/string-width/license
@@ -623,6 +642,7 @@ sha256 e7d1fee7347ffddccc5fd03327ffdb50f8c112be0d5016d62388a92c4ae6e7a9  src/3rd
 sha256 83927d1555a8e1d5ed9896991fbb2b4cdfb64f45f5e12b7446c3bff5cea538d3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/treeify/LICENSE
 sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/trim-newlines/license
 sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tslib/LICENSE.txt
+sha256 ed0ff5ab79bc82703690fde4644e352c9ce73e9b890b87ea68b1a1fc5805792b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tsutils/LICENSE
 sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tty-browserify/LICENSE
 sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-check/LICENSE
 sha256 26181ebee1063f3dc6766a3b6d05999a0da058f172eadf2ca5d15105ffd9735a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typedarray/LICENSE
@@ -630,10 +650,22 @@ sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rd
 sha256 23d466b1b134b415b66fa50c6526b4cf3e7b9258554da88d3abb371721e7ce68  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-is/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/chai/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/color-name/LICENSE
+sha256 5938d4fe4890c79ad14e02e643c385b25b8b6c7bbb97ab08996034b586512df5  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/eslint-plugin/LICENSE
+sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/eslint-plugin/node_modules/regexpp/LICENSE
+sha256 5938d4fe4890c79ad14e02e643c385b25b8b6c7bbb97ab08996034b586512df5  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/experimental-utils/LICENSE
+sha256 d3a724e2ed749f172ff70b62a1d0631b7d4b0ea273782365a3464d4e2d6b6dbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/experimental-utils/node_modules/eslint-scope/LICENSE
+sha256 e2fc706570305bcb7dfadb1cac951d5934ce0d7331a7a7ff1bbc254dbe1d9ef8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/parser/LICENSE
+sha256 635818d8f39384751c8a5f3f3e735022f07afb3ccdb26eb17ff8eca28428f888  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/LICENSE
+sha256 6236fa0b88a4a0cce3dda0367979491b2052b3c8d6b1c10b3668de083e86a7f0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/node_modules/glob/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@typescript-eslint/typescript-estree/node_modules/semver/LICENSE
 sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typescript/LICENSE.txt
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/eslint-visitor-keys/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/estree/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/filesystem/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/json-schema/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/mocha/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/node/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/puppeteer/LICENSE
 sha256 b00ae96f0815ae8fa49c09044467306e98cd89d6770c535fb596ccbd350c6ab4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/uglify-js/LICENSE
 sha256 3b2a6a268aa815dec121d614245e03b5c68db1f044d5b525e36db7d5dc7fb9c3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ultron/LICENSE
 sha256 3fda5977c0904e226190b4e21d64340c1731e2142d6fe5f3dee0090a216b8b63  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/universalify/LICENSE
@@ -698,6 +730,7 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/axe-core/LICENSE
 sha256 a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/pyjson5/src/LICENSE
 sha256 4f5753ce8acf3feafc758599058746d30bda07bc0d4cc3a6a1eb8e039fdba1dc  src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  src/3rdparty/chromium/third_party/dpkg-shlibdeps/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE
 sha256 9021fdb5341ebbb2eb5c771ac5cfac527790673179d3b21a42de1ab2798ec30f  src/3rdparty/chromium/third_party/espresso/LICENSE
@@ -710,7 +743,7 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rd
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/ffmpeg/COPYING.GPLv3
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv2.1
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv3
-sha256 076cab8e06ec34890bac1747d2ab00de603a4892d30ae6c2d99e50f7c2400825  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
+sha256 cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
 sha256 f45cc81b400a048b56c9edbd4c3317f7a8958463dfd55aa96f268ecfd6baa12c  src/3rdparty/chromium/third_party/flac/COPYING.FDL
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rdparty/chromium/third_party/flac/COPYING.GPL
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  src/3rdparty/chromium/third_party/flac/COPYING.LGPL
@@ -722,8 +755,6 @@ sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rd
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/src/COPYING
 sha256 fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT
 sha256 56e67061ab590046b09876a084478ea87c4ece1579deb194347096e61c2537dd  src/3rdparty/chromium/third_party/fuchsia-sdk/LICENSE
-sha256 9f5db2544e04e3e0fb39ea277b9bb6f8efcc8bb84f6264630978ce4708495535  src/3rdparty/chromium/third_party/gestures/gestures/LICENSE
-sha256 4bd9e329f9b268bd0dec2df0560a03382fe426adf83daa7b314d2f46b9b22c9a  src/3rdparty/chromium/third_party/gestures/LICENSE
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/gif_player/LICENSE
 sha256 8ea14fdc7efee7fe53c79101b97049bd547dc6686cfa05df4f0686146a561423  src/3rdparty/chromium/third_party/glfw/src/LICENSE.md
 sha256 23353f4505b1c8ce4f8f72fc3b11dc74b4a8a7bf95921d93ff77f227c171a710  src/3rdparty/chromium/third_party/glslang/LICENSE
@@ -733,12 +764,12 @@ sha256 5e0df8c845c742e76f2f64d2d9ce1b7e74a2422fddbc577ae6a56319083de0bf  src/3rd
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/googletest/src/googletest/LICENSE
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/googletest/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/google-truth/LICENSE
-sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/gson/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/guava/LICENSE
 sha256 ca382aa537f8923d6c0991fb976d184a2009eb76080313bf10dcecdc9311f0dd  src/3rdparty/chromium/third_party/gvr-android-keyboard/LICENSE
 sha256 f54c49d3ff865458c5d3c68c3367a1f6e0d7b3f686f8c88a6a563ef90f84ad9e  src/3rdparty/chromium/third_party/gvr-android-sdk/LICENSE
 sha256 96e5bbd81970983d666e702fa56f67dfd2fdaa363b8a4266e8d98847374cd7c8  src/3rdparty/chromium/third_party/hamcrest/LICENSE
-sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING
+sha256 beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  src/3rdparty/chromium/third_party/harfbuzz-ng/src/COPYING
+sha256 c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383  src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/ms-use/COPYING
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/hunspell/COPYING
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  src/3rdparty/chromium/third_party/hunspell/COPYING.LESSER
 sha256 53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  src/3rdparty/chromium/third_party/hunspell/COPYING.MPL
@@ -751,10 +782,10 @@ sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rd
 sha256 8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  src/3rdparty/chromium/third_party/ijar/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/ink/LICENSE
 sha256 b9be92f13356083392d97da13cab8ae543c7911f44eff5289b693da8b17b9e08  src/3rdparty/chromium/third_party/inspector_protocol/LICENSE
-sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/intellij/LICENSE
 sha256 7a92c5e7a83b5ddcc693bb84ea8bdb842308509c1758cffdfe24717609154c75  src/3rdparty/chromium/third_party/isimpledom/LICENSE
 sha256 ed8d7a24769ac9d57d08769b5f8be27519dd8811d06b0995dbe8ca6714e96d08  src/3rdparty/chromium/third_party/jacoco/LICENSE
 sha256 33b6816eb449962d307495946519ed78cef8743819f6f1d60e8b3d4e86c38b1c  src/3rdparty/chromium/third_party/javalang/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/jetifier_standalone/LICENSE
 sha256 7975c0027cfa5d08253fbb6ff4676acc38248bd5e046d0dbab3d810971e97970  src/3rdparty/chromium/third_party/jinja2/LICENSE
 sha256 76c45ece83a26117f86f4e349e7df118708e061e87225328fb478ce1e8b3eb86  src/3rdparty/chromium/third_party/jsoncpp/LICENSE
 sha256 95039d77a20e75b428207740d9a8f97b2dce3c89da4b21f1ad862b5997160e0a  src/3rdparty/chromium/third_party/jsoncpp/source/LICENSE
@@ -771,11 +802,10 @@ sha256 5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf  src/3rd
 sha256 ff6c857ce2708e87701323078aef115c1872a1f80a9649f86dc899b48083bc60  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/vector/LICENSE
 sha256 719d8fa235f2068e0ae6d6a7dceb0a7720d7840f0f0ebed29957989e6ded3cd8  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE
-sha256 fb3ab1e1621c6c469499a6ba1e926c027f32af3063c0456282f89382591cc46a  src/3rdparty/chromium/third_party/libevdev/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/libgav1/src/LICENSE
 sha256 d56bafdaeaa793331a29e9766b7efe66524c98533da798a57201e291863ef625  src/3rdparty/chromium/third_party/libgifcodec/LICENSE.md
 sha256 37d8bfba91b745693ea58f846f2f1276229745adf532974b73c1911cfd144241  src/3rdparty/chromium/third_party/libipp/LICENSE
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE
-sha256 19af539b1ec692ea9ccf71b6ea97d602bcf7187eab27b0ea806aea1cd10b0b13  src/3rdparty/chromium/third_party/libjpeg/LICENSE
 sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md
 sha256 3bf128851aff9f392953276ea8ade3e41da0f40b853fde58ec21034aa91ccc31  src/3rdparty/chromium/third_party/libovr/LICENSE
 sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  src/3rdparty/chromium/third_party/libpng/LICENSE
@@ -824,6 +854,7 @@ sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rd
 sha256 8bed129a6a15e631c93a624985e631eb62a55f7e072b78f4e1c3dde7c745283d  src/3rdparty/chromium/third_party/one_euro_filter/LICENSE
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  src/3rdparty/chromium/third_party/openh264/src/LICENSE
 sha256 34a5c58db7cc4d3265d14a9aa26e38067fe114311d8bec31f909d1c240e626c4  src/3rdparty/chromium/third_party/openscreen/src/LICENSE
+sha256 284545e873c704952e5b1b39d457dd83a3b115a51d9f1eb5175137bd69b8fa1b  src/3rdparty/chromium/third_party/openscreen/src/third_party/mozilla/LICENSE.txt
 sha256 f56ff606104d4ef18e617921a75c73ad73b5a1a1d70c69590c29de16919e04ad  src/3rdparty/chromium/third_party/openvr/src/LICENSE
 sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  src/3rdparty/chromium/third_party/opus/src/COPYING
 sha256 7efb4989e0cd1b256229bdf2f09300c5d14e35db0e7476bfb87fac243498273d  src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt
@@ -854,7 +885,7 @@ sha256 cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  src/3rd
 sha256 c5b14f5a3814d2e57b9bb9520dcf57a2c3817b65c4f989e5c82e332c82af1038  src/3rdparty/chromium/third_party/pymock/LICENSE.txt
 sha256 318cea263a2fb726d767e2777771a431a3220008e6940dd5138a235a1fc498fc  src/3rdparty/chromium/third_party/pystache/LICENSE
 sha256 956c3b678228a216142df38d039bba56ee6509d3298e7a4b8dd5bc3eaa80fe33  src/3rdparty/chromium/third_party/Python-Markdown/LICENSE.md
-sha256 23681c6986fb33d57957660543f6e9dcbbcf6d2ae2f9fa2dbdb5efec5aa0d95f  src/3rdparty/chromium/third_party/pywebsocket/src/LICENSE
+sha256 5a2954f05e7fcc1bf240a3b58534f974760b5aae02438ce875c9c7fe0bdb4cf9  src/3rdparty/chromium/third_party/pywebsocket3/src/LICENSE
 sha256 c903100da706172066fa1b6f02eba60f202fea63036492d2c4a01267e32aa7a8  src/3rdparty/chromium/third_party/qcms/src/COPYING
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/quic_trace/src/LICENSE
 sha256 38751245389e1e23f73e6f5384b5cbe7fa972cc4410c5adc9c04b082a0b9561a  src/3rdparty/chromium/third_party/quic_trace/src/third_party/fonts/LICENSE
@@ -870,13 +901,14 @@ sha256 19c9b910bec5a4f2c420747d1bf81e975ffdb1377ad91c5d9b1e8dd3e38f4c17  src/3rd
 sha256 a7436c952fa2dc0701860cf4187d1e8e8e6de6720dec0ae9e0b641bc50eebced  src/3rdparty/chromium/third_party/robolectric/licenses/javolution.license.txt
 sha256 5b6ac717e37db4f6d17bda7791f4ce3f99947aeb21e6e72b705aa3d1ee2de480  src/3rdparty/chromium/third_party/robolectric/licenses/pivotal.labs.license.txt
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/s2cellid/LICENSE
-sha256 e320e0b6915c2a93dc7f6db28c014f223ae32de61f5033300db2b75d506daa1f  src/3rdparty/chromium/third_party/sfntly/COPYING.txt
-sha256 e320e0b6915c2a93dc7f6db28c014f223ae32de61f5033300db2b75d506daa1f  src/3rdparty/chromium/third_party/sfntly/src/cpp/COPYING.txt
+sha256 3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  src/3rdparty/chromium/third_party/schema_org/LICENSE
 sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  src/3rdparty/chromium/third_party/shaderc/src/LICENSE
 sha256 b5a00e94f058edc87e05978329b55730d8689abe61205d9018443d03de4f07da  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.glslang
 sha256 47e20ce182bc68fab1a0cfb129b03c326aaf4f2b6b7905aa9d376d31018bd29f  src/3rdparty/chromium/third_party/shaderc/src/third_party/LICENSE.spirv-tools
 sha256 33c9a2fe619e1200937629f318895898ffcd1bf7d0ddd39adc382c030925e61e  src/3rdparty/chromium/third_party/simplejson/LICENSE.txt
 sha256 b25948e48c44312d04ffc626a9d52cae7c04539a1a8e0c1be47b7bfa0da03e1d  src/3rdparty/chromium/third_party/sinonjs/LICENSE
+sha256 8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  src/3rdparty/chromium/third_party/six/LICENSE
+sha256 8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  src/3rdparty/chromium/third_party/six/src/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/skcms/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE
 sha256 5f787c1dee3c56547f09ccc2906ab5f5293c4d8dd6c8654e573216c38e908dbd  src/3rdparty/chromium/third_party/skia/LICENSE
@@ -898,14 +930,16 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/src/utils/vscode/src/lsp/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/sqlite4java/LICENSE
 sha256 06545a6ec25fbbff6c62f205f94a35be49e38f33bea827a8cfb07d7b82e4b083  src/3rdparty/chromium/third_party/sqlite/LICENSE
-sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms
-sha256 9c6479123f32a1ed50d9a0af203dfe8972e65035b0cdeef436b5f8d0924517fe  src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md
+sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/src/autoconf/tea/license.terms
+sha256 9c6479123f32a1ed50d9a0af203dfe8972e65035b0cdeef436b5f8d0924517fe  src/3rdparty/chromium/third_party/sqlite/src/LICENSE.md
+sha256 033d0150b3bd78b36894c88fcc68da0c3f2e661d3b3485e8cc9a61b2c2bf7895  src/3rdparty/chromium/third_party/subresource-filter-ruleset/LICENSE
 sha256 28113a6e9e2fd7584187c738a7c5484452a1c383307a1741bec50a73262fac08  src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt
 sha256 ad4672b403488876635d2b455918f74b829d478da868ffc0c621a00fc99195f5  src/3rdparty/chromium/third_party/tcmalloc/LICENSE
 sha256 81ebf38708899097aacaac9723679b3ffa17640c14cd3193c46b75197de18b2c  src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING
 sha256 d600ff20c150a675461dde76752e35f4cc3be6e7d8e70b8da3e775ea7e5ec4aa  src/3rdparty/chromium/third_party/test_fonts/LICENSE
 sha256 bb04dd22ee55fe3c24ee2a3c82bd1efdebbd965f7c178224a2977edc2457bb2f  src/3rdparty/chromium/third_party/tlslite/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/turbine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/ub-uiautomator/LICENSE
 sha256 0a90947436dc17f047f8c95b64593e2cc9a2b6d4ff6618f2f0beba5a9b568c14  src/3rdparty/chromium/third_party/unrar/LICENSE
 sha256 6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  src/3rdparty/chromium/third_party/unrar/src/license.txt
@@ -919,6 +953,8 @@ sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/web-animations-js/sources/COPYING
 sha256 d51b39e7ed0391e75e0add75d1a162fdf4a0d6b49fba7635ed0ac4e16f324773  src/3rdparty/chromium/third_party/webdriver/COPYING
 sha256 6d83e980b9b843cf6fe24cb94714d00f9b0cf69cb00d0e3b0bed018d49d6f24f  src/3rdparty/chromium/third_party/webdriver/LICENSE
+sha256 fec8eb2896784d7b9ef5bcb1c64b97156455a3c88df4fdd36538fb55c0decac4  src/3rdparty/chromium/third_party/webgpu-cts/src/LICENSE.txt
+sha256 e30fbe869f1fa489901bb08888a919c5d50ddb5be6d16b9e4a2cb226263dd7db  src/3rdparty/chromium/third_party/webgpu-cts/src/third_party/jquery/LICENSE.txt
 sha256 25b7731b70c77ecd5f3bb19303fbaa99be18860f81d44f71da670fdcd04829db  src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/fft4g/LICENSE
 sha256 41d791701e3e1c1073470403de7e342442d1e6a2af72681023b13a2f45f2125c  src/3rdparty/chromium/third_party/webrtc/common_audio/third_party/spl_sqrt_floor/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE
@@ -937,6 +973,9 @@ sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rd
 sha256 47754d3064047c300714af25258efa782e144fdf1e835bfd1edbeb7f8f4ef9e4  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/dat.gui/LICENSE
 sha256 71819b5a0a080b6a3d35b3579817c2c558abcf3c92bb5abc052145a7c106573e  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/js/third-party/gl-matrix/LICENSE
 sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md
+sha256 88d855a8e07a39df758fe9964f5d04d5c2fab39416e566e9d91588e254ca27dc  src/3rdparty/chromium/third_party/weston/LICENSE
+sha256 fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  src/3rdparty/chromium/third_party/weston/src/COPYING
+sha256 a34730970264d619f352598bf30295ad505a60fc3a493add8aa851645ce3ea47  src/3rdparty/chromium/third_party/weston/src/data/COPYING
 sha256 20de375707692099b3132084695377ce5fec0aec05813dedcce094b8eda44386  src/3rdparty/chromium/third_party/widevine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/woff2/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/wuffs/LICENSE
@@ -948,7 +987,6 @@ sha256 942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  src/3rd
 sha256 a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  src/3rdparty/chromium/tools/grit/third_party/six/LICENSE
 sha256 63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE
 sha256 f5b244982699ca9fe5cc8fa8a7c08cf5dee5d3a0c8896892899e5df13316e1b7  src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE
-sha256 4fde1ca31ffe4e16a76098f56170166c61a5493d3bafcc6a5903d3cb60aa7560  src/3rdparty/chromium/tools/symsrc/COPYING-pefile
 sha256 7389900fb68d920c6cb21b70702a2bc240523472a3fd091023d6135cf01d1c5c  src/3rdparty/chromium/tools/win/ChromeDebug/ChromeDebug/LICENSE
 sha256 284545e873c704952e5b1b39d457dd83a3b115a51d9f1eb5175137bd69b8fa1b  src/3rdparty/chromium/url/third_party/mozilla/LICENSE.txt
 sha256 f10a1808e442ae7dbfecf6b54ae4de84193a768770e189a67d5f397730acdbc9  src/3rdparty/chromium/v8/LICENSE
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 820950dfe2..99bc49d106 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebsockets-everywhere-src-5.15.1.tar.xz.sha256
-sha256  5f30053a0a794676ce7d7521f6b789409cc449a7e90cab547d871fc07a61dd7e  qtwebsockets-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebsockets-everywhere-src-5.15.2.tar.xz.sha256
+sha256  a0b42d85dd34ff6e2d23400e02f83d8b85bcd80e60efd1521d12d9625d4a233f  qtwebsockets-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 2e23ddb0af..cc37f54b90 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtwebview-everywhere-src-5.15.1.tar.xz.sha256
-sha256  426852a3f569da82aa84dfd7f06c6aeb06488a927b66342a612401b41392b260  qtwebview-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebview-everywhere-src-5.15.2.tar.xz.sha256
+sha256  be9f46167e4977ead5ef5ecf883fdb812a4120f2436383583792f65557e481e7  qtwebview-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index e5680f55ff..dd42ab3ff0 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtx11extras-everywhere-src-5.15.1.tar.xz.sha256
-sha256  f7cd7c475a41840209808bf8b1de1c6587c3c74e5ae3b0969760b9ed35159e59  qtx11extras-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtx11extras-everywhere-src-5.15.2.tar.xz.sha256
+sha256  7014702ee9a644a5a93da70848ac47c18851d4f8ed622b29a72eed9282fc6e3e  qtx11extras-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 011444a27f..55dace4d06 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.1/submodules/qtxmlpatterns-everywhere-src-5.15.1.tar.xz.sha256
-sha256  6859d440ce662f3679ce483ebb5a552b619a32517cb1a52a38f967b377857745  qtxmlpatterns-everywhere-src-5.15.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtxmlpatterns-everywhere-src-5.15.2.tar.xz.sha256
+sha256  76ea2162a7c349188d7e7e4f6c77b78e8a205494c90fee3cea3487a1ae2cf2fa  qtxmlpatterns-everywhere-src-5.15.2.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.29.2
