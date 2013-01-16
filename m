From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Wed, 16 Jan 2013 14:49:34 +0000
Subject: [Buildroot] [PATCH] ncdu: new package
In-Reply-To: <1358347774-11998-1-git-send-email-bogdan@nimblex.net>
References: <1358347774-11998-1-git-send-email-bogdan@nimblex.net>
Message-ID: <1358347774-11998-2-git-send-email-bogdan@nimblex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in      |  1 +
 package/ncdu/Config.in |  7 +++++++
 package/ncdu/ncdu.mk   | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/ncdu/Config.in
 create mode 100644 package/ncdu/ncdu.mk

diff --git a/package/Config.in b/package/Config.in
index c59f342..e981ac2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -778,6 +778,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
 source "package/monit/Config.in"
+source "package/ncdu/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/ncdu/Config.in b/package/ncdu/Config.in
new file mode 100644
index 0000000..dac7444
--- /dev/null
+++ b/package/ncdu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NCDU
+	bool "ncdu"
+	select BR2_PACKAGE_NCURSES
+	help
+	  ncdu is a disk usage analyzer with an ncurses interface
+
+	  http://dev.yorhel.nl/ncdu
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
new file mode 100644
index 0000000..5c28178
--- /dev/null
+++ b/package/ncdu/ncdu.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# ncdu
+#
+#############################################################
+NCDU_VERSION = 1.9
+NCDU_SITE = http://dev.yorhel.nl/download/
+
+NCDU_DEPENDENCIES = ncurses
+
+NCDU_LICENSE = MIT
+NCDU_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.12.1
