From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 29 May 2015 11:12:42 +0200
Subject: [Buildroot] [PATCH] package/python-can: new package
Message-ID: <1432890762-24842-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides controller area network support for Python.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                |  1 +
 package/python-can/Config.in     |  6 ++++++
 package/python-can/python-can.mk | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-can/Config.in
 create mode 100644 package/python-can/python-can.mk

diff --git a/package/Config.in b/package/Config.in
index d18343c..6661240 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -577,6 +577,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-bottle/Config.in"
+	source "package/python-can/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-can/Config.in b/package/python-can/Config.in
new file mode 100644
index 0000000..6b4e0fa
--- /dev/null
+++ b/package/python-can/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CAN
+	bool "python-can"
+	help
+	  This module provides controller area network support for Python.
+
+	  https://bitbucket.org/hardbyte/python-can
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
new file mode 100644
index 0000000..50477a3
--- /dev/null
+++ b/package/python-can/python-can.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-can
+#
+################################################################################
+
+PYTHON_CAN_VERSION = ae5b6cf
+PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can
+PYTHON_CAN_SITE_METHOD = hg
+PYTHON_CAN_LICENSE = GPLv3
+PYTHON_CAN_LICENSE_FILES = LICENSE.txt
+PYTHON_CAN_DEPENDENCIES = python
+PYTHON_CAN_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.9.1
