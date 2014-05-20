From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Tue, 20 May 2014 13:53:00 +1200
Subject: [Buildroot] [PATCH 3/3] python: new module cffi
In-Reply-To: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <1400550780-16669-3-git-send-email-oli.vogt.pub01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Foreign Function Interface for Python calling C code.

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
---
 package/Config.in                  |  1 +
 package/python-cffi/Config.in      | 11 +++++++++++
 package/python-cffi/python-cffi.mk | 13 +++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-cffi/Config.in
 create mode 100644 package/python-cffi/python-cffi.mk

diff --git a/package/Config.in b/package/Config.in
index 9c61485..60bdbf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,6 +441,7 @@ source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 source "package/python-bottle/Config.in"
+source "package/python-cffi/Config.in"
 source "package/python-configobj/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dialog/Config.in"
diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
new file mode 100644
index 0000000..7967e8a
--- /dev/null
+++ b/package/python-cffi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_CFFI
+	bool "python-cffi"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This is the Foreign Function Interface for Python calling C code.
+	  The aim of this project is to provide a convenient and
+	  reliable way of calling C code from Python.
+
+	  Not tested with Python-3
+
+	  https://pypi.python.org/pypi/cffi
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
new file mode 100644
index 0000000..10bf535
--- /dev/null
+++ b/package/python-cffi/python-cffi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-cffi
+#
+################################################################################
+
+PYTHON_CFFI_VERSION = 0.8.2
+PYTHON_CFFI_SOURCE  = cffi-$(PYTHON_CFFI_VERSION).tar.gz
+PYTHON_CFFI_SITE    = https://pypi.python.org/packages/source/c/cffi/
+PYTHON_CFFI_SETUP_TYPE = setuptools
+PYTHON_CFFI_LICENSE = MIT
+
+$(eval $(python-package))
-- 
1.9.1
