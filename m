From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:11:52 +0100
Subject: [Buildroot] [git commit] arch/arm: add cortex-A32
Message-ID: <20171201205337.172A77FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc9d6024312017a9fc7ecf6c112e60bd8288af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cortex-A32 is an armv8a core, but it lacks the optional AArch64
extensions, so can only work in 32-bit mode.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index d110d52..061c0ea 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -243,6 +243,16 @@ config BR2_cortex_m4
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
+config BR2_cortex_a32
+	bool "cortex-A32"
+	depends on !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -571,6 +581,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
 	# armv8a
+	default "cortex-a32"	if BR2_cortex_a32
 	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-a57"	if BR2_cortex_a57
 	default "cortex-a57.cortex-a53"	if BR2_cortex_a57_a53
