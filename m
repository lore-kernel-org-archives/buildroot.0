From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 15:54:19 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] arch/arm: restrict more
 armv8a cores to aarch64
Message-ID: <20190118145456.76BA783557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a18058f0ee706f30a394133000692d6fa92ceeba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Since gcc-8, falkor and qdf24xx have been available only as
AArch64. Indeed, according to upstream commit [1], the released HW has
never supported AArch32.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=96a411453d39e6583fa4d7008761a1977cdbe7fa

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit d9e8c74f0f59abc59c5bc538a4a1dc1d41c11007)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b05e83e33c..e3b808279e 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -342,25 +342,19 @@ config BR2_exynos_m1
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
