From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 19:32:02 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] dmalloc: fix build with
 strdup
Message-ID: <20190129183148.0BDB1814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=820f919acc40e5aa5208c5857126021478c68c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
 - http://autobuild.buildroot.org/results/3f2518f7a9e87034cd501ac3d121ea3a33827e7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c10e96b3310d9a4a21016d4e9292ace7898e9c5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmalloc/0005-fix-strdup.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/dmalloc/0005-fix-strdup.patch b/package/dmalloc/0005-fix-strdup.patch
new file mode 100644
index 0000000000..5884df6a89
--- /dev/null
+++ b/package/dmalloc/0005-fix-strdup.patch
@@ -0,0 +1,24 @@
+From 59d73a473f1c1a31bcba90d314f956d0bcc3de95 Mon Sep 17 00:00:00 2001
+From: Siana Gearz <siana.sg@live.de>
+Date: Sat, 8 Sep 2012 22:55:17 +0200
+Subject: [PATCH] Fix strdup
+
+[Retrieved from:
+https://github.com/siana/dmalloc/commit/59d73a473f1c1a31bcba90d314f956d0bcc3de95]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dmalloc.h.3 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dmalloc.h.3 b/dmalloc.h.3
+index d3d1c13..3fc573a 100644
+--- a/dmalloc.h.3
++++ b/dmalloc.h.3
+@@ -459,6 +459,7 @@ DMALLOC_PNT	valloc(DMALLOC_SIZE size);
+  *
+  * string -> String we are duplicating.
+  */
++#undef strdup
+ extern
+ char	*strdup(const char *string);
+ #endif /* ifndef DMALLOC_STRDUP_MACRO */
