From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 06:48:54 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-couchdb: new package
Message-ID: <20161006044858.27768-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                          |  1 +
 package/python-couchdb/Config.in           |  6 ++++++
 package/python-couchdb/python-couchdb.hash |  3 +++
 package/python-couchdb/python-couchdb.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-couchdb/Config.in
 create mode 100644 package/python-couchdb/python-couchdb.hash
 create mode 100644 package/python-couchdb/python-couchdb.mk

diff --git a/package/Config.in b/package/Config.in
index 26fcc31..c7f29e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ menu "External python modules"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
+	source "package/python-couchdb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crossbar/Config.in"
diff --git a/package/python-couchdb/Config.in b/package/python-couchdb/Config.in
new file mode 100644
index 0000000..5b1937f
--- /dev/null
+++ b/package/python-couchdb/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_COUCHDB
+	bool "python-couchdb"
+	help
+	  Python library for working with CouchDB.
+
+	  https://github.com/djc/couchdb-python/
diff --git a/package/python-couchdb/python-couchdb.hash b/package/python-couchdb/python-couchdb.hash
new file mode 100644
index 0000000..f9422a8
--- /dev/null
+++ b/package/python-couchdb/python-couchdb.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/couchdb/json, sha256 locally computed
+md5	2ed5ad2a477fd3cb472ed6dc5a381ff3  CouchDB-1.1.tar.gz
+sha256	9503ea413956c33b5e2af248235afb5e0f011f33f816a32e872f8ff9b0a0e710  CouchDB-1.1.tar.gz
diff --git a/package/python-couchdb/python-couchdb.mk b/package/python-couchdb/python-couchdb.mk
new file mode 100644
index 0000000..62dfb7f
--- /dev/null
+++ b/package/python-couchdb/python-couchdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-couchdb
+#
+################################################################################
+
+PYTHON_COUCHDB_VERSION = 1.1
+PYTHON_COUCHDB_SOURCE = CouchDB-$(PYTHON_COUCHDB_VERSION).tar.gz
+PYTHON_COUCHDB_SITE = https://pypi.python.org/packages/9a/e8/c3c8da6d00145aaca07f2b784794917613dad26532068da4e8392dc48d7f
+PYTHON_COUCHDB_SETUP_TYPE = setuptools
+PYTHON_COUCHDB_LICENSE = BSD
+PYTHON_COUCHDB_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.9.3
