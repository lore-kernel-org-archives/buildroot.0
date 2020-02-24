From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:20 +0100
Subject: [Buildroot] [PATCH 03/36] package/qt53d: drop 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt53d/qt53d.hash |  3 ---
 package/qt5/qt53d/qt53d.mk   | 10 ++--------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 1ccc9f00e9..54dbda367d 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qt3d-everywhere-src-5.12.7.tar.xz.sha256
 sha256 2030de3dc93fd4062f677f61938229af9cd7aa4c3d2932cdda2ccb663d681126 qt3d-everywhere-src-5.12.7.tar.xz
 
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 7674b44558..1028dd6a65 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -36,19 +36,13 @@ endef
 endif
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-# Available since 5.9
-define QT53D_INSTALL_TARGET_LATEST
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
 define QT53D_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
-	$(QT53D_INSTALL_TARGET_LATEST)
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
 	$(QT53D_INSTALL_TARGET_EXAMPLES)
 endef
 endif
-- 
2.20.1
