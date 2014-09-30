From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 30 Sep 2014 16:11:35 -0400
Subject: [Buildroot] [PATCH 2/2] valgrind: Add patch to fix ARM host
	detection
In-Reply-To: <1412107895-10015-1-git-send-email-mike@mikebwilliams.com>
References: <1412107895-10015-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1412107895-10015-3-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 ...-0003-Add-patch-to-fix-ARM_host-detection.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/valgrind/valgrind-0003-Add-patch-to-fix-ARM_host-detection.patch

diff --git a/package/valgrind/valgrind-0003-Add-patch-to-fix-ARM_host-detection.patch b/package/valgrind/valgrind-0003-Add-patch-to-fix-ARM_host-detection.patch
new file mode 100644
index 0000000..b5338d7
--- /dev/null
+++ b/package/valgrind/valgrind-0003-Add-patch-to-fix-ARM_host-detection.patch
@@ -0,0 +1,26 @@
+From 21152a9ec6cfcc2bdade8488bab21ed43a088f97 Mon Sep 17 00:00:00 2001
+From: Mike Williams <mike@mikebwilliams.com>
+Date: Tue, 30 Sep 2014 15:51:24 -0400
+Subject: [PATCH] valgrind: Add patch to fix ARM host detection
+
+Signed-off-by: Mike Williams <mike@mikebwilliams.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2aeed78..b280ee2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -212,7 +212,7 @@ case "${host_cpu}" in
+         ARCH_MAX="s390x"
+         ;;
+ 
+-     armv7*)
++     arm*)
+ 	AC_MSG_RESULT([ok (${host_cpu})])
+ 	ARCH_MAX="arm"
+ 	;;
+-- 
+1.9.1
+
-- 
1.9.1
