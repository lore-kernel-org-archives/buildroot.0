From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:45 -0300
Subject: [Buildroot] [PATCH 20/36] arch/Config.in*: fix attributes order
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-21-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention: type, default, depends on, select, help.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 arch/Config.in         |  2 +-
 arch/Config.in.arc     |  2 +-
 arch/Config.in.arm     |  4 ++--
 arch/Config.in.bfin    |  2 +-
 arch/Config.in.m68k    |  2 +-
 arch/Config.in.mips    |  8 ++++----
 arch/Config.in.powerpc |  4 ++--
 arch/Config.in.sh      |  2 +-
 arch/Config.in.sparc   |  2 +-
 arch/Config.in.x86     | 30 +++++++++++++++---------------
 arch/Config.in.xtensa  |  8 ++++----
 11 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index d3f63da34f..dd972bc0ee 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -376,8 +376,8 @@ endchoice
 # Set up flat binary type
 choice
 	prompt "FLAT Binary type"
-	depends on BR2_BINFMT_FLAT
 	default BR2_BINFMT_FLAT_ONE
+	depends on BR2_BINFMT_FLAT
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 92503a0140..156384b9a5 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,7 +1,7 @@
 choice
 	prompt "Target CPU"
-	depends on BR2_arc
 	default BR2_arc770d
+	depends on BR2_arc
 	help
 	    Specific CPU to use
 
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b05e83e33c..c99a995db2 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -456,9 +456,9 @@ config BR2_ARM_ENABLE_VFP
 
 choice
 	prompt "Target ABI"
-	depends on BR2_arm || BR2_armeb
 	default BR2_ARM_EABIHF if BR2_ARM_CPU_HAS_VFPV2
 	default BR2_ARM_EABI
+	depends on BR2_arm || BR2_armeb
 	help
 	  Application Binary Interface to use. The Application Binary
 	  Interface describes the calling conventions (how arguments
@@ -746,7 +746,6 @@ config BR2_GCC_TARGET_ABI
 	default "lp64"		if BR2_aarch64 || BR2_aarch64_be
 
 config BR2_GCC_TARGET_FPU
-	depends on BR2_arm || BR2_armeb
 	default "vfp"		if BR2_ARM_FPU_VFPV2
 	default "vfpv3"		if BR2_ARM_FPU_VFPV3
 	default "vfpv3-d16"	if BR2_ARM_FPU_VFPV3D16
@@ -756,6 +755,7 @@ config BR2_GCC_TARGET_FPU
 	default "neon-vfpv4"	if BR2_ARM_FPU_NEON_VFPV4
 	default "fp-armv8"	if BR2_ARM_FPU_FP_ARMV8
 	default "neon-fp-armv8"	if BR2_ARM_FPU_NEON_FP_ARMV8
+	depends on BR2_arm || BR2_armeb
 
 config BR2_GCC_TARGET_FLOAT_ABI
 	default "soft"		if BR2_ARM_SOFT_FLOAT
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index bd9589c71d..b570d388fd 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,7 +1,7 @@
 choice
 	prompt "Target CPU"
-	depends on BR2_bfin
 	default BR2_bf532
+	depends on BR2_bfin
 	help
 	  Specify target CPU
 config BR2_bf512
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index c56031cb78..c134df2f14 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -15,8 +15,8 @@ config BR2_m68k_cf
 # coldfire variants will be added later
 choice
 	prompt "Target CPU"
-	depends on BR2_m68k
 	default BR2_m68k_68040
+	depends on BR2_m68k
 	help
 	  Specific CPU variant to use
 
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 5513edb180..cc11744f04 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -28,9 +28,9 @@ config BR2_MIPS_CPU_MIPS64R6
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default BR2_mips_32 if BR2_mips || BR2_mipsel
 	default BR2_mips_64 if BR2_mips64 || BR2_mips64el
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Specific CPU variant to use
 
@@ -117,8 +117,8 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_mips64 || BR2_mips64el
 	default BR2_MIPS_NABI32
+	depends on BR2_mips64 || BR2_mips64el
 
 	help
 	  Application Binary Interface to use
@@ -144,8 +144,8 @@ config BR2_MIPS_SOFT_FLOAT
 
 choice
 	prompt "FP mode"
-	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
 	default BR2_MIPS_FP32_MODE_XX
+	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
 	help
 	  MIPS32 supports different FP modes (32,xx,64). Information about FP
 	  modes can be found here:
@@ -179,8 +179,8 @@ config BR2_MIPS_NAN_2008
 
 choice
 	prompt "Target NaN"
-	depends on BR2_mips_32r5 || BR2_mips_64r5
 	default BR2_MIPS_ENABLE_NAN_2008
+	depends on BR2_mips_32r5 || BR2_mips_64r5
 	help
 	  MIPS supports two different NaN encodings, legacy and 2008.
 	  Information about MIPS NaN encodings can be found here:
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 0968412647..7a452a630a 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -71,12 +71,12 @@ config BR2_powerpc_740
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_7400
 	bool "7400"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	depends on !BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_7450
 	bool "7450"
-	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	depends on !BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_750
 	bool "750"
 	depends on !BR2_ARCH_IS_64
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index deb7244f29..1cb2db90ad 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -1,7 +1,7 @@
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_sh
 	default BR2_sh4
+	depends on BR2_sh
 	help
 	  Specific CPU variant to use
 
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 9b6a6aa21a..b22b55142e 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -1,8 +1,8 @@
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_sparc || BR2_sparc64
 	default BR2_sparc_v8 if BR2_sparc
 	default BR2_sparc_v9 if BR2_sparc64
+	depends on BR2_sparc || BR2_sparc64
 	help
 	  Specific CPU variant to use
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8e623b3c2b..f7c53a0fae 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -20,8 +20,8 @@ config BR2_X86_CPU_HAS_AVX2
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_i386 || BR2_x86_64
 	default BR2_x86_i586 if BR2_i386
+	depends on BR2_i386 || BR2_x86_64
 	help
 	  Specific CPU variant to use
 
@@ -50,35 +50,35 @@ config BR2_x86_pentiumpro
 	depends on !BR2_x86_64
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium_m
 	bool "pentium mobile"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
-	depends on !BR2_x86_64
 config BR2_x86_pentium2
 	bool "pentium2"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_pentium3
 	bool "pentium3"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
-	depends on !BR2_x86_64
 config BR2_x86_pentium4
 	bool "pentium4"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
-	depends on !BR2_x86_64
 config BR2_x86_prescott
 	bool "prescott"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
-	depends on !BR2_x86_64
 config BR2_x86_nocona
 	bool "nocona"
 	select BR2_X86_CPU_HAS_MMX
@@ -140,21 +140,21 @@ config BR2_x86_silvermont
 	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_k6
 	bool "k6"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_k6_2
 	bool "k6-2"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_athlon
 	bool "athlon"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_athlon_4
 	bool "athlon-4"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
-	depends on !BR2_x86_64
 config BR2_x86_opteron
 	bool "opteron"
 	select BR2_X86_CPU_HAS_MMX
@@ -198,21 +198,21 @@ config BR2_x86_geode
 	depends on !BR2_x86_64
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
+	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
-	depends on !BR2_x86_64
 config BR2_x86_winchip_c6
 	bool "IDT Winchip C6"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_winchip2
 	bool "IDT Winchip 2"
-	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 endchoice
 
 config BR2_ARCH
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 5d5bcb48f9..49e93a4774 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -1,15 +1,15 @@
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_xtensa
 	default BR2_xtensa_fsf
+	depends on BR2_xtensa
 
 config BR2_XTENSA_CUSTOM
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	bool "Custom Xtensa processor configuration"
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 config BR2_xtensa_fsf
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	bool "fsf - Default configuration"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 endchoice
 
@@ -30,8 +30,8 @@ config BR2_XTENSA_OVERLAY_FILE
 
 choice
 	prompt "Target Architecture Endianness"
-	depends on BR2_XTENSA_CUSTOM
 	default BR2_XTENSA_LITTLE_ENDIAN
+	depends on BR2_XTENSA_CUSTOM
 
 config BR2_XTENSA_LITTLE_ENDIAN
 	bool "Little endian"
-- 
2.14.1
