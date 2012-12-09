From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 18:54:03 -0300
Subject: [Buildroot] [PATCH 2/2] arm: update processor types
In-Reply-To: <1355090043-12326-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355090043-12326-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355090043-12326-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the arm processor types: add the cortex A5 & A15 variants.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm      |    8 ++++++++
 toolchain/gcc/Config.in |    6 +++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 6e5d258..b65b4ac 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -29,10 +29,14 @@ config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+config BR2_cortex_a5
+	bool "cortex-A5"
 config BR2_cortex_a8
 	bool "cortex-A8"
 config BR2_cortex_a9
 	bool "cortex-A9"
+config BR2_cortex_a15
+	bool "cortex-A15"
 config BR2_sa110
 	bool "sa110"
 config BR2_sa1100
@@ -83,8 +87,10 @@ config BR2_GCC_TARGET_TUNE
 	default "arm1136jf-s"	if BR2_arm1136jf_s
 	default "arm1176jz-s"	if BR2_arm1176jz_s
 	default "arm1176jzf-s"	if BR2_arm1176jzf_s
+	default "cortex-a5"	if BR2_cortex_a5
 	default "cortex-a8"	if BR2_cortex_a8
 	default "cortex-a9"	if BR2_cortex_a9
+	default "cortex-a15"	if BR2_cortex_a15
 	default "strongarm110"	if BR2_sa110
 	default "strongarm1100"	if BR2_sa1100
 	default "xscale"	if BR2_xscale
@@ -102,8 +108,10 @@ config BR2_GCC_TARGET_ARCH
 	default "armv6j"	if BR2_arm1136jf_s
 	default "armv6zk"	if BR2_arm1176jz_s
 	default "armv6zk"	if BR2_arm1176jzf_s
+	default "armv7-a"	if BR2_cortex_a5
 	default "armv7-a"	if BR2_cortex_a8
 	default "armv7-a"	if BR2_cortex_a9
+	default "armv7-a"	if BR2_cortex_a15
 	default "armv4"		if BR2_sa110
 	default "armv4"		if BR2_sa1100
 	default "armv5te"	if BR2_xscale
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index de79452..d16e7b0 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -15,15 +15,15 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp
+		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-- 
1.7.8.6
