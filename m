From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:53:53 +0100
Subject: [Buildroot] [PATCH 6/6] arch: Config.in string configuration
	options must be quoted
In-Reply-To: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4376ef19f7a7e37034dc1ce844b6a13548e43653.1352987586.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Yann E. Morin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm     |   78 +++++++++++++++++------------------
 arch/Config.in.m68k    |   24 +++++------
 arch/Config.in.mips    |   22 +++++-----
 arch/Config.in.powerpc |   70 ++++++++++++++++----------------
 arch/Config.in.sparc   |   42 +++++++++----------
 arch/Config.in.x86     |  106 ++++++++++++++++++++++++------------------------
 6 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2acedc4..6e5d258 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -69,46 +69,46 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_armeb
 
 config BR2_GCC_TARGET_TUNE
-	default arm600		if BR2_arm600
-	default arm610		if BR2_arm610
-	default arm620		if BR2_arm620
-	default arm7tdmi	if BR2_arm7tdmi
-	default arm7tdmi	if BR2_arm720t
-	default arm7tdmi	if BR2_arm740t
-	default arm920		if BR2_arm920
-	default arm920t		if BR2_arm920t
-	default arm922t		if BR2_arm922t
-	default arm926ej-s	if BR2_arm926t
-	default arm1136j-s	if BR2_arm1136j_s
-	default arm1136jf-s	if BR2_arm1136jf_s
-	default arm1176jz-s	if BR2_arm1176jz_s
-	default arm1176jzf-s	if BR2_arm1176jzf_s
-	default cortex-a8	if BR2_cortex_a8
-	default cortex-a9	if BR2_cortex_a9
-	default strongarm110	if BR2_sa110
-	default strongarm1100	if BR2_sa1100
-	default xscale		if BR2_xscale
-	default iwmmxt		if BR2_iwmmxt
+	default "arm600"	if BR2_arm600
+	default "arm610"	if BR2_arm610
+	default "arm620"	if BR2_arm620
+	default "arm7tdmi"	if BR2_arm7tdmi
+	default "arm7tdmi"	if BR2_arm720t
+	default "arm7tdmi"	if BR2_arm740t
+	default "arm920"	if BR2_arm920
+	default "arm920t"	if BR2_arm920t
+	default "arm922t"	if BR2_arm922t
+	default "arm926ej-s"	if BR2_arm926t
+	default "arm1136j-s"	if BR2_arm1136j_s
+	default "arm1136jf-s"	if BR2_arm1136jf_s
+	default "arm1176jz-s"	if BR2_arm1176jz_s
+	default "arm1176jzf-s"	if BR2_arm1176jzf_s
+	default "cortex-a8"	if BR2_cortex_a8
+	default "cortex-a9"	if BR2_cortex_a9
+	default "strongarm110"	if BR2_sa110
+	default "strongarm1100"	if BR2_sa1100
+	default "xscale"	if BR2_xscale
+	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ARCH
-	default armv4t		if BR2_arm7tdmi
-	default armv3		if BR2_arm610
-	default armv3		if BR2_arm710
-	default armv4t		if BR2_arm720t
-	default armv4t		if BR2_arm920t
-	default armv4t		if BR2_arm922t
-	default armv5te		if BR2_arm926t
-	default armv5t		if BR2_arm10t
-	default armv6j		if BR2_arm1136jf_s
-	default armv6zk		if BR2_arm1176jz_s
-	default armv6zk		if BR2_arm1176jzf_s
-	default armv7-a		if BR2_cortex_a8
-	default armv7-a		if BR2_cortex_a9
-	default armv4		if BR2_sa110
-	default armv4		if BR2_sa1100
-	default armv5te		if BR2_xscale
-	default iwmmxt		if BR2_iwmmxt
+	default "armv4t"	if BR2_arm7tdmi
+	default "armv3"		if BR2_arm610
+	default "armv3"		if BR2_arm710
+	default "armv4t"	if BR2_arm720t
+	default "armv4t"	if BR2_arm920t
+	default "armv4t"	if BR2_arm922t
+	default "armv5te"	if BR2_arm926t
+	default "armv5t"	if BR2_arm10t
+	default "armv6j"	if BR2_arm1136jf_s
+	default "armv6zk"	if BR2_arm1176jz_s
+	default "armv6zk"	if BR2_arm1176jzf_s
+	default "armv7-a"	if BR2_cortex_a8
+	default "armv7-a"	if BR2_cortex_a9
+	default "armv4"		if BR2_sa110
+	default "armv4"		if BR2_sa1100
+	default "armv5te"	if BR2_xscale
+	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ABI
-	default apcs-gnu	if BR2_ARM_OABI
-	default aapcs-linux	if BR2_ARM_EABI
+	default "apcs-gnu"	if BR2_ARM_OABI
+	default "aapcs-linux"	if BR2_ARM_EABI
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index b3d95b7..ba6cedf 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -5,17 +5,17 @@ config BR2_ENDIAN
 	default "BIG"
 
 config BR2_GCC_TARGET_TUNE
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
+	default "68000"		if BR2_m68k_68000
+	default "68010"		if BR2_m68k_68010
+	default "68020"		if BR2_m68k_68020
+	default "68030"		if BR2_m68k_68030
+	default "68040"		if BR2_m68k_68040
+	default "68060"		if BR2_m68k_68060
 
 config BR2_GCC_TARGET_ARCH
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
+	default "68000"		if BR2_m68k_68000
+	default "68010"		if BR2_m68k_68010
+	default "68020"		if BR2_m68k_68020
+	default "68030"		if BR2_m68k_68030
+	default "68040"		if BR2_m68k_68040
+	default "68060"		if BR2_m68k_68060
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index c71c3f4..1454fb4 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -63,16 +63,16 @@ config BR2_ENDIAN
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
 config BR2_GCC_TARGET_TUNE
-	default mips1		if BR2_mips_1
-	default mips2		if BR2_mips_2
-	default mips3		if BR2_mips_3
-	default mips4		if BR2_mips_4
-	default mips32		if BR2_mips_32
-	default mips32r2	if BR2_mips_32r2
-	default mips64		if BR2_mips_64
-	default mips64r2	if BR2_mips_64r2
+	default "mips1"		if BR2_mips_1
+	default "mips2"		if BR2_mips_2
+	default "mips3"		if BR2_mips_3
+	default "mips4"		if BR2_mips_4
+	default "mips32"	if BR2_mips_32
+	default "mips32r2"	if BR2_mips_32r2
+	default "mips64"	if BR2_mips_64
+	default "mips64r2"	if BR2_mips_64r2
 
 config BR2_GCC_TARGET_ABI
-	default 32		if BR2_MIPS_OABI32
-	default n32		if BR2_MIPS_NABI32
-	default 64		if BR2_MIPS_NABI64
+	default "32"		if BR2_MIPS_OABI32
+	default "n32"		if BR2_MIPS_NABI32
+	default "64"		if BR2_MIPS_NABI64
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 55c1651..693246b 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -89,40 +89,40 @@ config BR2_ENDIAN
 	default "BIG"
 
 config BR2_GCC_TARGET_TUNE
-	default 401		if BR2_powerpc_401
-	default 403		if BR2_powerpc_403
-	default 405		if BR2_powerpc_405
-	default 405fp		if BR2_powerpc_405fp
-	default 440		if BR2_powerpc_440
-	default 440fp		if BR2_powerpc_440fp
-	default 505		if BR2_powerpc_505
-	default 601		if BR2_powerpc_601
-	default 602		if BR2_powerpc_602
-	default 603		if BR2_powerpc_603
-	default 603e		if BR2_powerpc_603e
-	default 604		if BR2_powerpc_604
-	default 604e		if BR2_powerpc_604e
-	default 620		if BR2_powerpc_620
-	default 630		if BR2_powerpc_630
-	default 740		if BR2_powerpc_740
-	default 7400		if BR2_powerpc_7400
-	default 7450		if BR2_powerpc_7450
-	default 750		if BR2_powerpc_750
-	default 801		if BR2_powerpc_801
-	default 821		if BR2_powerpc_821
-	default 823		if BR2_powerpc_823
-	default 860		if BR2_powerpc_860
-	default 970		if BR2_powerpc_970
-	default 8540		if BR2_powerpc_8540
-	default	8548		if BR2_powerpc_8548
-	default e300c2		if BR2_powerpc_e300c2
-	default e300c3		if BR2_powerpc_e300c3
-	default e500mc		if BR2_powerpc_e500mc
+	default "401"		if BR2_powerpc_401
+	default "403"		if BR2_powerpc_403
+	default "405"		if BR2_powerpc_405
+	default "405fp"		if BR2_powerpc_405fp
+	default "440"		if BR2_powerpc_440
+	default "440fp"		if BR2_powerpc_440fp
+	default "505"		if BR2_powerpc_505
+	default "601"		if BR2_powerpc_601
+	default "602"		if BR2_powerpc_602
+	default "603"		if BR2_powerpc_603
+	default "603e"		if BR2_powerpc_603e
+	default "604"		if BR2_powerpc_604
+	default "604e"		if BR2_powerpc_604e
+	default "620"		if BR2_powerpc_620
+	default "630"		if BR2_powerpc_630
+	default "740"		if BR2_powerpc_740
+	default "7400"		if BR2_powerpc_7400
+	default "7450"		if BR2_powerpc_7450
+	default "750"		if BR2_powerpc_750
+	default "801"		if BR2_powerpc_801
+	default "821"		if BR2_powerpc_821
+	default "823"		if BR2_powerpc_823
+	default "860"		if BR2_powerpc_860
+	default "970"		if BR2_powerpc_970
+	default "8540"		if BR2_powerpc_8540
+	default	"8548"		if BR2_powerpc_8548
+	default "e300c2"	if BR2_powerpc_e300c2
+	default "e300c3"	if BR2_powerpc_e300c3
+	default "e500mc"	if BR2_powerpc_e500mc
 
 config BR2_GCC_TARGET_ABI
-	default altivec		if BR2_PPC_ABI_altivec
-	default no-altivec	if BR2_PPC_ABI_no-altivec
-	default spe		if BR2_PPC_ABI_spe
-	default no-spe		if BR2_PPC_ABI_no-spe
-	default ibmlongdouble	if BR2_PPC_ABI_ibmlongdouble
-	default ieeelongdouble	if BR2_PPC_ABI_ieeelongdouble
+	default "altivec"		if BR2_PPC_ABI_altivec
+	default "no-altivec"		if BR2_PPC_ABI_no-altivec
+	default "spe"			if BR2_PPC_ABI_spe
+	default "no-spe"		if BR2_PPC_ABI_no-spe
+	default "ibmlongdouble"		if BR2_PPC_ABI_ibmlongdouble
+	default "ieeelongdouble"	if BR2_PPC_ABI_ieeelongdouble
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index d810b75..e1f72cc 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -44,26 +44,26 @@ config BR2_ENDIAN
 	default "BIG"
 
 config BR2_GCC_TARGET_TUNE
-	default v7		if BR2_sparc_v7
-	default cypress		if BR2_sparc_cypress
-	default v8		if BR2_sparc_v8
-	default supersparc	if BR2_sparc_supersparc
-	default hypersparc	if BR2_sparc_hypersparc
-	default sparclite	if BR2_sparc_sparclite
-	default f930		if BR2_sparc_f930
-	default f934		if BR2_sparc_f934
-	default sparclite86x	if BR2_sparc_sparclite86x
-	default sparclet	if BR2_sparc_sparclet
-	default tsc701		if BR2_sparc_tsc701
-	default v9		if BR2_sparc_v9
-	default v9		if BR2_sparc_v9a
-	default v9		if BR2_sparc_v9b
-	default ultrasparc	if BR2_sparc_ultrasparc
-	default ultrasparc3	if BR2_sparc_ultrasparc3
-	default niagara		if BR2_sparc_niagara
+	default "v7"		if BR2_sparc_v7
+	default "cypress"	if BR2_sparc_cypress
+	default "v8"		if BR2_sparc_v8
+	default "supersparc"	if BR2_sparc_supersparc
+	default "hypersparc"	if BR2_sparc_hypersparc
+	default "sparclite"	if BR2_sparc_sparclite
+	default "f930"		if BR2_sparc_f930
+	default "f934"		if BR2_sparc_f934
+	default "sparclite86x"	if BR2_sparc_sparclite86x
+	default "sparclet"	if BR2_sparc_sparclet
+	default "tsc701"	if BR2_sparc_tsc701
+	default "v9"		if BR2_sparc_v9
+	default "v9"		if BR2_sparc_v9a
+	default "v9"		if BR2_sparc_v9b
+	default "ultrasparc"	if BR2_sparc_ultrasparc
+	default "ultrasparc3"	if BR2_sparc_ultrasparc3
+	default "niagara"	if BR2_sparc_niagara
 
 config BR2_GCC_TARGET_CPU
-	default sparchfleon	if BR2_sparc_sparchfleon
-	default sparchfleonv8	if BR2_sparc_sparchfleonv8
-	default sparcsfleon	if BR2_sparc_sparcsfleon
-	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
+	default "sparchfleon"	if BR2_sparc_sparchfleon
+	default "sparchfleonv8"	if BR2_sparc_sparchfleonv8
+	default "sparcsfleon"	if BR2_sparc_sparcsfleon
+	default "sparcsfleonv8"	if BR2_sparc_sparcsfleonv8
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ef29a71..d2e0807 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -178,58 +178,58 @@ config BR2_ENDIAN
 	default "LITTLE"
 
 config BR2_GCC_TARGET_TUNE
-	default i386		if BR2_x86_i386
-	default i486		if BR2_x86_i486
-	default i586		if BR2_x86_i586
-	default pentium-mmx	if BR2_x86_pentium_mmx
-	default i686		if BR2_x86_i686
-	default pentiumpro	if BR2_x86_pentiumpro
-	default pentium-m	if BR2_x86_pentium_m
-	default pentium2	if BR2_x86_pentium2
-	default pentium3	if BR2_x86_pentium3
-	default pentium4	if BR2_x86_pentium4
-	default prescott	if BR2_x86_prescott
-	default nocona		if BR2_x86_nocona
-	default core2		if BR2_x86_core2
-	default atom		if BR2_x86_atom
-	default k8		if BR2_x86_opteron
-	default k8-sse3		if BR2_x86_opteron_sse3
-	default barcelona	if BR2_x86_barcelona
-	default k6		if BR2_x86_k6
-	default k6-2		if BR2_x86_k6_2
-	default athlon		if BR2_x86_athlon
-	default athlon-4	if BR2_x86_athlon_4
-	default winchip-c6	if BR2_x86_winchip_c6
-	default winchip2	if BR2_x86_winchip2
-	default c3		if BR2_x86_c3
-	default c3-2		if BR2_x86_c32
-	default geode		if BR2_x86_geode
-	default generic		if BR2_x86_generic
+	default "i386"		if BR2_x86_i386
+	default "i486"		if BR2_x86_i486
+	default "i586"		if BR2_x86_i586
+	default "pentium-mmx"	if BR2_x86_pentium_mmx
+	default "i686"		if BR2_x86_i686
+	default "pentiumpro"	if BR2_x86_pentiumpro
+	default "pentium-m"	if BR2_x86_pentium_m
+	default "pentium2"	if BR2_x86_pentium2
+	default "pentium3"	if BR2_x86_pentium3
+	default "pentium4"	if BR2_x86_pentium4
+	default "prescott"	if BR2_x86_prescott
+	default "nocona"	if BR2_x86_nocona
+	default "core2"		if BR2_x86_core2
+	default "atom"		if BR2_x86_atom
+	default "k8"		if BR2_x86_opteron
+	default "k8-sse3"	if BR2_x86_opteron_sse3
+	default "barcelona"	if BR2_x86_barcelona
+	default "k6"		if BR2_x86_k6
+	default "k6-2"		if BR2_x86_k6_2
+	default "athlon"	if BR2_x86_athlon
+	default "athlon-4"	if BR2_x86_athlon_4
+	default "winchip-c6"	if BR2_x86_winchip_c6
+	default "winchip2"	if BR2_x86_winchip2
+	default "c3"		if BR2_x86_c3
+	default "c3-2"		if BR2_x86_c32
+	default "geode"		if BR2_x86_geode
+	default "generic"	if BR2_x86_generic
 
 config BR2_GCC_TARGET_ARCH
-	default i386		if BR2_x86_i386
-	default i486		if BR2_x86_i486
-	default i586		if BR2_x86_i586
-	default pentium-mmx	if BR2_x86_pentium_mmx
-	default i686		if BR2_x86_i686
-	default pentiumpro	if BR2_x86_pentiumpro
-	default pentium-m	if BR2_x86_pentium_m
-	default pentium2	if BR2_x86_pentium2
-	default pentium3	if BR2_x86_pentium3
-	default pentium4	if BR2_x86_pentium4
-	default prescott	if BR2_x86_prescott
-	default nocona		if BR2_x86_nocona
-	default core2		if BR2_x86_core2
-	default atom		if BR2_x86_atom
-	default k8		if BR2_x86_opteron
-	default k8-sse3		if BR2_x86_opteron_sse3
-	default barcelona	if BR2_x86_barcelona
-	default k6		if BR2_x86_k6
-	default k6-2		if BR2_x86_k6_2
-	default athlon		if BR2_x86_athlon
-	default athlon-4	if BR2_x86_athlon_4
-	default winchip-c6	if BR2_x86_winchip_c6
-	default winchip2	if BR2_x86_winchip2
-	default c3		if BR2_x86_c3
-	default c3-2		if BR2_x86_c32
-	default geode		if BR2_x86_geode
+	default "i386"		if BR2_x86_i386
+	default "i486"		if BR2_x86_i486
+	default "i586"		if BR2_x86_i586
+	default "pentium-mmx"	if BR2_x86_pentium_mmx
+	default "i686"		if BR2_x86_i686
+	default "pentiumpro"	if BR2_x86_pentiumpro
+	default "pentium-m"	if BR2_x86_pentium_m
+	default "pentium2"	if BR2_x86_pentium2
+	default "pentium3"	if BR2_x86_pentium3
+	default "pentium4"	if BR2_x86_pentium4
+	default "prescott"	if BR2_x86_prescott
+	default "nocona"	if BR2_x86_nocona
+	default "core2"		if BR2_x86_core2
+	default "atom"		if BR2_x86_atom
+	default "k8"		if BR2_x86_opteron
+	default "k8-sse3"	if BR2_x86_opteron_sse3
+	default "barcelona"	if BR2_x86_barcelona
+	default "k6"		if BR2_x86_k6
+	default "k6-2"		if BR2_x86_k6_2
+	default "athlon"	if BR2_x86_athlon
+	default "athlon-4"	if BR2_x86_athlon_4
+	default "winchip-c6"	if BR2_x86_winchip_c6
+	default "winchip2"	if BR2_x86_winchip2
+	default "c3"		if BR2_x86_c3
+	default "c3-2"		if BR2_x86_c32
+	default "geode"		if BR2_x86_geode
-- 
1.7.9.5
