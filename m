From: Eric Limpens <limpens@gmail.com>
Date: Thu, 16 Jul 2015 10:46:14 +0200
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: add ability to build sixaxis
	plugin
Message-ID: <1437036374-4179-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/bluez5_utils/Config.in       | 5 +++++
 package/bluez5_utils/bluez5_utils.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 472432b..dade0ee 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -58,6 +58,11 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 	help
 	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
 
+config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
+	bool "build sixaxis plugin"
+	help
+	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock controller)
+
 config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 	bool "build tests"
 	help
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index a1adbe1..4c50e53 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -41,6 +41,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
+# enable sixaxis plugin
+ifeq ($(BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-sixaxis
+endif
+
 # install gatttool (For some reason upstream choose not to do it by default)
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
 define BLUEZ5_UTILS_INSTALL_GATTTOOL
-- 
1.9.1
