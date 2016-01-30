From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 30 Jan 2016 23:46:10 +0100
Subject: [Buildroot] [PATCH v2 2/2] crudini: new package
In-Reply-To: <1454193970-22544-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1454193970-22544-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <1454193970-22544-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
Changes v1 -> v2:
  - add sha256 hash
  - whitespace and line length fixes
  - indicate in comment that python-configobj is runtime dependency
---
 package/Config.in            |  1 +
 package/crudini/Config.in    | 10 ++++++++++
 package/crudini/crudini.hash |  3 +++
 package/crudini/crudini.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
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
index 0000000..8a70016
--- /dev/null
+++ b/package/crudini/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CRUDINI
+	bool "crudini"
+	depends on BR2_PACKAGE_PYTHON
+	# runtime dependency:
+	select BR2_PACKAGE_PYTHON_INIPARSE
+	help
+	  A utility for handling ini files from the command line and
+	  shell scripts
+
+	  https://pypi.python.org/pypi/crudini
diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
new file mode 100644
index 0000000..b9aaecf
--- /dev/null
+++ b/package/crudini/crudini.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7d1313f1bb9800db9cbceaa518bcf212, sha256 locally computed
+md5    7d1313f1bb9800db9cbceaa518bcf212 crudini-0.7.tar.gz
+sha256 5d493ae6600e54f9e0296b12d3adba99b88a439d8c4b2ebf9bc6f9c0613a03d7  crudini-0.7.tar.gz
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
