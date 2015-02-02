From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 18:32:34 +0100
Subject: [Buildroot] [git commit] arm: conditionally support regular ARM
	instructions
Message-ID: <20150202173424.8BBD28046A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a87f5806ed1e6449c859ff97d1104548529b7102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, all ARM processors supported the original ARM instructions.
However, the Cortex-M variants don't support them, and support only
Thumb/Thumb2 modes.

So, make a Kconfig option for ARM support and use it.

[Thomas:
  - Remove the dependency in the choice between ARM/Thumb/Thumb-2,
    because basically the choice is now always visible.
  - Replace the BR2_ARM_INSTRUCTIONS_ARM_CHOICE choice option directly
    by BR2_ARM_INSTRUCTIONS_ARM, instead of having this blind option
    defined separately. This means the choice is now always visible,
    even when only the ARM instruction set is supported.]

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm |   28 ++++++++++++++++++++++------
 1 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 162191b..f5d317b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -31,6 +31,9 @@ config BR2_ARM_CPU_HAS_VFPV4
 	bool
 	select BR2_ARM_CPU_HAS_VFPV3
 
+config BR2_ARM_CPU_HAS_ARM
+	bool
+
 config BR2_ARM_CPU_HAS_THUMB
 	bool
 
@@ -58,83 +61,100 @@ choice
 
 config BR2_arm920t
 	bool "arm920t"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_arm922t
 	bool "arm922t"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
 config BR2_arm926t
 	bool "arm926t"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 config BR2_cortex_a5
 	bool "cortex-A5"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a7
 	bool "cortex-A7"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a8
 	bool "cortex-A8"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a9
 	bool "cortex-A9"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a12
 	bool "cortex-A12"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_cortex_a15
 	bool "cortex-A15"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_NEON
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 config BR2_fa526
 	bool "fa526/626"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 config BR2_pj4
 	bool "pj4"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
 config BR2_xscale
 	bool "xscale"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
 config BR2_iwmmxt
 	bool "iwmmxt"
+	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
 endchoice
 
@@ -318,10 +338,10 @@ endchoice
 
 choice
 	prompt "ARM instruction set"
-	depends on BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
 
-config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
+config BR2_ARM_INSTRUCTIONS_ARM
 	bool "ARM"
+	depends on BR2_ARM_CPU_HAS_ARM
 	help
 	  This option instructs the compiler to generate regular ARM
 	  instructions, that are all 32 bits wide.
@@ -346,10 +366,6 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 
 endchoice
 
-config BR2_ARM_INSTRUCTIONS_ARM
-	def_bool y
-	depends on !(BR2_ARM_INSTRUCTIONS_THUMB || BR2_ARM_INSTRUCTIONS_THUMB2)
-
 config BR2_ARCH
 	default "arm"	if BR2_arm
 	default "armeb"	if BR2_armeb
