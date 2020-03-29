From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:49:21 +0200
Subject: [Buildroot] [git commit] package/rocksdb: fix build without dlfcn.h
Message-ID: <20200329133645.3D64988DA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e054d20cbc8ff0da0c5fe189ab5542d2beaeeed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/04c5afff034d8d71d11b95c998e3156292852de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
