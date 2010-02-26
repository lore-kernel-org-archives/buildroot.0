From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Feb 2010 15:27:54 +0100
Subject: [Buildroot] [git commit master] Revert "busybox: add upstream 1.16
	fix"
Message-ID: <20100226144809.D731A7778D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=88075cc4c686cddafafaa9bc5c6bb08c1db4b33f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1d7b6f65c633865b25c8603975f9aec88e4e1275.

The fsync patch tries to add the same lines already added by
busybox-1.16.0-compat.patch, so skip it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.0-fsync.patch |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 package/busybox/busybox-1.16.0-fsync.patch

diff --git a/package/busybox/busybox-1.16.0-fsync.patch b/package/busybox/busybox-1.16.0-fsync.patch
deleted file mode 100644
index b0d73ee..0000000
--- a/package/busybox/busybox-1.16.0-fsync.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -urpN busybox-1.16.0/coreutils/fsync.c busybox-1.16.0-fsync/coreutils/fsync.c
---- busybox-1.16.0/coreutils/fsync.c	2010-01-25 01:59:38.000000000 +0100
-+++ busybox-1.16.0-fsync/coreutils/fsync.c	2010-02-26 08:24:59.000000000 +0100
-@@ -7,6 +7,9 @@
-  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
-  */
- #include "libbb.h"
-+#ifndef O_NOATIME
-+# define O_NOATIME 0
-+#endif
- 
- /* This is a NOFORK applet. Be very careful! */
- 
-- 
1.6.3.3
