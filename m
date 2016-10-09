From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 10:04:35 +0200
Subject: [Buildroot] [PATCH v3 07/10] package/python-cssutils: new package
In-Reply-To: <20161009080438.4976-1-bernd.kuhls@t-online.de>
References: <20161009080438.4976-1-bernd.kuhls@t-online.de>
Message-ID: <20161009080438.4976-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming python-mwscrape2slob package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial version

 package/Config.in                            |  1 +
 package/python-cssutils/Config.in            |  8 ++++++++
 package/python-cssutils/python-cssutils.hash |  3 +++
 package/python-cssutils/python-cssutils.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-cssutils/Config.in
 create mode 100644 package/python-cssutils/python-cssutils.hash
 create mode 100644 package/python-cssutils/python-cssutils.mk

diff --git a/package/Config.in b/package/Config.in
index bd2a3d8..d81b8e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,7 @@ menu "External python modules"
 	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
+	source "package/python-cssutils/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
diff --git a/package/python-cssutils/Config.in b/package/python-cssutils/Config.in
new file mode 100644
index 0000000..74de742
--- /dev/null
+++ b/package/python-cssutils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CSSUTILS
+	bool "python-cssutils"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  A CSS Cascading Style Sheets library for Python.
+
+	  http://cthedot.de/cssutils/
diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
new file mode 100644
index 0000000..7b188bc
--- /dev/null
+++ b/package/python-cssutils/python-cssutils.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/cssutils/json, sha256 locally computed
+md5	7fcdf2c3e9f053136af1990146eb361d  cssutils-1.0.1.tar.gz
+sha256	d8a18b2848ea1011750231f1dd64fe9053dbec1be0b37563c582561e7a529063  cssutils-1.0.1.tar.gz
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
new file mode 100644
index 0000000..3dd501a
--- /dev/null
+++ b/package/python-cssutils/python-cssutils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cssutils
+#
+################################################################################
+
+PYTHON_CSSUTILS_VERSION = 1.0.1
+PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
+PYTHON_CSSUTILS_SITE = https://pypi.python.org/packages/22/de/6b03e0088baf0299ab7d2e95a9e26c2092e9cb3855876b958b6a62175ca2
+PYTHON_CSSUTILS_LICENSE = LGPLv3+
+PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
+PYTHON_CSSUTILS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.9.3
