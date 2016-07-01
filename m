From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 17:37:33 +0200
Subject: [Buildroot] [git commit] python-xlutils: new package
Message-ID: <20160701153805.2DAB58079C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a17720cbdb85796933f4a27dce807e75756c785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-xlutils/Config.in           |  9 +++++++++
 package/python-xlutils/python-xlutils.hash |  4 ++++
 package/python-xlutils/python-xlutils.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e230df4..26e2059 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -788,6 +788,7 @@ menu "External python modules"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
+	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
diff --git a/package/python-xlutils/Config.in b/package/python-xlutils/Config.in
new file mode 100644
index 0000000..9c12d76
--- /dev/null
+++ b/package/python-xlutils/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_XLUTILS
+	bool "python-xlutils"
+	select BR2_PACKAGE_PYTHON_XLRD # runtime
+	select BR2_PACKAGE_PYTHON_XLWT # runtime
+	help
+	  Utilities for working with Excel files that require both
+	  xlrd and xlwt.
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
