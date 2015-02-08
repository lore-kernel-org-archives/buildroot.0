From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun,  8 Feb 2015 14:30:20 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
Message-ID: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Single line comments generate an error and break the build.
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/webkit/0009-fix-single-line-comments.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/webkit/0009-fix-single-line-comments.patch

diff --git a/package/webkit/0009-fix-single-line-comments.patch b/package/webkit/0009-fix-single-line-comments.patch
new file mode 100644
index 0000000..2bb0a13
--- /dev/null
+++ b/package/webkit/0009-fix-single-line-comments.patch
@@ -0,0 +1,35 @@
+From 2172217cfbdadab48602c35f5fd7eb24f8462408 Mon Sep 17 00:00:00 2001
+From: Sagaert Johan <sagaert.johan@skynet.be>
+Date: Fri, 6 Feb 2015 21:53:05 +0100
+Subject: [PATCH 1/1] fix single line comments
+
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+---
+ Source/WTF/wtf/Platform.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 0ced0b2..f654389 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -298,7 +298,7 @@
+ #endif
+ 
+ #if CPU(ARM_NEON) && (!COMPILER(GCC) || GCC_VERSION_AT_LEAST(4, 7, 0))
+-// All NEON intrinsics usage can be disabled by this macro.
++/* All NEON intrinsics usage can be disabled by this macro. */
+ #define HAVE_ARM_NEON_INTRINSICS 1
+ #endif
+ 
+@@ -1155,7 +1154,7 @@
+ #if !defined(ENABLE_PARALLEL_GC) && !ENABLE(OBJECT_MARK_LOGGING) && (PLATFORM(MAC) || PLATFORM(IOS) || PLATFORM(BLACKBERRY) || PLATFORM(GTK)) && ENABLE(COMPARE_AND_SWAP)
+ #define ENABLE_PARALLEL_GC 1
+ #elif PLATFORM(QT)
+-// Parallel GC is temporarily disabled on Qt because of regular crashes, see https://bugs.webkit.org/show_bug.cgi?id=90957 for details
++/* Parallel GC is temporarily disabled on Qt because of regular crashes, see https://bugs.webkit.org/show_bug.cgi?id=90957 for details */
+ #define ENABLE_PARALLEL_GC 0
+ #endif
+
+-- 
+2.2.2
+
-- 
2.2.2
