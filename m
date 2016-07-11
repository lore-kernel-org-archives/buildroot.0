From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Jul 2016 22:13:48 +0200
Subject: [Buildroot] [PATCH v1] fbset: fix musl compile
Message-ID: <1468268028-13960-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unconditional include <asm/types.h> for __u32 type.

Fixes [1]:

  error: unknown type name '__u32'

[1] http://autobuild.buildroot.net/results/90f/90fc7954c532417c2ceaf9ab8549099d84561a42

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/fbset/0001-Fix-musl-compile.patch | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/fbset/0001-Fix-musl-compile.patch

diff --git a/package/fbset/0001-Fix-musl-compile.patch b/package/fbset/0001-Fix-musl-compile.patch
new file mode 100644
index 0000000..65d84c5
--- /dev/null
+++ b/package/fbset/0001-Fix-musl-compile.patch
@@ -0,0 +1,33 @@
+From 6d42be24b62b94df8e2f01956842b7ee4b640e97 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 11 Jul 2016 22:07:42 +0200
+Subject: [PATCH] Fix musl compile.
+
+Unconditional include <asm/types.h> for __u32 type.
+
+Fixes:
+
+  error: unknown type name '__u32'
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ fbset.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/fbset.h b/fbset.h
+index 9b1d2ac..3c511e1 100644
+--- a/fbset.h
++++ b/fbset.h
+@@ -15,9 +15,7 @@
+ #include <stdio.h>
+ #include <sys/types.h>
+ 
+-#ifdef __GLIBC__
+ #include <asm/types.h>
+-#endif
+ 
+ #define VERSION         "Linux Frame Buffer Device Configuration " \
+ 			"Version 2.1 (23/06/1999)\n"  \
+-- 
+2.8.1
+
-- 
2.8.1
