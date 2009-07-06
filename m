From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 6 Jul 2009 12:28:04 -0400
Subject: [Buildroot] [PATCH] Update linux versions
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901A13EC9@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update target/linux versions

The linux versions in target/linux/Config.in.advanced and
target/linux/Config.in.versions are a bit stale.  Update
them to the latest releases and add help information about
the release dates (from kernel.org).

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 3a171b5..321a0aa 100644
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
@@ -128,12 +133,20 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.29.4)"
+	bool "The latest stable Linux kernel (2.6.30.1)"
+
+config BR2_LINUX_2_6_31
+	bool "Linux 2.6.31"
+	select BR2_KERNEL_BASE
+
+config BR2_LINUX_2_6_30
+	bool "Linux 2.6.30"
+	select BR2_KERNEL_BASE
 
 config BR2_LINUX_2_6_29
 	bool "Linux 2.6.29"
 	select BR2_KERNEL_BASE
-	
+
 config BR2_LINUX_2_6_28
 	bool "Linux 2.6.28"
 	select BR2_KERNEL_BASE
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
+	default "patch-2.6.31-rc2.bz2"
 	help
 	  Specify a patch to be downloaded
 
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index a37a5ad..7e04c85 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -1,64 +1,94 @@
-# This file defines the latest version of 
+# This file defines the latest version of
 # You also have to edit BR2_LINUX_2_6_STABLE
 # in target/linux/Config.in.advanced
 # which is approximately at line 132
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.30-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.31-rc2" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 	help
-	  Not really available as of 20090103
+	  Released Jun 4, 2009
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.30-rc4-git4" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.31-rc2" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	help
+	  Released Jun 4, 2009
 
 config LINUX26_LATEST_MM_VERSION
 	string
 	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	help
+	  Released Oct 29, 2008
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.29.4"
+	default "2.6.30.1"
 	help
 	  This is the latest stable kernel (including minor version)
 
+config BR2_KERNEL_LATEST_2_6_30
+	string
+	default "1"
+	help
+	  Released Jun 3, 2009
+
 config BR2_KERNEL_LATEST_2_6_29
 	string
-	default "4"
+	default "6"
+	help
+	  Released Jun 2, 2009
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
-	default "7"
+	default "10"
+	help
+	  Released May 2, 2009
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "13"
+	default "26"
+	help
+	  Released Jun 2, 2009
 
 config BR2_KERNEL_LATEST_2_6_26
 	string
 	default "8"
+	help
+	  Released Nov 10, 2008
 
 config BR2_KERNEL_LATEST_2_6_25
 	string
-	default "19"
+	default "20"
+	help
+	  Released Nov 10, 2008
 
 config BR2_KERNEL_LATEST_2_6_24
 	string
 	default "7"
+	help
+	  Released May 7, 2008
 
 config BR2_KERNEL_LATEST_2_6_23
 	string
 	default "17"
+	help
+	  Released Feb 26, 2008
 
 config BR2_KERNEL_LATEST_2_6_22
 	string
 	default "19"
+	help
+	  Released Feb 26, 2008
 
 config BR2_KERNEL_LATEST_2_6_21
 	string
 	default "7"
+	help
+	  Released Aug 4, 2007
 
 config BR2_KERNEL_LATEST_2_6_20
 	string
 	default "21"
+	help
+	  Released Oct 17, 2007 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_linux_versions.patch
Type: application/octet-stream
Size: 4479 bytes
Desc: buildroot_linux_versions.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/81403c67/attachment.obj>
