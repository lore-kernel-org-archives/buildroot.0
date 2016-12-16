From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 16:54:29 +0100
Subject: [Buildroot] [PATCH] python-incremental: new package
Message-ID: <1481903669-14942-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                  |  1 +
 package/python-incremental/Config.in               |  6 ++++++
 package/python-incremental/python-incremental.hash |  3 +++
 package/python-incremental/python-incremental.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-incremental/Config.in
 create mode 100644 package/python-incremental/python-incremental.hash
 create mode 100644 package/python-incremental/python-incremental.mk

diff --git a/package/Config.in b/package/Config.in
index 6fb1565..17a7e1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -693,6 +693,7 @@ menu "External python modules"
 	source "package/python-humanize/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
+	source "package/python-incremental/Config.in"
 	source "package/python-iniparse/Config.in"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
diff --git a/package/python-incremental/Config.in b/package/python-incremental/Config.in
new file mode 100644
index 0000000..64f8623
--- /dev/null
+++ b/package/python-incremental/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_INCREMENTAL
+	bool "python-incremental"
+	help
+	  A library for versioning your Python projects.
+
+	  https://github.com/hawkowl/incremental
diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
new file mode 100644
index 0000000..580e76c
--- /dev/null
+++ b/package/python-incremental/python-incremental.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/incremental/json, sha256 locally computed
+md5	3fe6b3b1da1d26a48187fb27e969f072  incremental-16.10.1.tar.gz
+sha256	14ad6b720ec47aad6c9caa83e47db1843e2b9b98742da5dda08e16a99f400342  incremental-16.10.1.tar.gz
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
new file mode 100644
index 0000000..64eda68
--- /dev/null
+++ b/package/python-incremental/python-incremental.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-incremental
+#
+################################################################################
+
+PYTHON_INCREMENTAL_VERSION = 16.10.1
+PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
+PYTHON_INCREMENTAL_SITE = https://pypi.python.org/packages/da/b0/32233c9e84b0d44b39015fba8fec03e88053723c1b455925081dc6ccd9e7
+PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
+PYTHON_INCREMENTAL_LICENSE = MIT
+PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4
