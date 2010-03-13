From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Mar 2010 12:56:30 +0100
Subject: [Buildroot] [git commit master] target: add linux 2.6.33
Message-ID: <20100313115658.215FE776B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ebb8e0a5be59e33d1876ae18a2f1c27d04bee828
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Config.in.advanced |    9 ++++++++-
 target/linux/Config.in.versions |   10 ++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index ca837d1..8cc5121 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -33,6 +33,7 @@ source "target/linux/Config.in.versions"
 
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default $(BR2_KERNEL_LATEST_2_6_33) if BR2_LINUX_2_6_33 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_32) if BR2_LINUX_2_6_32 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_31) if BR2_LINUX_2_6_31 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_30) if BR2_LINUX_2_6_30 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -46,6 +47,7 @@ config BR2_KERNEL_PATCH_LEVEL
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.34" if BR2_LINUX_2_6_33
 	default "2.6.33" if BR2_LINUX_2_6_32
 	default "2.6.32" if BR2_LINUX_2_6_31
 	default "2.6.31" if BR2_LINUX_2_6_30
@@ -58,6 +60,7 @@ config BR2_KERNEL_NEXT_VERSION
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.33" if BR2_LINUX_2_6_33
 	default "2.6.32" if BR2_LINUX_2_6_32
 	default "2.6.31" if BR2_LINUX_2_6_31
 	default "2.6.30" if BR2_LINUX_2_6_30
@@ -103,7 +106,11 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.32.9)"
+	bool "The latest stable Linux kernel (2.6.33)"
+
+config BR2_LINUX_2_6_33
+	bool "Linux 2.6.33"
+	select BR2_KERNEL_BASE
 
 config BR2_LINUX_2_6_32
 	bool "Linux 2.6.32"
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index c8bc09a..d6e0d0c 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -1,4 +1,4 @@
-# This file defines the latest version of 
+# This file defines the latest version of
 # You also have to edit BR2_LINUX_2_6_STABLE
 # in target/linux/Config.in.advanced
 # which is approximately at line 136
@@ -15,10 +15,16 @@ config LINUX26_LATEST_GIT_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.32.9"
+	default "2.6.33"
 	help
 	  This is the latest stable kernel (including minor version).
 
+config BR2_KERNEL_LATEST_2_6_33
+	string
+	default ""
+	help
+	  Released 2010-Feb-24.
+
 config BR2_KERNEL_LATEST_2_6_32
 	string
 	default "9"
-- 
1.6.3.3
