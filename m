From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  1 Jun 2015 18:24:41 +0200
Subject: [Buildroot] [PATCH v2] package/python-can: new package
Message-ID: <1433175881-26365-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides controller area network support for Python.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Chages v1 -> v2:
 - Fixed license
 - Removed hg clone for package retrival

 package/Config.in                |  1 +
 package/python-can/Config.in     |  6 ++++++
 package/python-can/python-can.mk | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-can/Config.in
 create mode 100644 package/python-can/python-can.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..88c9aa2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -572,6 +572,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
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
index 0000000..8db5732
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
+PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get/
+PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
+PYTHON_CAN_LICENSE = LGPLv3
+PYTHON_CAN_LICENSE_FILES = LICENSE.txt
+PYTHON_CAN_DEPENDENCIES = python
+PYTHON_CAN_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.4.2
