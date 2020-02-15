From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:06:13 +0100
Subject: [Buildroot] [git commit] package/rocksdb: add gflags optional
 dependency
Message-ID: <20200215105640.EE8838E094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=589849add79c3c4e15c06fd13012154f550e029b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
