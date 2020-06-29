From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 29 Jun 2020 20:27:10 +0300
Subject: [Buildroot] [PATCH 1/1] package/fuse-overlayfs: bump to version
 1.1.2
Message-ID: <20200629172711.127573-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch (already in version).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...1-direct.c-fix-compilation-with-musl.patch | 28 -------------------
 package/fuse-overlayfs/fuse-overlayfs.hash    |  2 +-
 package/fuse-overlayfs/fuse-overlayfs.mk      |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch

diff --git a/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch b/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch
deleted file mode 100644
index 17f58c8408..0000000000
--- a/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 27a01e622e1f26b3c60137c3123c0b667b3f6579 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Mon, 22 Jun 2020 20:48:36 +0300
-Subject: [PATCH] direct.c: fix compilation with musl
-
-Upstream PR status:
-https://github.com/containers/fuse-overlayfs/pull/219
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- direct.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/direct.c b/direct.c
-index 67bed20..39e5c8f 100644
---- a/direct.c
-+++ b/direct.c
-@@ -25,6 +25,7 @@
- 
- #include "fuse-overlayfs.h"
- 
-+#include "limits.h"
- #include <unistd.h>
- #include <fcntl.h>
- #include <errno.h>
--- 
-2.26.2
-
diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
index ee1eb694c9..401f4426f8 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.hash
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256	060168c2d5a8c6cc768b4542eba9953b7ff4a31f94bfb2e05b3d1051390838b1  fuse-overlayfs-1.1.0.tar.gz
+sha256	1c0fa67f806c44d5c51f4bce02fdcb546137a2688a8de76d93d07b79defc9cac  fuse-overlayfs-1.1.2.tar.gz
 # Locally computed
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
index 25f4eadd11..1d19099eda 100644
--- a/package/fuse-overlayfs/fuse-overlayfs.mk
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FUSE_OVERLAYFS_VERSION = 1.1.0
+FUSE_OVERLAYFS_VERSION = 1.1.2
 FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
 FUSE_OVERLAYFS_LICENSE = GPL-3.0
 FUSE_OVERLAYFS_LICENSE_FILES = COPYING
-- 
2.26.2
