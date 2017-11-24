From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:30:36 +0100
Subject: [Buildroot] [git commit] arch/arm: add some non-cortex armv8a cores
Message-ID: <20171201205337.36D317FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d632d9e5a984a8da01156f28a2180e344f6a07a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some need gcc-5, some gcc-6 and some gcc-7.

The thunderx familly does not build in 32-bit mode (gcc complains
that the CPU is unknown, and even gcc master only knows them as
aarch64-only).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 6f189c6..2d6eb99 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -332,6 +332,74 @@ config BR2_cortex_a73_a53
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_exynos_m1
+	bool "exynos-m1"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+config BR2_falkor
+	bool "falkor"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_qdf24xx
+	bool "qdf24xx"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+if BR2_ARCH_IS_64
+config BR2_thunderx
+	bool "thunderx"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+config BR2_thunderxt81
+	bool "thunderxt81"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_thunderxt83
+	bool "thunderxt83"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_thunderxt88
+	bool "thunderxt88"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_thunderxt88p1
+	bool "thunderxt88p1"
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+endif # BR2_ARCH_IS_64
+config BR2_xgene1
+	bool "xgene1"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -627,6 +695,15 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a73"	if BR2_cortex_a73
 	default "cortex-a73.cortex-a35"	if BR2_cortex_a73_a35
 	default "cortex-a73.cortex-a53"	if BR2_cortex_a73_a53
+	default "exynos-m1"	if BR2_exynos_m1
+	default "falkor"	if BR2_falkor
+	default "qdf24xx"	if BR2_qdf24xx
+	default "thunderx"	if BR2_thunderx
+	default "thunderxt81"	if BR2_thunderxt81
+	default "thunderxt83"	if BR2_thunderxt83
+	default "thunderxt88"	if BR2_thunderxt88
+	default "thunderxt88p1"	if BR2_thunderxt88p1
+	default "xgene1"	if BR2_xgene1
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
