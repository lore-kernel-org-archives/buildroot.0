From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:28:12 +0100
Subject: [Buildroot] [git commit] crudini: new package
Message-ID: <20160302202756.0A02C80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b62b1b45a8364801b46569b5d3fd4ae489f76b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/crudini/Config.in    |  9 +++++++++
 package/crudini/crudini.hash |  3 +++
 package/crudini/crudini.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ba50199..c5442de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1559,6 +1559,7 @@ endif
 comment "Utilities"
 	source "package/at/Config.in"
 	source "package/ccrypt/Config.in"
+	source "package/crudini/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/file/Config.in"
diff --git a/package/crudini/Config.in b/package/crudini/Config.in
new file mode 100644
index 0000000..e4e26e5
--- /dev/null
+++ b/package/crudini/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CRUDINI
+	bool "crudini"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_INIPARSE # runtime
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
