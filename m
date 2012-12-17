From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Mon, 17 Dec 2012 12:04:08 -0800 (PST)
Subject: [Buildroot] [PATCH 1/1] Added new package ncdu
Message-ID: <1355774648.20811.YahooMailNeo@web120305.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
?package/Config.in????? |? 1 +
?package/ncdu/Config.in |? 7 +++++++
?package/ncdu/ncdu.mk?? | 13 +++++++++++++
?3 files changed, 21 insertions(+)
?create mode 100644 package/ncdu/Config.in
?create mode 100644 package/ncdu/ncdu.mk

diff --git a/package/Config.in b/package/Config.in
index 171db8f..2d12cdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
?source "package/module-init-tools/Config.in"
?endif
?source "package/monit/Config.in"
+source "package/ncdu/Config.in"
?if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
?source "package/procps/Config.in"
?source "package/psmisc/Config.in"
diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
new file mode 100644
index 0000000..d8b4db4
--- /dev/null
+++ b/package/ncdu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NCDU
+?????? bool "ncdu"
+?????? select BR2_PACKAGE_NCURSES
+?????? help
+???????? ncdu is a disk usage analyzer with an ncurses interface
+
+???????? http://dev.yorhel.nl/ncdu
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
new file mode 100644
index 0000000..26f3b5e
--- /dev/null
+++ b/package/ncdu/ncdu.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# ncdu
+#
+#############################################################
+NCDU_VERSION=1.9
+NCDU_SITE=http://dev.yorhel.nl/download/
+NCDU_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
+NCDU_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
+
+NCDU_DEPENDENCIES = ncurses
+
+$(eval $(autotools-package))
-- 
1.7.12.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ncdu.diff
Type: application/octet-stream
Size: 1812 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121217/42140369/attachment.obj>
