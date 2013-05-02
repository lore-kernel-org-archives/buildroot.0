From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 16:07:26 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce BR2_ARCH_HAS_NO_GCC_x_y
Message-ID: <1367503646-31181-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch eliminates the long "depends on" lines in
toolchain/gcc/Config.in by letting architectures specify
which GCC versions they do not support.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in          |    7 +++++++
 arch/Config.in.arc      |    7 +++++++
 arch/Config.in.arm      |   15 +++++++++++++++
 arch/Config.in.powerpc  |    9 +++++++++
 arch/Config.in.sparc    |   24 ++++++++++++++++++++++++
 arch/Config.in.x86      |    2 ++
 toolchain/gcc/Config.in |   42 +++++++++++++++++++++++++++++++++++-------
 7 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 2006f1e..89fdf4b 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -48,6 +48,13 @@ config BR2_aarch64
 config BR2_avr32
 	bool "AVR32"
 	select BR2_SOFT_FLOAT
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 	help
 	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
 	  Atmel.
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 9f68b46..2bde0bf 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -5,6 +5,13 @@ config BR2_ARCH
 config BR2_arc
 	bool
 	default y if BR2_arcle || BR2_arceb
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 
 config BR2_ENDIAN
 	default "LITTLE" if BR2_arcle
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2f4c0c8..16b5049 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -36,19 +36,34 @@ config BR2_arm1176jzf_s
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
+	select BR2_ARCH_HAS_NO_GCC_4_5
 config BR2_fa526
 	bool "fa526/626"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
+	select BR2_ARCH_HAS_NO_GCC_4_5
 config BR2_pj4
 	bool "pj4"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 config BR2_xscale
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8643efc..6cd6f17 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -20,12 +20,18 @@ config BR2_powerpc_440fp
 	bool "440 with FPU"
 config BR2_powerpc_464
 	bool "464"
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_powerpc_464fp
 	bool "464 with FPU"
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_powerpc_476
 	bool "476"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
 config BR2_powerpc_476fp
 	bool "476 with FPU"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
 config BR2_powerpc_505
 	bool "505"
 config BR2_powerpc_601
@@ -66,10 +72,13 @@ config BR2_powerpc_8548
 	bool "8548 / e500v2"
 config BR2_powerpc_e300c2
 	bool "e300c2"
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_powerpc_e300c3
 	bool "e300c3"
+	select BR2_ARCH_HAS_NO_GCC_4_3
 config BR2_powerpc_e500mc
 	bool "e500mc"
+	select BR2_ARCH_HAS_NO_GCC_4_3
 endchoice
 
 choice
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 33204a2..c2e6077 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -9,12 +9,36 @@ config BR2_sparc_v8
 	bool "v8"
 config BR2_sparc_sparchfleon
 	bool "hfleon"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 config BR2_sparc_sparchfleonv8
 	bool "hfleonv8"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 config BR2_sparc_sparcsfleon
 	bool "sfleon"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 config BR2_sparc_sparcsfleonv8
 	bool "sfleonv8"
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_5
+	select BR2_ARCH_HAS_NO_GCC_4_6
+	select BR2_ARCH_HAS_NO_GCC_4_7
+	select BR2_ARCH_HAS_NO_GCC_4_8
+	select BR2_ARCH_HAS_NO_GCC_SNAP
 endchoice
 
 config BR2_ARCH
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..ce4fd11 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -86,6 +86,8 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_HAS_NO_GCC_4_3
+	select BR2_ARCH_HAS_NO_GCC_4_4
 config BR2_x86_k6
 	bool "k6"
 	select BR2_X86_CPU_HAS_MMX
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index f297e73..4fa0f9c 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -2,6 +2,34 @@
 
 comment "GCC Options"
 
+config BR2_ARCH_HAS_NO_GCC_4_3
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_4_4
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_4_5
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_4_6
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_4_7
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_4_8
+	bool
+	default n
+
+config BR2_ARCH_HAS_NO_GCC_SNAP
+	bool
+	default n
+
 config BR2_GCC_NEEDS_MPC
 	bool
 
@@ -23,35 +51,35 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_ARCH_HAS_NO_GCC_4_3
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_ARCH_HAS_NO_GCC_4_4
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_ARCH_HAS_NO_GCC_4_5
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_ARCH_HAS_NO_GCC_4_6
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_ARCH_HAS_NO_GCC_4_7
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_ARCH_HAS_NO_GCC_4_8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_ARCH_HAS_NO_GCC_SNAP
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
-- 
1.7.0.4
