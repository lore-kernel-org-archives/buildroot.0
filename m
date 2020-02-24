From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:39 +0100
Subject: [Buildroot] [PATCH 22/36] package/qt5virtualkeyboard: drop qt 5.6
 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-22-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.12.7 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...emove-weird-install-path-for-example.patch | 38 -------------------
 .../2.0/qt5virtualkeyboard.hash               |  8 ----
 .../5.12.7/qt5virtualkeyboard.hash            |  9 -----
 package/qt5/qt5virtualkeyboard/Config.in      |  5 ---
 .../qt5virtualkeyboard.hash                   | 11 +++++-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 34 +----------------
 6 files changed, 10 insertions(+), 95 deletions(-)
 delete mode 100644 package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
 delete mode 100644 package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
 delete mode 100644 package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash

diff --git a/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch b/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
deleted file mode 100644
index 367cc4a1f7..0000000000
--- a/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From aef55eb7b3470ba6dee4abc67acda1d308c90e97 Mon Sep 17 00:00:00 2001
-From: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
-Date: Mon, 4 Apr 2016 14:25:54 +0200
-Subject: [PATCH 1/1] remove weird install path for example
-
-the deployment system on top should deal with this.
-
-Upstream-Status: Backport [with adaptations]
-Change-Id: I1befb3e0c9bb6546afc59a40e525d1d600475a86
-Reviewed-by: Joerg Bornemann <joerg.bornemann@theqtcompany.com>
-Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
-[gportay: update basic.pro path]
----
- examples/virtualkeyboard/basic/basic.pro                  | 8 ++-----
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/examples/virtualkeyboard/basic/basic.pro b/examples/virtualkeyboard/basic/basic.pro
-index 28cc4dc..0f71e0e 100644
---- a/examples/virtualkeyboard/basic/basic.pro
-+++ b/examples/virtualkeyboard/basic/basic.pro
-@@ -7,12 +7,8 @@ static {
-     QT += svg
-     QTPLUGIN += qtvirtualkeyboardplugin
- }
--android-no-sdk|!isEmpty(CROSS_COMPILE) {
--    TARGETPATH = /data/user/qt/virtualkeyboard/basic
--} else {
--    TARGETPATH = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard/basic
--}
--target.path = $$TARGETPATH
-+
-+target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard/basic
- INSTALLS += target
- 
- RESOURCES += \
--- 
-2.17.1
-
diff --git a/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
deleted file mode 100644
index 0cc4f9c82e..0000000000
--- a/package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtvirtualkeyboard-opensource-src-2.0.tar.xz.mirrorlist
-sha256 1d543a851e83fc3de40f48c2935f70278e842589b9a235c2b22f41733e561aec qtvirtualkeyboard-opensource-src-2.0.tar.xz
-
-# Hashes for license files:
-sha256 6148d2793ca4e62ba3935a27bd3e46971a5d7c871dbe8f2687a867bd2c2589fb src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
-sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
-sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
-sha256 ca3dd653e13c4a935622cfce00dc4e2d7a8295b64da99bd1d4f2a8ddb6b0956e src/virtualkeyboard/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
deleted file mode 100644
index 668f971bea..0000000000
--- a/package/qt5/qt5virtualkeyboard/5.12.7/qt5virtualkeyboard.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz.sha256
-sha256 aaa52aaff923df22de8472d71843dadb80f3f6fe0312122e64ffe5436db40daa qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
-sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/plugins/openwnn/3rdparty/openwnn/NOTICE
-sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/plugins/pinyin/3rdparty/pinyin/NOTICE
-sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/Config.in b/package/qt5/qt5virtualkeyboard/Config.in
index 8e9cacd3c8..4cac6fd275 100644
--- a/package/qt5/qt5virtualkeyboard/Config.in
+++ b/package/qt5/qt5virtualkeyboard/Config.in
@@ -1,11 +1,6 @@
-comment "qt5virtualkeyboard needs an OpenGL-capable backend"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
-
 config BR2_PACKAGE_QT5VIRTUALKEYBOARD
 	bool "qt5virtualkeyboard"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	select BR2_PACKAGE_QT5SVG
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 5316f03b10..668f971bea 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,2 +1,9 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz.sha256
+sha256 aaa52aaff923df22de8472d71843dadb80f3f6fe0312122e64ffe5436db40daa qtvirtualkeyboard-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
+sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/plugins/openwnn/3rdparty/openwnn/NOTICE
+sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index c13fa699a6..3823b8e017 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,21 +4,14 @@
 #
 ################################################################################
 
-# Module does not follow Qt versionning for 5.6
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
-else
-QT5VIRTUALKEYBOARD_VERSION = 2.0
-endif
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
 QT5VIRTUALKEYBOARD_LICENSE = GPL-3.0
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
-endif
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
@@ -26,44 +19,26 @@ QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LA
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
-else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/openwnn/3rdparty/openwnn/NOTICE
 endif
-endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (pinyin)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
-else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
 endif
-endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (tcime), BSD-3-Clause (tcime)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
-else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
 endif
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE += , MIT (lipi-toolkit)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
-else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
@@ -87,17 +62,10 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
-endef
-else
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
 	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
 endef
-endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
@@ -105,7 +73,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_STATIC_LIBS),)
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
 endef
-- 
2.20.1
