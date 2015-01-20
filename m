From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jan 2015 21:41:38 +0100
Subject: [Buildroot] [PATCH] python-pyxb: new package
Message-ID: <1421786498-3330-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |  1 +
 package/python-pyxb/Config.in        |  7 +++++++
 package/python-pyxb/python-pyxb.hash |  3 +++
 package/python-pyxb/python-pyxb.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-pyxb/Config.in
 create mode 100644 package/python-pyxb/python-pyxb.hash
 create mode 100644 package/python-pyxb/python-pyxb.mk

diff --git a/package/Config.in b/package/Config.in
index 32d6755..5f6ebc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -545,6 +545,7 @@ menu "external python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
+	source "package/python-pyxb/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-pyxb/Config.in b/package/python-pyxb/Config.in
new file mode 100644
index 0000000..f122671
--- /dev/null
+++ b/package/python-pyxb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYXB
+	bool "python-pyxb"
+	help
+	  PyXB is a pure Python package that generates Python code
+	  for classes that correspond to data structures defined by XMLSchema.
+
+	  http://pyxb.sourceforge.net/
diff --git a/package/python-pyxb/python-pyxb.hash b/package/python-pyxb/python-pyxb.hash
new file mode 100644
index 0000000..6da3abc
--- /dev/null
+++ b/package/python-pyxb/python-pyxb.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  14ced19ecce51e7cd26434446f9bd6b4e309e91806f1f6fc5e21f4ac736aa0de  python-pyxb-1.2.4.tar.gz
+
diff --git a/package/python-pyxb/python-pyxb.mk b/package/python-pyxb/python-pyxb.mk
new file mode 100644
index 0000000..bd607b6
--- /dev/null
+++ b/package/python-pyxb/python-pyxb.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pyxb
+#
+################################################################################
+
+PYTHON_PYXB_VERSION = 1.2.4
+PYTHON_PYXB_SITE = $(call github,pabigot,pyxb,PyXB-$(PYTHON_PYXB_VERSION))
+PYTHON_PYXB_LICENSE = Apache License 2.0
+PYTHON_PYXB_LICENSE_FILES = LICENSE
+PYTHON_PYXB_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.0
