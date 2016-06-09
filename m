From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:38:23 +0200
Subject: [Buildroot] [git commit] python-pathvalidate: new package
Message-ID: <20160609083947.EDD7480163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac72010d3c6237e57ab4ff1ef8710e0f41fd3351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                    |  1 +
 package/python-pathvalidate/Config.in                |  8 ++++++++
 package/python-pathvalidate/python-pathvalidate.hash |  4 ++++
 package/python-pathvalidate/python-pathvalidate.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d4662f6..fa269d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "External python modules"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
 	source "package/python-pathtools/Config.in"
+	source "package/python-pathvalidate/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
new file mode 100644
index 0000000..d70e34a
--- /dev/null
+++ b/package/python-pathvalidate/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PATHVALIDATE
+	bool "python-pathvalidate"
+	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	help
+	  pathvalidate is a python library to validate/sanitize a string
+	  such as filename/variable-name.
+
+	  https://github.com/thombashi/pathvalidate
diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
new file mode 100644
index 0000000..e1395ac
--- /dev/null
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pathvalidate/json
+md5	e53ca2293a6602e003e11bcf88baecad  pathvalidate-0.4.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	0d7b60327ee49a7d5cc3f7d7f8e3b6b6fe6cd3e2bde5e13e2c6ecabcc5022fa4  pathvalidate-0.4.1.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
new file mode 100644
index 0000000..de47455
--- /dev/null
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pathvalidate
+#
+################################################################################
+
+PYTHON_PATHVALIDATE_VERSION = 0.4.1
+PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/e4/68/831a61ad8c7f7b8340fe651aa189591a7ebbcda1456782d4c37d40f229c1
+PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
+PYTHON_PATHVALIDATE_LICENSE = MIT
+PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
