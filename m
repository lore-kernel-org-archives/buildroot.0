From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Sep 2017 08:21:22 +0200
Subject: [Buildroot] [PATCH 1/5] python-simplesqlite: new package
Message-ID: <20170904062126.3274-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                    |  1 +
 package/python-simplesqlite/Config.in                | 16 ++++++++++++++++
 package/python-simplesqlite/python-simplesqlite.hash |  3 +++
 package/python-simplesqlite/python-simplesqlite.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/python-simplesqlite/Config.in
 create mode 100644 package/python-simplesqlite/python-simplesqlite.hash
 create mode 100644 package/python-simplesqlite/python-simplesqlite.mk

diff --git a/package/Config.in b/package/Config.in
index 66ce30701..d926f7e02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -869,6 +869,7 @@ menu "External python modules"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-simplesqlite/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
new file mode 100644
index 000000000..048a2b460
--- /dev/null
+++ b/package/python-simplesqlite/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_SIMPLESQLITE
+	bool "python-simplesqlite"
+	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
+	help
+	  SimpleSQLite is a Python library to simplify SQLite database
+	  operations: table creation, data insertion and get data as other
+	  data formats.
diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
new file mode 100644
index 000000000..b9dc1378c
--- /dev/null
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/simplesqlite/json, sha256 locally computed
+md5	be05735a65f91bf0bb47c2bfcf474dd3  SimpleSQLite-0.15.0.tar.gz
+sha256	319cf4fd660a2a8ba1d77bac65e3cb3bed30ef5e2b2f98aab558026a29bbefec  SimpleSQLite-0.15.0.tar.gz
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
new file mode 100644
index 000000000..48c37c563
--- /dev/null
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simplesqlite
+#
+################################################################################
+
+PYTHON_SIMPLESQLITE_VERSION = 0.15.0
+PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
+PYTHON_SIMPLESQLITE_SITE = https://pypi.python.org/packages/d5/09/e256a7d421c223505d4e89079b4936c6a6de39a5a095ec4bcaa9bfc3f933
+PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
+PYTHON_SIMPLESQLITE_LICENSE = MIT
+PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
