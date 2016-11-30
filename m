From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:11 +0100
Subject: [Buildroot] [PATCH 8/8] arch/Config.in.arm: add Cortex-A57 and
	Cortex-A72
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <7cdaae6e62c3a98dceecd5b195ef16f425621cee.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Add two popular ARM64 cores to the list of supported cores: Cortex-A57
and Cortex-A72.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 592b097..743f6ca 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -198,6 +198,20 @@ config BR2_cortex_a53
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a57
+	bool "cortex-A57"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a72
+	bool "cortex-A72"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
@@ -520,6 +534,12 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
 	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
 	default "cortex-a53+fp+simd" 	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
+	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
+	default "cortex-a57+fp+simd" 	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
+	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
+	default "cortex-a72+fp+simd" 	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.7.4
