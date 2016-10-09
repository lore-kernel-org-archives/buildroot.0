From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Oct 2016 10:04:30 +0200
Subject: [Buildroot] [PATCH v3 02/10] package/python-couchdb: new package
In-Reply-To: <20161009080438.4976-1-bernd.kuhls@t-online.de>
References: <20161009080438.4976-1-bernd.kuhls@t-online.de>
Message-ID: <20161009080438.4976-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by upcoming python-mwscrape package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: added SSL runtime dependency
v2: fix license, clarify in help text that this module provides a
    CouchDB client, the server can run on a remote machine (Thomas)

 package/Config.in                          |  1 +
 package/python-couchdb/Config.in           |  8 ++++++++
 package/python-couchdb/python-couchdb.hash |  3 +++
 package/python-couchdb/python-couchdb.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-couchdb/Config.in
 create mode 100644 package/python-couchdb/python-couchdb.hash
 create mode 100644 package/python-couchdb/python-couchdb.mk

diff --git a/package/Config.in b/package/Config.in
index 852aa50..738f930 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -657,6 +657,7 @@ menu "External python modules"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
+	source "package/python-couchdb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crossbar/Config.in"
diff --git a/package/python-couchdb/Config.in b/package/python-couchdb/Config.in
new file mode 100644
index 0000000..9156883
--- /dev/null
+++ b/package/python-couchdb/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_COUCHDB
+	bool "python-couchdb"
+	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Python client library for working with CouchDB.
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
index 0000000..c88787c
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
+PYTHON_COUCHDB_LICENSE = BSD-3c
+PYTHON_COUCHDB_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.9.3
