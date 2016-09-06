From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 23:28:11 +0200
Subject: [Buildroot] [git commit] package/leveldb: bump version to 1.19
Message-ID: <20160906213028.B990B819E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ddb8b720c45eedcc4759e029c6b8f2e4d9aaf4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased 0002-Add-install-recipe.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leveldb/0002-Add-install-recipe.patch | 8 ++++----
 package/leveldb/leveldb.hash                  | 2 +-
 package/leveldb/leveldb.mk                    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/leveldb/0002-Add-install-recipe.patch b/package/leveldb/0002-Add-install-recipe.patch
index 38c2ca8..8645a64 100644
--- a/package/leveldb/0002-Add-install-recipe.patch
+++ b/package/leveldb/0002-Add-install-recipe.patch
@@ -15,10 +15,10 @@ diff --git a/Makefile b/Makefile
 index 2bd2cad..530f2c3 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -225,3 +225,19 @@ else
- .c.o:
- 	$(CC) $(CFLAGS) -c $< -o $@
- endif
+@@ -412,3 +412,19 @@ else
+ 
+ $(SHARED_OUTDIR)/%.o: %.c
+ 	$(CC) $(CFLAGS) $(PLATFORM_SHARED_CFLAGS) -c $< -o $@
 +
 +INSTALL_ROOT = /
 +INSTALL_PREFIX= usr/local
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index 1f83e6e..4af30fb 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4aa1a7479bc567b95a59ac6fb79eba49f61884d6fd400f20b7af147d54c5cee5  leveldb-v1.18.tar.gz
+sha256 7d7a14ae825e66aabeb156c1c3fae9f9a76d640ef6b40ede74cc73da937e5202  leveldb-v1.19.tar.gz
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index e2c267b..2ce3e4a 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = v1.18
+LEVELDB_VERSION = v1.19
 LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3c
 LEVELDB_LICENSE_FILES = LICENSE
