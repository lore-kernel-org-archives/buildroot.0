From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Apr 2013 15:54:24 -0300
Subject: [Buildroot] [PATCH] toolchain/arm: add support for Marvell PJ4
Message-ID: <1367261664-11031-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm      |  4 ++++
 toolchain/gcc/Config.in | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f706dcc..2f4c0c8 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -47,6 +47,8 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_NEON
 config BR2_fa526
 	bool "fa526/626"
+config BR2_pj4
+	bool "pj4"
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 config BR2_xscale
@@ -115,6 +117,7 @@ config BR2_GCC_TARGET_TUNE
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a15"	if BR2_cortex_a15
 	default "fa526"		if BR2_fa526
+	default "marvell-pj4"	if BR2_pj4
 	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
@@ -135,6 +138,7 @@ config BR2_GCC_TARGET_ARCH
 	default "armv7-a"	if BR2_cortex_a9
 	default "armv7-a"	if BR2_cortex_a15
 	default "armv4"		if BR2_fa526
+	default "armv7-a"	if BR2_pj4
 	default "armv4"		if BR2_strongarm
 	default "armv5te"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index d7e8715..aae422c 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -18,25 +18,25 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
+		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526
+		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
-- 
1.8.1.5
