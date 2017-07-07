From: Brent Sink <brents_3@hotmail.com>
Date: Fri, 7 Jul 2017 03:45:27 +0000
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
Message-ID: <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from version 5.9, Qt uses pcre2 instead of pcre.

Hashes of all modules have been updated.

Signed-off-by: Brent Sink <brents_3@hotmail.com>
Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/Config.in                                    | 4 ++--
 package/qt5/qt5.mk                                       | 4 ++--
 package/qt5/qt53d/qt53d.hash                             | 4 ++--
 package/qt5/qt5base/qt5base.hash                         | 4 ++--
 package/qt5/qt5base/qt5base.mk                           | 8 +++++++-
 package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
 package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
 package/qt5/qt5location/qt5location.hash                 | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
 package/qt5/qt5script/qt5script.hash                     | 4 ++--
 package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
 package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
 package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
 package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
 package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
 package/qt5/qt5webkit/qt5webkit.hash                     | 4 ++--
 package/qt5/qt5websockets/qt5websockets.hash             | 5 +++--
 package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
 26 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index a2358a5..a858f73 100644
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
index 5c7af39..5578b7c 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.8
-QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_VERSION_MAJOR = 5.9
+QT5_VERSION = $(QT5_VERSION_MAJOR).1
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
 QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 else
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
index 5fe8bb8..bd8bf47 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -8,7 +8,13 @@ QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
 QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
 
-QT5BASE_DEPENDENCIES = host-pkgconf zlib pcre
+QT5BASE_DEPENDENCIES = host-pkgconf zlib
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5BASE_DEPENDENCIES += pcre
+else
+QT5BASE_DEPENDENCIES += pcre2
+endif
+
 QT5BASE_INSTALL_STAGING = YES
 
 # A few comments:
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
index 80a3103..81f46d0 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtquickcontrols2-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 09dc1710aa4701aebe145829eb99bab94d0870cf578f7dddcec0af92286dfec1 qtquickcontrols2-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtquickcontrols2-opensource-src-5.8.0.tar.xz
-sha256 b099866ec74f13cf0047274c61f0486d1eba27716fa07b69f682c54d3a4ade1b  qtquickcontrols2-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.1/5.9.1/submodules/qtquickcontrols2-opensource-src-5.9.1.tar.xz.mirrorlist
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
index 541d95b..a045d26 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qttools-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 db2bb4318786257a47172c377d9c456d5d5ec760d5d69240a4693dc87989e1b7 qttools-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qttools-opensource-src-5.8.0.tar.xz
-sha256 95ec8e76d393b6ba26ffff5041fce41946d2bf3aec1402c6533e24d9fc269d83  qttools-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5./5.9.1/submodules/qttools-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 c4eb56cf24a75661b8317b566be37396c90357b4f6730ef12b8c97a7079ca0e8 qttools-opensource-src-5.9.1.tar.xz
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
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index e20a66b..6f16e3b 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebengine-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 2f0a1648e1a8b22bad0134f2b37d69d185074393c398c1a3c6a83b910ff39740  qtwebengine-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebengine-opensource-src-5.8.0.tar.xz
-#sha256 223d22f1660811e60677afe0a85f2f385823e25157689561489700c5d1da79be  qtwebengine-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebengine-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 f6a37eeb9188474a16d29ede498fce959396ab80329a0a83eaeb925251686401 qtwebengine-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 4431e2d..993f0d4 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
 # Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebkit-opensource-src-5.8.0.tar.xz
-sha256 79ae8660086bf92ffb0008b17566270e6477c8fa0daf9bb3ac29404fb5911bec  qtwebkit-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index a91e084..18bb7a4 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,6 @@
+
 # Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebsockets-opensource-src-5.6.2.tar.xz.mirrorlist
 sha256 3cd9d4bbff8e6be5e252f00fc9ecb9ac2d8a193020288c7d1e82583daeb5ba35 qtwebsockets-opensource-src-5.6.2.tar.xz
 
-# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebsockets-opensource-src-5.8.0.tar.xz
-sha256 aa110af297d0d3239f346c3ee0cd43621adf463eb62a04941bbfe3fcccb845f5  qtwebsockets-opensource-src-5.8.0.tar.xz
+# Hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebsockets-opensource-src-5.9.1.tar.xz.mirrorlist
+sha256 01277362430b5a75c19a16ded8cf4c53a3bccddcc0ba2f50648e0f2985f23464 qtwebsockets-opensource-src-5.9.1.tar.xz
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
-- 
1.9.1
