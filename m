From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 29 Oct 2012 22:51:41 +0100
Subject: [Buildroot] [PATCH] grantlee: new package
Message-ID: <508EFA6D.7000404@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for the Grantlee library
Grantlee is a Qt implementation of the Django template system, see here: 
http://www.gitorious.org/grantlee/pages/Home

(it's my first patch to buildroot, so please let me know any notes, thx)

Signed-off-by:  "Zoltan Gyarmati" <mr.zoltan.gyarmati@gmail.com>
---
  package/Config.in            |    1 +
  package/grantlee/Config.in   |    8 ++++++++
  package/grantlee/grantlee.mk |   14 ++++++++++++++
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
index 0000000..6e3b80d
--- /dev/null
+++ b/package/grantlee/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GRANTLEE
+    bool "grantlee"
+    depends on BR2_PACKAGE_QT
+    select BR2_PACKAGE_QT_STL
+    help
+      Qt implemantation of the Django template framework
+
+        http://www.grantlee.org/apidox
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
new file mode 100644
index 0000000..9264f80
--- /dev/null
+++ b/package/grantlee/grantlee.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# grantlee
+#
+#############################################################
+
+GRANTLEE_VERSION = 0.2.0
+GRANTLEE_SITE = http://downloads.grantlee.org/
+GRANTLEE_INSTALL_STAGING = YES
+GRANTLEE_INSTALL_TARGET = YES
+GRANTLEE_DEPENDENCIES = host-pkg-config qt
+
+$(eval $(cmake-package))
+
-- 
1.7.9.5
