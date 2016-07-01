From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 17:31:02 +0200
Subject: [Buildroot] [git commit] python-xlwt: new package
Message-ID: <20160701153324.B129181D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abf0cd28710c0cfecaf59c852f4e49708956a231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-xlwt/Config.in        |  8 ++++++++
 package/python-xlwt/python-xlwt.hash |  4 ++++
 package/python-xlwt/python-xlwt.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f120025..e230df4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -788,6 +788,7 @@ menu "External python modules"
 	source "package/python-wsaccel/Config.in"
 	source "package/python-xlrd/Config.in"
 	source "package/python-xlsxwriter/Config.in"
+	source "package/python-xlwt/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-xlwt/Config.in b/package/python-xlwt/Config.in
new file mode 100644
index 0000000..a48ac6f
--- /dev/null
+++ b/package/python-xlwt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_XLWT
+	bool "python-xlwt"
+	help
+	  Library to create spreadsheet files compatible with MS Excel
+	  97/2000/XP/2003 XLS files, on any platform, with Python 2.6,
+	  2.7, 3.3+.
+
+	  http://www.python-excel.org/
diff --git a/package/python-xlwt/python-xlwt.hash b/package/python-xlwt/python-xlwt.hash
new file mode 100644
index 0000000..4cacf2b
--- /dev/null
+++ b/package/python-xlwt/python-xlwt.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/xlwt/json
+md5	fadf8d1be8c5f071561c4145ed5f5b89  xlwt-1.1.2.tar.gz
+# sha256 calculated by scanpypi
+sha256	aed648c17731f40f84550dd2a1aaa53569f0cbcaf5610ba895cd2632587b723c  xlwt-1.1.2.tar.gz
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
new file mode 100644
index 0000000..38d5f09
--- /dev/null
+++ b/package/python-xlwt/python-xlwt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xlwt
+#
+################################################################################
+
+PYTHON_XLWT_VERSION = 1.1.2
+PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
+PYTHON_XLWT_SITE = https://pypi.python.org/packages/0b/69/644313df86e6375ec2c6b34ec8ac544b9cc7803b7d943223d32811860f3d
+PYTHON_XLWT_SETUP_TYPE = setuptools
+PYTHON_XLWT_LICENSE = BSD-3c, BSD-4c
+PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
+
+$(eval $(python-package))
