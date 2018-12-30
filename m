From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 15:16:11 +0100
Subject: [Buildroot] [PATCH 2/4] arch/arm: restrict more armv8a cores to
 aarch64
In-Reply-To: <cover.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <891faf01bce122d52613f7fc831f32526beaa1a3.1546179362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since gcc-8, falkor and qdf24xx have been available only as AArch64.

Although we could support building in 32-bit for older gcc versions, we
decided not to, in the sake of simplicity.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 83813d96f5..bc1bb26582 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -376,25 +376,19 @@ config BR2_exynos_m1
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+if BR2_ARCH_IS_64
 config BR2_falkor
 	bool "falkor"
-	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_qdf24xx
 	bool "qdf24xx"
-	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-if BR2_ARCH_IS_64
 config BR2_thunderx
 	bool "thunderx"
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-- 
2.14.1
