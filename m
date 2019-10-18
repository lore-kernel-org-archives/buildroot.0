From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.11.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-23-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update dependency list.
* Add hash for license file.
* The package now supports both Python 2 and Python 3.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-thrift/Config.in          | 2 +-
 package/python-thrift/python-thrift.hash | 8 +++++---
 package/python-thrift/python-thrift.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-thrift/Config.in b/package/python-thrift/Config.in
index 20d94d0c6e..1ecfda357b 100644
--- a/package/python-thrift/Config.in
+++ b/package/python-thrift/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_THRIFT
 	bool "python-thrift"
-	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  python-thrift is a Python bindings for the Apache Thrift RPC
 	  system.
diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 72269eb836..56d99f2a54 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/thrift/json, sha256 locally computed
-md5	b519551d7a086bb0b4f222a8f566b7e8  thrift-0.9.3.tar.gz
-sha256	dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e  thrift-0.9.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/thrift/json
+md5	36165d5c80e6b101dbe9fcf7ef524d51  thrift-0.11.0.tar.gz
+sha256	7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8806e6b  thrift-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256	6a62a493bd7c741378619ff61c56282d64f3ad033dc8154b67c808311960bb02  setup.py
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index d0e3a14685..21f2355f63 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.9.3
+PYTHON_THRIFT_VERSION = 0.11.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://pypi.python.org/packages/ae/58/35e3f0cd290039ff862c2c9d8ae8a76896665d70343d833bdc2f748b8e55
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/c6/b4/510617906f8e0c5660e7d96fbc5585113f83ad547a3989b80297ac72a74c
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = setup.py
 PYTHON_THRIFT_SETUP_TYPE = setuptools
-- 
2.20.1
