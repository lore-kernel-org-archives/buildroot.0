From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Sun,  9 Jun 2013 10:53:50 +0800
Subject: [Buildroot]  [PATCH] arm: update processor types
Message-ID: <1370746430-5135-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update arm architecture variant: add the cortex A7.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 arch/Config.in.arm      |    5 +++++
 toolchain/gcc/Config.in |    8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2f4c0c8..983cac4 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -36,6 +36,9 @@ config BR2_arm1176jzf_s
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+config BR2_cortex_a7
+	bool "cortex-A7"
+	select BR2_ARM_CPU_HAS_NEON
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
@@ -113,6 +116,7 @@ config BR2_GCC_TARGET_TUNE
 	default "arm1176jz-s"	if BR2_arm1176jz_s
 	default "arm1176jzf-s"	if BR2_arm1176jzf_s
 	default "cortex-a5"	if BR2_cortex_a5
+	default "cortex-a7"	if BR2_cortex_a7
 	default "cortex-a8"	if BR2_cortex_a8
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a15"	if BR2_cortex_a15
@@ -134,6 +138,7 @@ config BR2_GCC_TARGET_ARCH
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
 	default "armv7-a"	if BR2_cortex_a5
+	default "armv7-a"	if BR2_cortex_a7
 	default "armv7-a"	if BR2_cortex_a8
 	default "armv7-a"	if BR2_cortex_a9
 	default "armv7-a"	if BR2_cortex_a15
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index fdb19e1..7830241 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -23,20 +23,20 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
-- 
1.7.9.5
