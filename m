From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sun, 26 Jul 2015 14:12:18 +0200
Subject: [Buildroot] [PATCH 2/2] Add pycli package
In-Reply-To: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
References: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
Message-ID: <1437912738-24116-2-git-send-email-geoffrey.ragot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-pycli/Config.in       |  4 ++++
 package/python-pycli/python-pycli.mk | 15 +++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-pycli/Config.in
 create mode 100644 package/python-pycli/python-pycli.mk

diff --git a/package/Config.in b/package/Config.in
index 8bc27a4..06a4326 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ menu "external python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
+	source "package/python-pycli/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
new file mode 100644
index 0000000..a4f157e
--- /dev/null
+++ b/package/python-pycli/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_PYTHON_PYCLI
+	bool "python-pycli"
+	help
+	  The cli package is a framework for making simple, correct command line applications in Python.
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
new file mode 100644
index 0000000..6857425
--- /dev/null
+++ b/package/python-pycli/python-pycli.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pycli
+#
+################################################################################
+
+PYTHON_PYCLI_VERSION = devel
+PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
+PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI/
+PYTHON_PYCLI_SETUP_TYPE = distutils
+PYTHON_PYCLI_LICENSE = Python software foundation license v2
+PYTHON_PYCLI_LICENSE_FILES = LICENSE
+PYTHON_PYCLI_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.4.6
