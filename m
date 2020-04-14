From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 19:55:49 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to version
 5.3.0
Message-ID: <20200414015549.21132-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of upstream commit 3a5e6219a2b62af076caa4f37fab9258165ec266 msgpack
is now required.

License hash change is due to date update in upstream commit
cf83d1d429ecebb093f6eaab773bd41c251530ca.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-influxdb/Config.in            | 1 +
 package/python-influxdb/python-influxdb.hash | 6 +++---
 package/python-influxdb/python-influxdb.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-influxdb/Config.in b/package/python-influxdb/Config.in
index a848e4f2ae..6ebbd4aa9c 100644
--- a/package/python-influxdb/Config.in
+++ b/package/python-influxdb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_INFLUXDB
 	bool "python-influxdb"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
index d1f25552c7..7b43091eca 100644
--- a/package/python-influxdb/python-influxdb.hash
+++ b/package/python-influxdb/python-influxdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/influxdb/json
-md5	01db77f4ca825d554a78804a4be4a353  influxdb-5.2.3.tar.gz
-sha256	30276c7e04bf7659424c733b239ba2f0804d7a1f3c59ec5dd3f88c56176c8d36  influxdb-5.2.3.tar.gz
+md5  d528c8ccd8ab40bc608ad1e507e7788a  influxdb-5.3.0.tar.gz
+sha256  9bcaafd57ac152b9824ab12ed19f204206ef5df8af68404770554c5b55b475f6  influxdb-5.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	70146f78d168b33ac5903490a918469e22a801a8d3a81103f3d8706dc0024c9a  LICENSE
+sha256  b654917e2c25a69d2bd56e72dddbc6eb29bf7e40384d7c46bb291d5c5185213b  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index 160a9d4136..e5b1aea70f 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLUXDB_VERSION = 5.2.3
+PYTHON_INFLUXDB_VERSION = 5.3.0
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/d2/0d/351a346886ecbe61211cbfcad8ac73f99f5a9bf526916631c5668dbad601
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/be/8d/85ec8f11299a6dfc115244db71fd8f13e9a69f5e9eb77dc3392f4f959e9a
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
-- 
2.20.1
