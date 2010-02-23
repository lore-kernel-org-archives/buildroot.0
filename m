From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 13:17:45 +0100
Subject: [Buildroot] [git commit master] linux-advanced: add 2.6.32.8
Message-ID: <20100223133013.A1EC777716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc88b05c33173bafbcb733e4d75e420dbfc2fd43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Config.in.advanced |   19 ++++++++++++++-----
 target/linux/Config.in.versions |   10 +++++++++-
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index a17e41a..f87d710 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -33,6 +33,8 @@ source "target/linux/Config.in.versions"
 
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default $(BR2_KERNEL_LATEST_2_6_32) if BR2_LINUX_2_6_32 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default $(BR2_KERNEL_LATEST_2_6_31) if BR2_LINUX_2_6_31 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_30) if BR2_LINUX_2_6_30 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_29) if BR2_LINUX_2_6_29 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_28) if BR2_LINUX_2_6_28 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -44,6 +46,8 @@ config BR2_KERNEL_PATCH_LEVEL
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.33" if BR2_LINUX_2_6_32
+	default "2.6.32" if BR2_LINUX_2_6_31
 	default "2.6.31" if BR2_LINUX_2_6_30
 	default "2.6.30" if BR2_LINUX_2_6_29
 	default "2.6.29" if BR2_LINUX_2_6_28
@@ -54,6 +58,7 @@ config BR2_KERNEL_NEXT_VERSION
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.32" if BR2_LINUX_2_6_32
 	default "2.6.31" if BR2_LINUX_2_6_31
 	default "2.6.30" if BR2_LINUX_2_6_30
 	default "2.6.29" if BR2_LINUX_2_6_29
@@ -121,7 +126,15 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.30.2)"
+	bool "The latest stable Linux kernel (2.6.32.8)"
+
+config BR2_LINUX_2_6_32
+	bool "Linux 2.6.32"
+	select BR2_KERNEL_BASE
+
+config BR2_LINUX_2_6_31
+	bool "Linux 2.6.31"
+	select BR2_KERNEL_BASE
 
 config BR2_LINUX_2_6_30
 	bool "Linux 2.6.30"
@@ -151,10 +164,6 @@ config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
 	select BR2_KERNEL_BASE
 
-config BR2_LINUX_2_6_31
-	bool "Linux 2.6.31"
-	select BR2_KERNEL_BASE
-
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index d71504d..1d4cd75 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -19,10 +19,18 @@ config LINUX26_LATEST_MM_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.30.2"
+	default "2.6.32.8"
 	help
 	  This is the latest stable kernel (including minor version)
 
+config BR2_KERNEL_LATEST_2_6_32
+	string
+	default "8"
+
+config BR2_KERNEL_LATEST_2_6_31
+	string
+	default "12"
+
 config BR2_KERNEL_LATEST_2_6_30
 	string
 	default "2"
-- 
1.6.3.3
