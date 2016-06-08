From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  8 Jun 2016 15:25:30 +0200
Subject: [Buildroot] [PATCH 2/2] python-dateutil: new package
In-Reply-To: <1465392330-13320-1-git-send-email-yegorslists@googlemail.com>
References: <1465392330-13320-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1465392330-13320-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-dateutil/Config.in            |  7 +++++++
 package/python-dateutil/python-dateutil.hash |  4 ++++
 package/python-dateutil/python-dateutil.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-dateutil/Config.in
 create mode 100644 package/python-dateutil/python-dateutil.hash
 create mode 100644 package/python-dateutil/python-dateutil.mk

diff --git a/package/Config.in b/package/Config.in
index 1337dbc..0cb2e7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,6 +654,7 @@ menu "External python modules"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
+	source "package/python-dateutil/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
diff --git a/package/python-dateutil/Config.in b/package/python-dateutil/Config.in
new file mode 100644
index 0000000..56a1d83
--- /dev/null
+++ b/package/python-dateutil/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DATEUTIL
+	bool "python-dateutil"
+	select BR2_PACKAGE_PYTHON_SIX
+	help
+	  Extensions to the standard Python datetime module.
+
+	  https://dateutil.readthedocs.org
diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
new file mode 100644
index 0000000..9eff016
--- /dev/null
+++ b/package/python-dateutil/python-dateutil.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/python-dateutil/json
+md5	05ffc6d2cc85a7fd93bb245807f715ef  python-dateutil-2.5.3.tar.gz
+# sha256 calculated by scanpypi
+sha256	1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed  python-dateutil-2.5.3.tar.gz
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
new file mode 100644
index 0000000..371788c
--- /dev/null
+++ b/package/python-dateutil/python-dateutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dateutil
+#
+################################################################################
+
+PYTHON_DATEUTIL_VERSION = 2.5.3
+PYTHON_DATEUTIL_SOURCE = python-dateutil-$(PYTHON_DATEUTIL_VERSION).tar.gz
+PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902
+PYTHON_DATEUTIL_SETUP_TYPE = setuptools
+PYTHON_DATEUTIL_LICENSE = BSD-3c
+PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4
