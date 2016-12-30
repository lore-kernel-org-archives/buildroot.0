From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 30 Dec 2016 08:52:19 +0100
Subject: [Buildroot] [PATCH] python-pudb: new package
Message-ID: <1483084339-8656-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |  1 +
 package/python-pudb/Config.in        | 11 +++++++++++
 package/python-pudb/python-pudb.hash |  3 +++
 package/python-pudb/python-pudb.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-pudb/Config.in
 create mode 100644 package/python-pudb/python-pudb.hash
 create mode 100644 package/python-pudb/python-pudb.mk

diff --git a/package/Config.in b/package/Config.in
index f2103b5..32e2dfb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "External python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-ptyprocess/Config.in"
+	source "package/python-pudb/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pycli/Config.in"
diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
new file mode 100644
index 0000000..d4a4f73
--- /dev/null
+++ b/package/python-pudb/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PUDB
+	bool "python-pudb"
+	select BR2_PACKAGE_PYTHON_URWID # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  A full-screen, console-based Python debugger.
+
+	  https://github.com/inducer/pudb
diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
new file mode 100644
index 0000000..b06d5e8
--- /dev/null
+++ b/package/python-pudb/python-pudb.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pudb/json, sha256 locally computed
+md5	4573b70163329c1cb59836a357bfdf7c  pudb-2016.2.tar.gz
+sha256	e958d7f7b1771cf297714e95054075df3b2a47455d7a740be4abbbd41289505a  pudb-2016.2.tar.gz
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
new file mode 100644
index 0000000..5349c1e
--- /dev/null
+++ b/package/python-pudb/python-pudb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pudb
+#
+################################################################################
+
+PYTHON_PUDB_VERSION = 2016.2
+PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
+PYTHON_PUDB_SITE = https://pypi.python.org/packages/50/1a/d9b692e32afff09ccb5aa33c3d51c6d5a80efbb59de90307b33601e7fa62
+PYTHON_PUDB_SETUP_TYPE = setuptools
+PYTHON_PUDB_LICENSE = MIT
+PYTHON_PUDB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4
