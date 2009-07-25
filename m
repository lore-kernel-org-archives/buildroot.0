From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 25 Jul 2009 08:46:45 +0200
Subject: [Buildroot] [git commit] Update kernel "latest" major/minor version
 numbers including adding support for 2.6.30/2.6.31-rc#
Message-ID: <20090725064731.B7E12774E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1a6f22d2a3616e649c8241a3efc5b09aaa0fb849
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 target/linux/Config.in.advanced |   21 +++++++++++++++++----
 target/linux/Config.in.versions |   16 ++++++++++------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 3a171b5..6d755d8 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -33,6 +33,7 @@ source "target/linux/Config.in.versions"
 
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default $(BR2_KERNEL_LATEST_2_6_30) if BR2_LINUX_2_6_30 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_29) if BR2_LINUX_2_6_29 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_28) if BR2_LINUX_2_6_28 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_27) if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -47,6 +48,8 @@ config BR2_KERNEL_PATCH_LEVEL
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.31" if BR2_LINUX_2_6_30
+	default "2.6.30" if BR2_LINUX_2_6_29
 	default "2.6.29" if BR2_LINUX_2_6_28
 	default "2.6.28" if BR2_LINUX_2_6_27
 	default "2.6.27" if BR2_LINUX_2_6_26
@@ -59,6 +62,8 @@ config BR2_KERNEL_NEXT_VERSION
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.31" if BR2_LINUX_2_6_31
+	default "2.6.30" if BR2_LINUX_2_6_30
 	default "2.6.29" if BR2_LINUX_2_6_29
 	default "2.6.28" if BR2_LINUX_2_6_28
 	default "2.6.27" if BR2_LINUX_2_6_27
@@ -128,7 +133,11 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.29.4)"
+	bool "The latest stable Linux kernel (2.6.30.2)"
+
+config BR2_LINUX_2_6_30
+	bool "Linux 2.6.30"
+	select BR2_KERNEL_BASE
 
 config BR2_LINUX_2_6_29
 	bool "Linux 2.6.29"
@@ -170,6 +179,10 @@ config BR2_LINUX_2_6_20
 	bool "Linux 2.6.20"
 	select BR2_KERNEL_BASE
 
+config BR2_LINUX_2_6_31
+	bool "Linux 2.6.31"
+	select BR2_KERNEL_BASE
+
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 
@@ -178,19 +191,19 @@ endchoice
 if BR2_LINUX26_CUSTOM
 config BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION
 	string "Linux Tarball version"
-	default "2.6.30"
+	default "2.6.31"
 	help
 	  Specify any .tar.bz2 file
 
 config BR2_CUSTOM_LINUX26_VERSION
 	string "Linux Version"
-	default "2.6.30"
+	default "2.6.31"
 	help
 	  Specify what the linux version will be called
 
 config BR2_CUSTOM_LINUX26_PATCH
 	string "patch name"
-	default "patch-2.6.30-rc4.bz2"
+	default "patch-2.6.31-rc4.bz2"
 	help
 	  Specify a patch to be downloaded
 
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index a37a5ad..caf1151 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -1,11 +1,11 @@
 # This file defines the latest version of 
 # You also have to edit BR2_LINUX_2_6_STABLE
 # in target/linux/Config.in.advanced
-# which is approximately at line 132
+# which is approximately at line 136
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.30-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.31-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 	help
 	  Not really available as of 20090103
 
@@ -19,21 +19,25 @@ config LINUX26_LATEST_MM_VERSION
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.29.4"
+	default "2.6.30.2"
 	help
 	  This is the latest stable kernel (including minor version)
 
+config BR2_KERNEL_LATEST_2_6_30
+	string
+	default "2"
+
 config BR2_KERNEL_LATEST_2_6_29
 	string
-	default "4"
+	default "6"
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
-	default "7"
+	default "10"
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "13"
+	default "27"
 
 config BR2_KERNEL_LATEST_2_6_26
 	string
-- 
1.6.3.3
