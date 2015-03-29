From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:21:37 +0200
Subject: [Buildroot] [git commit] linux-ext: update Xenomai help text
Message-ID: <20150329132201.32938803CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88f80b312304bf900f8ce3c2caf41991d8a15875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reword the help text and get ride of the supported kernel
version list which is outdated since Xenomai version bump.

[Thomas: rewrap text to the appropriate length, fix some typos.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.ext.in |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 8f15687..c909254 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -8,13 +8,21 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 	select BR2_PACKAGE_XENOMAI
 	help
-	  Xenomai Kernel part.
+	  Xenomai is split in two parts: a kernel part and a userspace
+	  part. Enabling this option automatically selects the Xenomai
+	  package and helps in patching the Linux kernel built by
+	  Buildroot with the Xenomai kernel part (ie Adeos/Ipipe).
 
-	  In the current version of Xenomai, the following kernel
-	  versions are supported: on Blackfin, 2.6.34 and 2.6.36.9, on
-	  SH4, 2.6.32.10, on x86, 2.6.35.9, 2.6.37.6, 2.6.38.8, on
-	  ARM, 2.6.35.9, 2.6.37.6, 2.6.38.8, on NIOS2, 2.6.35, on
-	  PowerPC, 2.6.35.7, 2.6.36.4, 3.0.8.
+	  You can find the currently supported kernel versions by
+	  looking at the available patches in the Xenomai sources
+	  tree: ksrc/arch/$(ARCH)/patches
+
+	  However, it is recommended to use the latest version of the
+	  Adeos/Ipipe patch available at
+	  http://download.gna.org/adeos/patches
+
+	  Xenomai is know to support Blackfin, SH4, x86, ARM, NIOS2
+	  and PowerPC architectures.
 
 comment "xenomai needs a toolchain w/ threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
@@ -26,7 +34,7 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	string "Path for Adeos patch file"
 	help
 	  Optionally, explicitly specify the Adeos patch to use.
-	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
+	  Download it at http://download.gna.org/adeos/patches
 	  and verify that your kernel version in buildroot matches.
 
 # RTAI
