From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 15:17:45 +0200
Subject: [Buildroot] [PATCH 5/9] arch/arm: add cortex-A32
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <07305c6d448adf1ebed0d3df6a4d6de52a670927.1504444617.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cortex-A32 is an armv8a core, but it lacks the optional AArch64
extensions, so can only work in 32-bit mode.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 0ae6a16a0a..0304929ba1 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -243,6 +243,16 @@ config BR2_cortex_m4
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
+config BR2_cortex_a32
+	bool "cortex-A32"
+	depends on !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -572,6 +582,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
 	# armv8a
+	default "cortex-a32"	if BR2_cortex_a32
 	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-a57"	if BR2_cortex_a57
 	default "cortex-a57.cortex-a53"	if BR2_cortex_a57_a53
-- 
2.11.0
