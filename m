From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  7 Jul 2016 16:31:51 +0200
Subject: [Buildroot] [PATCH] python-dialog3: new package
Message-ID: <1467901911-5054-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Existing python-dialog package supports Python 2 only. For Python 3
another package is required.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-dialog3/Config.in           | 10 ++++++++++
 package/python-dialog3/python-dialog3.hash |  3 +++
 package/python-dialog3/python-dialog3.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-dialog3/Config.in
 create mode 100644 package/python-dialog3/python-dialog3.hash
 create mode 100644 package/python-dialog3/python-dialog3.mk

diff --git a/package/Config.in b/package/Config.in
index a682131..7d6924c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -650,6 +650,7 @@ menu "External python modules"
 	source "package/python-dataproperty/Config.in"
 	source "package/python-dateutil/Config.in"
 	source "package/python-dialog/Config.in"
+	source "package/python-dialog3/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dominate/Config.in"
diff --git a/package/python-dialog3/Config.in b/package/python-dialog3/Config.in
new file mode 100644
index 0000000..cd07608
--- /dev/null
+++ b/package/python-dialog3/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_DIALOG3
+	bool "python-dialog3"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU # dialog
+	select BR2_PACKAGE_DIALOG
+	help
+	  A Python 3 only interface to the UNIX dialog utility and
+	  mostly-compatible programs.
+
+	  http://pythondialog.sourceforge.net/
diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
new file mode 100644
index 0000000..dae863b
--- /dev/null
+++ b/package/python-dialog3/python-dialog3.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pythondialog/json, sha256 locally computed
+md5	3d5ebc33e85f6313964f5eef720dab19  pythondialog-3.4.0.tar.bz2
+sha256  019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe  pythondialog-3.4.0.tar.bz2
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
new file mode 100644
index 0000000..abc4a39
--- /dev/null
+++ b/package/python-dialog3/python-dialog3.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-dialog3
+#
+################################################################################
+
+PYTHON_DIALOG3_VERSION = 3.4.0
+PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.bz2
+PYTHON_DIALOG3_SITE = https://pypi.python.org/packages/fa/f4/686742f01ebb5863d4c5e1acab620acfed0fe97280a26b4ed25917f4f333
+PYTHON_DIALOG3_LICENSE = LGPLv2.1+
+PYTHON_DIALOG3_LICENSE_FILES = COPYING
+PYTHON_DIALOG3_SETUP_TYPE = distutils
+PYTHON_DIALOG3_DEPENDENCIES = dialog
+
+$(eval $(python-package))
-- 
2.8.1
