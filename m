From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 25 Jun 2012 15:43:17 +0100
Subject: [Buildroot] [PATCH] json-javascript: new package
Message-ID: <1340635397-20780-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                          |    1 +
 package/json-javascript/Config.in          |    6 ++++++
 package/json-javascript/json-javascript.mk |   17 +++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/json-javascript/Config.in
 create mode 100644 package/json-javascript/json-javascript.mk

diff --git a/package/Config.in b/package/Config.in
index 99257b4..da61a12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
+source "package/json-javascript/Config.in"
 endmenu
 
 menu "Multimedia"
diff --git a/package/json-javascript/Config.in b/package/json-javascript/Config.in
new file mode 100644
index 0000000..501c54f
--- /dev/null
+++ b/package/json-javascript/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JSON_JAVASCRIPT
+	bool "json-javascript"
+	help
+	  JSON in JavaScript
+
+	  https://github.com/douglascrockford/JSON-js/
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
new file mode 100644
index 0000000..fc739d4
--- /dev/null
+++ b/package/json-javascript/json-javascript.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# json-javascript
+#
+#############################################################
+JSON_JAVASCRIPT_VERSION = 42c18c621a411c3f39a81bb0a387fc50dcd738d9
+JSON_JAVASCRIPT_SITE = git://github.com/douglascrockford/JSON-js.git
+
+define JSON_JAVASCRIPT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/json2.js $(TARGET_DIR)/var/www/json2.js
+endef
+
+define JSON_JAVASCRIPT_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/var/www/json2.js
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
