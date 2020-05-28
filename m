From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 29 May 2020 00:14:11 +0200
Subject: [Buildroot] [PATCH for-next v1] package/qt5: bump version to 5.15.0
Message-ID: <20200528221411.31473-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5declarative:
  - rebased 0002-examples-fix-parallel-install.patch

qt5tools:
  - rebased 0001-Disable-designer-tool-fixes-configure-error.patch

qt5webengine
  - 3rdparty hash update

qt5webkit-examples
  - add 0003-Fix-QPainterPath-include.patch to fix compile because
    of missing QPainterPath include

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5.mk                            |   4 +-
 package/qt5/qt53d/qt53d.hash                  |   4 +-
 package/qt5/qt5base/qt5base.hash              |   4 +-
 package/qt5/qt5charts/qt5charts.hash          |   4 +-
 .../qt5/qt5connectivity/qt5connectivity.hash  |   4 +-
 .../0002-examples-fix-parallel-install.patch  |  31 +-
 .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
 .../qt5graphicaleffects.hash                  |   4 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
 package/qt5/qt5location/qt5location.hash      |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
 .../qt5quickcontrols2/qt5quickcontrols2.hash  |   4 +-
 package/qt5/qt5script/qt5script.hash          |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash    |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash  |   4 +-
 package/qt5/qt5svg/qt5svg.hash                |   4 +-
 ...-designer-tool-fixes-configure-error.patch |  12 +-
 package/qt5/qt5tools/qt5tools.hash            |   4 +-
 .../qt5virtualkeyboard.hash                   |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
 package/qt5/qt5webengine/chromium-latest.inc  | 750 +++++++++++++----
 package/qt5/qt5webengine/qt5webengine.hash    | 766 ++++++++++++++----
 .../0003-Fix-QPainterPath-include.patch       |  36 +
 package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
 package/qt5/qt5webview/qt5webview.hash        |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash    |   4 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
 31 files changed, 1327 insertions(+), 372 deletions(-)
 create mode 100644 package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index f98a0a56e6..e540ebcf85 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT5_VERSION_MAJOR = 5.14
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION_MAJOR = 5.15
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
 QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 966fa491b0..b660692982 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qt3d-everywhere-src-5.14.2.tar.xz.sha256
-sha256  9da82f1cc4b7d416d31ec96224c59d221473a48f6e579eef978f7d2e3932c674  qt3d-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qt3d-everywhere-src-5.15.0.tar.xz.sha256
+sha256  61856f0c453b79e98b7a1e65ea8f59976fa78230ffa8dec959b5f4b45383dffd  qt3d-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index aec3d6d614..a32723f37a 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtbase-everywhere-src-5.14.2.tar.xz.sha256
-sha256  48b9e79220941665a9dd827548c6428f7aa3052ccba8f4f7e039a94aa1d2b28a  qtbase-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtbase-everywhere-src-5.15.0.tar.xz.sha256
+sha256  9e7af10aece15fa9500369efde69cb220eee8ec3a6818afe01ce1e7d484824c5  qtbase-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index a78a7cb6ff..1fa59915e4 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtcharts-everywhere-src-5.14.2.tar.xz.sha256
-sha256  adb25203ea748d886cc3d8993c20def702115eccea311594592058134ba83bb7  qtcharts-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtcharts-everywhere-src-5.15.0.tar.xz.sha256
+sha256  44a24fc16abcaf9ae97ecf3215f6f3b44ebdb3b73bcb4ed3549a51519e4883a7  qtcharts-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 86b361197b..644210b2e4 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtconnectivity-everywhere-src-5.14.2.tar.xz.sha256
-sha256  abe67b3e3a775e2a2e27c62a5391f37007ffbe72bce58b96116995616cfcbc28  qtconnectivity-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtconnectivity-everywhere-src-5.15.0.tar.xz.sha256
+sha256  f911fb8f8bf3a9958785d0378d25ced8989047938b7138d619854a94fa0b27dd  qtconnectivity-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
index bc4654dad7..7005104701 100644
--- a/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
+++ b/package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch
@@ -1,4 +1,4 @@
-From bf4ee955cde7a27a8fd988a7985064f19d2a10fe Mon Sep 17 00:00:00 2001
+From ceccffbee9d674044641dd6a1010715b86eda254 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 26 May 2020 20:16:44 +0200
 Subject: [PATCH] examples: fix parallel install
@@ -11,6 +11,8 @@ fails with a variation of the following error messages:
 
 Fix it by using OTHER_FILES instead of a seperate qml files install target.
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.15.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  .../extending-qml/chapter1-basics/chapter1-basics.pro     | 8 +++-----
@@ -25,10 +27,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  9 files changed, 30 insertions(+), 37 deletions(-)
 
 diff --git a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
-index 9911e024..127d4092 100644
+index 1f777d2e..7c50dc31 100644
 --- a/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
 +++ b/examples/qml/tutorials/extending-qml/chapter1-basics/chapter1-basics.pro
-@@ -6,10 +6,8 @@ SOURCES += piechart.cpp \
+@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
  
  RESOURCES += chapter1-basics.qrc
  
@@ -43,10 +45,10 @@ index 9911e024..127d4092 100644
 -INSTALLS += target qml
 +INSTALLS += target
 diff --git a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
-index 7fd850ce..cba5c39b 100644
+index 264f028f..8947b4e0 100644
 --- a/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
 +++ b/examples/qml/tutorials/extending-qml/chapter2-methods/chapter2-methods.pro
-@@ -6,10 +6,8 @@ SOURCES += piechart.cpp \
+@@ -10,10 +10,8 @@ SOURCES += piechart.cpp \
  
  RESOURCES += chapter2-methods.qrc
  
@@ -61,10 +63,10 @@ index 7fd850ce..cba5c39b 100644
 -INSTALLS += target qml
 +INSTALLS += target
 diff --git a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
-index 1ae83f71..7d959e3f 100644
+index 152f17ce..ffe632ee 100644
 --- a/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
 +++ b/examples/qml/tutorials/extending-qml/chapter3-bindings/chapter3-bindings.pro
-@@ -6,10 +6,8 @@ SOURCES += piechart.cpp \
+@@ -10,10 +10,8 @@ SOURCES += piechart.cpp \
  
  RESOURCES += chapter3-bindings.qrc
  
@@ -79,10 +81,10 @@ index 1ae83f71..7d959e3f 100644
 -INSTALLS += target qml
 +INSTALLS += target
 diff --git a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
-index 12dfbd62..e17a59be 100644
+index e277f746..29911eae 100644
 --- a/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
 +++ b/examples/qml/tutorials/extending-qml/chapter4-customPropertyTypes/chapter4-customPropertyTypes.pro
-@@ -8,10 +8,8 @@ SOURCES += piechart.cpp \
+@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
  
  RESOURCES += chapter4-customPropertyTypes.qrc
  
@@ -97,10 +99,10 @@ index 12dfbd62..e17a59be 100644
 -INSTALLS += target qml
 +INSTALLS += target
 diff --git a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
-index 67d1cd35..dd0f11d8 100644
+index edbd3c23..0db640a7 100644
 --- a/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
 +++ b/examples/qml/tutorials/extending-qml/chapter5-listproperties/chapter5-listproperties.pro
-@@ -8,10 +8,8 @@ SOURCES += piechart.cpp \
+@@ -12,10 +12,8 @@ SOURCES += piechart.cpp \
  
  RESOURCES += chapter5-listproperties.qrc
  
@@ -166,10 +168,10 @@ index 8be4dbb6..678a6756 100644
  
  CONFIG += install_ok  # Do not cargo-cult this!
 diff --git a/examples/quick/scenegraph/simplematerial/simplematerial.pro b/examples/quick/scenegraph/simplematerial/simplematerial.pro
-index 6ae935f3..23a3b61f 100644
+index 131af459..76a21ab3 100644
 --- a/examples/quick/scenegraph/simplematerial/simplematerial.pro
 +++ b/examples/quick/scenegraph/simplematerial/simplematerial.pro
-@@ -6,7 +6,7 @@ SOURCES += \
+@@ -11,10 +11,10 @@ SOURCES += \
  RESOURCES += simplematerial.qrc
  
  target.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/simplematerial
@@ -180,6 +182,9 @@ index 6ae935f3..23a3b61f 100644
 +OTHER_FILES += main.qml
 +
 +INSTALLS += target
+ 
+ HEADERS += \
+     simplematerialitem.h
 -- 
 2.26.2
 
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e66aa4ae16..b7bed2a11c 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtdeclarative-everywhere-src-5.14.2.tar.xz.sha256
-sha256  a3c4617adc9760347c93d2eb6c25d22f620cd22f44afa0494eb499a805831650  qtdeclarative-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtdeclarative-everywhere-src-5.15.0.tar.xz.sha256
+sha256  9c3c93fb7d340b2f7d738d12408c047318c78973cb45bfc5ff6b3a57e1fef699  qtdeclarative-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 7d5c555867..5bdc3ba7f3 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtgraphicaleffects-everywhere-src-5.14.2.tar.xz.sha256
-sha256  487a7f858244a08264363733055a8cf8b00e77c658c5608cc462817d15e4b50f  qtgraphicaleffects-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtgraphicaleffects-everywhere-src-5.15.0.tar.xz.sha256
+sha256  0d2ea4bc73b9df13a4b739dcbc1e3c7b298c7e682f7f9252b232e3bde7b63eda  qtgraphicaleffects-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 19613ce7b3..64249269a7 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtimageformats-everywhere-src-5.14.2.tar.xz.sha256
-sha256  733eca0165c15e046b106039c989dac7f6bc2ecf215396d965ed065369264f8c  qtimageformats-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtimageformats-everywhere-src-5.15.0.tar.xz.sha256
+sha256  83f32101b1a898fcb8ed6f11a657d1125484ac0c2223014b61849d9010efebc8  qtimageformats-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index d3dad5c5ec..b871c74944 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtlocation-everywhere-src-5.14.2.tar.xz.sha256
-sha256  c37708bc396f6dac397b49a6a268d5edb39e1c8296ca2337ce9e80bde04775cc  qtlocation-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtlocation-everywhere-src-5.15.0.tar.xz.sha256
+sha256  c68b0778a521e5522641c41b1778999dd408ebfda1e0de166a83743268be5f3f  qtlocation-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index fc3bb486dc..2338471849 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtmultimedia-everywhere-src-5.14.2.tar.xz.sha256
-sha256  7acd8ede6835314206e407b35b668f0add67544577fb51fe67afb03137fb9fe9  qtmultimedia-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtmultimedia-everywhere-src-5.15.0.tar.xz.sha256
+sha256  0708d867697f392dd3600c5c1c88f5c61b772a5250a4d059dca67b844af0fbd7  qtmultimedia-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index c7d82245a8..c00c1cd978 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtquickcontrols-everywhere-src-5.14.2.tar.xz.sha256
-sha256  d55def1dd4ee1250bd6a4e76849f4e362368b6411c2216d5f669c761216d4461  qtquickcontrols-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquickcontrols-everywhere-src-5.15.0.tar.xz.sha256
+sha256  7072cf4cd27e9f18b36b1c48dec7c79608cf87ba847d3fc3de133f220ec1acee  qtquickcontrols-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 4333a520b6..cdb05dbd01 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtquickcontrols2-everywhere-src-5.14.2.tar.xz.sha256
-sha256  faf7d349d8f4a8db36cd3c62a5724bcf689300f2fdb7dc1ea034392aab981560  qtquickcontrols2-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtquickcontrols2-everywhere-src-5.15.0.tar.xz.sha256
+sha256  839abda9b58cd8656b2e5f46afbb484e63df466481ace43318c4c2022684648f  qtquickcontrols2-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 8c73b213bf..824b43c650 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtscript-everywhere-src-5.14.2.tar.xz.sha256
-sha256  e9fd487ccb3cbf00e86b0b803aa79e9f6bbe7a337b8e97d069e040c3e0789bfe  qtscript-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtscript-everywhere-src-5.15.0.tar.xz.sha256
+sha256  02dc21b309621876a89671be27cea86a58e74a96aa28da65fe1b37a3aad29373  qtscript-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index f0e70d6ae6..35060bc264 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtscxml-everywhere-src-5.14.2.tar.xz.sha256
-sha256  030cea352a56074f577200f967ef37c959b2767127de61f766f59b0d99763790  qtscxml-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtscxml-everywhere-src-5.15.0.tar.xz.sha256
+sha256  9c3a72bf5ebd07553b0049cc1943f04cff93b7e53bde8c81d652422dbf12ff72  qtscxml-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 48c19d69f5..817caa7634 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtsensors-everywhere-src-5.14.2.tar.xz.sha256
-sha256  bccfca6910b0383d8f65823496ff5011abed2fa8fd446b4b27333d0fd7bb8c61  qtsensors-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtsensors-everywhere-src-5.15.0.tar.xz.sha256
+sha256  12b17ed6cbe6c49c8ab71958bc5d8ad1c42bf20e2fa72613ede11001e98144da  qtsensors-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 62c699c237..7bc3222c43 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtserialbus-everywhere-src-5.14.2.tar.xz.sha256
-sha256  0b7762175a649a40c4dd619c5de61d772235dc86099343278e2c3229d0836a91  qtserialbus-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtserialbus-everywhere-src-5.15.0.tar.xz.sha256
+sha256  cee067c84d025e221b83d109b58ea16c4d2dc0af0aea45cc6724acd33a1b7379  qtserialbus-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 798b7f0e12..d93f7d789d 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtserialport-everywhere-src-5.14.2.tar.xz.sha256
-sha256  a6d977dd723ad4d3368b5163691405b8852f809974a96ec54103494e834aea21  qtserialport-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtserialport-everywhere-src-5.15.0.tar.xz.sha256
+sha256  ba19369069a707dffddca8d9c477bb2bb4aa26630dfee6792254c4bf9bd57a67  qtserialport-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 57b2c165c8..a3f04a098b 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtsvg-everywhere-src-5.14.2.tar.xz.sha256
-sha256  c7d7faa01a3e7a6e4d38fafcec5529a488258218749779e6fa0e09a21173b5a1  qtsvg-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtsvg-everywhere-src-5.15.0.tar.xz.sha256
+sha256  ee4d287e2e205ca8c08921b9cbe0fc58bf46be080b5359ad4d7fbdee44aeee0d  qtsvg-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
index 786fd5c356..20c5e2a470 100644
--- a/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
+++ b/package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch
@@ -1,4 +1,4 @@
-From ba3c7c2233e8d4875abd6c391764d87a9bd59c5d Mon Sep 17 00:00:00 2001
+From a70da8d731b969305096a0213b70659dc641591a Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Tue, 17 Dec 2019 11:01:59 +0100
 Subject: [PATCH] Disable designer tool (fixes configure error).
@@ -8,6 +8,8 @@ Fixes:
   .../build/qt5tools-5.14.0/src/designer/src/components/lib/lib.pro
   Project ERROR: Multiple modules claim plugin type 'designer' (uitools, in addition to designer)
 
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased for Qt5.15.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  src/linguist/linguist/linguist.pro | 2 +-
@@ -15,12 +17,12 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/src/linguist/linguist/linguist.pro b/src/linguist/linguist/linguist.pro
-index af74df8..d7dfd7a 100644
+index d083896..7d74cfc 100644
 --- a/src/linguist/linguist/linguist.pro
 +++ b/src/linguist/linguist/linguist.pro
 @@ -1,4 +1,4 @@
--QT += core-private gui-private widgets xml uitools-private printsupport
-+QT += core-private gui-private widgets xml printsupport
+-QT += core-private gui-private widgets uitools-private printsupport
++QT += core-private gui-private widgets printsupport
  
  DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII
  
@@ -40,5 +42,5 @@ index 5c256ea..6d079be 100644
          qtHaveModule(quick):qtConfig(thread):qtConfig(toolbutton): SUBDIRS += distancefieldgenerator
      }
 -- 
-2.23.0
+2.26.2
 
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 314756ef60..b816a92d38 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qttools-everywhere-src-5.14.2.tar.xz.sha256
-sha256  5bb0cf7832b88eb6bc9d4289f98307eb14b16a453ad6cf42cca13c4fe1a053c5  qttools-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qttools-everywhere-src-5.15.0.tar.xz.sha256
+sha256  ddbcb49aab3a2e3672582c6e2e7bec0058feff790f67472343c79e2895e0e437  qttools-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 46faa55da0..c0c7fed086 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtvirtualkeyboard-everywhere-src-5.14.2.tar.xz.sha256
-sha256  364f3338563e617e7c964a37170b415b546c5f82965e781271f9dada3e3868d7  qtvirtualkeyboard-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtvirtualkeyboard-everywhere-src-5.15.0.tar.xz.sha256
+sha256  f22f9204ab65578d9c8aa832a8a39108f826e00a7d391c7884ff490c587f34be  qtvirtualkeyboard-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 979f277b02..f10c58b71a 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtwayland-everywhere-src-5.14.2.tar.xz.sha256
-sha256  d31633ca718fb407cf70870613d45d0ed80aa04c058586ac3036bae1aff7832a  qtwayland-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwayland-everywhere-src-5.15.0.tar.xz.sha256
+sha256  084133e10bfbd32a28125639660c59975f23457bba6a79b30a25802cec76a9fb  qtwayland-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index a765434ea9..a86ca89d06 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtwebchannel-everywhere-src-5.14.2.tar.xz.sha256
-sha256  7d1dc8441523638c3d455c7d408ec65aebc073acab80e24063865f929231f874  qtwebchannel-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebchannel-everywhere-src-5.15.0.tar.xz.sha256
+sha256  ea80510b363e6f92ce99932f06d176e43459c4a5159fe97b5ef96fcfbab5ed4f  qtwebchannel-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webengine/chromium-latest.inc b/package/qt5/qt5webengine/chromium-latest.inc
index 8cd85ddfae..a10e71f125 100644
--- a/package/qt5/qt5webengine/chromium-latest.inc
+++ b/package/qt5/qt5webengine/chromium-latest.inc
@@ -5,7 +5,7 @@
 #	sort | sed 's%^\(.*\)$%\t\1 \\%') > package/qt5/qt5webengine/chromium-latest.inc
 QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/base/third_party/cityhash/COPYING \
-	src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE \
+	src/3rdparty/chromium/base/third_party/double_conversion/LICENSE \
 	src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE \
 	src/3rdparty/chromium/base/third_party/icu/LICENSE \
 	src/3rdparty/chromium/base/third_party/libevent/LICENSE \
@@ -26,15 +26,20 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/net/third_party/uri_template/LICENSE \
 	src/3rdparty/chromium/ppapi/LICENSE \
 	src/3rdparty/chromium/third_party/abseil-cpp/LICENSE \
-	src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE \
 	src/3rdparty/chromium/third_party/angle/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE \
 	src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/bin/jsonschema/LICENSE \
+	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/contrib/natvis/LICENSE \
+	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/license.txt \
+	src/3rdparty/chromium/third_party/angle/third_party/vulkan-headers/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/angle/third_party/vulkan-loader/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/angle/third_party/vulkan-tools/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/m4sugar/LICENSE \
+	src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/skeletons/LICENSE \
 	src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE \
-	src/3rdparty/chromium/third_party/apache-mac/LICENSE \
-	src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE \
 	src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE \
 	src/3rdparty/chromium/third_party/apple_apsl/LICENSE \
 	src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE \
@@ -46,19 +51,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2 \
 	src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1 \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits_worker/lighthouse/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE_python \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/formatter_worker/acorn/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/LICENSE \
-	src/3rdparty/chromium/third_party/blink/renderer/devtools/scripts/closure/COPYING \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Noto/LICENSE_OFL.txt \
 	src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt \
-	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING \
-	src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/enum/enum/LICENSE \
 	src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/h2/LICENSE \
@@ -70,7 +64,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/boringssl/src/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/LICENSE \
-	src/3rdparty/chromium/third_party/boringssl/src/third_party/sike/LICENSE \
 	src/3rdparty/chromium/third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE \
 	src/3rdparty/chromium/third_party/bouncycastle/LICENSE \
 	src/3rdparty/chromium/third_party/breakpad/breakpad/LICENSE \
@@ -101,6 +94,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20 \
 	src/3rdparty/chromium/third_party/cld_3/LICENSE \
 	src/3rdparty/chromium/third_party/cld_3/src/LICENSE \
+	src/3rdparty/chromium/third_party/closure_compiler/compiler/COPYING \
+	src/3rdparty/chromium/third_party/closure_compiler/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
 	src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE \
@@ -116,137 +111,590 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/dawn/LICENSE \
 	src/3rdparty/chromium/third_party/decklink/LICENSE \
 	src/3rdparty/chromium/third_party/devscripts/COPYING \
-	src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-escapes/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/argparse/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/astral-regex/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/code-frame/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/highlight/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE.md \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/brace-expansion/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/callsites/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-cursor/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-width/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-convert/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-name/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-map/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/debug/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/deep-is/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.closure-compiler \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.esprima \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/emoji-regex/LICENSE-MIT.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/escape-string-regexp/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-utils/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-visitor-keys/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/espree/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE.BSD \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/license.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE.BSD \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE.BSD \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/external-editor/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-deep-equal/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-json-stable-stringify/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE.md \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/figures/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/file-entry-cache/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flat-cache/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flatted/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fs.realpath/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/functional-red-black-tree/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globals/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/node_modules/is-glob/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/iconv-lite/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ignore/LICENSE-MIT \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/import-fresh/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inflight/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inherits/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/ansi-regex/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/strip-ansi/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/isexe/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-extglob/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-fullwidth-code-point/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-glob/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-promise/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-schema-traverse/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-stable-stringify-without-jsonify/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-yaml/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/levn/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimatch/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimist/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mkdirp/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/license.md \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mute-stream/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/nice-try/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/once/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/onetime/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/optionator/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/os-tmpdir/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/parent-module/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-dirname/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-absolute/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-key/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/prelude-ls/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/progress/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/punycode/LICENSE-MIT.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/regexpp/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/restore-cursor/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rimraf/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/run-async/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm2015/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm5/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/src/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safer-buffer/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/semver/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-command/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-regex/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/slice-ansi/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/sprintf-js/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string-width/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-json-comments/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/ansi-regex/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/string-width/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/strip-ansi/license \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/text-table/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.APACHE2 \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.MIT \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tmp/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tslib/LICENSE.txt \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/type-check/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/which/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wordwrap/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wrappy/LICENSE \
-	src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/write/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits_worker/lighthouse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE_python \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm_modes/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/dagre_layout/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/formatter_worker/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/sdk/wasm_source_map/LICENSES.deps \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/abbrev/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/accepts/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn-jsx/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn-walk/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ajv/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/amdefine/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-colors/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-wrap/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/anymatch/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/append-transform/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/argparse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/array-find-index/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/arr-diff/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/arr-union/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/asap/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assert/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assign-symbols/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/astral-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async-limiter/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/code-frame/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/generator/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/generator/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-function-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-get-function-arity/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-split-export-declaration/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/highlight/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/template/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/traverse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/types/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/balanced-match/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64-arraybuffer/LICENSE-MIT \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64id/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64-js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/binary-extensions/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/.bin/license-checker \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/blob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/bluebird/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/brace-expansion/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/braces/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-aes/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-cipher/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-des/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-rsa/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-sign/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-zlib/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browser-resolve/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browser-stdout/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer-from/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer-xor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/builtin-status-codes/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/bytes/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/callsites/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase-keys/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chai/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chardet/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/check-error/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/node_modules/glob-parent/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cipher-base/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cliui/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-width/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/clone/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/code-point-at/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/color-convert/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/color-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/colors/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/node_modules/convert-source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/commander/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/compare-versions/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/component-emitter/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/readable-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/string_decoder/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/content-type/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/convert-source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/convert-source-map/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cookie/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/core-js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/core-util-is/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-ecdh/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-hash/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-hmac/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cross-spawn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/crypto-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/currently-unhandled/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/custom-event/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/date-format/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dateformat/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/debuglog/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/decamelize/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/deep-eql/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/deep-is/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/default-require-extensions/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/defaults/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/define-properties/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/depd/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dezalgo/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diffie-hellman/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/di/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.closure-compiler \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.esprima \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/domain-browser/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ee-first/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/emoji-regex/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/encodeurl/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/end-of-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ent/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/error-ex/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-object-assign/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-promise/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-abstract/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-html/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/node_modules/esprima/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-scope/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-utils/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-visitor-keys/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/espree/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esprima/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esquery/license.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-to-primitive/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/estraverse/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esutils/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eventemitter3/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/events/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/evp_bytestokey/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/execa/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extend/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extend-shallow/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/external-editor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-deep-equal/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-json-stable-stringify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-levenshtein/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fd-slicer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/file-entry-cache/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fileset/LICENSE-MIT \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fill-range/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/find-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flatted/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fsevents/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fs-extra/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fs.realpath/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/functional-red-black-tree/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/function-bind/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-caller-file/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-func-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-stream/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/node_modules/is-glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/graceful-fs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/handlebars/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-binary2/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hash-base/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has/LICENSE-MIT \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-symbols/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/he/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hosted-git-info/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-errors/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-errors/node_modules/inherits/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-proxy/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/https-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/https-proxy-agent/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/iconv-lite/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ieee754/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ignore/LICENSE-MIT \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/import-fresh/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/indent-string/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inflight/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inherits/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inline-source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inline-source-map/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/node_modules/strip-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/invert-kv/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-arguments/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-arrayish/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isbinaryfile/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-binary-path/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-callable/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-date-object/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isexe/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extendable/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extglob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-finite/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-generator-function/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-nan/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-number/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isobject/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-plain-object/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-promise/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-regex/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-stream/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-symbol/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-api/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-coverage/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-hook/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/node_modules/semver/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/node_modules/supports-color/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/async/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.source-map \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/esprima/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/estraverse/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/has-flag/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/supports-color/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-reports/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-utf8/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/jsesc/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/jsonfile/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-parse-better-errors/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-schema-traverse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-stable-stringify-without-jsonify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-stringify-safe/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-tokens/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-yaml/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-yaml/node_modules/esprima/LICENSE.BSD \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-chai/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-chrome-launcher/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage-istanbul-instrumenter/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage-istanbul-reporter/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/LICENSE-istanbul \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/node_modules/minimist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/acorn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/async/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lcid/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/levn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/bin/license-checker \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/lib/license-files.js \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/lib/license.js \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/node_modules/nopt/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/pify/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/strip-bom/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/node_modules/path-exists/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash.memoize/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log4js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log-symbols/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/loud-rejection/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lru-cache/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/make-dir/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/map-age-cleaner/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/map-obj/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/md5.js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/media-typer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mem/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mem/node_modules/mimic-fn/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/meow/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/meow/node_modules/minimist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-db/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-types/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimalistic-assert/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimatch/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mkdirp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/ansi-colors/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/diff/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/find-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/glob/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/supports-color/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mute-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/negotiator/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/neo-async/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/nice-try/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/nopt/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-package-data/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-package-data/node_modules/resolve/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-path/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/npm-run-path/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/number-is-nan/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-assign/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.assign/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.entries/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.getownpropertydescriptors/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-inspect/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-is/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-keys/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/once/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/on-finished/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/node_modules/wordwrap/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optionator/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/osenv/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-homedir/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-locale/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pad/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pako/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parent-module/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parse-asn1/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parse-json/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseqs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseuri/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseurl/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-dirname/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-exists/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-key/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-parse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/node_modules/pify/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pathval/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pbkdf2/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-defer/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pend/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-finally/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/picomatch/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pify/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pinkie/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pinkie-promise/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-is-promise/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-limit/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-locate/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/plugin-error/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/prelude-ls/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process-nextick-args/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/progress/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pseudomap/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-try/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/public-encrypt/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pump/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/punycode/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/ws/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/qs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring-es3/License.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring/License.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randombytes/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randomfill/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/range-parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/raw-body/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readable-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readdirp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readdir-scoped-modules/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-installed/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-package-json/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/redent/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/regexpp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/remap-istanbul/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/repeating/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-directory/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-main-filename/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/requires-port/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rfdc/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rimraf/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ripemd160/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rollup/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/run-async/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/_esm2015/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/_esm5/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/src/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/safer-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/semver/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/set-blocking/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setimmediate/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setprototypeof/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sha.js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/signal-exit/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slide/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-adapter/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/node_modules/ms/license.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/source-map/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-compare/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-correct/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-expression-parse/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-ranges/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-satisfies/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sprintf-js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/statuses/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/readable-stream/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/string_decoder/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-http/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/streamroller/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/streamroller/node_modules/debug/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string_decoder/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimleft/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimright/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-bom/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-eof/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-indent/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/string-width/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/strip-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/text-table/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through2/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through/LICENSE.APACHE2 \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through/LICENSE.MIT \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/timers-browserify/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tmp/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/to-fast-properties/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/toidentifier/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/to-regex-range/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/treeify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/trim-newlines/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tslib/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tty-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-check/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typedarray/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-detect/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-is/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/chai/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/color-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typescript/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/estree/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/mocha/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/node/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/uglify-js/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ultron/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/universalify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/unpipe/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/url/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/url/node_modules/punycode/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/useragent/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util-deprecate/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util-extend/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/utils-merge/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/validate-npm-package-license/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/vm-browserify/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/void-elements/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wcwidth/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/which/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/which-module/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wide-align/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wordwrap/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/is-fullwidth-code-point/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/string-width/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/strip-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrappy/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/write/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ws/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ws/node_modules/safe-buffer/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/xmlhttprequest-ssl/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/xtend/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/y18n/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yallist/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/ansi-regex/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/ansi-styles/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/camelcase/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/cliui/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/color-convert/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/color-name/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/emoji-regex/LICENSE-MIT.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/find-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/is-fullwidth-code-point/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/locate-path/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/path-exists/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/p-locate/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/string-width/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/strip-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/wrap-ansi/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/yargs-parser/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-parser/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-parser/node_modules/camelcase/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/camelcase/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/find-up/license \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/get-caller-file/LICENSE.md \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/require-main-filename/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/yargs/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/yargs-parser/LICENSE.txt \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yauzl/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yeast/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/scripts/closure/COPYING \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/axe-core/LICENSE \
+	src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/pyjson5/src/LICENSE \
 	src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE \
 	src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE \
 	src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE \
-	src/3rdparty/chromium/third_party/errorprone/LICENSE \
 	src/3rdparty/chromium/third_party/espresso/LICENSE \
-	src/3rdparty/chromium/third_party/expat/files/COPYING \
-	src/3rdparty/chromium/third_party/feed/LICENSE \
+	src/3rdparty/chromium/third_party/expat/src/expat/COPYING \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/full_lgpl.txt \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/jpeg.txt \
 	src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/mips.txt \
@@ -263,7 +711,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/flatbuffers/LICENSE \
 	src/3rdparty/chromium/third_party/flatbuffers/src/dart/LICENSE \
 	src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt \
-	src/3rdparty/chromium/third_party/flot/LICENSE.txt \
 	src/3rdparty/chromium/third_party/fontconfig/LICENSE \
 	src/3rdparty/chromium/third_party/fontconfig/src/COPYING \
 	src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT \
@@ -318,6 +765,8 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE \
 	src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE \
 	src/3rdparty/chromium/third_party/libevdev/LICENSE \
+	src/3rdparty/chromium/third_party/libgifcodec/LICENSE.md \
+	src/3rdparty/chromium/third_party/libipp/LICENSE \
 	src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE \
 	src/3rdparty/chromium/third_party/libjpeg/LICENSE \
 	src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md \
@@ -344,6 +793,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/libyuv/LICENSE \
 	src/3rdparty/chromium/third_party/lottie/LICENSE \
 	src/3rdparty/chromium/third_party/lzma_sdk/LICENSE \
+	src/3rdparty/chromium/third_party/mako/LICENSE \
 	src/3rdparty/chromium/third_party/markupsafe/LICENSE \
 	src/3rdparty/chromium/third_party/material_design_icons/LICENSE \
 	src/3rdparty/chromium/third_party/mesa_headers/LICENSE \
@@ -362,7 +812,6 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/netty4/LICENSE \
 	src/3rdparty/chromium/third_party/netty-tcnative/LICENSE \
 	src/3rdparty/chromium/third_party/node/LICENSE \
-	src/3rdparty/chromium/third_party/nvml/LICENSE \
 	src/3rdparty/chromium/third_party/objenesis/LICENSE \
 	src/3rdparty/chromium/third_party/ocmock/License.txt \
 	src/3rdparty/chromium/third_party/one_euro_filter/LICENSE \
@@ -377,6 +826,7 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE \
 	src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt \
+	src/3rdparty/chromium/third_party/perfetto/LICENSE \
 	src/3rdparty/chromium/third_party/pexpect/LICENSE \
 	src/3rdparty/chromium/third_party/pffft/LICENSE \
 	src/3rdparty/chromium/third_party/ply/LICENSE \
@@ -385,6 +835,9 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt \
 	src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
 	src/3rdparty/chromium/third_party/polymer/v3_0/components-chromium/polymer/LICENSE.txt \
+	src/3rdparty/chromium/third_party/private-join-and-compute/src/crypto/LICENSE \
+	src/3rdparty/chromium/third_party/private-join-and-compute/src/LICENSE \
+	src/3rdparty/chromium/third_party/private-join-and-compute/src/util/LICENSE \
 	src/3rdparty/chromium/third_party/proguard/LICENSE \
 	src/3rdparty/chromium/third_party/protobuf/LICENSE \
 	src/3rdparty/chromium/third_party/pycoverage/LICENSE \
@@ -424,24 +877,24 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE \
 	src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE \
-	src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/skcms/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt \
 	src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/LICENSE \
 	src/3rdparty/chromium/third_party/skia/third_party/wuffs/LICENSE \
 	src/3rdparty/chromium/third_party/smhasher/LICENSE \
 	src/3rdparty/chromium/third_party/snappy/src/COPYING \
+	src/3rdparty/chromium/third_party/spirv-cross/spirv-cross/LICENSE \
 	src/3rdparty/chromium/third_party/spirv-headers/LICENSE \
 	src/3rdparty/chromium/third_party/spirv-headers/src/LICENSE \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE \
 	src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE \
+	src/3rdparty/chromium/third_party/SPIRV-Tools/src/utils/vscode/src/lsp/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite4java/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/LICENSE \
 	src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms \
 	src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md \
 	src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE \
 	src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt \
-	src/3rdparty/chromium/third_party/tcmalloc/gperftools-2.0/vendor/COPYING \
 	src/3rdparty/chromium/third_party/tcmalloc/LICENSE \
 	src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING \
 	src/3rdparty/chromium/third_party/test_fonts/LICENSE \
@@ -479,10 +932,13 @@ QT5WEBENGINE_CHROMIUM_LICENSE_FILES = \
 	src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md \
 	src/3rdparty/chromium/third_party/widevine/LICENSE \
 	src/3rdparty/chromium/third_party/woff2/LICENSE \
+	src/3rdparty/chromium/third_party/wuffs/LICENSE \
+	src/3rdparty/chromium/third_party/wuffs/src/LICENSE \
 	src/3rdparty/chromium/third_party/xdg-utils/LICENSE \
 	src/3rdparty/chromium/third_party/xstream/LICENSE \
 	src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING \
 	src/3rdparty/chromium/third_party/zlib/LICENSE \
+	src/3rdparty/chromium/tools/grit/third_party/six/LICENSE \
 	src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE \
 	src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE \
 	src/3rdparty/chromium/tools/symsrc/COPYING-pefile \
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index fb75f4e079..418621d219 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtwebengine-everywhere-src-5.14.2.tar.xz.sha256
-sha256  e169d6a75d8c397e04f843bc1b9585950fb9a001255cd18d6293f66fa8a6c947  qtwebengine-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebengine-everywhere-src-5.15.0.tar.xz.sha256
+sha256  c38e2fda7ed1b7d5a90f26abf231ec0715d78a5bc39a94673d8e39d75f04c5df  qtwebengine-everywhere-src-5.15.0.tar.xz
 
 # Locally calculated
 sha256 f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
@@ -12,7 +12,7 @@ sha256 9ae1959e86bd49b9680f78e0b49d4e52ae88a3f234d497e175e42a7e8ed59216  LICENSE
 # Locally calculated with:
 # for i in $(find src/3rdparty/ -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before') ; do echo -n "sha256 " ; sha256sum $i ; done | sort --key=3
 sha256 3ed00dd93c75655599456c83cba2f69c6824fd53f24fc24206ba27b65057709d  src/3rdparty/chromium/base/third_party/cityhash/COPYING
-sha256 d04360743ae3338bb08ab2106b51e24309e3ca4b1c6b1186139531ade351b7e3  src/3rdparty/chromium/base/third_party/dmg_fp/LICENSE
+sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/base/third_party/double_conversion/LICENSE
 sha256 96e7ccbf8d17e319dd77c4ebd4965b64a820bbcc3142a2478fbf95af77417b6a  src/3rdparty/chromium/base/third_party/dynamic_annotations/LICENSE
 sha256 5d85142a5609ad177a2d7a2e7cae060b886b8b42f25c5b9803cf0cb5ee04ad2f  src/3rdparty/chromium/base/third_party/icu/LICENSE
 sha256 9ad1d4223b80349f3d3ab9cec92f93431b9da14a1b5d41de468ce054a28cf8aa  src/3rdparty/chromium/base/third_party/libevent/LICENSE
@@ -33,15 +33,20 @@ sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/net/third_party/uri_template/LICENSE
 sha256 834ee20e8fc3235722ed801bae30cc539c2775be656ff9cc2810fe674e53d5ec  src/3rdparty/chromium/ppapi/LICENSE
 sha256 c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  src/3rdparty/chromium/third_party/abseil-cpp/LICENSE
-sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/accessibility_test_framework/LICENSE
 sha256 bf4da21bd20bcfb5b60b7ecc67fa864a79be049e21d6178076887f178dd6c71a  src/3rdparty/chromium/third_party/angle/LICENSE
 sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rdparty/chromium/third_party/angle/src/common/third_party/smhasher/LICENSE
 sha256 86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  src/3rdparty/chromium/third_party/angle/src/common/third_party/xxhash/LICENSE
 sha256 a08ba10adec47027ef8078848729837b1c5a42f140718d7afd65c23f1eeec392  src/3rdparty/chromium/third_party/angle/src/third_party/compiler/LICENSE
 sha256 31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  src/3rdparty/chromium/third_party/angle/src/third_party/libXNVCtrl/LICENSE
+sha256 837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/bin/jsonschema/LICENSE
+sha256 394faaedb93c1da8ecbd61322518834908fee64381117e01a611bf9fac20baa6  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/contrib/natvis/LICENSE
+sha256 a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/license.txt
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/angle/third_party/vulkan-headers/src/LICENSE.txt
+sha256 43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  src/3rdparty/chromium/third_party/angle/third_party/vulkan-loader/src/LICENSE.txt
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/angle/third_party/vulkan-tools/src/LICENSE.txt
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/m4sugar/LICENSE
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/angle/tools/flex-bison/third_party/skeletons/LICENSE
 sha256 bfec18debedcb337f8af53f143ccf0b1575d0b7c30deaee137f10397eca0d353  src/3rdparty/chromium/third_party/angle/util/windows/third_party/StackWalker/LICENSE
-sha256 1cb2d2f0c068fe473ae53779068384bac433e033af76e75d29a79223315a5e49  src/3rdparty/chromium/third_party/apache-mac/LICENSE
-sha256 29028ec63522121b5545046e0c4d3ccc1e01fc8d9aaa3272554f74829cdacf84  src/3rdparty/chromium/third_party/apache-portable-runtime/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/apk-patch-size-estimator/LICENSE
 sha256 b23e682fda7310afe43505ed6041919ccff8f9e0c6799ebd7542cbcef11102e3  src/3rdparty/chromium/third_party/apple_apsl/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/arcore-android-sdk-client/LICENSE
@@ -53,19 +58,8 @@ sha256 a661d10f8f194b1963a75bb4d308f17b078cc064624313a556902d89705f6876  src/3rd
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-APPLE
 sha256 7555fa34bc131a75ca56d65c40cc1ea8f9515d23e353d4c15d58573a042f7805  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2
 sha256 f2b3bd09663381deb99721109d22b47af1213bb43007a8b56a06c6375c8050ce  src/3rdparty/chromium/third_party/blink/renderer/core/LICENSE-LGPL-2.1
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits/lighthouse/LICENSE
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/audits_worker/lighthouse/LICENSE
-sha256 a3f2fe2ac6b471aa80c737c5d283dd049bdc903a73835ee6d4d2cac02fdd53bf  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE
-sha256 c6daa4e8737d15aa7140b4f7eb82b9d4829bd2fd27132c43e282203b9c67dfc4  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm/LICENSE_python
-sha256 13110d66c514a7890c4b388a353bc08fa094fe13d5ed7f3a222cc0a0caa3fd17  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE
-sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/formatter_worker/acorn/LICENSE
-sha256 1490793b8913f0fa78af7bf2e70076f54272748e278f065c50794529eaed8e74  src/3rdparty/chromium/third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE
-sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/third_party/blink/renderer/devtools/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/blink/renderer/devtools/scripts/closure/COPYING
 sha256 6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2  src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Noto/LICENSE_OFL.txt
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt
-sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/COPYING
-sha256 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  src/3rdparty/chromium/third_party/blink/renderer/platform/wtf/dtoa/LICENSE
 sha256 5a7b465d39b5e018bc40cc34162176269f7c476989cb4dbcf0ec0b81701545a7  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/LICENSE.md
 sha256 88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/enum/enum/LICENSE
 sha256 663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/h2/LICENSE
@@ -74,10 +68,9 @@ sha256 16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  src/3rd
 sha256 763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/hyperframe/LICENSE
 sha256 63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/third_party/six/LICENSE
 sha256 df336397e09e764416fc33b555703b1cdddd3a0cfea8a013ad1cad565c8be2f5  src/3rdparty/chromium/third_party/blink/tools/blinkpy/third_party/wpt/wpt/tools/wptserve/LICENSE
-sha256 64fee5ec1a356f70c7c258b344b64e87a98a66fe1bd49d5fd34573350e43567b  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
+sha256 60bd7c54856bf9387221bde5ab55d516d7cea15870d0fed69406bcd1c8ec7c9d  src/3rdparty/chromium/third_party/boringssl/src/LICENSE
 sha256 0c125a4dab5ab869473e6491db22f6c0a7f8a4de58588d03bb2b16c0c8ebd7de  src/3rdparty/chromium/third_party/boringssl/src/third_party/fiat/LICENSE
 sha256 9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/LICENSE
-sha256 c544adf8f0d43453d9fdf6c11da19605d12d89806a7870653169b8cc97f5bb53  src/3rdparty/chromium/third_party/boringssl/src/third_party/sike/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE
 sha256 5740985669353ef52e0f320413ff68dc62b6c23a596cd78b6d6b80764f1c50ab  src/3rdparty/chromium/third_party/bouncycastle/LICENSE
 sha256 f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  src/3rdparty/chromium/third_party/breakpad/breakpad/LICENSE
@@ -108,6 +101,8 @@ sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/checkstyle/LICENSE.apache20
 sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/LICENSE
 sha256 c2d13ec3b431617beb314705c0f42d17ca579eed00032ed8a13dbcd23fc9bdd5  src/3rdparty/chromium/third_party/cld_3/src/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/closure_compiler/compiler/COPYING
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/closure_compiler/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/crashpad/crashpad/LICENSE
 sha256 212846e0145aa50fb3a5aef254a370311a93acf6c1e792e47e0068d64c8c3885  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE
 sha256 4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  src/3rdparty/chromium/third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE
@@ -123,137 +118,590 @@ sha256 2da4494d2a8b5c742afbb905b10621e40129284c977ac138e3081ed0d9d83aed  src/3rd
 sha256 b77e952e3feaebd807d27784988b19fb60f83f9fc9a0c03e6aedbbffd5d6f8ee  src/3rdparty/chromium/third_party/dawn/LICENSE
 sha256 43452b94e6aa0c2d076ad25b87f580c11571689d52f3aa1a1f7bdcab31a0bd15  src/3rdparty/chromium/third_party/decklink/LICENSE
 sha256 5a2ed53cc5975569e9fa146c4245eaf53377dc1a88bdcb923da6487e53cba55e  src/3rdparty/chromium/third_party/devscripts/COPYING
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/LICENSE
-sha256 cfa72b62b9ae173078823a3796b25c027a9071046a263beddf966df67018ce06  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE
-sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE
-sha256 e85e131fa4ed25538ff1f4962ced1fb6f68b079bd9164a790597a0f30b8fd030  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-escapes/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE
-sha256 c8442419dc614089ea022b3da6bfc089b41a58fb7b9030d1e651f2f36189dce2  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/argparse/LICENSE
-sha256 69dee148a2cc470554dfa7142e830662062394d0fe67cddd379aba90dc60d6b3  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/astral-regex/license
-sha256 517913953e6a69da35bccb95c2d801f70d73e8f267cdad1a1615bfe8974ad3ad  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/code-frame/LICENSE
-sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/@babel/highlight/LICENSE
-sha256 a1bd5deadb6a06dd74efa852c1b8b23f63b67f2214fbe9c8bd591da51da69268  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE.md
-sha256 68f12f6e2c33688699249c01d8f9623c534da20aa71989c57b061b7bc1676d14  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/brace-expansion/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/callsites/license
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chalk/LICENSE
-sha256 7df1d6cf5b4112cbe277a84269e02ae631603a9a3a21b8328a34c30b8c3dd1ab  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-cursor/LICENSE
-sha256 33fa5470b2195e410b075a32516b6ad27784b8a8ff74ae90cfd60c14b76e6644  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cli-width/LICENSE
-sha256 693866fc419c6f61c8570438ec00659d156ec2b4d4a4d04091711f5f11a365d4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-convert/LICENSE
-sha256 7357445bac398c76c0aef75a587009fe406d40de6a79789eb5b7ecbbad317ef2  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/color-name/LICENSE
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/concat-map/LICENSE
-sha256 aaa78451b6fecd1b9c4594c796c133c0e90cad100372ff8bc6de615e9ef9adf1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE
-sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/debug/LICENSE
-sha256 f2042f3634c4136d06b5139c9c6aefb81a3a462b514548bc1845953233dfba98  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/deep-is/LICENSE
-sha256 5c272e206669b79ee20fa89fa8fa888d5b56186f16c55a5614753ad3412e2ae9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.closure-compiler
-sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.esprima
-sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/emoji-regex/LICENSE-MIT.txt
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/escape-string-regexp/LICENSE
-sha256 db83f2ede67f36cfab1ea0721ea2ee97515863e9a65346881f305e430451cc91  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint/LICENSE
-sha256 d3a724e2ed749f172ff70b62a1d0631b7d4b0ea273782365a3464d4e2d6b6dbd  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE
-sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-utils/LICENSE
-sha256 d8bf34ff6d190640a01e7704ad78253fc181bc128949d71273fbbaa12f33c0b4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/eslint-visitor-keys/LICENSE
-sha256 6273faa0d14a54972c0341a724010eb8cd928ee486745a9eea8cf80680ba5098  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/espree/LICENSE
-sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE.BSD
-sha256 ac68116ae73740de4190892f334992e449a124600924ec761e64319d3aac9e6e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esquery/license.txt
-sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE.BSD
-sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE.BSD
-sha256 e33b7bc13a0e5ea9ed6718e12e99a5b0b60276162f0195aa7f342397f4b0155d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/external-editor/LICENSE
-sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-deep-equal/LICENSE
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-json-stable-stringify/LICENSE
-sha256 942a98cb8846a6354266193f173c1354615827fbb7d67f68399599dff12c4d6a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE.md
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/figures/LICENSE
-sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/file-entry-cache/LICENSE
-sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flat-cache/LICENSE
-sha256 5097efeab30293dd7e26d6960b6b94f1aeca958d22f1eca3535c482a891e95a9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/flatted/LICENSE
-sha256 8465b04b67f473341171b5c9c8b2c741a4a395b3f6ed58339b3a4f4db3db7472  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/fs.realpath/LICENSE
-sha256 e67aed7df22dc8031e4fcf5338fe91cb33e3817e5c58a99a2a2802eea9069791  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/functional-red-black-tree/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/globals/LICENSE
-sha256 6236fa0b88a4a0cce3dda0367979491b2052b3c8d6b1c10b3668de083e86a7f0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE
-sha256 a2a19c04f527f7582fb2e58887f0a90f403732fc6accd7322287f0f5949b489e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/LICENSE
-sha256 3672fb6ef1c214578dfee689643516c2685f61ab08d130517ca8ea24f383a840  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/glob-parent/node_modules/is-glob/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE
-sha256 ac779f7314c74f232ef847ea86e714abe25cf6eeb5cc97b69451b74e2af6492d  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/iconv-lite/LICENSE
-sha256 9c94db23dc4b1e9aaee5d195668b916afc71efed54af226b66cf0ccc4389c1c0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ignore/LICENSE-MIT
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/import-fresh/license
-sha256 05dc4d785ac3a488676d3ed10e901b75ad89dafcc63f8e66610fd4a39cc5c7e8  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inflight/LICENSE
-sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inherits/LICENSE
-sha256 e6c3f1bc47f97cdeef953f6c109b6392be0d059ae94659faf550e61b7a75ebc7  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/ansi-regex/license
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/strip-ansi/license
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/isexe/LICENSE
-sha256 73b5283588baa142c5baaef5f56d3e8fdea7a30b214e8c5737e87640f882453a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-extglob/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-fullwidth-code-point/LICENSE
-sha256 4cd903859549d4b20b571041f96dfae1136ed079c476126268f9d7cc1b611150  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-glob/LICENSE
-sha256 44191656d296391e0ec97e32f5385f0d02b6f2992694082d22ea04ba0f66f9e4  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/is-promise/LICENSE
-sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-schema-traverse/LICENSE
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/json-stable-stringify-without-jsonify/LICENSE
-sha256 2213d91c606205c71eb051a199478cdc2adde945893404d7f1421436dd6d5cc1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE
-sha256 a07bc24468b9654ce76a547d47a2db282d07733b715db4c73a98bd63961f9550  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/js-yaml/LICENSE
-sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/levn/LICENSE
-sha256 f71e8ed126b46346494aad5486874cd8f0aafe95092ed67d2e3cb6110f939abc  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimatch/LICENSE
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/minimist/LICENSE
-sha256 05991c2e8f070b69ec5b656c2c12fd07cd0153dd157d39b050b82af59b319a01  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mkdirp/LICENSE
-sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/ms/license.md
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/mute-stream/LICENSE
-sha256 bd220c219b05e6c22b7c23613ca926f60932d07c9fe141dd6e04b80dbc4b4e52  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/nice-try/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/once/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/onetime/LICENSE
-sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/optionator/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/os-tmpdir/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/parent-module/license
-sha256 9c791b69df62b2264d0a846786f82b00bd6943200a0b10eba66a1ba7a7785fc8  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-dirname/license
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-is-absolute/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/path-key/license
-sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/prelude-ls/LICENSE
-sha256 d7d2a7786de7c7cfd96f920c6f12927d74e1d2a861ca4498bf465c3bc3f4c21c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/progress/LICENSE
-sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/punycode/LICENSE-MIT.txt
-sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/regexpp/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/restore-cursor/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rimraf/LICENSE
-sha256 e5c1364118b39fa98b959138ce4aa4d0e68cfbee12d115e69730579fecb1dc1b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/run-async/LICENSE
-sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm2015/LICENSE.txt
-sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm5/LICENSE.txt
-sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/LICENSE.txt
-sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/rxjs/src/LICENSE.txt
-sha256 4bc935e71be198c67ddf3c2b5fddb195f6edc182bfc155a96a6db61b44b494b9  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/safer-buffer/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/semver/LICENSE
-sha256 e6fdf7ac2af533b4436d99aa75df32aa78690510f7d68a3e73e8576967298d2f  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-command/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/shebang-regex/LICENSE
-sha256 e05b1eaf5b5f99b7ad75cd1f38858ff9a311780b97715ead67936d60bf96aa7e  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE.txt
-sha256 3dc3b3d3a284d871f7f307655c90fb101d73abbf87bbddeefd2f67883353bdbc  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/slice-ansi/LICENSE
-sha256 a4cdda44b5adea4731d53dcae78fb5124f8fd853e994f01e25d8c33a7daf818b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/sprintf-js/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/string-width/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-ansi/LICENSE
-sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/strip-json-comments/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE
-sha256 37b6932865726cf59cbfb8b32a5c9fd82c834c2deba4d53aa4a6b433ae69cdda  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/LICENSE
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/ansi-regex/license
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/string-width/license
-sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/table/node_modules/strip-ansi/license
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/text-table/LICENSE
-sha256 e8734448285a2dd773d40136ed5d5e8163a70701dd540cdc796cfca232f67d55  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.APACHE2
-sha256 d72dea1a8cdf3f4dfa2f594253d0c5b37baefc76e806f5ecb0e426393edcd505  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.MIT
-sha256 162413c61e0982abe89a06bf7a02ec760dc49a7364d838bd9f01daebb5b95954  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tmp/LICENSE
-sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/tslib/LICENSE.txt
-sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/type-check/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/which/LICENSE
-sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wordwrap/LICENSE
-sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/wrappy/LICENSE
-sha256 0ead7e8cd8b0bc66a981ee69acaf1297ffa838cfce1b156a039bb24f997c0a27  src/3rdparty/chromium/third_party/devtools-node-modules/third_party/node_modules/write/LICENSE
+sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits/lighthouse/LICENSE
+sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/audits_worker/lighthouse/LICENSE
+sha256 a3f2fe2ac6b471aa80c737c5d283dd049bdc903a73835ee6d4d2cac02fdd53bf  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE
+sha256 c6daa4e8737d15aa7140b4f7eb82b9d4829bd2fd27132c43e282203b9c67dfc4  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm/LICENSE_python
+sha256 13110d66c514a7890c4b388a353bc08fa094fe13d5ed7f3a222cc0a0caa3fd17  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/cm_modes/LICENSE
+sha256 9fea307fe830918e12b6822f943f4b59bd7715614efb68e834a141ca758bd5f2  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/dagre_layout/LICENSE
+sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/formatter_worker/acorn/LICENSE
+sha256 f734f7708439c275f3599e2df7de84cd9f360bd13620a30ab376af6c9deb213b  src/3rdparty/chromium/third_party/devtools-frontend/src/front_end/sdk/wasm_source_map/LICENSES.deps
+sha256 7a209dd1b94cabdb5ea9c6f9164b9546ffa5daaa671e7767d49510db055f5c51  src/3rdparty/chromium/third_party/devtools-frontend/src/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/abbrev/LICENSE
+sha256 71f83c4c0621102a56d9853812777b85751bce7e9726f686f5b056c1f8a4b0e6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/accepts/LICENSE
+sha256 cfa72b62b9ae173078823a3796b25c027a9071046a263beddf966df67018ce06  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn-jsx/LICENSE
+sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn/LICENSE
+sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/acorn-walk/LICENSE
+sha256 e85e131fa4ed25538ff1f4962ced1fb6f68b079bd9164a790597a0f30b8fd030  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ajv/LICENSE
+sha256 ea97081f183590d87376f5fe73b7150c79863a73167f47ed87c41e191f89eb0b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/amdefine/LICENSE
+sha256 10e7818a114cf8b702a2263ad424b3cd9d34254df6039e47bb3f412000b0ae00  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-colors/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-escapes/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-regex/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-styles/LICENSE
+sha256 0798f37cff4a3f438c071316e41f94ffe110116a313ab0fc4f8caa07218f1f0f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ansi-wrap/LICENSE
+sha256 5a3b0007c4203f10fe11b3fe8747253eb994f135e10b73e1f88ada941af09c6e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/anymatch/LICENSE
+sha256 0b61ac8491c66669491fdb328200203822b91d2a0461f5cd898fe0944ea97e41  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/append-transform/license
+sha256 c8442419dc614089ea022b3da6bfc089b41a58fb7b9030d1e651f2f36189dce2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/argparse/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/array-find-index/license
+sha256 f4a48aa8354a257785aa534bab2ac5ff2c2a98cd59cdf4a637bb68ee185683f7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/arr-diff/LICENSE
+sha256 3672fb6ef1c214578dfee689643516c2685f61ab08d130517ca8ea24f383a840  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/arr-union/LICENSE
+sha256 e80373b1ed0f33cecc47173b4b0c6afe0d0318b32dbd84116a1a957e3f7f43a8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/asap/LICENSE.md
+sha256 6239c6144c31e58cf925c34483606969c555574d64ffa96518ab5d7f45c75d43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assert/LICENSE
+sha256 0798f37cff4a3f438c071316e41f94ffe110116a313ab0fc4f8caa07218f1f0f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/assign-symbols/LICENSE
+sha256 69dee148a2cc470554dfa7142e830662062394d0fe67cddd379aba90dc60d6b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/astral-regex/license
+sha256 d9fed24f132985934fca621c4dc1dfb53e03377a24d0568d424383d7eaa9c0ac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async/LICENSE
+sha256 e5a57cdd72e279910183799153134d0e749a5664fc459c8eacbecf72532b7db3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/async-limiter/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/code-frame/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/generator/LICENSE
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/generator/node_modules/source-map/LICENSE
+sha256 4e32449bd377d3dbced215dfd66dc234994c28e561aef73dbd29d6b5a1a00484  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-function-name/LICENSE
+sha256 517913953e6a69da35bccb95c2d801f70d73e8f267cdad1a1615bfe8974ad3ad  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-get-function-arity/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/helper-split-export-declaration/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/highlight/LICENSE
+sha256 2e97627cb278aa7556fb9e8817368302301a595b6c7582512b8d74c57b773652  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/parser/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/template/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/traverse/LICENSE
+sha256 117da2af0d4ce0fe1c8e19b5cff9dcd806adf973d328d27b11d4448c4ff24f76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@babel/types/LICENSE
+sha256 a1bd5deadb6a06dd74efa852c1b8b23f63b67f2214fbe9c8bd591da51da69268  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/balanced-match/LICENSE.md
+sha256 f3eca6ff762533fa5a77caf954a143e48afa204668cf97dce758c45a9e006be3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64-arraybuffer/LICENSE-MIT
+sha256 de6059eadd0c1327f30a22663392e57d36b97b0ac9bb48f4875c8008ba823c30  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64id/LICENSE
+sha256 5b37224c080cdcc97c871ada971c224e9926370fe74f11b539aa1cf9f3b1aca1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/base64-js/LICENSE
+sha256 85fe65eefab89e2a683232b96e6f689279821a0bd3b351e9ab6a6ebd19dea567  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/binary-extensions/license
+sha256 150d7707d4532d57bdb5718637ff62fff1f075921c5ffaa084df27f900bfea76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/.bin/license-checker
+sha256 7d3e0d8d5604632b94ff9aea3001153c506566cd1c6c7bb37000acdb1fb37417  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/blob/LICENSE
+sha256 87092fe7ffd1e92eba5d1dd39b73a73fdb4fdd4df3474beacc3d9f6b08ece82c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/bluebird/LICENSE
+sha256 23d466b1b134b415b66fa50c6526b4cf3e7b9258554da88d3abb371721e7ce68  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/body-parser/node_modules/ms/license.md
+sha256 68f12f6e2c33688699249c01d8f9623c534da20aa71989c57b061b7bc1676d14  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/brace-expansion/LICENSE
+sha256 e70ff771504ba41f2be55de812a017ff46433d7a250c862e38fc419159e44500  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/braces/LICENSE
+sha256 82ba430b068b75a41438568e1e4ed1f96e02699c9b51735154af03e9b59d6b0d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-aes/LICENSE
+sha256 dc09aa476634db0dbae1a296f099d5bd39e27c96b876d4d20b236fa565002bb6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-cipher/LICENSE
+sha256 e54f1a2edadb1d8d3a482bcd0712acad2947337ae35e40ca34b22eb77940863f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-des/license
+sha256 672eb2c2ad92bee7ef6c894f1431a66d7e8fdd7965cfdca5aa4fc206951a7c9c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-rsa/LICENSE
+sha256 a0e06d86a5a17341fa6134ee30ef18d73251cf32b8a577cdfd6aad6ad34af61d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-sign/LICENSE
+sha256 ddd770379e07bf0574dfaa4485be80a23b3248b36d09f33ec79276c09b829daf  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browserify-zlib/LICENSE
+sha256 0e91be39cb38da2972a6e0649dcd4e8a49595996b3ab4b04e72ef9ea71de9079  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browser-resolve/LICENSE
+sha256 fd595a25dd3c90492a8cc3b888aa9ae47630173181efed17f71b4c689d99d0ec  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/browser-stdout/LICENSE
+sha256 14275f5c8139d02054c5259d52a88ccbba662a86af18c30f071c8d082dc6004c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer-from/LICENSE
+sha256 06bafa45fdad2579ba0e43b0c9b2c6290287c99c4203c300254a462b38a307f6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer/LICENSE
+sha256 51ad9defd71911dbe413daf277bcb2e1077743f5ee5ae48d0a3b90a5b7486f55  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/buffer-xor/LICENSE
+sha256 f057f36739d53d228a746de4440c1e0c644ecde06d6beab45337d39c9d12a393  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/builtin-status-codes/license
+sha256 e3b44af066615de2ea48d18d852d0762f18c0b2efcea714fa48a6f729d405b85  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/bytes/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/callsites/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase-keys/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/camelcase/license
+sha256 b181da80336ff9dd1043fc8be1a764d7382363433319aa872e4d2cb5ce2a3066  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chai/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chalk/LICENSE
+sha256 7df1d6cf5b4112cbe277a84269e02ae631603a9a3a21b8328a34c30b8c3dd1ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chardet/LICENSE
+sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/check-error/LICENSE
+sha256 db9ba183d4cbfbaf6c27db2effddbb84b46340c33ed32a066bc0b144a3ea1298  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/LICENSE
+sha256 2c46f1325bd3822a33c1e2c1e49c18d13127ac00f9c8b3b79196c7a126f73cd9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/chokidar/node_modules/glob-parent/LICENSE
+sha256 cf93ad78cfd5f3523248675aeb2a46e003367596883d4fa26a0c38d553ab0f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cipher-base/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-cursor/LICENSE
+sha256 2dc0465729366c3a7890dfa9e972a1ba7048a26c02116fb8b419a6a1ac110149  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cliui/LICENSE.txt
+sha256 33fa5470b2195e410b075a32516b6ad27784b8a8ff74ae90cfd60c14b76e6644  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cli-width/LICENSE
+sha256 3fb0857ef0133928cf72c88dfc464e931486e88778961eedec25585e2321507f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/clone/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/code-point-at/license
+sha256 693866fc419c6f61c8570438ec00659d156ec2b4d4a4d04091711f5f11a365d4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/color-convert/LICENSE
+sha256 7357445bac398c76c0aef75a587009fe406d40de6a79789eb5b7ecbbad317ef2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/color-name/LICENSE
+sha256 77ffe84006509949525fd57df06f4a6a80ad862c5314b66ab5bb6ac4cee6280b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/colors/LICENSE
+sha256 1fa6ee8bb95a81ae3d73a5bd074a3ac380ffec13697051063ca1a601921b91db  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/LICENSE
+sha256 1fa6ee8bb95a81ae3d73a5bd074a3ac380ffec13697051063ca1a601921b91db  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/node_modules/convert-source-map/LICENSE
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/combine-source-map/node_modules/source-map/LICENSE
+sha256 04512a63dce4d2d506ad612dc0bd7681ccf6e3655f7b6eaef7dfac8323d1ec0b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/commander/LICENSE
+sha256 d682394bef4a34d279b0237feecf145abadd6ec1e41cbb094592b8cc9fc2f34b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/compare-versions/LICENSE
+sha256 0f0b408b8b871d983e767528c6dc51e0ad7efaa022890c449fe2b2e1ee24dbb7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/component-emitter/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-map/LICENSE
+sha256 96b29c9aaa611a05349b362d48c2ffce0966fe408401a2d1a157be312c035b5f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/LICENSE
+sha256 ec62dc96da0099b87f4511736c87309335527fb7031639493e06c95728dc8c54  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/readable-stream/LICENSE
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/safe-buffer/LICENSE
+sha256 11f2aafb37d06b3ee5bdaf06e9811141d0da05263c316f3d627f45c20d43261b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/concat-stream/node_modules/string_decoder/LICENSE
+sha256 9913ff70f23424d49fda2b05902cfb72f17ae1e48aaf898c349a284289a74751  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/connect/node_modules/ms/license.md
+sha256 257aed98914108e91a337912727b6a802eef218248507f74b76faffaff517a38  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/content-type/LICENSE
+sha256 1fa6ee8bb95a81ae3d73a5bd074a3ac380ffec13697051063ca1a601921b91db  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/convert-source-map/LICENSE
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/convert-source-map/node_modules/safe-buffer/LICENSE
+sha256 c02110eedc16c7114f1a9bdc026c65626ce1d9c7e27fd51a8e0feee8a48a6858  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cookie/LICENSE
+sha256 722e1193901ad1ed4460753dded483d68ca2ad0528c67f86f76abc46b9aa25f5  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/core-js/LICENSE
+sha256 33b734d60042d0fe0c92dd1fc1e874193a1c899ec3e276a2eb935d2d0bf5b710  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/core-util-is/LICENSE
+sha256 d4ad87ad0bb7d57c17ae73b46e064243b972edc3036c38c222172c9600a20b56  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-ecdh/LICENSE
+sha256 cf93ad78cfd5f3523248675aeb2a46e003367596883d4fa26a0c38d553ab0f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-hash/LICENSE
+sha256 cf93ad78cfd5f3523248675aeb2a46e003367596883d4fa26a0c38d553ab0f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/create-hmac/LICENSE
+sha256 aaa78451b6fecd1b9c4594c796c133c0e90cad100372ff8bc6de615e9ef9adf1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/cross-spawn/LICENSE
+sha256 6134c69bc22c8289252e70de3af20bd67071233459055be74d83acfcc4865e7e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/crypto-browserify/LICENSE
+sha256 0b61ac8491c66669491fdb328200203822b91d2a0461f5cd898fe0944ea97e41  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/currently-unhandled/license
+sha256 53ecc31e1632c07980cb0c97dcaf3d1d20323d21194b92150987a4fecf517b3c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/custom-event/LICENSE
+sha256 9660914267128b5f96a102bd7f6268c249110a39cb7c4bb7f536d856445d739c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/date-format/LICENSE
+sha256 e38ad5868b1e32ab44c63da6e58b8b58604d8d1dd90c40d171f2feaa756b088b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dateformat/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/debug/LICENSE
+sha256 5f9e03a50e10f262f7bd356fe323b12f461f14dae6762611285a0d7479340ae7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/debuglog/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/decamelize/license
+sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/deep-eql/LICENSE
+sha256 f2042f3634c4136d06b5139c9c6aefb81a3a462b514548bc1845953233dfba98  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/deep-is/LICENSE
+sha256 d7c67af00ef4ecd9bee06e010bb1fcd8d5f0ecb02fa1b73fe3ef030a88800d4b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/default-require-extensions/license
+sha256 b568428993e6acff80c1214dcc4f7195241772d5b3d23d92ee6bf5406a102896  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/defaults/LICENSE
+sha256 00d402c2bbe7c67369bd01ce2c16b8ed46ccc949a1ee2d6bb8f9606afa8c7434  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/define-properties/LICENSE
+sha256 bd47ce7b88c7759630d1e2b9fcfa170a0f1fde522be09e13fb1581a79d090400  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/depd/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/dezalgo/LICENSE
+sha256 db6109f994692150ed82cd904bb053c73b97b23678bf52047f747bfec11e1934  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diffie-hellman/LICENSE
+sha256 152f0fb43e953fcf5c56c5bfa4c834bb96b1603e4026319c613dd3e734f305cf  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/diff/LICENSE
+sha256 545278991ee5f1fb4372f913ec44837cff9395175140f8f21118074330a659cb  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/di/LICENSE
+sha256 5c272e206669b79ee20fa89fa8fa888d5b56186f16c55a5614753ad3412e2ae9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.closure-compiler
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/doctrine/LICENSE.esprima
+sha256 8ffaa1b117e1c280023c8ef997a84a461133b972c8bade4579050e3e41835902  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/domain-browser/LICENSE.md
+sha256 965ef284f7f4c176842ec2e87fa13e79feed777d56d7a21a5a3b38f1bb6dc288  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ee-first/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/emoji-regex/LICENSE-MIT.txt
+sha256 7585ea7bba616ccbbe43cb54ecb67956688c3c5641bb84f3099a652a73193afe  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/encodeurl/LICENSE
+sha256 3fe8d55a98dbf260eace67c00cf9bc53edb46234e840098a0b93df3096b97fb6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/end-of-stream/LICENSE
+sha256 bb996a5665c8e18041251e833e52b590f0da5050c1878aa3e3a47f71bb16fa6d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-client/node_modules/ms/license.md
+sha256 8e0349070612cb59fc604588974e193d8363f0a08752caf31d3f270a609d346a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io/node_modules/ms/license.md
+sha256 2a190271977c2ad47c85a9e08cc05d078fe9293643061d466d2ae89ce8e5c2f1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/engine.io-parser/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ent/LICENSE
+sha256 92b07a2e5b0e051d37dde85042c736d6d551cfcbc0983f39d7ef903b3986bbc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/error-ex/LICENSE
+sha256 c2c31e096c312163e9a7a908a5209f335eb4c3381d6c404dd1e1b91fe65707fc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-object-assign/LICENSE
+sha256 da852e222c72bc04a0a9046aac35f2e5d33775a8ea9f1d8f59b1cfd195ef9bb0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es6-promise/LICENSE
+sha256 00d402c2bbe7c67369bd01ce2c16b8ed46ccc949a1ee2d6bb8f9606afa8c7434  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-abstract/LICENSE
+sha256 255aa557a1f55224ce522f311629c0bf20854740a67955cefd798fbd1d3d1ded  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-html/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escape-string-regexp/LICENSE
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/LICENSE.BSD
+sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/escodegen/node_modules/esprima/LICENSE.BSD
+sha256 db83f2ede67f36cfab1ea0721ea2ee97515863e9a65346881f305e430451cc91  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint/LICENSE
+sha256 d3a724e2ed749f172ff70b62a1d0631b7d4b0ea273782365a3464d4e2d6b6dbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-scope/LICENSE
+sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-utils/LICENSE
+sha256 d8bf34ff6d190640a01e7704ad78253fc181bc128949d71273fbbaa12f33c0b4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eslint-visitor-keys/LICENSE
+sha256 6273faa0d14a54972c0341a724010eb8cd928ee486745a9eea8cf80680ba5098  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/espree/LICENSE
+sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esprima/LICENSE.BSD
+sha256 ac68116ae73740de4190892f334992e449a124600924ec761e64319d3aac9e6e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esquery/license.txt
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/es-to-primitive/LICENSE
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/estraverse/LICENSE.BSD
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/esutils/LICENSE.BSD
+sha256 3aecc12b1cb28832b5f65ab64291de96568c3f236a74d646281b4491f7bcadbf  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/eventemitter3/LICENSE
+sha256 631987b7616a325a5b97566c232418481ddf7dbb5ecadefb991e791876cc2599  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/events/LICENSE
+sha256 cf93ad78cfd5f3523248675aeb2a46e003367596883d4fa26a0c38d553ab0f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/evp_bytestokey/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/execa/license
+sha256 97af7428f93afbab9bf79cd09254da1357161794f4255eb1b4599f04dd2d2e7c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extend/LICENSE
+sha256 9580cc528a1c38d1560a9d36e34404fe1ea9d8e6f44c596dac2a3104ef63cdab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extend-shallow/LICENSE
+sha256 e33b7bc13a0e5ea9ed6718e12e99a5b0b60276162f0195aa7f342397f4b0155d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/external-editor/LICENSE
+sha256 77b2de947c65f3062fb347118ca198ca50898ead84a8509d8153fa65741f029b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/extract-zip/node_modules/ms/license.md
+sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-deep-equal/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-json-stable-stringify/LICENSE
+sha256 942a98cb8846a6354266193f173c1354615827fbb7d67f68399599dff12c4d6a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fast-levenshtein/LICENSE.md
+sha256 176d95320d565cb034d8323797b6cd6160238f625453687f98aad2085c46c3b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fd-slicer/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/figures/LICENSE
+sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/file-entry-cache/LICENSE
+sha256 99513010b6a19894e01864cba86bf98291bef8251a302d90ab1a572d91ebacc8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fileset/LICENSE-MIT
+sha256 35bdd8a44339719441900fb50fbefc5e2dca1ca662cbaed7a687de842c8b70f2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fill-range/LICENSE
+sha256 24973d5320410e565ec92f18f73f12af7d97c634d414ba170d119fe3f98904c8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/finalhandler/node_modules/ms/license.md
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/find-up/license
+sha256 c8c8324aff32c44f9e501aac5b3b97540c26af7d6dd6af8bce5e34300596e27d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat-cache/LICENSE
+sha256 95a61f61553614db5421a2cefb17c22ff6b2b4b2206f5bc8913d04f72a22b033  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flat/LICENSE
+sha256 5097efeab30293dd7e26d6960b6b94f1aeca958d22f1eca3535c482a891e95a9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/flatted/LICENSE
+sha256 bfa8a54bb952ccda79f0f1889721d108f5b605babbb2b8a3705ffb52f4132eb7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/follow-redirects/node_modules/debug/LICENSE
+sha256 99de4c30f4643c00d4895d9c6ade0af4ec43d301449c191f5fbe41b53bb6a13a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fsevents/LICENSE
+sha256 1e76029602ae9b21cc4e612db2496d92febed882ba13ba745f8b3309e85f9d39  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fs-extra/LICENSE
+sha256 8465b04b67f473341171b5c9c8b2c741a4a395b3f6ed58339b3a4f4db3db7472  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/fs.realpath/LICENSE
+sha256 e67aed7df22dc8031e4fcf5338fe91cb33e3817e5c58a99a2a2802eea9069791  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/functional-red-black-tree/LICENSE
+sha256 773e131a7684726005a7e4688a80b4620033bc08499bc1404dd1a1eb3bca725e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/function-bind/LICENSE
+sha256 902dbb4154679fb2b8d7c33878183f45b268d01eae5e5033dddaa8852d45f213  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-caller-file/LICENSE.md
+sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-func-name/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/get-stream/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/globals/LICENSE
+sha256 6236fa0b88a4a0cce3dda0367979491b2052b3c8d6b1c10b3668de083e86a7f0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob/LICENSE
+sha256 a2a19c04f527f7582fb2e58887f0a90f403732fc6accd7322287f0f5949b489e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/LICENSE
+sha256 3672fb6ef1c214578dfee689643516c2685f61ab08d130517ca8ea24f383a840  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/glob-parent/node_modules/is-glob/LICENSE
+sha256 2fc5460f1526810979054ecd18cd01349b57f38ea56d1e920afdea34d104540c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/graceful-fs/LICENSE
+sha256 8a48a335d7dcc06e3da2bea89220cfe978394b1bc84a3e628e60bc4864917915  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/handlebars/LICENSE
+sha256 dc1fcc41f783463ed272ada875a7d3d1baf6c6279e5efada2c4ef2ca72db39e1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-binary2/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-flag/LICENSE
+sha256 898f204abbbbde58c6230a31842c59aeb8040fbcffa924db28e6d0b1d7631a3a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hash-base/LICENSE
+sha256 4fe5fd7b3318def0b74f8bf8c9276403f01da628fa8888822661519d80f237d3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has/LICENSE-MIT
+sha256 206c1adcf206dc0031b11232f5b054ec5f1662407ab1ca415247921cab2068ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/has-symbols/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/he/LICENSE-MIT.txt
+sha256 c1476ec53119cd4c8370f91f5152ac76312a29b4fae2d49b5e0e0970fe0fa5ee  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/hosted-git-info/LICENSE
+sha256 dcb94ff9b1e037a847bc20589dc81a1066d041fd4c16deb18b0fa968c66cf395  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-errors/LICENSE
+sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-errors/node_modules/inherits/LICENSE
+sha256 589850dfc0a1d39a97c592d618d5772f84aec2b11c6898e020acb985299f3bab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/http-proxy/LICENSE
+sha256 ff151c00207c908581639851dd8504ce4255be0650b2b236edec2aa90342b0cd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/https-browserify/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/https-proxy-agent/node_modules/debug/LICENSE
+sha256 ac779f7314c74f232ef847ea86e714abe25cf6eeb5cc97b69451b74e2af6492d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/iconv-lite/LICENSE
+sha256 18d45466ba3253deae04667e267a91ea8de8548f18c1125264d1c9db28194cc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ieee754/LICENSE
+sha256 9c94db23dc4b1e9aaee5d195668b916afc71efed54af226b66cf0ccc4389c1c0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ignore/LICENSE-MIT
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/import-fresh/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/indent-string/license
+sha256 05dc4d785ac3a488676d3ed10e901b75ad89dafcc63f8e66610fd4a39cc5c7e8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inflight/LICENSE
+sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inherits/LICENSE
+sha256 1fa6ee8bb95a81ae3d73a5bd074a3ac380ffec13697051063ca1a601921b91db  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inline-source-map/LICENSE
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inline-source-map/node_modules/source-map/LICENSE
+sha256 e6c3f1bc47f97cdeef953f6c109b6392be0d059ae94659faf550e61b7a75ebc7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/inquirer/node_modules/strip-ansi/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/invert-kv/license
+sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-arguments/LICENSE
+sha256 92b07a2e5b0e051d37dde85042c736d6d551cfcbc0983f39d7ef903b3986bbc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-arrayish/LICENSE
+sha256 628a0b082ba17df4f4bcb7946d41988891d2b410b25927b995c2f632a0829676  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isbinaryfile/LICENSE.txt
+sha256 85fe65eefab89e2a683232b96e6f689279821a0bd3b351e9ab6a6ebd19dea567  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-binary-path/license
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-buffer/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-callable/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-date-object/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isexe/LICENSE
+sha256 4922620a5741e9d1bb43dde132021a982ae7c545eed1c6e00b555d6fe978005f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extendable/LICENSE
+sha256 73b5283588baa142c5baaef5f56d3e8fdea7a30b214e8c5737e87640f882453a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-extglob/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-finite/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-fullwidth-code-point/LICENSE
+sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-generator-function/LICENSE
+sha256 4cd903859549d4b20b571041f96dfae1136ed079c476126268f9d7cc1b611150  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-glob/LICENSE
+sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-nan/LICENSE
+sha256 35bdd8a44339719441900fb50fbefc5e2dca1ca662cbaed7a687de842c8b70f2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-number/LICENSE
+sha256 0ead7e8cd8b0bc66a981ee69acaf1297ffa838cfce1b156a039bb24f997c0a27  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/isobject/LICENSE
+sha256 4cd903859549d4b20b571041f96dfae1136ed079c476126268f9d7cc1b611150  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-plain-object/LICENSE
+sha256 44191656d296391e0ec97e32f5385f0d02b6f2992694082d22ea04ba0f66f9e4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-promise/LICENSE
+sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-regex/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-stream/license
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-symbol/LICENSE
+sha256 b661867c1d66a1b71ee3a6109159874334cd5c182a80d1bcc7353b5a4c6823c6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-api/LICENSE
+sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-coverage/LICENSE
+sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-hook/LICENSE
+sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-instrument/node_modules/semver/LICENSE
+sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-report/node_modules/supports-color/license
+sha256 b661867c1d66a1b71ee3a6109159874334cd5c182a80d1bcc7353b5a4c6823c6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-lib-source-maps/LICENSE
+sha256 d38a14ec66572a5588bba501f05eef0874e3ce929f0ddcb749c7557f4fdcb905  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/LICENSE
+sha256 4d3083ec594b158fd6adfdc6c9423ffe0746d2d93cebfb98f1a35b69da78051e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/async/LICENSE
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.BSD
+sha256 c9d85a24226fa4dd8c0756961de362cee34f6e9b1d19938bd480239950ad9a93  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/escodegen/LICENSE.source-map
+sha256 4193a099a2c3ba864dd6b94f37e2fd80757d50796999d65adbca6a8c0f3a8e0a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/esprima/LICENSE.BSD
+sha256 0e74697a68cebdcd61502c30fe80ab7f9e341d995dcd452023654d57133534b1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/estraverse/LICENSE.BSD
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/glob/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/has-flag/license
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/source-map/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul/node_modules/supports-color/license
+sha256 e09f9b52c6ce5c17ba8103cd0cbf446c33b5448b0c1d01d711b36a1f15a501ba  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/istanbul-reports/LICENSE
+sha256 f481fe414a74f72c6b37890ad65e1d0b7c3f51be175b6d3e992fdcdb66882bd4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/is-utf8/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/jsesc/LICENSE-MIT.txt
+sha256 a9801fb52ba22ef808682a094da8a7a480584b7ed0dfd0d888ab543616335031  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/jsonfile/LICENSE
+sha256 6cf2891dd0e66460f7d2ed83e1e3fe4b4b4c1a8c1f1f96c222a3466ad12ff197  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-parse-better-errors/LICENSE.md
+sha256 7bf9b2de73a6b356761c948d0e9eeb4be6c1270bd04c79cd489c1e400ffdfc1a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-schema-traverse/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-stable-stringify-without-jsonify/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/json-stringify-safe/LICENSE
+sha256 2213d91c606205c71eb051a199478cdc2adde945893404d7f1421436dd6d5cc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-tokens/LICENSE
+sha256 a07bc24468b9654ce76a547d47a2db282d07733b715db4c73a98bd63961f9550  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-yaml/LICENSE
+sha256 94bcb9959136723aa4fb36e1a6c4d5c662a2369978cfae344dabfb83ae619e79  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/js-yaml/node_modules/esprima/LICENSE.BSD
+sha256 e3d4ed2aa50e7583730b1531034331ba9093c8bef7414234c7c9306db3858913  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-chai/LICENSE
+sha256 296b9a3c5e4eb7b79a6f1dca9a27ee31e48fe5c9d48a32ec31ac924b65ff287c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-chrome-launcher/LICENSE
+sha256 be13520ed43fa818f7bbe9d3a2beccaf1931421d818d35b42bdae3c127241ed3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage-istanbul-instrumenter/LICENSE
+sha256 55c6f6d52a0b60393333dd4e9d385957c7e784517daa9cfbf5b09ec812811eec  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage-istanbul-reporter/LICENSE
+sha256 296b9a3c5e4eb7b79a6f1dca9a27ee31e48fe5c9d48a32ec31ac924b65ff287c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/LICENSE
+sha256 d38a14ec66572a5588bba501f05eef0874e3ce929f0ddcb749c7557f4fdcb905  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/LICENSE-istanbul
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-coverage/node_modules/source-map/LICENSE
+sha256 6e4e577107740b24ebd73cb813be506861d706129e502ca7160683a5cea4c129  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma/LICENSE
+sha256 296b9a3c5e4eb7b79a6f1dca9a27ee31e48fe5c9d48a32ec31ac924b65ff287c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-mocha/node_modules/minimist/LICENSE
+sha256 3c50a3d2df1468f5e7b723d4c931c1c7ba6775740aa1ef9fa49586ddb7b168fd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/LICENSE
+sha256 7cdb44aabddbdd78998119d68a39c87424119b663945c79891fc1b022301824c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/acorn/LICENSE
+sha256 d9fed24f132985934fca621c4dc1dfb53e03377a24d0568d424383d7eaa9c0ac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/async/LICENSE
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/source-map/LICENSE
+sha256 162413c61e0982abe89a06bf7a02ec760dc49a7364d838bd9f01daebb5b95954  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/karma-typescript/node_modules/tmp/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lcid/license
+sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/levn/LICENSE
+sha256 150d7707d4532d57bdb5718637ff62fff1f075921c5ffaa084df27f900bfea76  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/bin/license-checker
+sha256 455629980585dfdadbdcbaf846659b65da3dd092ac9bfd10b07717a0e2f84ef5  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/lib/license-files.js
+sha256 37932d5f93a7f9e762346358ae427e703d69fdaae6e7cd67158b35eea91c9eec  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/lib/license.js
+sha256 adeb5a7f7d027ec14c3698be7a0f248978516ab39ccec4fb70689ba4753cdd67  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/node_modules/debug/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/license-checker/node_modules/nopt/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/pify/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/load-json-file/node_modules/strip-bom/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/locate-path/node_modules/path-exists/license
+sha256 f71e8ed126b46346494aad5486874cd8f0aafe95092ed67d2e3cb6110f939abc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash/LICENSE
+sha256 90df9e2220f682e1f77e24b1c0f72d2de18b818096c957a65698e74c41a4826f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lodash.memoize/LICENSE.txt
+sha256 66da8b277e527c270de6abc57727c58032267d161a81dbac02c3eed45fd13366  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log4js/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/log-symbols/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/loud-rejection/license
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/lru-cache/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/make-dir/license
+sha256 3d3fba5375126ff321d3a51938899d744b1189896618e0f2d088d9e1ebf2822a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/map-age-cleaner/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/map-obj/license
+sha256 898f204abbbbde58c6230a31842c59aeb8040fbcffa924db28e6d0b1d7631a3a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/md5.js/LICENSE
+sha256 74d8054d56d522bdaa340d3d71130cb204997d523a5292c85ac1264dd77c8d06  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/media-typer/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mem/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mem/node_modules/mimic-fn/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/meow/license
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/meow/node_modules/minimist/LICENSE
+sha256 965ef284f7f4c176842ec2e87fa13e79feed777d56d7a21a5a3b38f1bb6dc288  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-db/LICENSE
+sha256 8f2658c03422c408b2b2ce4d151decc3b1a6fd3d86e5ca9433777bccdcdf75a2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime/LICENSE
+sha256 71f83c4c0621102a56d9853812777b85751bce7e9726f686f5b056c1f8a4b0e6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mime-types/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mimic-fn/LICENSE
+sha256 136fee1129ea96ce18b41c26a72f5d4ba196ee41bfd73b55d0b8509cdda148e9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimalistic-assert/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimatch/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/minimist/LICENSE
+sha256 05991c2e8f070b69ec5b656c2c12fd07cd0153dd157d39b050b82af59b319a01  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mkdirp/LICENSE
+sha256 bd5663836feb58ffb7d0e6b9e62010f4c3399f2bb0a4cf6514a15d597bbdd577  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/LICENSE
+sha256 94e1923e52409cfd50e97988d9772c0de15f65700097e3227fec367a39e82b94  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/ansi-colors/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/debug/LICENSE
+sha256 152f0fb43e953fcf5c56c5bfa4c834bb96b1603e4026319c613dd3e734f305cf  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/diff/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/find-up/license
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/glob/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/ms/license.md
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mocha/node_modules/supports-color/license
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ms/license.md
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/mute-stream/LICENSE
+sha256 553d4d20029a24e315b428a1a54a9e109eaa340f2e958a4f50a92362c2c4070b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/negotiator/LICENSE
+sha256 811238ba7d85f6fe6b820703a32f92705bcf77bc352ddc3476783491c64a129a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/neo-async/LICENSE
+sha256 bd220c219b05e6c22b7c23613ca926f60932d07c9fe141dd6e04b80dbc4b4e52  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/nice-try/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/nopt/LICENSE
+sha256 d16b2b8c511d9f2bef8bbf49f0e2a94f032b6b8d181f71c83912c34c116a02e1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-package-data/LICENSE
+sha256 60acd7711e6c138e6041836e32d922705254cc1568a30fdf16aa8f59bb87aeaa  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-package-data/node_modules/resolve/LICENSE
+sha256 e70ff771504ba41f2be55de812a017ff46433d7a250c862e38fc419159e44500  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/normalize-path/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/npm-run-path/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/number-is-nan/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-assign/license
+sha256 a596744eec6b05682ed972bf93937668bbc8da2caed93fbf6510389de019b5c0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.assign/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.entries/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object.getownpropertydescriptors/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-inspect/LICENSE
+sha256 dc0fe5a22d9336f345ee984f9bf56f11f22877a3aa5fd16a1db9a8ca0e23a5d1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-is/LICENSE
+sha256 5640e5cbe2e9f57f6ccfdd8dbfbeadb875495bdbcb69d2666ce3177ccd0942e4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/object-keys/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/once/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/onetime/LICENSE
+sha256 8089bcc08845ec143e5761f4a101a65b8c792a0dedbfeeb90a15560c0b77f768  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/on-finished/LICENSE
+sha256 05991c2e8f070b69ec5b656c2c12fd07cd0153dd157d39b050b82af59b319a01  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optimist/node_modules/wordwrap/LICENSE
+sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/optionator/LICENSE
+sha256 d25d1d6d28c35cb6f358e2833e405c4e53fec2fa24d156323ddea5cd438d3407  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-browserify/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/osenv/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-homedir/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-locale/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/os-tmpdir/LICENSE
+sha256 a6859a1cdfa7b6ebcdd52505c41bb72e747675b3e7fe0b908c0ac09280f0ba93  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pad/LICENSE
+sha256 a04665b3b2de56c66730c1f720f528175739e4104f79073614aa611da1e85539  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pako/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parent-module/license
+sha256 bc5ed4eed738303bf403ec3b7e0a8e76760ef60664ad050a0ff61db23da77e66  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parse-asn1/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parse-json/license
+sha256 a41d7b212c43bf90af534ec5d73d24a65e3a8cf17941b6d10e9398346a179698  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseqs/LICENSE
+sha256 15c35ddf8c82a5fc84e3801db12e279b744605d6ad810e1b52ad09832fc71806  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseuri/LICENSE
+sha256 11d017c3b9f1ee3f44caf7203035f0461d5b57e0db8ce1bc03a9af34fa7d3f6b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/parseurl/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-browserify/LICENSE
+sha256 9c791b69df62b2264d0a846786f82b00bd6943200a0b10eba66a1ba7a7785fc8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-dirname/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-exists/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-is-absolute/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-key/license
+sha256 3f4609137f65070541b9214300ea0d640af8192857de0eeb2b03403003d9228a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-parse/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/path-type/node_modules/pify/license
+sha256 5d45910e7ed82fecc3e29b40a5b3a17ceb609fda19f860aa2ec180d87f4f9d4a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pathval/LICENSE
+sha256 a9667a8bf55e7f20cf894cb47774f94ebd4eb366408aafb980f1f6547bcdc10a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pbkdf2/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-defer/license
+sha256 7e64acffcb0d20d33f5a86949ffd4a99ae045b10c7332a9c3a58635876c16880  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pend/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-finally/license
+sha256 d0cd141b0c322fded5dfad1d4645bb2fedfc05b7321fe1009469638190d59ef9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/picomatch/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pify/license
+sha256 6ee0feb1f6ef996ff5a68600f8cf98909cf412d39ef3cdceaefd87d636fa1b7f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pinkie/license
+sha256 6ee0feb1f6ef996ff5a68600f8cf98909cf412d39ef3cdceaefd87d636fa1b7f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pinkie-promise/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-is-promise/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-limit/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-locate/license
+sha256 f476f01d5da0d8124355eeb79b42b95d2ad2a88d229dbe02b815628760a8cb43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/plugin-error/LICENSE
+sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/prelude-ls/LICENSE
+sha256 59a400d04c5078579acc27ddd6452c1bdf763f9506e01364700935fbb1a7c91b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process/LICENSE
+sha256 ecdccbcf39024f624ded480c01c0b25458e1eca8f26ecf040933865ce56d9a4f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/process-nextick-args/license.md
+sha256 d7d2a7786de7c7cfd96f920c6f12927d74e1d2a861ca4498bf465c3bc3f4c21c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/progress/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pseudomap/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/p-try/license
+sha256 db6109f994692150ed82cd904bb053c73b97b23678bf52047f747bfec11e1934  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/public-encrypt/LICENSE
+sha256 3fe8d55a98dbf260eace67c00cf9bc53edb46234e840098a0b93df3096b97fb6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/pump/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/punycode/LICENSE-MIT.txt
+sha256 a1e4522979cd422b42d0b464072eb7d0d218651659f56bf09f8c147384e3f105  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/LICENSE
+sha256 3de284c8e6fa7e8437eff6f53695471e0332129a5b42a79361e17b7637de94b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/puppeteer/node_modules/ws/LICENSE
+sha256 d2f9d2835eb09ccf673e118e4fdc372075437c1787e66c2202912fbe3e5ee9e1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/qs/LICENSE
+sha256 cb72d9714ddc21e758d63f423be0caddf909d23ccbb10a2f5201a870818e4f57  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring-es3/License.md
+sha256 cb72d9714ddc21e758d63f423be0caddf909d23ccbb10a2f5201a870818e4f57  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/querystring/License.md
+sha256 ddc0dd5947bd2966b9a4cfde098566b011de0acfbe7814536955636ce9e3eced  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randombytes/LICENSE
+sha256 ddc0dd5947bd2966b9a4cfde098566b011de0acfbe7814536955636ce9e3eced  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/randomfill/LICENSE
+sha256 f655e6291356ec0de7a8f0e69f294961a2cea86678ec94588be1e6a492e278ab  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/range-parser/LICENSE
+sha256 c8e6bca7230689d536a3bd7158f66e9c4f89f95d0748743a0370ac229e9023ad  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/raw-body/LICENSE
+sha256 ec62dc96da0099b87f4511736c87309335527fb7031639493e06c95728dc8c54  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readable-stream/LICENSE
+sha256 dffec71d93f273d2af7b54c6c7e7e70b3289c632ec0d7253210ec21ac336d5ac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readdirp/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/readdir-scoped-modules/LICENSE
+sha256 5ffe28e7ade7d8f10d85d5337a73fd793dac5c462fb9a28fbf8c5046c7fbca3b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-installed/LICENSE
+sha256 69be713b3d6c33e0dba76c4d23d986d568593abca04ce47d75162af255d6a345  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-package-json/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/read-pkg-up/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/redent/license
+sha256 fcf6eabf68ca96988a6b506b4fdc6cc32535d80eb2e11c79724af5ac6f50262b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/regexpp/LICENSE
+sha256 aac9937f6a8dbc3328d2b90ab19691333ec4931634ea808673c897e623a9efc1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/remap-istanbul/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/repeating/license
+sha256 a92e52eb1fa7cd746e3827bf01d3a3589bbc8e1e51348b1da042aad165525ad1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-directory/LICENSE
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/require-main-filename/LICENSE.txt
+sha256 3b2a6a268aa815dec121d614245e03b5c68db1f044d5b525e36db7d5dc7fb9c3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/requires-port/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve-from/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/resolve/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/restore-cursor/LICENSE
+sha256 1ce941682a96c7b898ecd125d0f2e22319758ea6f3adbf498a65d649b0f3f7dd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rfdc/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rimraf/LICENSE
+sha256 4847d2fd9ed54cc006dd79f5a14fa5dd35eb8274dca511418166e195e277c05b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ripemd160/LICENSE
+sha256 cc9426fe569f331f48fd3134b3a03b5bbe3fc7bd25d604be0006bd55a6134cf5  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rollup/LICENSE.md
+sha256 e5c1364118b39fa98b959138ce4aa4d0e68cfbee12d115e69730579fecb1dc1b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/run-async/LICENSE
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/_esm2015/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/_esm5/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/LICENSE.txt
+sha256 81c407ac717813b0e3795402960e04003c7bba8ba59b621624707028531c9ade  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/rxjs/src/LICENSE.txt
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/safe-buffer/LICENSE
+sha256 4bc935e71be198c67ddf3c2b5fddb195f6edc182bfc155a96a6db61b44b494b9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/safer-buffer/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/semver/LICENSE
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/set-blocking/LICENSE.txt
+sha256 c4b4ad3a5746f1f5249a6dd90396ec519264e1bb02e01e48a6522c48a3a97cb4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setimmediate/LICENSE.txt
+sha256 76d6d1ea0c268da37dd3c961b4fcfb23dee8417fff9e8786d4d44c585b781b69  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/setprototypeof/LICENSE
+sha256 58dcf38be1438f739412b87eb70d64bf00e9976d529bb119f700d8b3167924f0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sha.js/LICENSE
+sha256 e6fdf7ac2af533b4436d99aa75df32aa78690510f7d68a3e73e8576967298d2f  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-command/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/shebang-regex/LICENSE
+sha256 e05b1eaf5b5f99b7ad75cd1f38858ff9a311780b97715ead67936d60bf96aa7e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/signal-exit/LICENSE.txt
+sha256 3dc3b3d3a284d871f7f307655c90fb101d73abbf87bbddeefd2f67883353bdbc  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slice-ansi/LICENSE
+sha256 05dc4d785ac3a488676d3ed10e901b75ad89dafcc63f8e66610fd4a39cc5c7e8  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/slide/LICENSE
+sha256 56b7b228fde8d638cc7f1c3d0022cf111764083ac4f803b7a50a90388dce3788  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-adapter/LICENSE
+sha256 62e2032a1e1458b1d92a62f5fc51be48e08b95062295c91a9f3bd3686809d37e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-client/node_modules/ms/license.md
+sha256 c10d192d935165dac336ae245f9eef4c42bb37e7c6f5c5f6f7663db778122df1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io/node_modules/ms/license.md
+sha256 56b7b228fde8d638cc7f1c3d0022cf111764083ac4f803b7a50a90388dce3788  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/node_modules/debug/LICENSE
+sha256 6652830c2607c722b66f1b57de15877ab8fc5dca406cc5b335afeb365d0f32c1  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/socket.io-parser/node_modules/ms/license.md
+sha256 6cb0631f71c7749763fd3dd1d5bee52dd1070ec17f2edc1710079ad070bd2fbd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/source-map/LICENSE
+sha256 c5ca60a739543ef97683dfa0a94773b214c86c826c76a27b8f8e6eb38148cbce  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-compare/LICENSE.md
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-correct/LICENSE
+sha256 7edb57f7065309027de249642341292a5b21410d5773cc55bba73ff9cf01060e  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-expression-parse/LICENSE
+sha256 c5ca60a739543ef97683dfa0a94773b214c86c826c76a27b8f8e6eb38148cbce  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-ranges/LICENSE.md
+sha256 a21ab121cef9bed38553faad40e49b27ae3d2578d07a70956664e681021c9875  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/spdx-satisfies/LICENSE
+sha256 a4cdda44b5adea4731d53dcae78fb5124f8fd853e994f01e25d8c33a7daf818b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/sprintf-js/LICENSE
+sha256 512cfa4d5e7a7569c7ae4dd95241cb6ae2aaf648ef9ebd080c01bd24868d26e9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/statuses/LICENSE
+sha256 ff151c00207c908581639851dd8504ce4255be0650b2b236edec2aa90342b0cd  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/LICENSE
+sha256 ec62dc96da0099b87f4511736c87309335527fb7031639493e06c95728dc8c54  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/readable-stream/LICENSE
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/safe-buffer/LICENSE
+sha256 11f2aafb37d06b3ee5bdaf06e9811141d0da05263c316f3d627f45c20d43261b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-browserify/node_modules/string_decoder/LICENSE
+sha256 a0e6357a5e8ea65827addeb383e0948a1874d2f46bc7feaf6349b7a376ed6e98  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/stream-http/LICENSE
+sha256 9660914267128b5f96a102bd7f6268c249110a39cb7c4bb7f536d856445d739c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/streamroller/LICENSE
+sha256 98c970de440dcfc77471610aec2377c9d9b0db2b3be6d1add524a586e1d7f422  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/streamroller/node_modules/debug/LICENSE
+sha256 11f2aafb37d06b3ee5bdaf06e9811141d0da05263c316f3d627f45c20d43261b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string_decoder/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimleft/LICENSE
+sha256 c61652db3d2808f667b48af0a358f0d85fd07ad4a0d0b1a50882dec3b764c522  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string.prototype.trimright/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/string-width/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-ansi/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-bom/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-eof/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-indent/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/strip-json-comments/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/supports-color/LICENSE
+sha256 37b6932865726cf59cbfb8b32a5c9fd82c834c2deba4d53aa4a6b433ae69cdda  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/string-width/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/table/node_modules/strip-ansi/license
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/text-table/LICENSE
+sha256 faae57631e1c7d641c3b6f9b110c2a7a28c8b383d08d7796ac472c509f075850  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through2/LICENSE.md
+sha256 e8734448285a2dd773d40136ed5d5e8163a70701dd540cdc796cfca232f67d55  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through/LICENSE.APACHE2
+sha256 d72dea1a8cdf3f4dfa2f594253d0c5b37baefc76e806f5ecb0e426393edcd505  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/through/LICENSE.MIT
+sha256 d5f14c3258420dfe5a3b641a143d6e6dd90eabb5962244d937e25699c3a45ec9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/timers-browserify/LICENSE.md
+sha256 162413c61e0982abe89a06bf7a02ec760dc49a7364d838bd9f01daebb5b95954  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tmp/LICENSE
+sha256 61b82d27e63b14eabc706960aabf6caa1b27d044eb00d7908f92e68085301c3a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/to-fast-properties/license
+sha256 a832d679750e49ab433626ab196350b89964b60eb0d3edd3341887c7d5f4c128  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/toidentifier/LICENSE
+sha256 e7d1fee7347ffddccc5fd03327ffdb50f8c112be0d5016d62388a92c4ae6e7a9  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/to-regex-range/LICENSE
+sha256 83927d1555a8e1d5ed9896991fbb2b4cdfb64f45f5e12b7446c3bff5cea538d3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/treeify/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/trim-newlines/license
+sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tslib/LICENSE.txt
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/tty-browserify/LICENSE
+sha256 b9eb082c39fe245e38793699074c394c43a722c51fce031c3c165cb92a31035c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-check/LICENSE
+sha256 26181ebee1063f3dc6766a3b6d05999a0da058f172eadf2ca5d15105ffd9735a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typedarray/LICENSE
+sha256 e5aee0714b6ecc416454b968d1017570ef609f20d8722ab84b07acd550b78198  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-detect/LICENSE
+sha256 23d466b1b134b415b66fa50c6526b4cf3e7b9258554da88d3abb371721e7ce68  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/type-is/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/chai/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/color-name/LICENSE
+sha256 a5e9f9b1575301c7a7a03508fdaa2e05a918cc17fd21c6e898096a96d6a34f61  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/typescript/LICENSE.txt
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/estree/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/mocha/LICENSE
+sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/@types/node/LICENSE
+sha256 b00ae96f0815ae8fa49c09044467306e98cd89d6770c535fb596ccbd350c6ab4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/uglify-js/LICENSE
+sha256 3b2a6a268aa815dec121d614245e03b5c68db1f044d5b525e36db7d5dc7fb9c3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ultron/LICENSE
+sha256 3fda5977c0904e226190b4e21d64340c1731e2142d6fe5f3dee0090a216b8b63  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/universalify/LICENSE
+sha256 1a526fbe8d8577f5a4b1c2821842b55b7c0e18862531c62ae4ce69c9b19b74b6  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/unpipe/LICENSE
+sha256 97f780d3c79a42236f2b3435860f284c0ac6b958622f6bc9f1ac43fd49689b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/url/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/url/node_modules/punycode/LICENSE-MIT.txt
+sha256 1da14af109d9baaa8dee3094add5cc65a7772487dd94c8d2adfd36935b678c49  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/useragent/LICENSE
+sha256 0154425673db15cdfa80ecba2c9b1f1a867f7197a006764712849bfc3a93cbb7  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util-deprecate/LICENSE
+sha256 6239c6144c31e58cf925c34483606969c555574d64ffa96518ab5d7f45c75d43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util-extend/LICENSE
+sha256 6239c6144c31e58cf925c34483606969c555574d64ffa96518ab5d7f45c75d43  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/util/LICENSE
+sha256 6e7d699cdd1e4fa837ba7718ea49841aa67201b449ea8b3f9cf274be15974a64  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/utils-merge/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/validate-npm-package-license/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/vm-browserify/LICENSE
+sha256 405a272eaef556691ad7dda96db3237c9544afe18725842a1a5b3ec308960222  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/void-elements/LICENSE
+sha256 6294da0e0a201bbe1de254445c9d07133a9448af05e4e44d0a2364747d114368  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wcwidth/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/which/LICENSE
+sha256 852bf81203aa93aa89afc9f881ebb035322dc7334aaceff435c557634c94a815  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/which-module/LICENSE
+sha256 0cef05dfff8b6aa7f35596984f5709f0d17c2582924a751efa471a76de7cdc11  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wide-align/LICENSE
+sha256 435a6722c786b0a56fbe7387028f1d9d3f3a2d0fb615bb8fee118727c3f59b7b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wordwrap/LICENSE
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/ansi-regex/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/is-fullwidth-code-point/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/string-width/license
+sha256 6fb9754611c20f6649f68805e8c990e83261f29316e29de9e6cedae607b8634c  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrap-ansi/node_modules/strip-ansi/license
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/wrappy/LICENSE
+sha256 0ead7e8cd8b0bc66a981ee69acaf1297ffa838cfce1b156a039bb24f997c0a27  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/write/LICENSE
+sha256 3de284c8e6fa7e8437eff6f53695471e0332129a5b42a79361e17b7637de94b3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ws/LICENSE
+sha256 c7cc929b57080f4b9d0c6cf57669f0463fc5b39906344dfc8d3bc43426b30eac  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/ws/node_modules/safe-buffer/LICENSE
+sha256 a5f35901ee8b2039a7431144c23dd10bd47c1d07bcee0cd3a536421d86412214  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/xmlhttprequest-ssl/LICENSE
+sha256 82e67379203d5794e7c44549847d8d64ae6904591381682360470898bd306821  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/xtend/LICENSE
+sha256 2034cce3b6fafcddd642c4175e01d3ddfc332a53b9f20fdc46b1466dc89ac469  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/y18n/LICENSE
+sha256 4ec3d4c66cd87f5c8d8ad911b10f99bf27cb00cdfcff82621956e379186b016b  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yallist/LICENSE
+sha256 fe71524a15f30aab0f39af7165d38fc64a4269b7d2a0caffebc907355aec9c92  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/ansi-regex/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/ansi-styles/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/camelcase/license
+sha256 2dc0465729366c3a7890dfa9e972a1ba7048a26c02116fb8b419a6a1ac110149  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/cliui/LICENSE.txt
+sha256 693866fc419c6f61c8570438ec00659d156ec2b4d4a4d04091711f5f11a365d4  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/color-convert/LICENSE
+sha256 7357445bac398c76c0aef75a587009fe406d40de6a79789eb5b7ecbbad317ef2  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/color-name/LICENSE
+sha256 483acb265f182907d1caf6cff9c16c96f31325ed23792832cc5d8b12d5f88c8a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/emoji-regex/LICENSE-MIT.txt
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/find-up/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/is-fullwidth-code-point/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/locate-path/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/path-exists/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/p-locate/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/string-width/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/strip-ansi/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/wrap-ansi/license
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs/node_modules/yargs-parser/LICENSE.txt
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-parser/LICENSE.txt
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-parser/node_modules/camelcase/license
+sha256 30877d17f7e38530d46b49fb375ee98ce2e8b085b3ee72d4c2888710416ef139  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/LICENSE
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/camelcase/license
+sha256 48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/find-up/license
+sha256 902dbb4154679fb2b8d7c33878183f45b268d01eae5e5033dddaa8852d45f213  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/get-caller-file/LICENSE.md
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/require-main-filename/LICENSE.txt
+sha256 fe71524a15f30aab0f39af7165d38fc64a4269b7d2a0caffebc907355aec9c92  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/yargs/LICENSE
+sha256 365496ca1f56da40b23c9815fc40fa9005847b2f8f8fd1c1a4929ef25ec8cd1d  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yargs-unparser/node_modules/yargs-parser/LICENSE.txt
+sha256 b303783d5eb7ca50b853ffa5f145e4e7998fab339831d848f507ca6cd970577a  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yauzl/LICENSE
+sha256 3b2a6a268aa815dec121d614245e03b5c68db1f044d5b525e36db7d5dc7fb9c3  src/3rdparty/chromium/third_party/devtools-frontend/src/node_modules/yeast/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/devtools-frontend/src/scripts/closure/COPYING
+sha256 af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/axe-core/LICENSE
+sha256 a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  src/3rdparty/chromium/third_party/devtools-frontend/src/third_party/pyjson5/src/LICENSE
 sha256 4f5753ce8acf3feafc758599058746d30bda07bc0d4cc3a6a1eb8e039fdba1dc  src/3rdparty/chromium/third_party/dom_distiller_js/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/emoji-segmenter/src/LICENSE
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/errorprone/LICENSE
 sha256 9021fdb5341ebbb2eb5c771ac5cfac527790673179d3b21a42de1ab2798ec30f  src/3rdparty/chromium/third_party/espresso/LICENSE
-sha256 46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76  src/3rdparty/chromium/third_party/expat/files/COPYING
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/feed/LICENSE
+sha256 46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76  src/3rdparty/chromium/third_party/expat/src/expat/COPYING
 sha256 d9c904abd0ead61b3fbaef0a609285548076ff9c3f814cc1cf019c5d7150736d  src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/full_lgpl.txt
 sha256 a8579e3fc40c11ab147bc299257733eb749cd455010385f7c117f70d7aef24e4  src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/jpeg.txt
 sha256 857d5f537af3aa164e7a27eda60147d34195e5781abe7b1d358d9fb01e222ae0  src/3rdparty/chromium/third_party/ffmpeg/chromium/scripts/license_texts/mips.txt
@@ -262,15 +710,14 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rd
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/ffmpeg/COPYING.GPLv3
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv2.1
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  src/3rdparty/chromium/third_party/ffmpeg/COPYING.LGPLv3
-sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
+sha256 076cab8e06ec34890bac1747d2ab00de603a4892d30ae6c2d99e50f7c2400825  src/3rdparty/chromium/third_party/ffmpeg/LICENSE.md
 sha256 f45cc81b400a048b56c9edbd4c3317f7a8958463dfd55aa96f268ecfd6baa12c  src/3rdparty/chromium/third_party/flac/COPYING.FDL
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  src/3rdparty/chromium/third_party/flac/COPYING.GPL
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  src/3rdparty/chromium/third_party/flac/COPYING.LGPL
 sha256 946b733afbaa20a192c8dc022b4e43090e78f28fd293494d1b307f7301552c9b  src/3rdparty/chromium/third_party/flac/COPYING.Xiph
 sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/flatbuffers/LICENSE
 sha256 3112ebbfc0fe10ad40a97672f5590c4292536a28cbfe3506820b15dec70b2258  src/3rdparty/chromium/third_party/flatbuffers/src/dart/LICENSE
-sha256 7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3  src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt
-sha256 e09d954054165670b6a669e6da59673d9e85f343b9983e92a220623ff0198f8c  src/3rdparty/chromium/third_party/flot/LICENSE.txt
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/flatbuffers/src/LICENSE.txt
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/LICENSE
 sha256 fa4cd9ab005185e10cd8f7504518856c7dd36c01e766c2bac87f4fc638e9f886  src/3rdparty/chromium/third_party/fontconfig/src/COPYING
 sha256 fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  src/3rdparty/chromium/third_party/freetype/src/docs/LICENSE.TXT
@@ -325,6 +772,8 @@ sha256 ff6c857ce2708e87701323078aef115c1872a1f80a9649f86dc899b48083bc60  src/3rd
 sha256 719d8fa235f2068e0ae6d6a7dceb0a7720d7840f0f0ebed29957989e6ded3cd8  src/3rdparty/chromium/third_party/libaom/source/libaom/third_party/x86inc/LICENSE
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  src/3rdparty/chromium/third_party/libcxx-pretty-printers/LICENSE
 sha256 fb3ab1e1621c6c469499a6ba1e926c027f32af3063c0456282f89382591cc46a  src/3rdparty/chromium/third_party/libevdev/LICENSE
+sha256 d56bafdaeaa793331a29e9766b7efe66524c98533da798a57201e291863ef625  src/3rdparty/chromium/third_party/libgifcodec/LICENSE.md
+sha256 37d8bfba91b745693ea58f846f2f1276229745adf532974b73c1911cfd144241  src/3rdparty/chromium/third_party/libipp/LICENSE
 sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/3rdparty/chromium/third_party/libjingle_xmpp/LICENSE
 sha256 19af539b1ec692ea9ccf71b6ea97d602bcf7187eab27b0ea806aea1cd10b0b13  src/3rdparty/chromium/third_party/libjpeg/LICENSE
 sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  src/3rdparty/chromium/third_party/libjpeg_turbo/LICENSE.md
@@ -351,9 +800,10 @@ sha256 7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  src/3rd
 sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  src/3rdparty/chromium/third_party/libyuv/LICENSE
 sha256 0d4077a7055ead389c4c5a9a6ac4bb8b784fc6e9e37be2caf544fcceed26cb16  src/3rdparty/chromium/third_party/lottie/LICENSE
 sha256 6e3e0a978f1e136cb3efb89702f4314671581a0c70c9a52447669e00f7b129e8  src/3rdparty/chromium/third_party/lzma_sdk/LICENSE
+sha256 c3b124673c93872156757a934c75b498d68eec09510e25e549d9dc2013776499  src/3rdparty/chromium/third_party/mako/LICENSE
 sha256 0bbe88228fd63d20ec097f64e58d5a0a465123ae139140a18d406c60b48824b5  src/3rdparty/chromium/third_party/markupsafe/LICENSE
 sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/material_design_icons/LICENSE
-sha256 c93465d6a75e6ade8785edb4ec125ece083ab0910ed0417b4ff346792ba0f851  src/3rdparty/chromium/third_party/mesa_headers/LICENSE
+sha256 536284e40c611f371f6ce5d74efac37a20d993cd3af96259b9b9e20b1669ff1e  src/3rdparty/chromium/third_party/mesa_headers/LICENSE
 sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  src/3rdparty/chromium/third_party/metrics_proto/LICENSE
 sha256 27ebda9d51f0a56b7e281ccd8230a27236dcb51c05f64b07869ecf6e965d68b0  src/3rdparty/chromium/third_party/microsoft_webauthn/LICENSE
 sha256 83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  src/3rdparty/chromium/third_party/minigbm/LICENSE
@@ -369,7 +819,6 @@ sha256 1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  src/3rd
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/netty4/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/netty-tcnative/LICENSE
 sha256 0cd1bd4b934ffdc5e7f1bcfa9d08bd17295e5414bdca99c06b1036278b01f0b1  src/3rdparty/chromium/third_party/node/LICENSE
-sha256 d41b608410d0f07157353639f967a561202236e6303f45c98aec47934b924700  src/3rdparty/chromium/third_party/nvml/LICENSE
 sha256 b5730da9a26472a405b0b1c61d3d166714d9d654ab3282e54e4a01a5f66316c3  src/3rdparty/chromium/third_party/objenesis/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/ocmock/License.txt
 sha256 8bed129a6a15e631c93a624985e631eb62a55f7e072b78f4e1c3dde7c745283d  src/3rdparty/chromium/third_party/one_euro_filter/LICENSE
@@ -380,10 +829,11 @@ sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  src/3rd
 sha256 7efb4989e0cd1b256229bdf2f09300c5d14e35db0e7476bfb87fac243498273d  src/3rdparty/chromium/third_party/opus/src/LICENSE_PLEASE_READ.txt
 sha256 0d74de3c3cd3196a9ed1bc612cfd5f81d7509d66c4be34a50f99d61bd1ad00d4  src/3rdparty/chromium/third_party/ots/LICENSE
 sha256 9dd8d2fb95ba862a5d166a167682c1c67a209acd3bf09b6fd03f76d3579729bc  src/3rdparty/chromium/third_party/ow2_asm/LICENSE
-sha256 b578cdd2345840ada550bd12519533812320d5f1d21cf4c1c7e1b1b0a31c98b7  src/3rdparty/chromium/third_party/pdfium/LICENSE
+sha256 76621fcfb65adfd6602b700708b74c8e20f3325b32f1a54bec83a5cf7c679f53  src/3rdparty/chromium/third_party/pdfium/LICENSE
 sha256 32759d1397d8f7b9e15ece146e4038b22b90e93b4935b5a840bcef4d2ba5ea55  src/3rdparty/chromium/third_party/pdfium/third_party/bigint/LICENSE
 sha256 bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  src/3rdparty/chromium/third_party/pdfium/third_party/libpng16/LICENSE
 sha256 c5b14f5a3814d2e57b9bb9520dcf57a2c3817b65c4f989e5c82e332c82af1038  src/3rdparty/chromium/third_party/pdfium/third_party/pymock/LICENSE.txt
+sha256 e323929b7c2178e2efc9ac70e62166670274bd772f90a8d83a90300c5f60002c  src/3rdparty/chromium/third_party/perfetto/LICENSE
 sha256 9f98bab33648b77578d85ac0f1d1c3941a72aa6d7e65015ba181f2fe804bb85d  src/3rdparty/chromium/third_party/pexpect/LICENSE
 sha256 a46200592eb193853527250da098e6bb0c75424e7a2c7db8da526c4f301c3d88  src/3rdparty/chromium/third_party/pffft/LICENSE
 sha256 dd4930c619afd8527591353c7d3d1c1d7f4bf62ed1cb411f4f507dbdee7738a2  src/3rdparty/chromium/third_party/ply/LICENSE
@@ -392,6 +842,9 @@ sha256 24699c6858472311aa9acc6c2b7112ff9de6e7792569158ba9e439deb0529ef6  src/3rd
 sha256 a5adc2955c0dd848c97aa6afb14e0047a610f0fcfa6ce0011efad01a0e051406  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt
 sha256 984fb04a16a9f1e0145ffd891125dc366a01cd921f58c9b0369be400c720790d  src/3rdparty/chromium/third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt
 sha256 a5adc2955c0dd848c97aa6afb14e0047a610f0fcfa6ce0011efad01a0e051406  src/3rdparty/chromium/third_party/polymer/v3_0/components-chromium/polymer/LICENSE.txt
+sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/private-join-and-compute/src/crypto/LICENSE
+sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/private-join-and-compute/src/LICENSE
+sha256 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  src/3rdparty/chromium/third_party/private-join-and-compute/src/util/LICENSE
 sha256 294f58267c6f473c4ce7270bf5c8d34b2003cb43804552459654c36553431276  src/3rdparty/chromium/third_party/proguard/LICENSE
 sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  src/3rdparty/chromium/third_party/protobuf/LICENSE
 sha256 2ab28b982a7f3150e1597befaa87e1636b9973c80aef3752597945d270c4c4e4  src/3rdparty/chromium/third_party/pycoverage/LICENSE
@@ -426,29 +879,29 @@ sha256 33c9a2fe619e1200937629f318895898ffcd1bf7d0ddd39adc382c030925e61e  src/3rd
 sha256 b25948e48c44312d04ffc626a9d52cae7c04539a1a8e0c1be47b7bfa0da03e1d  src/3rdparty/chromium/third_party/sinonjs/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/skcms/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/include/third_party/vulkan/LICENSE
-sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/LICENSE
+sha256 5f787c1dee3c56547f09ccc2906ab5f5293c4d8dd6c8654e573216c38e908dbd  src/3rdparty/chromium/third_party/skia/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/canvaskit/canvaskit/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-asmjs/LICENSE
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/modules/pathkit/npm-wasm/LICENSE
 sha256 5366e97b4478f15a1e2fd7e6094337426597df28de50cd9fed3f2e7e87f1229e  src/3rdparty/chromium/third_party/skia/third_party/etc1/LICENSE
-sha256 3e3a91ec5c3fa243ad1f5a25cedee0abafd9824d061378cd3c81c541b044bf09  src/3rdparty/chromium/third_party/skia/third_party/gif/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/third_party/skcms/LICENSE
 sha256 e21477eed484b07902a861a1b18d1e4ecd3e6f22fa81e2410f0770cfb67290e8  src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt
 sha256 d27678cba0d529e77201e2d2a053628143e986aad8f1e77f7039ad4366c8f978  src/3rdparty/chromium/third_party/skia/third_party/vulkanmemoryallocator/LICENSE
 sha256 e59bb5c5c6ba426a9ac4ba9fe667ad14c5166b12aa25be8af1d122b14fbe2e36  src/3rdparty/chromium/third_party/skia/third_party/wuffs/LICENSE
 sha256 3f6f1b520bc53e878ccbb698ad0bacef3752a5f4e4b50a26552bd70f60b40748  src/3rdparty/chromium/third_party/smhasher/LICENSE
 sha256 55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  src/3rdparty/chromium/third_party/snappy/src/COPYING
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/spirv-cross/spirv-cross/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/spirv-headers/LICENSE
 sha256 9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  src/3rdparty/chromium/third_party/spirv-headers/src/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/src/LICENSE
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/SPIRV-Tools/src/utils/vscode/src/lsp/LICENSE
 sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/sqlite4java/LICENSE
 sha256 06545a6ec25fbbff6c62f205f94a35be49e38f33bea827a8cfb07d7b82e4b083  src/3rdparty/chromium/third_party/sqlite/LICENSE
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  src/3rdparty/chromium/third_party/sqlite/patched/autoconf/tea/license.terms
 sha256 9c6479123f32a1ed50d9a0af203dfe8972e65035b0cdeef436b5f8d0924517fe  src/3rdparty/chromium/third_party/sqlite/patched/LICENSE.md
 sha256 28113a6e9e2fd7584187c738a7c5484452a1c383307a1741bec50a73262fac08  src/3rdparty/chromium/third_party/sudden_motion_sensor/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/swiftshader/LICENSE.txt
-sha256 81ebf38708899097aacaac9723679b3ffa17640c14cd3193c46b75197de18b2c  src/3rdparty/chromium/third_party/tcmalloc/gperftools-2.0/vendor/COPYING
 sha256 ad4672b403488876635d2b455918f74b829d478da868ffc0c621a00fc99195f5  src/3rdparty/chromium/third_party/tcmalloc/LICENSE
 sha256 81ebf38708899097aacaac9723679b3ffa17640c14cd3193c46b75197de18b2c  src/3rdparty/chromium/third_party/tcmalloc/vendor/COPYING
 sha256 d600ff20c150a675461dde76752e35f4cc3be6e7d8e70b8da3e775ea7e5ec4aa  src/3rdparty/chromium/third_party/test_fonts/LICENSE
@@ -486,10 +939,13 @@ sha256 71819b5a0a080b6a3d35b3579817c2c558abcf3c92bb5abc052145a7c106573e  src/3rd
 sha256 eb077b108bac4c81abe7410274af0930456790add09a6fe5316910e2b936c0f9  src/3rdparty/chromium/third_party/webxr_test_pages/webxr-samples/LICENSE.md
 sha256 20de375707692099b3132084695377ce5fec0aec05813dedcce094b8eda44386  src/3rdparty/chromium/third_party/widevine/LICENSE
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/chromium/third_party/woff2/LICENSE
+sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/wuffs/LICENSE
+sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  src/3rdparty/chromium/third_party/wuffs/src/LICENSE
 sha256 b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  src/3rdparty/chromium/third_party/xdg-utils/LICENSE
 sha256 1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  src/3rdparty/chromium/third_party/xstream/LICENSE
 sha256 795f8d76eade6130129b680ac72ea81cb3e143467a65ea1f5f64946151d7fa20  src/3rdparty/chromium/third_party/yasm/source/patched-yasm/COPYING
 sha256 942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  src/3rdparty/chromium/third_party/zlib/LICENSE
+sha256 a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  src/3rdparty/chromium/tools/grit/third_party/six/LICENSE
 sha256 63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  src/3rdparty/chromium/tools/origin_trials/third_party/ed25519/LICENSE
 sha256 f5b244982699ca9fe5cc8fa8a7c08cf5dee5d3a0c8896892899e5df13316e1b7  src/3rdparty/chromium/tools/page_cycler/acid3/LICENSE
 sha256 4fde1ca31ffe4e16a76098f56170166c61a5493d3bafcc6a5903d3cb60aa7560  src/3rdparty/chromium/tools/symsrc/COPYING-pefile
diff --git a/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch b/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch
new file mode 100644
index 0000000000..2d5e8fae9a
--- /dev/null
+++ b/package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch
@@ -0,0 +1,36 @@
+From 452123a4491b26c5b078934477bd5864f1d004e4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 28 May 2020 20:58:26 +0200
+Subject: [PATCH] Fix QPainterPath include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add missing QPainterPath (needed for Qt-5.15.0 compile).
+
+Fixes:
+
+  searchlineedit.cpp:121:18: error: aggregate ?QPainterPath myPath? has incomplete type and cannot be defined
+       QPainterPath myPath;
+                    ^~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/webkitwidgets/browser/searchlineedit.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/webkitwidgets/browser/searchlineedit.cpp b/examples/webkitwidgets/browser/searchlineedit.cpp
+index fbd73cb..7462c82 100644
+--- a/examples/webkitwidgets/browser/searchlineedit.cpp
++++ b/examples/webkitwidgets/browser/searchlineedit.cpp
+@@ -34,6 +34,7 @@
+ #include "searchlineedit.h"
+ 
+ #include <QtGui/QPainter>
++#include <QtGui/QPainterPath>
+ #include <QtGui/QMouseEvent>
+ #include <QtWidgets/QMenu>
+ #include <QtWidgets/QStyle>
+-- 
+2.26.2
+
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 01436708cf..fc92672993 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtwebsockets-everywhere-src-5.14.2.tar.xz.sha256
-sha256  f06e62b18313fe1b40a35566e79645de4a8e7ac9f7717d1d98a06c5b49afca84  qtwebsockets-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebsockets-everywhere-src-5.15.0.tar.xz.sha256
+sha256  87c2f6542778f9b65b3f208740c1d0db643fd0bede21404b9abb265355da5092  qtwebsockets-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 08bcfb04a4..c3f8692632 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtwebview-everywhere-src-5.14.2.tar.xz.sha256
-sha256  c61f9213ee84fd7408898c0194468208ffb51af9d257e87e6b53daf24f65ff4b  qtwebview-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtwebview-everywhere-src-5.15.0.tar.xz.sha256
+sha256  b87ea205ce79c6b438ebe596e91fa80ba11f6aac7e89ffbf52b337d0fc8d6660  qtwebview-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 7723732c78..4d898aaa62 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtx11extras-everywhere-src-5.14.2.tar.xz.sha256
-sha256  be9a84a03a2ee81771215264e5dff7a996d04be6192b8cdaa1d41e319a81545a  qtx11extras-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtx11extras-everywhere-src-5.15.0.tar.xz.sha256
+sha256  c72b6c188284facddcf82835af048240e721dc8d6d9e8a7bd71d76fd876881a1  qtx11extras-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 93c91aa3cd..07104f0ede 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.14/5.14.2/submodules/qtxmlpatterns-everywhere-src-5.14.2.tar.xz.sha256
-sha256  219a876665345e3801baff71f31f30f5495c1cb9ab23fbbd27602632c80fcfb7  qtxmlpatterns-everywhere-src-5.14.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.0/submodules/qtxmlpatterns-everywhere-src-5.15.0.tar.xz.sha256
+sha256  2752cf2aa25ebfda89c3736457e27b3d0c7c7ed290dcfd52c209f9f905998507  qtxmlpatterns-everywhere-src-5.15.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
-- 
2.26.2
