From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:04:16 +0200
Subject: [Buildroot] [git commit] arch/arm: fix -mcpu default values for
	AArch64
Message-ID: <20170710160034.7F68E800A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d06e91df85a2f02dd10dcac6a37a19da11b13aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have to specify the -mcpu value, even in 64-bit mode.

For AArch64, +fp and +simd are the default, so they are totally useless.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b1817ed..3cafe21 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -534,15 +534,9 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
-	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
-	default "cortex-a53+fp"		if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a53+fp+simd"	if (BR2_cortex_a53 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
-	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
-	default "cortex-a57+fp"		if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a57+fp+simd"	if (BR2_cortex_a57 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
-	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
-	default "cortex-a72+fp"		if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_FP_ARMV8)
-	default "cortex-a72+fp+simd"	if (BR2_cortex_a72 && BR2_ARCH_IS_64 && BR2_ARM_FPU_NEON_FP_ARMV8)
+	default "cortex-a53"	if BR2_cortex_a53
+	default "cortex-a57"	if BR2_cortex_a57
+	default "cortex-a72"	if BR2_cortex_a72
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
