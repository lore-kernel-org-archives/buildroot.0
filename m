From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:18:08 +0100
Subject: [Buildroot] [git commit] arch/arm: add some armv8a cortex variants
Message-ID: <20171201205337.22E777FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9960da6ec84d0fc4f3d7ef8d9db5b1e29d79358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 061c0ea..6f189c6 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -253,6 +253,15 @@ config BR2_cortex_a32
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_cortex_a35
+	bool "cortex-A35"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -296,6 +305,33 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_cortex_a73
+	bool "cortex-A73"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_cortex_a73_a35
+	bool "cortex-A73/A35 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_cortex_a73_a53
+	bool "cortex-A73/A53 big.LITTLE"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -582,11 +618,15 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-m4"	if BR2_cortex_m4
 	# armv8a
 	default "cortex-a32"	if BR2_cortex_a32
+	default "cortex-a35"	if BR2_cortex_a35
 	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-a57"	if BR2_cortex_a57
 	default "cortex-a57.cortex-a53"	if BR2_cortex_a57_a53
 	default "cortex-a72"	if BR2_cortex_a72
 	default "cortex-a72.cortex-a53"	if BR2_cortex_a72_a53
+	default "cortex-a73"	if BR2_cortex_a73
+	default "cortex-a73.cortex-a35"	if BR2_cortex_a73_a35
+	default "cortex-a73.cortex-a53"	if BR2_cortex_a73_a53
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
