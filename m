From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Mar 2020 16:58:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/rocksdb: fix build without dlfcn.h
In-Reply-To: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
References: <20200328155829.1133494-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328155829.1133494-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rocksdb/rocksdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index 86732ad46c..31a9f98b55 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -70,6 +70,7 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 ROCKSDB_BUILD_TARGETS += static_lib
 ROCKSDB_INSTALL_TARGETS += install-static
+ROCKSDB_EXTRA_CXXFLAGS += -DROCKSDB_NO_DYNAMIC_EXTENSION
 else ifeq ($(BR2_SHARED_LIBS),y)
 ROCKSDB_BUILD_TARGETS += shared_lib
 ROCKSDB_INSTALL_TARGETS += install-shared
-- 
2.25.1
