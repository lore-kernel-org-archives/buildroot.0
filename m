From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:35:00 +0200
Subject: [Buildroot] [git commit] arch/arm: add blind options to know the
	ARM architecture
Message-ID: <20141025103545.438F7B57CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ece7daaa10fc6612f73b4d876110b195d202f9c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the removal of BR2_GCC_TARGET_ARCH for ARM, this
commit introduces a number of blind options for each ARM architecture,
so that packages/toolchains that had dependencies using
BR2_GCC_TARGET_ARCH can continue to express their dependencies. It can
also be used to simplify package dependencies that were using the
individual ARM core options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 arch/Config.in.arm |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 201ff1d..5441c8d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -37,6 +37,18 @@ config BR2_ARM_CPU_HAS_THUMB
 config BR2_ARM_CPU_HAS_THUMB2
 	bool
 
+config BR2_ARM_CPU_ARMV4
+	bool
+
+config BR2_ARM_CPU_ARMV5
+	bool
+
+config BR2_ARM_CPU_ARMV6
+	bool
+
+config BR2_ARM_CPU_ARMV7A
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
@@ -47,70 +59,88 @@ choice
 config BR2_arm920t
 	bool "arm920t"
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV4
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV4
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV5
 config BR2_arm1136jf_s_r0
 	bool "arm1136jf_s rev0"
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
 config BR2_arm1136jf_s_r1
 	bool "arm1136jf_s rev1"
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
 config BR2_fa526
 	bool "fa526/626"
+	select BR2_ARM_CPU_ARMV4
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_VFPV3
+	select BR2_ARM_CPU_ARMV7A
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
+	select BR2_ARM_CPU_ARMV4
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV5
 config BR2_iwmmxt
 	bool "iwmmxt"
+	select BR2_ARM_CPU_ARMV5
 endchoice
 
 config BR2_arm1136jf_s
