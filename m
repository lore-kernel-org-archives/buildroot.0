From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 17:02:10 +0400
Subject: [Buildroot] [PATCH] diffutils stdio: don't assume gets any more
Message-ID: <1352466130-23535-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/diffutils/diffutils-3.2-no-gets.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/diffutils/diffutils-3.2-no-gets.patch

diff --git a/package/diffutils/diffutils-3.2-no-gets.patch b/package/diffutils/diffutils-3.2-no-gets.patch
new file mode 100644
index 0000000..56ca22d
--- /dev/null
+++ b/package/diffutils/diffutils-3.2-no-gets.patch
@@ -0,0 +1,21 @@
+hack until gzip pulls a newer gnulib version
+
+From 66712c23388e93e5c518ebc8515140fa0c807348 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Thu, 29 Mar 2012 13:30:41 -0600
+Subject: [PATCH] stdio: don't assume gets any more
+
+Gnulib intentionally does not have a gets module, and now that C11
+and glibc have dropped it, we should be more proactive about warning
+any user on a platform that still has a declaration of this dangerous
+interface.
+
+--- a/lib/stdio.in.h
++++ b/lib/stdio.in.h
+@@ -125,7 +125,6 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+-_GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
+ 
-- 
1.7.11.3
