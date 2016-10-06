From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:41 +0200
Subject: [Buildroot] [PATCH 14/21] package/python-thrift: bump version to
	0.9.3
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PYTHON_THRIFT_SUBDIR is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-thrift/python-thrift.hash | 5 +++--
 package/python-thrift/python-thrift.mk   | 7 +++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 811aa98..72269eb 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,2 +1,3 @@
-# From https://www.apache.org/dist/thrift/0.9.2/thrift-0.9.2.tar.gz.md5
-md5	89f63cc4d0100912f4a1f8a9dee63678	thrift-0.9.2.tar.gz
+# md5 from https://pypi.python.org/pypi/thrift/json, sha256 locally computed
+md5	b519551d7a086bb0b4f222a8f566b7e8  thrift-0.9.3.tar.gz
+sha256	dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e  thrift-0.9.3.tar.gz
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 99641b8..d0e3a14 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.9.2
+PYTHON_THRIFT_VERSION = 0.9.3
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(PYTHON_THRIFT_VERSION)
+PYTHON_THRIFT_SITE = https://pypi.python.org/packages/ae/58/35e3f0cd290039ff862c2c9d8ae8a76896665d70343d833bdc2f748b8e55
 PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = LICENSE
+PYTHON_THRIFT_LICENSE_FILES = setup.py
 PYTHON_THRIFT_SETUP_TYPE = setuptools
-PYTHON_THRIFT_SUBDIR = lib/py
 
 $(eval $(python-package))
-- 
2.9.3
