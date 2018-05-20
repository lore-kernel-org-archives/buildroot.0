From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:57:18 +0200
Subject: [Buildroot] [git commit branch/next] arch/arm: add cortex-m7 core
Message-ID: <20180520171922.F3F088123D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6edfa3bf781606eb6747739f289e5319421daddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Nothing fancy, just a plain Cortex-M, armv7-M core...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c99a995db2..7651d10927 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -241,6 +241,11 @@ config BR2_cortex_m4
 	bool "cortex-M4"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
+config BR2_cortex_m7
+	bool "cortex-M7"
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
@@ -716,6 +721,7 @@ config BR2_GCC_TARGET_CPU
 	# armv7m
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
+	default "cortex-m7"	if BR2_cortex_m7
 	# armv8a
 	default "cortex-a32"	if BR2_cortex_a32
 	default "cortex-a35"	if BR2_cortex_a35
