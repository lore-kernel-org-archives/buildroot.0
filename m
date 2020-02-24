From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:31 +0100
Subject: [Buildroot] [PATCH 14/36] package/qt5quickcontrols2: drop qt 5.6
 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-14-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash    |  7 -------
 .../qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash |  7 -------
 package/qt5/qt5quickcontrols2/Config.in                |  5 -----
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  9 +++++++--
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     | 10 ----------
 5 files changed, 7 insertions(+), 31 deletions(-)
 delete mode 100644 package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
 delete mode 100644 package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash

diff --git a/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
deleted file mode 100644
index 689a7e5284..0000000000
--- a/package/qt5/qt5quickcontrols2/5.12.7/qt5quickcontrols2.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols2-everywhere-src-5.12.7.tar.xz.sha256
-sha256 3a9526e5ad01edbfb796a6631983c391ea1b7e22ae6e07840048156a9e92a237 qtquickcontrols2-everywhere-src-5.12.7.tar.xz
-
-# Hashes for license files:
-sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
-sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
deleted file mode 100644
index 01fe5dcd61..0000000000
--- a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
-
-# Hashes for license files:
-sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 0ec5b37a28dd638c5c05c8cc940276e55c808353fe8d942c7f993c2c8b4cbe62 LICENSE.LGPLv3
diff --git a/package/qt5/qt5quickcontrols2/Config.in b/package/qt5/qt5quickcontrols2/Config.in
index d036f74bab..3f81e20d52 100644
--- a/package/qt5/qt5quickcontrols2/Config.in
+++ b/package/qt5/qt5quickcontrols2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS2
 	bool "qt5quickcontrols2"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST # qt5declarative/quick
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative/quick
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -14,7 +13,3 @@ config BR2_PACKAGE_QT5QUICKCONTROLS2
 	  to a core module in Qt 5.7.0.
 
 	  https://doc.qt.io/qt-5/qtquickcontrols2-index.html
-
-comment "qt5quickcontrols2 needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 5316f03b10..689a7e5284 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,2 +1,7 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols2-everywhere-src-5.12.7.tar.xz.sha256
+sha256 3a9526e5ad01edbfb796a6631983c391ea1b7e22ae6e07840048156a9e92a237 qtquickcontrols2-everywhere-src-5.12.7.tar.xz
+
+# Hashes for license files:
+sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
+sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
+sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index c2004c2ee7..632bc47205 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -31,7 +31,6 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
@@ -41,14 +40,5 @@ define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
 	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
 endef
-else
-define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
-	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
-endef
-endif
 
 $(eval $(generic-package))
-- 
2.20.1
