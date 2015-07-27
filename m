From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 27 Jul 2015 20:37:32 +0200
Subject: [Buildroot] [PATCH] jquery-datetimepicker: new package
Message-ID: <1438022252-8024-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce jQuery submenu for jQuery plugins.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                      |  5 +++++
 package/jquery-datetimepicker/Config.in                |  7 +++++++
 package/jquery-datetimepicker/jquery-datetimepicker.mk | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/jquery-datetimepicker/Config.in
 create mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.mk

diff --git a/package/Config.in b/package/Config.in
index f029e1d..f240c26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -882,6 +882,11 @@ menu "Javascript"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
+if BR2_PACKAGE_JQUERY
+menu "external jQuery plugins"
+	source "package/jquery-datetimepicker/Config.in"
+endmenu
+endif
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
 	source "package/jquery-sparkline/Config.in"
diff --git a/package/jquery-datetimepicker/Config.in b/package/jquery-datetimepicker/Config.in
new file mode 100644
index 0000000..9da3718
--- /dev/null
+++ b/package/jquery-datetimepicker/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JQUERY_DATETIMEPICKER
+	bool "jquery-datetimepicker"
+	help
+	  Use this plugin to unobtrusively add a datetimepicker,
+	  datepicker or timepicker dropdown to your forms.
+
+	  http://xdsoft.net/jqplugins/datetimepicker
diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.mk b/package/jquery-datetimepicker/jquery-datetimepicker.mk
new file mode 100644
index 0000000..519364a
--- /dev/null
+++ b/package/jquery-datetimepicker/jquery-datetimepicker.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jquery-datetimepicker
+#
+################################################################################
+
+JQUERY_DATETIMEPICKER_VERSION = 2.4.5
+JQUERY_DATETIMEPICKER_SITE = $(call github,xdan,datetimepicker,$(JQUERY_DATETIMEPICKER_VERSION))
+JQUERY_DATETIMEPICKER_LICENSE = MIT
+
+define JQUERY_DATETIMEPICKER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.css \
+		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.css
+	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.js \
+		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.js
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
