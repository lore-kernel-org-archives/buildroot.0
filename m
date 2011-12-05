From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Dec 2011 23:33:19 +0100
Subject: [Buildroot] [git commit] nbd: fix !BR2_LARGEFILE builds
Message-ID: <20111205224207.A629D8EDFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90424fe30b363b0639727cadc1b7cacb3c6089b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch sent upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/nbd-fix-non-lfs.patch |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/nbd/nbd-fix-non-lfs.patch b/package/nbd/nbd-fix-non-lfs.patch
new file mode 100644
index 0000000..41a80cd
--- /dev/null
+++ b/package/nbd/nbd-fix-non-lfs.patch
@@ -0,0 +1,37 @@
+From 8dd182693e9995bc1aeb907f9fd4ec06c18fc56f Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 5 Dec 2011 23:27:30 +0100
+Subject: [PATCH] lfs.h: fix !LFS builds
+
+Commit 448637fba4 (Fix 32/64 bit confusion) broke !LFS builds as it
+added the PARAM_OFFT defines inside the wrong conditional.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lfs.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lfs.h b/lfs.h
+index 64a03de..68d3b81 100644
+--- a/lfs.h
++++ b/lfs.h
+@@ -6,14 +6,14 @@
+ #define _FILE_OFFSET_BITS 64
+ #ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE
++#endif
+ #define PARAM_OFFT PARAM_INT64
+ #else
+ #define PARAM_OFFT PARAM_INT
+-#endif
++#endif /* NBD_LFS */
+ #ifdef HAVE_SYNC_FILE_RANGE
+ #define USE_SYNC_FILE_RANGE
+ #define _GNU_SOURCE
+ #endif /* HAVE_SYNC_FILE_RANGE */
+-#endif /* NBD_LFS */
+ 
+ #endif /* LFS_H */
+-- 
+1.7.7.1
+
