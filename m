From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sun, 11 Feb 2018 11:13:19 -0500
Subject: [Buildroot] [RFC 1/2] qt5: bump latest version to 5.10.0
In-Reply-To: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hashes has been updated using the following script:

	#!/bin/sh

	set -e

	get_url() {
		sed -e "\,# Hash from: https\?://download.qt.io/official_releases/qt/5.10/.*,{s,# Hash from: ,,;s,\.mirrorlist,.sha256,p}" \
		    -n "$1"
	}

	update_sha256() {
		sed -e "\,# Hash from: https\?://download.qt.io/official_releases/qt/5.10/.*,{n;s,^.*$,sha256 $2,}" \
		    -i "$1"
	}

	update_hashfile() {
		local url sha256
		url="$(get_url "$pkg/$module.hash")"
		sha256="$(wget -O- "$url")"
		update_sha256 "$pkg/$module.hash" "$sha256"
	}

	for pkg in package/qt5/qt5*
	do
		[ -d "$pkg" ] || continue
		module=${pkg##*/}
		if ! update_hashfile "$pkg/$module.hash"
		then
			continue
		fi
		echo "$module-source"
	done | xargs make "$@"

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/Config.in                                    | 4 ++--
 package/qt5/qt5.mk                                       | 8 ++++++--
 package/qt5/qt53d/qt53d.hash                             | 4 ++--
 package/qt5/qt53d/qt53d.mk                               | 2 +-
 package/qt5/qt5base/qt5base.hash                         | 4 ++--
 package/qt5/qt5base/qt5base.mk                           | 2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.hash                 | 4 ++--
 package/qt5/qt5canvas3d/qt5canvas3d.mk                   | 2 +-
 package/qt5/qt5charts/qt5charts.hash                     | 4 ++--
 package/qt5/qt5charts/qt5charts.mk                       | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash         | 4 ++--
 package/qt5/qt5connectivity/qt5connectivity.mk           | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash           | 4 ++--
 package/qt5/qt5declarative/qt5declarative.mk             | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk                     | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash | 4 ++--
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk   | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash         | 4 ++--
 package/qt5/qt5imageformats/qt5imageformats.mk           | 2 +-
 package/qt5/qt5location/qt5location.hash                 | 4 ++--
 package/qt5/qt5location/qt5location.mk                   | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash             | 4 ++--
 package/qt5/qt5multimedia/qt5multimedia.mk               | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash       | 4 ++--
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash     | 4 ++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk       | 2 +-
 package/qt5/qt5script/qt5script.hash                     | 4 ++--
 package/qt5/qt5script/qt5script.mk                       | 2 +-
 package/qt5/qt5scxml/qt5scxml.hash                       | 4 ++--
 package/qt5/qt5scxml/qt5scxml.mk                         | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                   | 4 ++--
 package/qt5/qt5sensors/qt5sensors.mk                     | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash               | 4 ++--
 package/qt5/qt5serialbus/qt5serialbus.mk                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash             | 4 ++--
 package/qt5/qt5serialport/qt5serialport.mk               | 2 +-
 package/qt5/qt5svg/qt5svg.hash                           | 4 ++--
 package/qt5/qt5svg/qt5svg.mk                             | 2 +-
 package/qt5/qt5tools/qt5tools.hash                       | 4 ++--
 package/qt5/qt5tools/qt5tools.mk                         | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash   | 4 ++--
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk     | 2 +-
 package/qt5/qt5wayland/qt5wayland.hash                   | 4 ++--
 package/qt5/qt5wayland/qt5wayland.mk                     | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash             | 4 ++--
 package/qt5/qt5webchannel/qt5webchannel.mk               | 2 +-
 package/qt5/qt5webengine/qt5webengine.hash               | 4 ++--
 package/qt5/qt5webengine/qt5webengine.mk                 | 2 +-
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk     | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash             | 4 ++--
 package/qt5/qt5websockets/qt5websockets.mk               | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash               | 4 ++--
 package/qt5/qt5x11extras/qt5x11extras.mk                 | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash           | 4 ++--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk             | 2 +-
 56 files changed, 88 insertions(+), 84 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index a9ee44c11f..b7786f7a63 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -35,14 +35,14 @@ choice
 	prompt "Qt5 version"
 
 config BR2_PACKAGE_QT5_VERSION_LATEST
-	bool "Latest (5.9)"
+	bool "Latest (5.10)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
 	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
 	help
-	  This option builds Qt 5.9, which is licensed under
+	  This option builds Qt 5.10, which is licensed under
 	  (L)GPL-3.0+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 7a6e1d7cfe..f82503e0c0 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,13 +5,17 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5_VERSION_MAJOR = 5.9
-QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_VERSION_MAJOR = 5.10
+QT5_VERSION = $(QT5_VERSION_MAJOR).0
+QT5_SRC = everywhere-src
 else
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).3
+QT5_SRC = opensource-src
 endif
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+# qt5(module,version): returns site of Qt5 tarball
+qt5source = $(1)-$(QT5_SRC)-$(2).tar.xz
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 18441ead0d..70fb7f762b 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qt3d-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 97925132f0583ccd76f5e104c849341df3abba73dd4d9b647622a23bdae6273f qt3d-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qt3d-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 12457e7227c793274329371c60b9028ab3e44db837e875e2c460367c1dbd34ab  qt3d-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index fcb743db21..fcbecff68c 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -6,7 +6,7 @@
 
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
-QT53D_SOURCE = qt3d-opensource-src-$(QT53D_VERSION).tar.xz
+QT53D_SOURCE = $(call qt5source,qt3d,$(QT53D_VERSION))
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index c6e694ab39..83ee83e2dd 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtbase-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 9e7c44005e7691dc7c85165bd4510282c47f0163521f4973eab71dbdb39a9982 qtbase-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtbase-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 fd5578cd320a13617c12cf2b19439386b203d6d45548e855f94e07be9829f762  qtbase-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c799cb..a48ce2e308 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -6,7 +6,7 @@
 
 QT5BASE_VERSION = $(QT5_VERSION)
 QT5BASE_SITE = $(QT5_SITE)
-QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
+QT5BASE_SOURCE = $(call qt5source,qtbase,$(QT5BASE_VERSION))
 
 QT5BASE_DEPENDENCIES = host-pkgconf zlib
 QT5BASE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
index 1664f626cd..8c7e55467d 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcanvas3d-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 5e38b17844af801be57844da0379cc6882750b9019034f4fe884aae70c300abc qtcanvas3d-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtcanvas3d-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 d289626f06236f2c0e3065416fd6a8a72b8895cb5253ee2d9b6320df5b452987  qtcanvas3d-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 97b0ec494e..0d31f45184 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -6,7 +6,7 @@
 
 QT5CANVAS3D_VERSION = $(QT5_VERSION)
 QT5CANVAS3D_SITE = $(QT5_SITE)
-QT5CANVAS3D_SOURCE = qtcanvas3d-opensource-src-$(QT5CANVAS3D_VERSION).tar.xz
+QT5CANVAS3D_SOURCE = $(call qt5source,qtcanvas3d,$(QT5CANVAS3D_VERSION))
 QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 3a9db5b297..93811d1328 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcharts-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ec1783a81d5715fc48a3276e67b90a66cac3e283ac14fc3bf88b2058994d69e9  qtcharts-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtcharts-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 12ce2c4a8467d349ecfdba831cc03c539f2b207aa21082a4e1043dcf8f1b31ef  qtcharts-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 17fdd96702..ab5d7f5aa6 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -6,7 +6,7 @@
 
 QT5CHARTS_VERSION = $(QT5_VERSION)
 QT5CHARTS_SITE = $(QT5_SITE)
-QT5CHARTS_SOURCE = qtcharts-opensource-src-$(QT5CHARTS_VERSION).tar.xz
+QT5CHARTS_SOURCE = $(call qt5source,qtcharts,$(QT5CHARTS_VERSION))
 QT5CHARTS_DEPENDENCIES = qt5base
 QT5CHARTS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index aaa3ef275b..7abc899509 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtconnectivity-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e2891e6e8d91e82e3c4d5667f3146062458067c0b706d65ac0fc7562afce0649 qtconnectivity-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtconnectivity-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 2e3fe2e872449065ec3326955fb97c629106f62b9441e8dfd2e0adfc9fb169a6  qtconnectivity-everywhere-src-5.10.0.tar.xz
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 4369a411a5..61dd853f81 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -6,7 +6,7 @@
 
 QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
 QT5CONNECTIVITY_SITE = $(QT5_SITE)
-QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
+QT5CONNECTIVITY_SOURCE = $(call qt5source,qtconnectivity,$(QT5CONNECTIVITY_VERSION))
 QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 6f171ffa40..3c0d301c36 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtdeclarative-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 505f66d2062c1d84ce743a0b4969531e1cf94e30970dc64efffe10f74f989407 qtdeclarative-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtdeclarative-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 5ccb4dbca5046554037bcffbb05918f6efcff321c44cd1c39b1c47be7e67711e  qtdeclarative-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index de8b048329..2c5027e304 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -6,7 +6,7 @@
 
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
-QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
+QT5DECLARATIVE_SOURCE = $(call qt5source,qtdeclarative,$(QT5DECLARATIVE_VERSION))
 QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 603b2a517d..38f309646f 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -7,7 +7,7 @@
 # Qt5Enginio does not follow Qt versionning
 # see https://bugreports.qt.io/browse/QTBUG-50111
 QT5ENGINIO_VERSION = 1.6.3
-QT5ENGINIO_SITE = $(QT5_SITE)
+QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl qt5base
 QT5ENGINIO_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 8770d72a19..2e82d5df03 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtgraphicaleffects-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 790b029bc8bdbb5c9548ecad2ff6e73b7da3deabbdba6bacac4a6aacd3a0f0d9 qtgraphicaleffects-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtgraphicaleffects-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 97b969112f21161fc924c1b1c98f1dad2bf7027e31b27ea9eec532db7b045e30  qtgraphicaleffects-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 2f6380f712..3467783b60 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -6,7 +6,7 @@
 
 QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
-QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
+QT5GRAPHICALEFFECTS_SOURCE = $(call qt5source,qtgraphicaleffects,$(QT5GRAPHICALEFFECTS_VERSION))
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index c56ed7d587..5353f3c684 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtimageformats-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 d4b309ddbac2275cafadffc62047a26ed8f169bde015925761894843eae725dd qtimageformats-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtimageformats-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 91bfb884f965af6d6c187f8ac4f9bb1f9fe0af59cbbe36e035ee5f5510b7f4fc  qtimageformats-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index f70f131d50..f0215837bd 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -6,7 +6,7 @@
 
 QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)
-QT5IMAGEFORMATS_SOURCE = qtimageformats-opensource-src-$(QT5IMAGEFORMATS_VERSION).tar.xz
+QT5IMAGEFORMATS_SOURCE = $(call qt5source,qtimageformats,$(QT5IMAGEFORMATS_VERSION))
 QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 5bb2021e09..56a9747706 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtlocation-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 80fd425cde8747c1fc79aa90994a9caf921d7c79ff41babec692fe43cdc74ce1 qtlocation-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtlocation-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 d84dcec7cfbc99a13e048f935783b0c2e1cb540defc82d77ac869a5b76aa85c7  qtlocation-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index e9f1e4d93d..3b0ec5d2ef 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -6,7 +6,7 @@
 
 QT5LOCATION_VERSION = $(QT5_VERSION)
 QT5LOCATION_SITE = $(QT5_SITE)
-QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
+QT5LOCATION_SOURCE = $(call qt5source,qtlocation,$(QT5LOCATION_VERSION))
 QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 750c3379ca..eee5f54c3e 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtmultimedia-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e79558d24ace9b4444d91d807b85778b6a0a592e7d1500ffadf45f7d3b8238a6 qtmultimedia-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtmultimedia-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 008333fdc3bc2d87977392397d38ebaae1329059997319cb1b0613fb6489806f  qtmultimedia-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index c890b31804..4086fe8133 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -6,7 +6,7 @@
 
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
 QT5MULTIMEDIA_SITE = $(QT5_SITE)
-QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
+QT5MULTIMEDIA_SOURCE = $(call qt5source,qtmultimedia,$(QT5MULTIMEDIA_VERSION))
 QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 84890c5612..589d8dc2b8 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 300eeebd7d2c243c0123bc2324b5643b3f967c0816aead0ba7b993aeeac0e226 qtquickcontrols-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtquickcontrols-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 a133ef7724d5d2eef4085920d463af78024f327d0ae320f24202a51b554e6129  qtquickcontrols-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 88e767bcf9..9cd223208f 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -6,7 +6,7 @@
 
 QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS_SOURCE = qtquickcontrols-opensource-src-$(QT5QUICKCONTROLS_VERSION).tar.xz
+QT5QUICKCONTROLS_SOURCE = $(call qt5source,qtquickcontrols,$(QT5QUICKCONTROLS_VERSION))
 QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 7a6040f34c..fde2fe7c17 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols2-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 21aaa26956ad0ccc3ce86ced7925ceae4b4cef25c6c5ef2f7ded608431420843 qtquickcontrols2-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtquickcontrols2-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 818770247a3a211714dfc17f7f5a07c6cf49999ff405d36fd00fab1d5559a1a1  qtquickcontrols2-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index f27cafc63b..7508b84b27 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -6,7 +6,7 @@
 
 QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_VERSION).tar.xz
+QT5QUICKCONTROLS2_SOURCE = $(call qt5source,qtquickcontrols2,$(QT5QUICKCONTROLS2_VERSION))
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 66582ad448..fec94079e9 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscript-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b80bfaaf58f154b68101e438a1881f669cb9974026926be7755adb00af355566 qtscript-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtscript-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 6cf2f2f09ccafa9c9cd5d16641ae2b75b7f98947de6ec0ec1717489f3a09cafc  qtscript-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index b6c02d0d1c..49371fba16 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -6,7 +6,7 @@
 
 QT5SCRIPT_VERSION = $(QT5_VERSION)
 QT5SCRIPT_SITE = $(QT5_SITE)
-QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
+QT5SCRIPT_SOURCE = $(call qt5source,qtscript,$(QT5SCRIPT_VERSION))
 QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index b0d861573c..fcb0d4f51e 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscxml-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 d8f51fa8eddd09fef29d8fad6e570e9ca9403469543ab10cb5cfad738786a81b qtscxml-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtscxml-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 4bbb19d6b169ab04aec62d09ed4324639cda13d2c25cf584c9061c5d9af65890  qtscxml-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 2d197a2bca..065cdd7d1a 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -6,7 +6,7 @@
 
 QT5SCXML_VERSION = $(QT5_VERSION)
 QT5SCXML_SITE = $(QT5_SITE)
-QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
+QT5SCXML_SOURCE = $(call qt5source,qtscxml,$(QT5SCXML_VERSION))
 QT5SCXML_DEPENDENCIES = qt5base qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 26e13d60b1..da48298ba6 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsensors-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b95ea20b3d616655435357671558631da6fe6970500b7e6d35d1111f0b8cdac1 qtsensors-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtsensors-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 cd98c5afb25bdb243b03a8e1da1a9643fbad334549c8128328446d0818fe3971  qtsensors-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index d4dc47e89c..b9e995bbfd 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -6,7 +6,7 @@
 
 QT5SENSORS_VERSION = $(QT5_VERSION)
 QT5SENSORS_SITE = $(QT5_SITE)
-QT5SENSORS_SOURCE = qtsensors-opensource-src-$(QT5SENSORS_VERSION).tar.xz
+QT5SENSORS_SOURCE = $(call qt5source,qtsensors,$(QT5SENSORS_VERSION))
 QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 9191fd2198..976b335e38 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialbus-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ef62745e1793515e03fa586171de13eb17ee7699c9eb626f76a4dc5a00c46938 qtserialbus-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtserialbus-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 3f594784d952dd40e6d7740cd6267a9259a877330cecd83feebef81f5200391b  qtserialbus-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 218aba4e0a..359bb14955 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -6,7 +6,7 @@
 
 QT5SERIALBUS_VERSION = $(QT5_VERSION)
 QT5SERIALBUS_SITE = $(QT5_SITE)
-QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
+QT5SERIALBUS_SOURCE = $(call qt5source,qtserialbus,$(QT5SERIALBUS_VERSION))
 QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 15abf7ac09..fcd81e790f 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialport-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 4cdd3e9157ec3e91078f993cd28651989fa2429a409e19d398fb9cced231abdf qtserialport-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtserialport-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 e580fed9ffd2a978df72775205a96b21d619b5fd5f5754f653864a206e831457  qtserialport-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 479870b16e..fe14d2f6e4 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -6,7 +6,7 @@
 
 QT5SERIALPORT_VERSION = $(QT5_VERSION)
 QT5SERIALPORT_SITE = $(QT5_SITE)
-QT5SERIALPORT_SOURCE = qtserialport-opensource-src-$(QT5SERIALPORT_VERSION).tar.xz
+QT5SERIALPORT_SOURCE = $(call qt5source,qtserialport,$(QT5SERIALPORT_VERSION))
 QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 03659702d6..2c85cbe02a 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsvg-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 df6628a60c8fbbcff99e6a24955c29494268d741509a3367a2294031ab4f5df2 qtsvg-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtsvg-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 4a2aa7cae70a3156846655422b9ed884d8b08b3707b95858e49c7cf9afe5e7b0  qtsvg-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 5a12755f94..078ea3dbee 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -6,7 +6,7 @@
 
 QT5SVG_VERSION = $(QT5_VERSION)
 QT5SVG_SITE = $(QT5_SITE)
-QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT5SVG_SOURCE = $(call qt5source,qtsvg,$(QT5SVG_VERSION))
 QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index 44856400e7..1b7b8bd123 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qttools-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 442c38de3e35f9dcc355dadff35436e23a5a7abd7dd1167a3bf6325e3d9284ff qttools-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qttools-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 1ff5dc747b7935de85257673424dfdffb231f3409f09a5f833d37e2f625cfe32  qttools-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index cf181e576b..eb03dbfc71 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -6,7 +6,7 @@
 
 QT5TOOLS_VERSION = $(QT5_VERSION)
 QT5TOOLS_SITE = $(QT5_SITE)
-QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5TOOLS_VERSION).tar.xz
+QT5TOOLS_SOURCE = $(call qt5source,qttools,$(QT5TOOLS_VERSION))
 
 QT5TOOLS_DEPENDENCIES = qt5base
 QT5TOOLS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 54ded48dea..2b3531a82a 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtvirtualkeyboard-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 b9313f744026f0dcf6e1008212880cd34851499d8b6bc9fc9fbaa1e4e52532ff qtvirtualkeyboard-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtvirtualkeyboard-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 2c2ddd65a335ecdd15e9ff1032a1634330e0d2359760f2a968b21dbc9f4e0b57  qtvirtualkeyboard-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 7d2201b55d..45f096e44b 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -6,7 +6,7 @@
 
 QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
-QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
+QT5VIRTUALKEYBOARD_SOURCE = $(call qt5source,qtvirtualkeyboard,$(QT5VIRTUALKEYBOARD_VERSION))
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index f03a15ceb9..000dcaa920 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,8 +1,8 @@
 # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwayland-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 308e8c44b0ad13520868365d72786d3e3f0b384da99ee72ba543cd866f655f6d qtwayland-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtwayland-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 5657f9656c95f83880f92e7697a1c13c9739bf4d0bfd867e711fff7c84004b93  qtwayland-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 81f514c6a1..57037027b7 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -6,7 +6,7 @@
 
 QT5WAYLAND_VERSION = $(QT5_VERSION)
 QT5WAYLAND_SITE = $(QT5_SITE)
-QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
+QT5WAYLAND_SOURCE = $(call qt5source,qtwayland,$(QT5WAYLAND_VERSION))
 QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland
 QT5WAYLAND_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 188e5ea1f3..492fce7dae 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebchannel-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 632795b293f1318e9aaa1e124b6a39b1625c8c1e35b0a9f05a02ea0066458358 qtwebchannel-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtwebchannel-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 f22424dc6235110bb7f587b01ce692738af1497fba2a9739fa90a5e57ba135a3  qtwebchannel-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index d46e053a53..20a7c6c1db 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -6,7 +6,7 @@
 
 QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
 QT5WEBCHANNEL_SITE = $(QT5_SITE)
-QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.xz
+QT5WEBCHANNEL_SOURCE = $(call qt5source,qtwebchannel,$(QT5WEBCHANNEL_VERSION))
 QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 35acf8da2c..4507d8e39a 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
-sha256 45ae1142fd87271c100f4d7889427738e774e86db5d8f6bcf9ceb99d18571d37 qtwebengine-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtwebengine-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 a8bf5989ef847a249bbc1f391743a36971825b896747d073e30dbcdefc9567f9  qtwebengine-everywhere-src-5.10.0.tar.xz
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 4d423f8329..31d625d06c 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -6,7 +6,7 @@
 
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
-QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
+QT5WEBENGINE_SOURCE = $(call qt5source,qtwebengine,$(QT5WEBENGINE_VERSION))
 QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index f81e994dc5..22c1d519d6 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# no 5.9.2 package available, fall back to 5.9.1 version
+# no 5.10 package available, fall back to 5.9.1 version
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
 QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index e76482bcfe..e12a083b05 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebsockets-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 ce069dff5b552bc6039bcf17e211d2c8837757e2194773bb54054105866111de qtwebsockets-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtwebsockets-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 17ab0fa22007e5485bf98cb5fef5387628274548d5e96923f45d097838f49403  qtwebsockets-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 4cb2aed1db..618c835566 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -6,7 +6,7 @@
 
 QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
 QT5WEBSOCKETS_SITE = $(QT5_SITE)
-QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.xz
+QT5WEBSOCKETS_SOURCE = $(call qt5source,qtwebsockets,$(QT5WEBSOCKETS_VERSION))
 QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index e835648c52..ba77586724 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtx11extras-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 e4e0bf8cbb629758ab85b72d240d7424642482f602ce414e06deef4e147bf2be qtx11extras-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtx11extras-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 cb79e744b122d5705e7a7b86ee1243a5095c8923377a1d0f6e8c630988025786  qtx11extras-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 0905d5f738..85af6a2da3 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -6,7 +6,7 @@
 
 QT5X11EXTRAS_VERSION = $(QT5_VERSION)
 QT5X11EXTRAS_SITE = $(QT5_SITE)
-QT5X11EXTRAS_SOURCE = qtx11extras-opensource-src-$(QT5X11EXTRAS_VERSION).tar.xz
+QT5X11EXTRAS_SOURCE = $(call qt5source,qtx11extras,$(QT5X11EXTRAS_VERSION))
 QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index e7f9d60fdd..9f36183eba 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,8 +1,8 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
 sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
 
-# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtxmlpatterns-opensource-src-5.9.3.tar.xz.mirrorlist
-sha256 cf9c66a612a963382f7b4b51ac8ee5e920bd035b26ecb5c5957f8f3d3286f0ba qtxmlpatterns-opensource-src-5.9.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.0/submodules/qtxmlpatterns-everywhere-src-5.10.0.tar.xz.mirrorlist
+sha256 b08abca6227e942a128e478b2eb81416c40925418d89064ee151c155e3d203c3  qtxmlpatterns-everywhere-src-5.10.0.tar.xz
 
 # Hashes for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 65fd9bd345..e670bf51b1 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -6,7 +6,7 @@
 
 QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
 QT5XMLPATTERNS_SITE = $(QT5_SITE)
-QT5XMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QT5XMLPATTERNS_VERSION).tar.xz
+QT5XMLPATTERNS_SOURCE = $(call qt5source,qtxmlpatterns,$(QT5XMLPATTERNS_VERSION))
 QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 
-- 
2.15.1
