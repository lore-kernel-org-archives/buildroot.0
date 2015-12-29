From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Dec 2015 09:12:38 -0300
Subject: [Buildroot] [PATCH 1/2] libfuse: switch to github
Message-ID: <1451391159-9906-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved to github, so point the homepage and download URL
there.
Use direct download link since the helper can't handle the re-uploaded
release files, and add a comment that it might make sense to switch to
it once a new release is made.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/Config.in    | 2 +-
 package/libfuse/libfuse.hash | 1 +
 package/libfuse/libfuse.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index deedb5a..2b0e31a 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBFUSE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
-	  http://fuse.sourceforge.net/
+	  https://github.com/libfuse/libfuse
 
 comment "libfuse needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index b1bbee3..5351b41 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,3 +1,4 @@
 # From http://sourceforge.net/projects/fuse/files/fuse-2.X/2.9.4/
+# Still valid for non-bumped github copy
 md5	ecb712b5ffc6dffd54f4a405c9b372d8	fuse-2.9.4.tar.gz
 sha1	c8b25419f33624dc5240af6a5d26f2c04367ca71	fuse-2.9.4.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 8360c82..12092f1 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,8 @@
 
 LIBFUSE_VERSION = 2.9.4
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
+# Switch to github helper on bump
+LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
-- 
2.4.10
