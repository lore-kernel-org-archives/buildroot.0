From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Feb 2020 17:44:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: add gflags optional
 dependency
Message-ID: <20200214164410.2901412-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rocksdb/rocksdb.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index e2a72b4dbe..8109605916 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -19,6 +19,13 @@ else
 ROCKSDB_CONF_OPTS += ROCKSDB_DISABLE_BZ2=1
 endif
 
+ifeq ($(BR2_PACKAGE_GFLAGS),y)
+ROCKSDB_DEPENDENCIES += gflags
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_GFLAGS=0
+else
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_GFLAGS=1
+endif
+
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 ROCKSDB_DEPENDENCIES += jemalloc
 ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_JEMALLOC=0
-- 
2.24.1
