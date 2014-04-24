From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Apr 2014 22:00:31 -0300
Subject: [Buildroot] [PATCHv2 2/6] arm: update processor types
In-Reply-To: <1398301235-8445-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398301235-8445-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1398301235-8445-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the arm processor types: add the cortex A12 variant supported by
gcc 4.9.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm         |  7 +++++++
 package/gcc/Config.in.host | 12 ++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index dd58744..b7a9ed6 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -98,6 +98,11 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
+config BR2_cortex_a12
+	bool "cortex-A12"
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
@@ -357,6 +362,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a7"	if BR2_cortex_a7
 	default "cortex-a8"	if BR2_cortex_a8
 	default "cortex-a9"	if BR2_cortex_a9
+	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
@@ -379,6 +385,7 @@ config BR2_GCC_TARGET_ARCH
 	default "armv7-a"	if BR2_cortex_a7
 	default "armv7-a"	if BR2_cortex_a8
 	default "armv7-a"	if BR2_cortex_a9
+	default "armv7-a"	if BR2_cortex_a12
 	default "armv7-a"	if BR2_cortex_a15
 	default "armv4"		if BR2_fa526
 	default "armv7-a"	if BR2_pj4
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6b44e94..9b77951 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -19,12 +19,12 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -32,24 +32,24 @@ choice
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
-- 
1.8.3.2
