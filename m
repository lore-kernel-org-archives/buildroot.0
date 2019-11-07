From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu,  7 Nov 2019 18:05:03 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/python-pyaes: new package
Message-ID: <20191107170504.1327891-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pyaes/Config.in         |  7 +++++++
 package/python-pyaes/python-pyaes.hash |  5 +++++
 package/python-pyaes/python-pyaes.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-pyaes/Config.in
 create mode 100644 package/python-pyaes/python-pyaes.hash
 create mode 100644 package/python-pyaes/python-pyaes.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 33273ce6c8..e9f5345520 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -258,6 +258,7 @@ F:	package/orbit/
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
+F:	package/python-pyaes
 
 N:	Bartosz Golaszewski <brgl@bgdev.pl>
 F:	package/autoconf-archive/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..8b554e46d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1006,6 +1006,7 @@ menu "External python modules"
 	source "package/python-ptyprocess/Config.in"
 	source "package/python-pudb/Config.in"
 	source "package/python-py/Config.in"
+	source "package/python-pyaes/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pyasn1/Config.in"
diff --git a/package/python-pyaes/Config.in b/package/python-pyaes/Config.in
new file mode 100644
index 0000000000..629fd82801
--- /dev/null
+++ b/package/python-pyaes/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYAES
+	bool "python-pyaes"
+	help
+	  Pure-Python Implementation of the AES block-cipher and
+	  common modes of operation.
+
+	  https://github.com/ricmoo/pyaes
diff --git a/package/python-pyaes/python-pyaes.hash b/package/python-pyaes/python-pyaes.hash
new file mode 100644
index 0000000000..25a15f1e19
--- /dev/null
+++ b/package/python-pyaes/python-pyaes.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyaes/json
+md5	20fd5c6e29dcfdd08098e85a859a54ec  pyaes-1.6.1.tar.gz
+sha256	02c1b1405c38d3c370b085fb952dd8bea3fadcee6411ad99f312cc129c536d8f  pyaes-1.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256	1efe6c78b28b4203d397ea9b68bdc9c658d21cd9afaf8ae8223def83f2a7ebbd  LICENSE.txt
diff --git a/package/python-pyaes/python-pyaes.mk b/package/python-pyaes/python-pyaes.mk
new file mode 100644
index 0000000000..a738d3c76a
--- /dev/null
+++ b/package/python-pyaes/python-pyaes.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyaes
+#
+################################################################################
+
+PYTHON_PYAES_VERSION = 1.6.1
+PYTHON_PYAES_SOURCE = pyaes-$(PYTHON_PYAES_VERSION).tar.gz
+PYTHON_PYAES_SITE = https://files.pythonhosted.org/packages/44/66/2c17bae31c906613795711fc78045c285048168919ace2220daa372c7d72
+PYTHON_PYAES_SETUP_TYPE = distutils
+PYTHON_PYAES_LICENSE = MIT
+PYTHON_PYAES_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.24.0
