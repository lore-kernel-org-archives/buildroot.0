From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Mar 2015 23:45:15 +0100
Subject: [Buildroot] [PATCH] linux-ext: update Xenomai help text
Message-ID: <1427409915-14913-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reword the help text and get ride of the supported kernel
version list which is outdated since Xenomai version bump.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 linux/Config.ext.in | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 8f15687..22c0bef 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -8,13 +8,20 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 	select BR2_PACKAGE_XENOMAI
 	help
-	  Xenomai Kernel part.
+	  Xenomai is split in two parts: a kernel part and an userspace part.
+	  Enabling this option automatically select the Xenomai package and help
+	  to patch the linux kernel build by Builroot with the Xenomai kernel
+	  part (ie ADEOS/IPIPE).
 
-	  In the current version of Xenomai, the following kernel
-	  versions are supported: on Blackfin, 2.6.34 and 2.6.36.9, on
-	  SH4, 2.6.32.10, on x86, 2.6.35.9, 2.6.37.6, 2.6.38.8, on
-	  ARM, 2.6.35.9, 2.6.37.6, 2.6.38.8, on NIOS2, 2.6.35, on
-	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
+	  You can find the currently supported kernel list by looking at the
+	  available patches in the Xenomai sources tree:
+	  ksrc/arch/$(ARCH)/patches
+
+	  However, It's recommended to use the latest version of the adeos/ipipe
+	  which is available at http://download.gna.org/adeos/patches
+
+	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2 and PowerPC
+	  architectures.
 
 comment "xenomai needs a toolchain w/ threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
@@ -26,7 +33,7 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	string "Path for Adeos patch file"
 	help
 	  Optionally, explicitly specify the Adeos patch to use.
-	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
+	  Download it at http://download.gna.org/adeos/patches
 	  and verify that your kernel version in buildroot matches.
 
 # RTAI
-- 
1.9.3
