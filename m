From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:51 +0200
Subject: [Buildroot] [PATCH v3 09/15] arch/arm: move dependency on 64-bit
 down to individual cores
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-10-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

It will make it easier to introduce new variants anywhere in the
list, when those variants have different bitness requirements.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 arch/Config.in.arm | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 93031ab147..5557261604 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -376,50 +376,55 @@ config BR2_exynos_m1
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-if BR2_ARCH_IS_64
 config BR2_falkor
 	bool "falkor"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_qdf24xx
 	bool "qdf24xx"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_thunderx
 	bool "thunderx"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_thunderxt81
 	bool "thunderxt81"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt83
 	bool "thunderxt83"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88
 	bool "thunderxt88"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88p1
 	bool "thunderxt88p1"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-endif # BR2_ARCH_IS_64
 config BR2_xgene1
 	bool "xgene1"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -430,59 +435,60 @@ config BR2_xgene1
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 
-if BR2_ARCH_IS_64
 comment "armv8.1a cores"
 config BR2_thunderx2t99
 	bool "thunderx2t99"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderx2t99p1
 	bool "thunderx2t99p1"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_vulcan
 	bool "vulcan"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-endif # BR2_ARCH_IS_64
 
-if BR2_ARCH_IS_64
 comment "armv8.2a cores"
 config BR2_cortex_a55
 	bool "cortex-A55"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75
 	bool "cortex-A75"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75_a55
 	bool "cortex-A75/A55 big.LITTLE"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-endif # BR2_ARCH_IS_64
 
-if BR2_ARCH_IS_64
 comment "armv8.3a cores"
 config BR2_saphira
 	bool "saphira"
+	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-endif # BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
-- 
2.17.1
