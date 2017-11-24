From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:01:03 +0100
Subject: [Buildroot] [git commit branch/next] arch/arm: simplify hiding non
 64-bit cores
Message-ID: <20171124221933.B71837FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9f95de2c0d81d40ef4b062447f1d7deba34788c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that the cores are all oredered correctly, we can just enclose all
the non 64-bit cores inside a big if-block, rather than have each of
them have the dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 66dce3a..c2b7931 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -68,37 +68,32 @@ choice
 	help
 	  Specific CPU variant to use
 
+if !BR2_ARCH_IS_64
 comment "armv4 cores"
-	depends on !BR2_ARCH_IS_64
 config BR2_arm920t
 	bool "arm920t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 
 comment "armv5 cores"
-	depends on !BR2_ARCH_IS_64
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_HAS_ARM
@@ -106,30 +101,25 @@ config BR2_arm926t
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 
 comment "armv6 cores"
-	depends on !BR2_ARCH_IS_64
 config BR2_arm1136j_s
 	bool "arm1136j-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -137,14 +127,12 @@ config BR2_arm1136jf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -152,7 +140,6 @@ config BR2_arm1176jzf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_arm11mpcore
 	bool "mpcore"
 	select BR2_ARM_CPU_HAS_ARM
@@ -160,10 +147,8 @@ config BR2_arm11mpcore
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 
 comment "armv7a cores"
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -172,7 +157,6 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -181,7 +165,6 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -190,7 +173,6 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -199,7 +181,6 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -208,7 +189,6 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -217,7 +197,6 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a15_a7
 	bool "cortex-A15/A7 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM
@@ -227,7 +206,6 @@ config BR2_cortex_a15_a7
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17
 	bool "cortex-A17"
 	select BR2_ARM_CPU_HAS_ARM
@@ -237,7 +215,6 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a17_a7
 	bool "cortex-A17/A7 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM
@@ -247,27 +224,23 @@ config BR2_cortex_a17_a7
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-	depends on !BR2_ARCH_IS_64
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 
 comment "armv7m cores"
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_IS_64
 config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_IS_64
+endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
 config BR2_cortex_a53
