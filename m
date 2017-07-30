From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jul 2017 16:47:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/leveldb: bump version to 1.20
Message-ID: <20170730144748.9010-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leveldb/0002-Add-install-recipe.patch | 6 ++++--
 package/leveldb/leveldb.hash                  | 2 +-
 package/leveldb/leveldb.mk                    | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/leveldb/0002-Add-install-recipe.patch b/package/leveldb/0002-Add-install-recipe.patch
index f65916f1e..4c0dcb16a 100644
--- a/package/leveldb/0002-Add-install-recipe.patch
+++ b/package/leveldb/0002-Add-install-recipe.patch
@@ -9,6 +9,8 @@ Signed-off-by: Steve James <ste@junkomatic.net>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [baruch: update for v1.19]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[baruch: update for v1.20]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile | 14 ++++++++++++++
  1 file changed, 14 insertions(+)
@@ -19,8 +21,8 @@ index 07a5a1ead6fd..c87023db527a 100644
 +++ b/Makefile
 @@ -412,3 +412,17 @@ $(SHARED_OUTDIR)/%.o: %.cc
  
- $(SHARED_OUTDIR)/%.o: %.c
- 	$(CC) $(CFLAGS) $(PLATFORM_SHARED_CFLAGS) -c $< -o $@
+ $(SHARED_OUTDIR)/port/port_posix_sse.o: port/port_posix_sse.cc
+ 	$(CXX) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(PLATFORM_SSEFLAGS) -c $< -o $@
 +
 +INSTALL_ROOT = /
 +INSTALL_PREFIX= usr/local
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index 4af30fbe6..a5300d7cd 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7d7a14ae825e66aabeb156c1c3fae9f9a76d640ef6b40ede74cc73da937e5202  leveldb-v1.19.tar.gz
+sha256 f5abe8b5b209c2f36560b75f32ce61412f39a2922f7045ae764a2c23335b6664  leveldb-v1.20.tar.gz
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 478f358e8..54942a0f2 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = v1.19
+LEVELDB_VERSION = v1.20
 LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
-- 
2.11.0
