From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:05 +0100
Subject: [Buildroot] [PATCH 2/8] arch/Config.in.arm: prepare addition of 64
	bits cores
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <62e0b2a33749d5cc4196fc7c63d8791aab6235a6.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Until now the "Target Architecture Variant" choice was not visible on
AArch64. In order to prepare the addition of the 64 bits core to this
choice, this commit adds a "depends on !BR2_ARCH_IS_64" dependency to
all currently supported cores (that are 32 bits only).

Following this commit, the "Target Architecture Variant" choice appears
on AArch64, but is for now empty.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 002ed04..0ca6a14 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -57,7 +57,6 @@ config BR2_ARM_CPU_ARMV7M
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_arm || BR2_armeb
 	default BR2_arm926t
 	help
 	  Specific CPU variant to use
@@ -68,12 +67,14 @@ config BR2_arm920t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_HAS_ARM
@@ -81,12 +82,14 @@ config BR2_arm926t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm1136j_s
 	bool "arm1136j-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -94,12 +97,14 @@ config BR2_arm1136jf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -107,6 +112,7 @@ config BR2_arm1176jzf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_arm11mpcore
 	bool "mpcore"
 	select BR2_ARM_CPU_HAS_ARM
@@ -114,6 +120,7 @@ config BR2_arm11mpcore
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -122,6 +129,7 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -130,6 +138,7 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -138,6 +147,7 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -146,6 +156,7 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -154,6 +165,7 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -162,6 +174,7 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17
 	bool "cortex-A17"
 	select BR2_ARM_CPU_HAS_ARM
@@ -170,41 +183,49 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
+	depends on !BR2_ARCH_IS_64
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
-- 
2.7.4
