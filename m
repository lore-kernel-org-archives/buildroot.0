From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 26 Jan 2017 16:52:03 +0100
Subject: [Buildroot] [PATCH] python-pyqrcode: new package
Message-ID: <20170126155203.10807-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-pyqrcode/Config.in            | 11 +++++++++++
 package/python-pyqrcode/python-pyqrcode.hash |  3 +++
 package/python-pyqrcode/python-pyqrcode.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-pyqrcode/Config.in
 create mode 100644 package/python-pyqrcode/python-pyqrcode.hash
 create mode 100644 package/python-pyqrcode/python-pyqrcode.mk

diff --git a/package/Config.in b/package/Config.in
index f48b89454..ae35c9b62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -766,6 +766,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
+	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pyqrcode/Config.in b/package/python-pyqrcode/Config.in
new file mode 100644
index 000000000..01b7ae813
--- /dev/null
+++ b/package/python-pyqrcode/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYQRCODE
+	bool "python-pyqrcode"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_CODECSCJK if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_CODECSCJK if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  A QR code generator written purely in Python with SVG, EPS,
+	  PNG and terminal output.
+
+	  https://github.com/mnooner256/pyqrcode
diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
new file mode 100644
index 000000000..619ddb0cc
--- /dev/null
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pyqrcode/json, sha256 locally computed
+md5	371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
+sha256	fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
diff --git a/package/python-pyqrcode/python-pyqrcode.mk b/package/python-pyqrcode/python-pyqrcode.mk
new file mode 100644
index 000000000..67e167a4b
--- /dev/null
+++ b/package/python-pyqrcode/python-pyqrcode.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyqrcode
+#
+################################################################################
+
+PYTHON_PYQRCODE_VERSION = 1.2.1
+PYTHON_PYQRCODE_SOURCE = PyQRCode-$(PYTHON_PYQRCODE_VERSION).tar.gz
+PYTHON_PYQRCODE_SITE = https://pypi.python.org/packages/37/61/f07226075c347897937d4086ef8e55f0a62ae535e28069884ac68d979316
+PYTHON_PYQRCODE_SETUP_TYPE = setuptools
+PYTHON_PYQRCODE_LICENSE = BSD-3c
+PYTHON_PYQRCODE_LICENSE_FILES = setup.py
+
+$(eval $(python-package))
-- 
2.11.0
