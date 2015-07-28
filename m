From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Jul 2015 20:14:27 +0200
Subject: [Buildroot] [PATCH v2] jquery-datetimepicker: new package
Message-ID: <1438107267-2163-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides datetimepicker, datepicker
and timepicker dropdown for web forms.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: remove jQuery plugin infra, so that it can be added separately (Thomas Petazzoni)

 package/Config.in                                      |  1 +
 package/jquery-datetimepicker/Config.in                |  8 ++++++++
 package/jquery-datetimepicker/jquery-datetimepicker.mk | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/jquery-datetimepicker/Config.in
 create mode 100644 package/jquery-datetimepicker/jquery-datetimepicker.mk

diff --git a/package/Config.in b/package/Config.in
index 1e39c74..8db91eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -885,6 +885,7 @@ menu "Javascript"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
+	source "package/jquery-datetimepicker/Config.in"
 	source "package/jquery-keyboard/Config.in"
 	source "package/jquery-mobile/Config.in"
 	source "package/jquery-sparkline/Config.in"
diff --git a/package/jquery-datetimepicker/Config.in b/package/jquery-datetimepicker/Config.in
new file mode 100644
index 0000000..6a07ec3
--- /dev/null
+++ b/package/jquery-datetimepicker/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JQUERY_DATETIMEPICKER
+	bool "jquery-datetimepicker"
+	select BR2_PACKAGE_JQUERY
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
