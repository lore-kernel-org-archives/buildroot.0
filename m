From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 10:51:03 +0100
Subject: [Buildroot] [git commit] dmalloc: fix build with strndup
Message-ID: <20190123095126.0351882879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c1d2f1dea659eb1d95d52e9c9838cd39099704c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5cfa01a41951ee3be2e8c1cb10edac3722d72c77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmalloc/0006-fix-strndup.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/dmalloc/0006-fix-strndup.patch b/package/dmalloc/0006-fix-strndup.patch
new file mode 100644
index 0000000000..a1865acb85
--- /dev/null
+++ b/package/dmalloc/0006-fix-strndup.patch
@@ -0,0 +1,24 @@
+From 005d92c2cebbde5c8623daa29725f7a62b18df7c Mon Sep 17 00:00:00 2001
+From: Siana Gearz <siana.sg@live.de>
+Date: Sat, 8 Sep 2012 22:44:35 +0200
+Subject: [PATCH] Fix strndup
+
+[Retrieved from:
+https://github.com/siana/dmalloc/commit/005d92c2cebbde5c8623daa29725f7a62b18df7c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dmalloc.h.3 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dmalloc.h.3 b/dmalloc.h.3
+index 8bda997..fb538a8 100644
+--- a/dmalloc.h.3
++++ b/dmalloc.h.3
+@@ -429,6 +429,7 @@ char	*strdup(const char *string);
+  *
+  * len -> Length of the string to duplicate.
+  */
++#undef strndup
+ extern
+ char	*strndup(const char *string, const DMALLOC_SIZE len);
+ 
