From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 24 Jan 2016 01:15:04 +0100
Subject: [Buildroot] [PATCH 2/2] crudini: new package
In-Reply-To: <1453594504-8725-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1453594504-8725-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1453594504-8725-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in            |  1 +
 package/crudini/Config.in    |  8 ++++++++
 package/crudini/crudini.hash |  2 ++
 package/crudini/crudini.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/crudini/Config.in
 create mode 100644 package/crudini/crudini.hash
 create mode 100644 package/crudini/crudini.mk

diff --git a/package/Config.in b/package/Config.in
index a339161..22f5dcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1525,6 +1525,7 @@ endif
 comment "Utilities"
 	source "package/at/Config.in"
 	source "package/ccrypt/Config.in"
+	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/file/Config.in"
diff --git a/package/crudini/Config.in b/package/crudini/Config.in
new file mode 100644
index 0000000..c677f3b
--- /dev/null
+++ b/package/crudini/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CRUDINI
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_INIPARSE
+	bool "crudini"
+	help
+	  A utility for handling ini files from the command line and shell scripts
+
+	  https://pypi.python.org/pypi/crudini
diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
new file mode 100644
index 0000000..04e2575
--- /dev/null
+++ b/package/crudini/crudini.hash
@@ -0,0 +1,2 @@
+#md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d1313f1bb9800db9cbceaa518bcf212
+md5    7d1313f1bb9800db9cbceaa518bcf212 crudini-0.7.tar.gz
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
new file mode 100644
index 0000000..d797efc
--- /dev/null
+++ b/package/crudini/crudini.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# crudini
+#
+################################################################################
+
+CRUDINI_VERSION = 0.7
+CRUDINI_SOURCE = crudini-$(CRUDINI_VERSION).tar.gz
+CRUDINI_SITE = https://pypi.python.org/packages/source/c/crudini
+CRUDINI_SETUP_TYPE = setuptools
+CRUDINI_LICENSE = GPLv2
+CRUDINI_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
1.9.1
