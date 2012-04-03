From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Apr 2012 21:27:40 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.2
Message-ID: <1333412860-22398-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2fsprogs/e2fsprogs-fallocate.patch |   22 ----------------------
 package/e2fsprogs/e2fsprogs.mk              |    2 +-
 2 files changed, 1 insertions(+), 23 deletions(-)
 delete mode 100644 package/e2fsprogs/e2fsprogs-fallocate.patch

diff --git a/package/e2fsprogs/e2fsprogs-fallocate.patch b/package/e2fsprogs/e2fsprogs-fallocate.patch
deleted file mode 100644
index 4d952a5..0000000
--- a/package/e2fsprogs/e2fsprogs-fallocate.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-We assume that fallocate is supported somehow
-but we need to check if we have fallocate()
-this problem shows up on uclibc systems since
-uclibc does not have fallocate() implemented
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
-===================================================================
---- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
-+++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
-@@ -895,7 +895,7 @@
- 		goto unimplemented;
- #endif
- 	} else {
--#ifdef FALLOC_FL_PUNCH_HOLE
-+#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
- 		/*
- 		 * If we are not on block device, try to use punch hole
- 		 * to reclaim free space.
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fee6f0a..5f87b40 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.42.1
+E2FSPROGS_VERSION = 1.42.2
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
 E2FSPROGS_CONF_OPT = \
-- 
1.7.3.4
