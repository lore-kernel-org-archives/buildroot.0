From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 13 Nov 2020 11:30:03 +0100
Subject: [Buildroot] [PATCH] package/pixz: bump version to v1.0.7
Message-ID: <20201113103003.9756-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update the hash accordingly.
- Remove a patch, as its fix is in this new version of pixz.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 package/pixz/0001-fix-linkage.patch | 41 -----------------------------
 package/pixz/pixz.hash              |  2 +-
 package/pixz/pixz.mk                |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/pixz/0001-fix-linkage.patch

diff --git a/package/pixz/0001-fix-linkage.patch b/package/pixz/0001-fix-linkage.patch
deleted file mode 100644
index 712c280ec2..0000000000
--- a/package/pixz/0001-fix-linkage.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f385e7be8adb620ca7eb89f84abe4d1df94c1029 Mon Sep 17 00:00:00 2001
-From: Dave Vasilevsky <dave@vasilevsky.ca>
-Date: Sat, 25 Apr 2020 19:16:05 -0400
-Subject: [PATCH] fix linkage
-
-[Retrieved from:
-https://github.com/vasi/pixz/commit/f385e7be8adb620ca7eb89f84abe4d1df94c1029]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/common.c | 2 +-
- src/pixz.h   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/common.c b/src/common.c
-index 59d3273..5938633 100644
---- a/src/common.c
-+++ b/src/common.c
-@@ -7,7 +7,7 @@
- 
- #pragma mark UTILS
- 
--FILE *gInFile = NULL;
-+FILE *gInFile = NULL, *gOutFile = NULL;
- lzma_stream gStream = LZMA_STREAM_INIT;
- 
- 
-diff --git a/src/pixz.h b/src/pixz.h
-index 0fa60f2..0939a9a 100644
---- a/src/pixz.h
-+++ b/src/pixz.h
-@@ -54,8 +54,8 @@ void pixz_read(bool verify, size_t nspecs, char **specs);
- 
- #pragma mark UTILS
- 
--FILE *gInFile, *gOutFile;
--lzma_stream gStream;
-+extern FILE *gInFile, *gOutFile;
-+extern lzma_stream gStream;
- 
- extern lzma_index *gIndex;
- 
diff --git a/package/pixz/pixz.hash b/package/pixz/pixz.hash
index 5491a016dc..9e2a211cdc 100644
--- a/package/pixz/pixz.hash
+++ b/package/pixz/pixz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8  pixz-1.0.6.tar.xz
+sha256  e5e32c6eb0bf112b98e74a5da8fb63b9f2cae71800f599d97ce540e150c8ddc5  pixz-1.0.7.tar.xz
 sha256  d036806b4d1efee7c6d86276451c4d833e9798751417e25daae62dfbe348641b  LICENSE
diff --git a/package/pixz/pixz.mk b/package/pixz/pixz.mk
index 8d80f78617..680c05c32c 100644
--- a/package/pixz/pixz.mk
+++ b/package/pixz/pixz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXZ_VERSION = 1.0.6
+PIXZ_VERSION = 1.0.7
 PIXZ_SITE = https://github.com/vasi/pixz/releases/download/v$(PIXZ_VERSION)
 PIXZ_SOURCE = pixz-$(PIXZ_VERSION).tar.xz
 PIXZ_DEPENDENCIES = host-pkgconf libarchive xz
-- 
2.28.0
