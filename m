From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:25:32 +0200
Subject: [Buildroot] [git commit] python-pysocks: new package
Message-ID: <20160415202639.2402E81838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90fbac29e2d0d87a7e1ae764f05fd18dea04df31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-pysocks/Config.in           |  6 ++++++
 package/python-pysocks/python-pysocks.hash |  3 +++
 package/python-pysocks/python-pysocks.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3ab1813..c1dccfd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -716,6 +716,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pysocks/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
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
