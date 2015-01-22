From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 22 Jan 2015 15:33:25 -0300
Subject: [Buildroot] [PATCH 1/4] arm: conditionally support regular ARM
	instructions
In-Reply-To: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1421951608-31233-2-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guido Mart?nez <guido@vanguardiasur.com.ar>

Until now, all ARM processors supported the original ARM instructions.
However, the Cortex-M variants don't support them, and support only
Thumb/Thumb2 modes.

So, make a Kconfig option for ARM support and use it.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 arch/Config.in.arm | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 162191b..a2d113a 100644
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
 
@@ -318,10 +338,11 @@ endchoice
 
 choice
 	prompt "ARM instruction set"
-	depends on BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
+	depends on BR2_ARM_CPU_HAS_ARM || BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_INSTRUCTIONS_ARM_CHOICE
 	bool "ARM"
+	depends on BR2_ARM_CPU_HAS_ARM
 	help
 	  This option instructs the compiler to generate regular ARM
 	  instructions, that are all 32 bits wide.
-- 
2.2.1
