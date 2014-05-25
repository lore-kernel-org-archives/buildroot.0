From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Sun, 25 May 2014 20:24:17 +1200
Subject: [Buildroot] [PATCH 1/3] python: new module flup
Message-ID: <1401006257-10688-1-git-send-email-oli.vogt.pub01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module is useful to implement a fastCGI webserver
Tested with ARM and Python 2.7.6

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
---
 package/Config.in                  |  1 +
 package/python-flup/Config.in      |  9 +++++++++
 package/python-flup/python-flup.mk | 15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-flup/Config.in
 create mode 100644 package/python-flup/python-flup.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..9c61485 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ source "package/python-configobj/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
+source "package/python-flup/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-flup/Config.in b/package/python-flup/Config.in
new file mode 100644
index 0000000..2c21323
--- /dev/null
+++ b/package/python-flup/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FLUP
+	bool "python-flup"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  flup provides of a collection of WSGI modules for Python.
+	  It allows a webserver to use scgi-mod and fastcgi-mod
+	  with python.
+
+	  https://pypi.python.org/pypi/flup
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
new file mode 100644
index 0000000..4f021d5
--- /dev/null
+++ b/package/python-flup/python-flup.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-flup
+#
+################################################################################
+
+PYTHON_FLUP_VERSION = 1.0.3.dev-20110405
+PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
+PYTHON_FLUP_SITE = http://pypi.python.org/packages/source/f/flup
+
+PYTHON_FLUP_LICENSE = BSD-4c, MIT
+
+PYTHON_FLUP_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.9.1
