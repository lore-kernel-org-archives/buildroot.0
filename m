From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 May 2019 17:07:17 +0200
Subject: [Buildroot] [PATCH v2 12/15] arch/arm: add two new 64-bit-only
 armv8a cores
In-Reply-To: <20190508150720.27946-1-romain.naour@gmail.com>
References: <20190508150720.27946-1-romain.naour@gmail.com>
Message-ID: <20190508150720.27946-13-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Build tested:
https://gitlab.com/kubu93/buildroot/pipelines/60318953

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in.arm | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b46c1c5cd1..d29b6edbc4 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -367,6 +367,13 @@ config BR2_cortex_a73_a53
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_emag
+	bool "emag"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_exynos_m1
 	bool "exynos-m1"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -383,6 +390,13 @@ config BR2_falkor
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+config BR2_phecda
+	bool "phecda"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_qdf24xx
 	bool "qdf24xx"
 	depends on BR2_ARCH_IS_64
@@ -821,8 +835,10 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a73"	if BR2_cortex_a73
 	default "cortex-a73.cortex-a35"	if BR2_cortex_a73_a35
 	default "cortex-a73.cortex-a53"	if BR2_cortex_a73_a53
+	default "emag"		if BR2_emag
 	default "exynos-m1"	if BR2_exynos_m1
 	default "falkor"	if BR2_falkor
+	default "phecda"	if BR2_phecda
 	default "qdf24xx"	if BR2_qdf24xx
 	default "thunderx"	if BR2_thunderx && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	default "octeontx"	if BR2_thunderx
-- 
2.14.5
