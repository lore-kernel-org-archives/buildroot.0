From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:07:14 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: add Cortex-A57 and
	Cortex-A72
Message-ID: <20161205221749.B2CD87FEC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2131f1b3817d594ce24ac9ba263f104077cf7c49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two popular ARM64 cores to the list of supported cores: Cortex-A57
and Cortex-A72.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
