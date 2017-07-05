From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 12:25:33 +0200
Subject: [Buildroot] [PATCH 1/5] arch/arm: fix -mcpu default values for
	AArch64
In-Reply-To: <cover.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <024f0b53f0d0da9c0942607b47db08748bdcd9a0.1499250321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For AArch64, +fp and +simd are the default, so they are totally useless.

Remove them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b1817ed568..aaf4506d7f 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -535,14 +535,8 @@ config BR2_GCC_TARGET_CPU
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
 	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
-	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a53+fp+simd"	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
-	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a57+fp+simd"	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
-	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a72+fp+simd"	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.11.0
