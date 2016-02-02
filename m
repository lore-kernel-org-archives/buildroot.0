From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:45 +0100
Subject: [Buildroot] [PATCH 05/19] python-lmdb: new package
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-6-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                    |  1 +
 package/python-lmdb/Config.in        |  8 ++++++++
 package/python-lmdb/python-lmdb.hash |  3 +++
 package/python-lmdb/python-lmdb.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-lmdb/Config.in
 create mode 100644 package/python-lmdb/python-lmdb.hash
 create mode 100644 package/python-lmdb/python-lmdb.mk

diff --git a/package/Config.in b/package/Config.in
index c4ee543..4294813 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -658,6 +658,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lmdb/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
new file mode 100644
index 0000000..06d6876
--- /dev/null
+++ b/package/python-lmdb/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_LMDB
+	bool "python-lmdb"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Universal Python binding for the LMDB 'Lightning' Database.
+
+	  https://pypi.python.org/pypi/lmdb
+
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
new file mode 100644
index 0000000..c983cfb
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=001817d754f96865549c85fb5251082f, sha256 locally computed.
+md5	001817d754f96865549c85fb5251082f  lmdb-0.88.tar.gz
+sha256	37d97041fb237da5600e14b889af49bd47538d6fde4a69d3a6c9097f787d175a  lmdb-0.88.tar.gz
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
new file mode 100644
index 0000000..7873f62
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-lmdb
+#
+################################################################################
+
+PYTHON_LMDB_VERSION = 0.88
+PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
+PYTHON_LMDB_SITE = http://pypi.python.org/packages/source/l/lmdb
+PYTHON_LMDB_LICENSE = BSD
+PYTHON_LMDB_SETUP_TYPE = setuptools
+PYTHON_LMDB_DEPENDENCIES = python-cffi
+
+$(eval $(python-package))
-- 
2.1.4
