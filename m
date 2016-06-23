From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 23 Jun 2016 10:56:34 +0200
Subject: [Buildroot] [PATCH 3/3] python-xlutils: new package
In-Reply-To: <1466672194-8423-1-git-send-email-yegorslists@googlemail.com>
References: <1466672194-8423-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1466672194-8423-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-xlutils/Config.in           |  9 +++++++++
 package/python-xlutils/python-xlutils.hash |  4 ++++
 package/python-xlutils/python-xlutils.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-xlutils/Config.in
 create mode 100644 package/python-xlutils/python-xlutils.hash
 create mode 100644 package/python-xlutils/python-xlutils.mk

diff --git a/package/Config.in b/package/Config.in
index 61d1d26..8328d9e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -778,6 +778,7 @@ menu "External python modules"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
+	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
diff --git a/package/python-xlutils/Config.in b/package/python-xlutils/Config.in
new file mode 100644
index 0000000..7788612
--- /dev/null
+++ b/package/python-xlutils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_XLUTILS
+	bool "python-xlutils"
+	select BR2_PACKAGE_PYTHON_XLRD # runtime
+	select BR2_PACKAGE_PYTHON_XLWT # runtime
+	help
+	  Utilities for working with Excel files that require both xlrd and
+	  xlwt.
+
+	  http://www.python-excel.org
diff --git a/package/python-xlutils/python-xlutils.hash b/package/python-xlutils/python-xlutils.hash
new file mode 100644
index 0000000..4f99860
--- /dev/null
+++ b/package/python-xlutils/python-xlutils.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/xlutils/json
+md5	7a6a339ddaacabce244341582ee61353  xlutils-2.0.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54  xlutils-2.0.0.tar.gz
diff --git a/package/python-xlutils/python-xlutils.mk b/package/python-xlutils/python-xlutils.mk
new file mode 100644
index 0000000..fc26b3c
--- /dev/null
+++ b/package/python-xlutils/python-xlutils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xlutils
+#
+################################################################################
+
+PYTHON_XLUTILS_VERSION = 2.0.0
+PYTHON_XLUTILS_SOURCE = xlutils-$(PYTHON_XLUTILS_VERSION).tar.gz
+PYTHON_XLUTILS_SITE = https://pypi.python.org/packages/93/fe/af6d73e4bc7b0ce359d34bebb2e8d4d129763acfecd66a3a7efc587e54c9
+PYTHON_XLUTILS_SETUP_TYPE = setuptools
+PYTHON_XLUTILS_LICENSE = MIT
+PYTHON_XLUTILS_LICENSE_FILES = xlutils/license.txt
+
+$(eval $(python-package))
-- 
2.1.4
