From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:51:46 +0100
Subject: [Buildroot] [git commit] icu: bump to version 57.1
Message-ID: <20160324215150.55AFA8190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a360174ffae0a83c3dd254c4ec90c8fa857b0afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch is
upstream so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...llocating-memory-for-pkgDataFlags.-compil.patch | 34 ----------------------
 package/icu/icu.hash                               |  6 ++--
 package/icu/icu.mk                                 |  2 +-
 3 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch b/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch
deleted file mode 100644
index d53a761..0000000
--- a/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 212016f27dd581fd7bef1a44a3342c59619a4ec8 Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Wed, 27 Jan 2016 17:24:25 +0100
-Subject: [PATCH] fix "Error allocating memory for pkgDataFlags." compilation
- error
-
- This is backport of the upstream icu commit 38081
-(http://bugs.icu-project.org/trac/changeset/38081/icu/trunk), which is
-a fix to upstream icu bug #11959
-(http://bugs.icu-project.org/trac/ticket/11959)
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- source/tools/toolutil/flagparser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/source/tools/toolutil/flagparser.c b/source/tools/toolutil/flagparser.c
-index 5543415..57256c3 100644
---- a/source/tools/toolutil/flagparser.c
-+++ b/source/tools/toolutil/flagparser.c
-@@ -96,8 +96,8 @@ parseFlagsFile_cleanup:
-     uprv_free(buffer);
- 
-     T_FileStream_close(f);
--    
--    if (U_FAILURE(*status)) {
-+
-+    if (U_FAILURE(*status) && *status != U_BUFFER_OVERFLOW_ERROR) {
-         return -1;
-     }
- 
--- 
-1.9.1
-
diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index e9f82b1..4233ba3 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,4 +1,4 @@
-# From https://ssl.icu-project.org/files/icu4c/56.1/icu4c-src-56_1.md5
-md5	c4a2d71ff56aec5ebfab2a3f059be99d	icu4c-56_1-src.tgz
+# From https://ssl.icu-project.org/files/icu4c/57.1/icu4c-src-57_1.md5
+md5	976734806026a4ef8bdd17937c8898b9	icu4c-57_1-src.tgz
 # Calculated based on the hash above
-sha256	3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2314816	icu4c-56_1-src.tgz
+sha256	ff8c67cb65949b1e7808f2359f2b80f722697048e90e7cfc382ec1fe229e9581	icu4c-57_1-src.tgz
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 40fe4b8..3b40dfb 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ICU_VERSION = 56.1
+ICU_VERSION = 57.1
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_LICENSE = ICU License
