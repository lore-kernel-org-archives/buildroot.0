From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 16:07:05 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce BR2_ARCH_HAS_GCC_x_y
Message-ID: <1367503625-31148-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch eliminates the long "depends on" lines in
toolchain/gcc/Config.in by letting architectures specify
which GCC versions they support.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in          |    9 ++++++
 arch/Config.in.arm      |   40 ++++++++++++++++++++++++++++
 arch/Config.in.powerpc  |   66 +++++++++++++++++++++++++++++++++++++++++++++++
 arch/Config.in.sparc    |    5 +++
 arch/Config.in.x86      |   31 ++++++++++++++++++++++
 toolchain/gcc/Config.in |   45 +++++++++++++++++++++++++++-----
 6 files changed, 189 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 2006f1e..08b6df8 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -56,6 +56,7 @@ config BR2_avr32
 
 config BR2_bfin
 	bool "Blackfin"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
 	  manufactured and marketed by Analog Devices.
@@ -93,6 +94,7 @@ config BR2_microblazebe
 
 config BR2_mips
 	bool "MIPS (big endian)"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -100,6 +102,7 @@ config BR2_mips
 
 config BR2_mipsel
 	bool "MIPS (little endian)"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -108,6 +111,7 @@ config BR2_mipsel
 config BR2_mips64
 	bool "MIPS64 (big endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
 	  http://www.mips.com/
@@ -116,6 +120,7 @@ config BR2_mips64
 config BR2_mips64el
 	bool "MIPS64 (little endian)"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
 	  http://www.mips.com/
@@ -130,6 +135,7 @@ config BR2_powerpc
 
 config BR2_sh
 	bool "SuperH"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -138,6 +144,7 @@ config BR2_sh
 
 config BR2_sh64
 	bool "SuperH64"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by Hitachi.
@@ -155,6 +162,7 @@ config BR2_sparc
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  x86-64 is an extension of the x86 instruction set (Intel i386
 	  architecture compatible microprocessor).
@@ -162,6 +170,7 @@ config BR2_x86_64
 
 config BR2_xtensa
 	bool "Xtensa"
+	select BR2_ARCH_HAS_ALL_GCC
 	help
 	  Xtensa is a Tensilica processor IP architecture.
 	  http://en.wikipedia.org/wiki/Xtensa
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2f4c0c8..26a3d03 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -15,46 +15,86 @@ choice
 
 config BR2_arm7tdmi
 	bool "arm7tdmi"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm720t
 	bool "arm720t"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm920t
 	bool "arm920t"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm922t
 	bool "arm922t"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm926t
 	bool "arm926t"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm10t
 	bool "arm10t"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm1136jf_s_r0
 	bool "arm1136jf_s rev0"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm1136jf_s_r1
 	bool "arm1136jf_s rev1"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_fa526
 	bool "fa526/626"
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_pj4
 	bool "pj4"
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_xscale
 	bool "xscale"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_iwmmxt
 	bool "iwmmxt"
+	select BR2_ARCH_HAS_ALL_GCC
 endchoice
 
 config BR2_arm1136jf_s
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 8643efc..323acf2 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -6,70 +6,136 @@ choice
 	  Specific CPU variant to use
 config BR2_generic_powerpc
 	bool "generic"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_401
 	bool "401"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_403
 	bool "403"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_405
 	bool "405"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_405fp
 	bool "405 with FPU"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_440
 	bool "440"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_440fp
 	bool "440 with FPU"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_464
 	bool "464"
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_464fp
 	bool "464 with FPU"
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_476
 	bool "476"
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_476fp
 	bool "476 with FPU"
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_505
 	bool "505"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_601
 	bool "601"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_602
 	bool "602"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_603
 	bool "603"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_603e
 	bool "603e"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_604
 	bool "604"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_604e
 	bool "604e"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_620
 	bool "620"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_630
 	bool "630"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_740
 	bool "740"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_7400
 	bool "7400"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_7450
 	bool "7450"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_750
 	bool "750"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_821
 	bool "821"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_823
 	bool "823"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_860
 	bool "860"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_970
 	bool "970"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_powerpc_e300c2
 	bool "e300c2"
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_e300c3
 	bool "e300c3"
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_powerpc_e500mc
 	bool "e500mc"
+	select BR2_ARCH_HAS_GCC_4_4
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 endchoice
 
 choice
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 33204a2..b169072 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -7,14 +7,19 @@ choice
 
 config BR2_sparc_v8
 	bool "v8"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_sparc_sparchfleon
 	bool "hfleon"
+	select BR2_ARCH_HAS_GCC_4_4
 config BR2_sparc_sparchfleonv8
 	bool "hfleonv8"
+	select BR2_ARCH_HAS_GCC_4_4
 config BR2_sparc_sparcsfleon
 	bool "sfleon"
+	select BR2_ARCH_HAS_GCC_4_4
 config BR2_sparc_sparcsfleonv8
 	bool "sfleonv8"
+	select BR2_ARCH_HAS_GCC_4_4
 endchoice
 
 config BR2_ARCH
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..b3ecc64 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -20,44 +20,55 @@ choice
 
 config BR2_x86_generic
 	bool "generic"
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_i386
 	bool "i386"
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_i486
 	bool "i486"
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_i686
 	bool "i686"
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentiumpro
 	bool "pentium pro"
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentium_m
 	bool "pentium mobile"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentium2
 	bool "pentium2"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentium3
 	bool "pentium3"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_pentium4
 	bool "pentium4"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_prescott
 	bool "prescott"
@@ -65,6 +76,7 @@ config BR2_x86_prescott
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_nocona
 	bool "nocona"
@@ -72,6 +84,7 @@ config BR2_x86_nocona
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_core2
 	bool "core2"
 	select BR2_X86_CPU_HAS_MMX
@@ -79,6 +92,7 @@ config BR2_x86_core2
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -86,62 +100,79 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_ARCH_HAS_GCC_4_5
+	select BR2_ARCH_HAS_GCC_4_6
+	select BR2_ARCH_HAS_GCC_4_7
+	select BR2_ARCH_HAS_GCC_4_8
+	select BR2_ARCH_HAS_GCC_SNAP
 config BR2_x86_k6
 	bool "k6"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_k6_2
 	bool "k6-2"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_athlon
 	bool "athlon"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_athlon_4
 	bool "athlon-4"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_opteron
 	bool "opteron"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_opteron_sse3
 	bool "opteron w/ SSE3"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_barcelona
 	bool "barcelona"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+	select BR2_ARCH_HAS_ALL_GCC
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
 	# processor, some with MMX support, some without.
 	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_winchip_c6
 	bool "IDT Winchip C6"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 config BR2_x86_winchip2
 	bool "IDT Winchip 2"
 	select BR2_X86_CPU_HAS_MMX
+	select BR2_ARCH_HAS_ALL_GCC
 	depends on !BR2_x86_64
 endchoice
 
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index f297e73..dfcc57f 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -2,6 +2,37 @@
 
 comment "GCC Options"
 
+config BR2_ARCH_HAS_ALL_GCC
+	bool
+
+config BR2_ARCH_HAS_GCC_4_3
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_4_4
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_4_5
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_4_6
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_4_7
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_4_8
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
+config BR2_ARCH_HAS_GCC_SNAP
+	bool
+	default y if BR2_ARCH_HAS_ALL_GCC
+
 config BR2_GCC_NEEDS_MPC
 	bool
 
@@ -23,35 +54,35 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_3
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_4
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_5
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_6
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on BR2_ARCH_HAS_GCC_4_7
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on BR2_ARCH_HAS_GCC_4_8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on BR2_ARCH_HAS_GCC_SNAP
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
-- 
1.7.0.4
