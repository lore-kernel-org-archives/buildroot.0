From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 23:56:23 +0200
Subject: [Buildroot] [PATCH] xenomai: requires thread support
Message-ID: <1374184583-20571-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/c99/c9912b2c21594350945c8a64528bb6a9b34d6292/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in       | 4 ++++
 package/xenomai/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 172fa76..70f3e32 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -3,6 +3,7 @@ menu "Linux Kernel Extensions"
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 	select BR2_PACKAGE_XENOMAI
@@ -15,6 +16,9 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 	  ARM, 2.6.35.9, 2.6.37.6, 2.6.38.8, on NIOS2, 2.6.35, on
 	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
 
+comment "xenomai requires thread support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	depends on BR2_LINUX_KERNEL_EXT_XENOMAI
 	string "Path for Adeos patch file"
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 767f622..f9de36b 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,5 +1,9 @@
+comment "xenomai requires thread support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 	help
-- 
1.8.1.2
