From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Mon, 10 Dec 2012 01:24:07 -0800 (PST)
Subject: [Buildroot]  [PATCH] package/ncdu: new package
Message-ID: <1355131447.60988.YahooMailNeo@web120305.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I made a patch for adding ncdu to buildroot. I find it very useful to have a quick view what uses storage space on your device.

Regards,
Bogdan



Signed-off-by: "Bogdan Radulescu" <bogdan@nimblex.net>
---
diff --git a/package/Config.in b/package/Config.in
index 74e439e..8307806 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -729,6 +729,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
?source "package/module-init-tools/Config.in"
?endif
?source "package/monit/Config.in"
+source "package/ncdu/Config.in"
?if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
?source "package/procps/Config.in"
?source "package/psmisc/Config.in"
diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
new file mode 100644
index 0000000..46e15f9
--- /dev/null
+++ b/package/ncdu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NCDU
+?????? bool "iftop"
+?????? select BR2_PACKAGE_NCURSES
+?????? help
+???????? ncdu is a disk usage analyzer with an ncurses interface
+
+???????? http://dev.yorhel.nl/ncdu
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
new file mode 100644
index 0000000..3cb3de4
--- /dev/null
+++ b/package/ncdu/ncdu.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# ncdu
+#
+#############################################################
+NCDU_VERSION=1.9
+NCDU_SOURCE=ncdu-$(NCDU_VERSION).tar.gz
+NCDU_SITE=http://dev.yorhel.nl/download/
+NCDU_INSTALL_STAGING = YES
+NCDU_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
+NCDU_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
+
+NCDU_DEPENDENCIES = ncurses
+
+$(eval $(autotools-package))
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ncdu.patch
Type: application/octet-stream
Size: 1441 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121210/dc115972/attachment.obj>
