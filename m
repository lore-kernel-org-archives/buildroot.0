From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 21:45:50 +0200
Subject: [Buildroot] [git commit] package/python-dataproperty: bump to
 version 0.43.1
Message-ID: <20191014195658.4B5AE7F903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a423d2d72a64a2c6fe7ba22570f415c20f6b0f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list.
* Update license hash: same content, line endings are now CRLF.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dataproperty/Config.in                | 6 +++++-
 package/python-dataproperty/python-dataproperty.hash | 9 +++++----
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/python-dataproperty/Config.in b/package/python-dataproperty/Config.in
index 1868709047..2d42b02c6c 100644
--- a/package/python-dataproperty/Config.in
+++ b/package/python-dataproperty/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_DATAPROPERTY
 	bool "python-dataproperty"
-	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  Python library for extract property from data.
diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 0e74acac5a..2a16250650 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/DataProperty/json, sha256 locally computed
-md5	66ecca45ae5e00b2a88799a2795a0cf8  DataProperty-0.29.1.tar.gz
-sha256	3e547003b1af16126ff48b1c284241bc8a46d1e38e334ecd3a5ba87955446806  DataProperty-0.29.1.tar.gz
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+# md5, sha256 from https://pypi.org/pypi/dataproperty/json
+md5	8280a85691959d988e58f52c0ed3d311  DataProperty-0.43.1.tar.gz
+sha256	ac2bc221a53fcd2afa140d1feb45cadbe62b335f667dba1e08e3c43a93339103  DataProperty-0.43.1.tar.gz
+# Locally computed sha256 checksums
+sha256	98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 900cd04608..74eeb859a8 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.29.1
+PYTHON_DATAPROPERTY_VERSION = 0.43.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://pypi.python.org/packages/38/6f/bf65cf1398ca34c709bf14ca9bc33821588498abe50c4652b0d345b9c08c
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/95/68/fb3498145a106f700ff304158b6d0f0c76eb3001ee5129a4f16c9846b338
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
