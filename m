From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:49 +0300
Subject: [Buildroot] [PATCH 07/23] python-lmdb: bump to version 0.94
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-8-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 7 +++++--
 package/python-lmdb/python-lmdb.mk   | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 7c2946044d..ed96d69545 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,2 +1,5 @@
-# Locally calculated
-sha256	abd2b2ae9ecf2fd1e1bc55ef4e8463b5910722fcd70a1bbf34a3e669a74a41a4 python-lmdb-py-lmdb_0.89.tar.gz
+# md5, sha256 from https://pypi.org/pypi/lmdb/json
+md5	57216cb8fba7aed91ceba5a69d359939  lmdb-0.94.tar.gz
+sha256	9c2b7f05c26b2c95d6f3a566314feefe2dc64ecec6c50242a932703cf74303fe  lmdb-0.94.tar.gz
+# Locally computed sha256 checksums
+sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 62fb0465b1..039656e2c1 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = py-lmdb_0.89
-PYTHON_LMDB_SITE = $(call github,dw,py-lmdb,$(PYTHON_LMDB_VERSION))
+PYTHON_LMDB_VERSION = 0.94
+PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/cb/31/5be8f436b56733d9e69c721c358502f4d77b627489a459978686be7db65f
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.17.1
