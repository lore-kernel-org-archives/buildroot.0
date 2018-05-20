From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:13:29 +0200
Subject: [Buildroot] [git commit] Revert "arch/arm: add cortex-m7 core"
Message-ID: <20180520171244.348F6812D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f0536474daffa6f1ee8ae73b37eda3fab75b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 43884e7f5011cbd70a9a17bfd87041953cfa74ee, which
was intended for the next branch, not master.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 7651d10927..c99a995db2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -241,11 +241,6 @@ config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
-config BR2_cortex_m7
-	bool "cortex-M7"
-	select BR2_ARM_CPU_HAS_THUMB2
-	select BR2_ARM_CPU_ARMV7M
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
@@ -721,7 +716,6 @@ config BR2_GCC_TARGET_CPU
 	# armv7m
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
-	default "cortex-m7"	if BR2_cortex_m7
 	# armv8a
 	default "cortex-a32"	if BR2_cortex_a32
 	default "cortex-a35"	if BR2_cortex_a35
