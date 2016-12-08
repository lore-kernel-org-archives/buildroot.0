From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:32:14 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: only enable
	BR2_ARM_CPU_HAS_ARM for ARMv8 in 32bit mode
Message-ID: <20161208213308.AA54A81E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d97af8763a10180ff935a3dff90b217d79246e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5e6/5e67cc067a06f7364cde1a8393ea72608fe7fef1/

A number of packages use BR2_ARM_CPU_HAS_ARM to know if the target handles
classic A32 instructions, which is only true for ARMv8 cores when they are
running in 32bit mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 743f6ca..3c47bd7 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -193,21 +193,21 @@ config BR2_cortex_a17
 	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a53
 	bool "cortex-A53"
-	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57
 	bool "cortex-A57"
-	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a72
 	bool "cortex-A72"
-	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8
