From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:15:28 +0200
Subject: [Buildroot] [git commit] json-javascript: new package
Message-ID: <20130505201734.3C5FC99B50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb3bff76eceeb5ee277d19f5e357b2b35e7922de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: update for generic-package, add license info]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/json-javascript/Config.in          |    6 ++++++
 package/json-javascript/json-javascript.mk |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 79b6b8f..e743dc8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ source "package/jquery-keyboard/Config.in"
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
index 0000000..a700e07
--- /dev/null
+++ b/package/json-javascript/json-javascript.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# json-javascript
+#
+#############################################################
+
+JSON_JAVASCRIPT_VERSION = 42c18c621a411c3f39a81bb0a387fc50dcd738d9
+JSON_JAVASCRIPT_SITE = git://github.com/douglascrockford/JSON-js.git
+JSON_JAVASCRIPT_LICENSE = Public Domain
+JSON_JAVASCRIPT_LICENSE_FILES = json2.js
+
+define JSON_JAVASCRIPT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/json2.js $(TARGET_DIR)/var/www/json2.js
+endef
+
+define JSON_JAVASCRIPT_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/var/www/json2.js
+endef
+
+$(eval $(generic-package))
