From: Zoltan at osuosl.org <Zoltan@osuosl.org>
Date: Wed, 31 Oct 2012 21:38:03 +0100
Subject: [Buildroot] [PATCH] add new package grantlee
Message-ID: <1351715883-10799-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in            |    1 +
 package/grantlee/Config.in   |    9 +++++++++
 package/grantlee/grantlee.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/grantlee/Config.in
 create mode 100644 package/grantlee/grantlee.mk

diff --git a/package/Config.in b/package/Config.in
index ab966e0..ef68b37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -139,6 +139,7 @@ source "package/qt/Config.in"
 if BR2_PACKAGE_QT
 comment "QT libraries and helper libraries"
 source "package/qtuio/Config.in"
+source "package/grantlee/Config.in"
 endif
 
 source "package/x11r7/Config.in"
diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
new file mode 100644
index 0000000..84afad2
--- /dev/null
+++ b/package/grantlee/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GRANTLEE
+	bool "grantlee"
+	select BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_QT_SCRIPT
+	select BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  Qt implemantation of the Django template framework
+
+	  http://www.grantlee.org
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
new file mode 100644
index 0000000..10adfd9
--- /dev/null
+++ b/package/grantlee/grantlee.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# grantlee
+#
+#############################################################
+
+GRANTLEE_VERSION = 0.2.0
+GRANTLEE_SITE = http://downloads.grantlee.org
+GRANTLEE_INSTALL_STAGING = YES
+GRANTLEE_DEPENDENCIES =  qt
+
+$(eval $(cmake-package))
+
-- 
1.7.9.5
