From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 21:56:42 +0100
Subject: [Buildroot] [git commit] python-lmdb: new package
Message-ID: <20160302202753.10E607FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a19359bf8218646f7b08b34f18896364e40c2ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - switch to Github, which has a LICENSE file. The issue was reported
   upstream: https://github.com/dw/py-lmdb/issues/108. Then added the
   <pkg>_LICENSE_FILES variable.
 - bump version to 0.89 (instead of 0.88)
 - indicate the proper license, following the SPDX code for the
   OpenLDAP 2.8 license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-lmdb/Config.in        |  7 +++++++
 package/python-lmdb/python-lmdb.hash |  2 ++
 package/python-lmdb/python-lmdb.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9199aea..b69a481 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -659,6 +659,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lmdb/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
new file mode 100644
index 0000000..baf9bce
--- /dev/null
+++ b/package/python-lmdb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LMDB
+	bool "python-lmdb"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Universal Python binding for the LMDB 'Lightning' Database.
+
+	  https://pypi.python.org/pypi/lmdb
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
new file mode 100644
index 0000000..7c29460
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	abd2b2ae9ecf2fd1e1bc55ef4e8463b5910722fcd70a1bbf34a3e669a74a41a4 python-lmdb-py-lmdb_0.89.tar.gz
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
new file mode 100644
index 0000000..62fb046
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-lmdb
+#
+################################################################################
+
+PYTHON_LMDB_VERSION = py-lmdb_0.89
+PYTHON_LMDB_SITE = $(call github,dw,py-lmdb,$(PYTHON_LMDB_VERSION))
+PYTHON_LMDB_LICENSE = OLDAP-2.8
+PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_SETUP_TYPE = setuptools
+PYTHON_LMDB_DEPENDENCIES = host-python-cffi
+
+$(eval $(python-package))
