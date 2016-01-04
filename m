From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon,  4 Jan 2016 18:09:22 +0100
Subject: [Buildroot] [PATCH] python-pysocks: new package
Message-ID: <1451927362-4384-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-pysocks/Config.in           |  6 ++++++
 package/python-pysocks/python-pysocks.hash |  3 +++
 package/python-pysocks/python-pysocks.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-pysocks/Config.in
 create mode 100644 package/python-pysocks/python-pysocks.hash
 create mode 100644 package/python-pysocks/python-pysocks.mk

diff --git a/package/Config.in b/package/Config.in
index 442021f..af39b03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pysocks/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
diff --git a/package/python-pysocks/Config.in b/package/python-pysocks/Config.in
new file mode 100644
index 0000000..cd38d4d
--- /dev/null
+++ b/package/python-pysocks/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYSOCKS
+	bool "python-pysocks"
+	help
+	  A Python SOCKS client module.
+
+	  https://github.com/Anorov/PySocks
diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
new file mode 100644
index 0000000..9388c42
--- /dev/null
+++ b/package/python-pysocks/python-pysocks.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c825c7c52b2c79dde73cac8d04bd25cb, sha256 locally computed
+md5     c825c7c52b2c79dde73cac8d04bd25cb  PySocks-1.5.6.tar.gz
+sha256  a62b35b13968ba3642a973d115ae6a11be886b5f5ae0841a3ecad4b4f1d7deb1  PySocks-1.5.6.tar.gz
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
new file mode 100644
index 0000000..a556ced
--- /dev/null
+++ b/package/python-pysocks/python-pysocks.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pysocks
+#
+################################################################################
+
+PYTHON_PYSOCKS_VERSION = 1.5.6
+PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
+PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/source/P/PySocks
+PYTHON_PYSOCKS_LICENSE = BSD-3c
+PYTHON_PYSOCKS_LICENSE_FILES = socks.py
+PYTHON_PYSOCKS_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4
