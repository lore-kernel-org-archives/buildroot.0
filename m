From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Dec 2018 15:16:10 +0100
Subject: [Buildroot] [PATCH 1/4] arch/arm: drop useless conditional
 dependencies for 64-bit-only cores
In-Reply-To: <cover.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <4afed8038e54fcc8f5053c2d526f489047f3c344.1546179362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those cores are already guarded by a 64-bit-only condition, so they
can't even select additional options in non-64-bit mode anyway...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f0488b4685..83813d96f5 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -440,27 +440,18 @@ if BR2_ARCH_IS_64
 comment "armv8.1a cores"
 config BR2_thunderx2t99
 	bool "thunderx2t99"
-	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderx2t99p1
 	bool "thunderx2t99p1"
-	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_vulcan
 	bool "vulcan"
-	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
-	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
-- 
2.14.1
