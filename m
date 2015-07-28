From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:18:16 +0200
Subject: [Buildroot] [git commit] jquery-datetimepicker: new package
Message-ID: <20150728211927.39BD681904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29ec58e06dacc74a05ed9c12a037ae046a6c620b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides datetimepicker, datepicker and timepicker
dropdown for web forms.

[Thomas:
  - add <pkg>_LICENSE_FILES.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/jquery-datetimepicker/Config.in            |    8 ++++++++
 .../jquery-datetimepicker/jquery-datetimepicker.mk |   19 +++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

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
index 0000000..e4d4799
--- /dev/null
+++ b/package/jquery-datetimepicker/jquery-datetimepicker.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# jquery-datetimepicker
+#
+################################################################################
+
+JQUERY_DATETIMEPICKER_VERSION = 2.4.5
+JQUERY_DATETIMEPICKER_SITE = $(call github,xdan,datetimepicker,$(JQUERY_DATETIMEPICKER_VERSION))
+JQUERY_DATETIMEPICKER_LICENSE = MIT
+JQUERY_DATETIMEPICKER_LICENSE_FILES = MIT-LICENSE.txt
+
+define JQUERY_DATETIMEPICKER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.css \
+		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.css
+	$(INSTALL) -m 0644 -D $(@D)/jquery.datetimepicker.js \
+		$(TARGET_DIR)/var/www/jquery-plugins/datetimepicker/jquery.datetimepicker.js
+endef
+
+$(eval $(generic-package))
