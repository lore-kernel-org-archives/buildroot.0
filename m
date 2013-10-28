From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 27 Oct 2013 21:29:27 -0300
Subject: [Buildroot] [PATCH] qt5base: add tslib plugin
Message-ID: <1382920167-3336-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Tslib plugin.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/qt5/qt5base/Config.in  | 5 +++++
 package/qt5/qt5base/qt5base.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e433373..cfe8f02 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -185,4 +185,9 @@ config BR2_PACKAGE_QT5BASE_ICU
 	  This option enables ICU support in Qt5. This is for example
 	  needed for Qt5Webkit.
 
+config BR2_PACKAGE_QT5BASE_TSLIB
+	bool "Enable Tslib support"
+	select BR2_PACKAGE_TSLIB
+	help
+	  This options enables the Tslib plugin
 endif
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0106c2c..ce78d31 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -128,6 +128,9 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_PNG),libpng)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DBUS),-dbus,-no-dbus)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DBUS),dbus)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),-tslib,-no-tslib)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_TSLIB),tslib)
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBGLIB2),-glib,-no-glib)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 
-- 
1.8.1.5
