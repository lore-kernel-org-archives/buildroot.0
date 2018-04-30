From: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
Date: Mon, 30 Apr 2018 12:21:17 +0200
Subject: [Buildroot] [PATCH 1/1] python-influxdb: new
Message-ID: <20180430102117.27271-1-sven.haardiek@iotec-gmbh.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

InfluxDB client.

Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
---
 package/Config.in                            |  1 +
 package/python-influxdb/Config.in            | 10 ++++++++++
 package/python-influxdb/python-influxdb.hash |  5 +++++
 package/python-influxdb/python-influxdb.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-influxdb/Config.in
 create mode 100644 package/python-influxdb/python-influxdb.hash
 create mode 100644 package/python-influxdb/python-influxdb.mk

diff --git a/package/Config.in b/package/Config.in
index d3b67d40de..fe36d31867 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -807,6 +807,7 @@ menu "External python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-incremental/Config.in"
+	source "package/python-influxdb/Config.in"
 	source "package/python-iniparse/Config.in"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
diff --git a/package/python-influxdb/Config.in b/package/python-influxdb/Config.in
new file mode 100644
index 0000000000..a848e4f2ae
--- /dev/null
+++ b/package/python-influxdb/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_INFLUXDB
+	bool "python-influxdb"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  InfluxDB client.
+
+	  https://github.com/influxdb/influxdb-python
diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
new file mode 100644
index 0000000000..28f2825c95
--- /dev/null
+++ b/package/python-influxdb/python-influxdb.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/influxdb/json
+md5	dec1e6fe9770c36290d38fb2a37fba25  influxdb-5.0.0.tar.gz
+sha256	6adba2ddfd5781a06b5204339e679d66645bf6cc2b7f493eb9d7c8986d714e80  influxdb-5.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	70146f78d168b33ac5903490a918469e22a801a8d3a81103f3d8706dc0024c9a  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
new file mode 100644
index 0000000000..1571cbd47a
--- /dev/null
+++ b/package/python-influxdb/python-influxdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-influxdb
+#
+################################################################################
+
+PYTHON_INFLUXDB_VERSION = 5.0.0
+PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/95/26/33e7b85b72a0df2dc00af4c1b9f5df3e7d0aea29ae4f8f65a83f7024c4e2
+PYTHON_INFLUXDB_SETUP_TYPE = setuptools
+PYTHON_INFLUXDB_LICENSE = MIT
+PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0
