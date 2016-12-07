From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  7 Dec 2016 10:25:22 +0100
Subject: [Buildroot] [PATCH 3/3] arch/Config.in.arm: support thumb2
	instructions for ARMv8 in 32bit mode
In-Reply-To: <20161207092522.16222-1-peter@korsgaard.com>
References: <20161207092522.16222-1-peter@korsgaard.com>
Message-ID: <20161207092522.16222-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARMv8 cores all support thumb2 instructions when running in aarch32 mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 6ec6029..2617976 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -195,6 +195,7 @@ config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
@@ -202,6 +203,7 @@ config BR2_cortex_a57
 	bool "cortex-A57"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
@@ -209,6 +211,7 @@ config BR2_cortex_a72
 	bool "cortex-A72"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-- 
2.10.2
