From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Apr 2010 10:38:08 +0200
Subject: [Buildroot] [git commit master] Add support to linux 2.6.30 kernel
	patches for Atmel arm in menuconfig.
Message-ID: <20100421083833.170DF20C1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78de2495586409d134b1be8c2ba21de5546adc10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Josh.Wu <josh.wu@atmel.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../device/Atmel/arch-arm/Config.in.linux.patches  |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/target/device/Atmel/arch-arm/Config.in.linux.patches b/target/device/Atmel/arch-arm/Config.in.linux.patches
index 0ea5091..8cd9a85 100644
--- a/target/device/Atmel/arch-arm/Config.in.linux.patches
+++ b/target/device/Atmel/arch-arm/Config.in.linux.patches
@@ -2,11 +2,17 @@ choice
 	prompt "Add AT91 specific patches"
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	default BR2_ARCH_AT91_2_6_30		if BR2_LINUX_2_6_30
 	default BR2_ARCH_AT91_2_6_28		if BR2_LINUX_2_6_28
 	default BR2_ARCH_AT91_2_6_27		if BR2_LINUX_2_6_27
 	help
 	  Select a patch to add to the Linux kernel
 
+config BR2_ARCH_AT91_2_6_30
+	bool "2.6.30"
+	help
+	  Apply the at91 linux-2.6.30 patches
+
 config	BR2_ARCH_AT91_2_6_28
 	bool "2.6.28"
 	help
@@ -22,6 +28,7 @@ config	BR2_KERNEL_ARCH_PATCH_VERSION
 	string
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	default "2.6.30" if BR2_ARCH_AT91_2_6_30
 	default "2.6.28" if BR2_ARCH_AT91_2_6_28
 	default "2.6.27" if BR2_ARCH_AT91_2_6_27
 
-- 
1.6.3.3
