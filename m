From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:18:12 +0200
Subject: [Buildroot] [git commit] package/fuse-overlayfs: fix build with musl
Message-ID: <20200622191618.BB8A38400E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9f7d66f3413c55472c18eacd25ca0e5734194c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/57d/57d6f6bcbf3c0f8761c924f8a69c71dee05dd6c3//

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-direct.c-fix-compilation-with-musl.patch  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch b/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch
new file mode 100644
index 0000000000..17f58c8408
--- /dev/null
+++ b/package/fuse-overlayfs/0001-direct.c-fix-compilation-with-musl.patch
@@ -0,0 +1,28 @@
+From 27a01e622e1f26b3c60137c3123c0b667b3f6579 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Mon, 22 Jun 2020 20:48:36 +0300
+Subject: [PATCH] direct.c: fix compilation with musl
+
+Upstream PR status:
+https://github.com/containers/fuse-overlayfs/pull/219
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ direct.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/direct.c b/direct.c
+index 67bed20..39e5c8f 100644
+--- a/direct.c
++++ b/direct.c
+@@ -25,6 +25,7 @@
+ 
+ #include "fuse-overlayfs.h"
+ 
++#include "limits.h"
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <errno.h>
+-- 
+2.26.2
+
