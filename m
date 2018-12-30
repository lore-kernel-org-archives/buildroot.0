From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:37:35 +0100
Subject: [Buildroot] [git commit] arch/arm: restrict more armv8a cores to
 aarch64
Message-ID: <20181230143303.0CE12837A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e8c74f0f59abc59c5bc538a4a1dc1d41c11007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcc-8, falkor and qdf24xx have been available only as
AArch64. Indeed, according to upstream commit [1], the released HW has
never supported AArch32.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=96a411453d39e6583fa4d7008761a1977cdbe7fa

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
