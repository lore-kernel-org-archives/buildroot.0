From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Sep 2017 16:18:59 +0200
Subject: [Buildroot] [PATCH] python-aiocoap: new package
Message-ID: <20170913141859.16616-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-aiocoap/Config.in           |  7 +++++++
 package/python-aiocoap/python-aiocoap.hash |  4 ++++
 package/python-aiocoap/python-aiocoap.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-aiocoap/Config.in
 create mode 100644 package/python-aiocoap/python-aiocoap.hash
 create mode 100644 package/python-aiocoap/python-aiocoap.mk

diff --git a/package/Config.in b/package/Config.in
index 48d1381921..5797018a52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -691,6 +691,7 @@ endif
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
+	source "package/python-aiocoap/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiocoap/Config.in b/package/python-aiocoap/Config.in
new file mode 100644
index 0000000000..cf5ca4e844
--- /dev/null
+++ b/package/python-aiocoap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOCOAP
+	bool "python-aiocoap"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Python CoAP library.
+
+	  https://github.com/chrysn/aiocoap
diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
new file mode 100644
index 0000000000..6df482aa68
--- /dev/null
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/aiocoap/json, sha256 locally computed
+md5	f5fed00767b4197f2fbaa0ff95cbbf78  aiocoap-0.3.tar.gz
+sha256	402d4151db6d8d0b1d66af5b6e10e0de1521decbf12140637e5b8d2aa9c5aef6  aiocoap-0.3.tar.gz
+sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
new file mode 100644
index 0000000000..a2db70b803
--- /dev/null
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiocoap
+#
+################################################################################
+
+PYTHON_AIOCOAP_VERSION = 0.3
+PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
+PYTHON_AIOCOAP_SITE = https://pypi.python.org/packages/9c/f6/d839e4b14258d76e74a39810829c13f8dd31de2bfe0915579b2a609d1bbe
+PYTHON_AIOCOAP_SETUP_TYPE = setuptools
+PYTHON_AIOCOAP_LICENSE = MIT
+PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
