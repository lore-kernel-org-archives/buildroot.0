From: Matt Flax <flatmax@flatmax.org>
Date: Fri, 19 Aug 2016 10:07:04 +1000
Subject: [Buildroot] [PATCH 1/1] arch/arm: Add Cortex-a53 CPU
Message-ID: <1471565224-15625-1-git-send-email-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
the toolchain to use cortex-a53 as the target. The effect is that various
cortex-a53 tunings are enabled for the compilation of packages.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 arch/Config.in.arm | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ee612f5..72bb744 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -170,6 +170,13 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a53
+	bool "cortex-A53"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
@@ -458,6 +465,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
 	default "cortex-a17"	if BR2_cortex_a17
+	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
 	default "fa526"		if BR2_fa526
-- 
2.7.4
