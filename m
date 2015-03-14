From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 13:49:20 +0100
Subject: [Buildroot] [git commit] uclibc: double quote values of string
	options
Message-ID: <20150314124926.A207480756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4f7cfe1855cefa35322891e887636c3b82a6aea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kconfig string option values should use double quotes when defined, so
this commit fixes package/uclibc/Config.in in that respect.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |   68 +++++++++++++++++++++++-----------------------
 1 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 45e08b0..56fea8a 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -70,9 +70,9 @@ config BR2_USE_UCLIBC_SNAPSHOT
 
 config BR2_UCLIBC_VERSION_STRING
 	string
-	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
+	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
-	default 1.0.1		if BR2_UCLIBC_VERSION_NG
+	default "1.0.1"		if BR2_UCLIBC_VERSION_NG
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
@@ -205,17 +205,17 @@ config BR2_UCLIBC_INSTALL_TEST_SUITE
 # uClibc architecture names.
 config BR2_UCLIBC_TARGET_ARCH
 	string
-	default arc	   if BR2_arcle || BR2_arceb
-	default arm	   if BR2_arm	|| BR2_armeb
-	default bfin	   if BR2_bfin
-	default m68k	   if BR2_m68k
-	default mips	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	default powerpc	   if BR2_powerpc
-	default sh	   if BR2_sh
-	default sparc	   if BR2_sparc
-	default xtensa	   if BR2_xtensa
-	default i386	   if BR2_i386
-	default x86_64	   if BR2_x86_64
+	default "arc"	   if BR2_arcle || BR2_arceb
+	default "arm"	   if BR2_arm	|| BR2_armeb
+	default "bfin"	   if BR2_bfin
+	default "m68k"	   if BR2_m68k
+	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default "powerpc"  if BR2_powerpc
+	default "sh"	   if BR2_sh
+	default "sparc"	   if BR2_sparc
+	default "xtensa"   if BR2_xtensa
+	default "i386"	   if BR2_i386
+	default "x86_64"   if BR2_x86_64
 
 config BR2_UCLIBC_ARC_TYPE
 	string
@@ -232,46 +232,46 @@ config BR2_UCLIBC_ARM_BX
 config BR2_UCLIBC_MIPS_ABI
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
-	default O32 if BR2_MIPS_OABI32
-	default N32 if BR2_MIPS_NABI32
-	default N64 if BR2_MIPS_NABI64
+	default "O32" if BR2_MIPS_OABI32
+	default "N32" if BR2_MIPS_NABI32
+	default "N64" if BR2_MIPS_NABI64
 
 config BR2_UCLIBC_MIPS_ISA
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
-	default MIPS32 if BR2_mips_32
-	default MIPS32R2 if BR2_mips_32r2
-	default MIPS64 if BR2_mips_64
+	default "MIPS32" if BR2_mips_32
+	default "MIPS32R2" if BR2_mips_32r2
+	default "MIPS64" if BR2_mips_64
 
 config BR2_UCLIBC_SH_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
-	default SH2A if BR2_sh2a
-	default SH4  if BR2_sh4 || BR2_sh4eb
+	default "SH2A" if BR2_sh2a
+	default "SH4"  if BR2_sh4 || BR2_sh4eb
 
 config BR2_UCLIBC_SPARC_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
-	default V7	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
-	default V8	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+	default "V7"	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default "V8"	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
 
 config BR2_UCLIBC_POWERPC_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
-	default CLASSIC if !BR2_powerpc_8540 && !BR2_powerpc_8548
-	default E500    if BR2_powerpc_8540 || BR2_powerpc_8548
+	default "CLASSIC" if !BR2_powerpc_8540 && !BR2_powerpc_8548
+	default "E500"    if BR2_powerpc_8540 || BR2_powerpc_8548
 
 config BR2_UCLIBC_X86_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
-	default 386     if BR2_x86_i386
-	default 486	if BR2_x86_i486
-	default 586	if BR2_x86_i586
-	default 586MMX	if BR2_x86_pentium_mmx
-	default 686	if BR2_x86_i686 || BR2_x86_pentiumpro
-	default PENTIUMII  if BR2_x86_pentium2
-	default PENTIUMIII if BR2_x86_pentium3
-	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
-			      BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
+	default "386"        if BR2_x86_i386
+	default "486"        if BR2_x86_i486
+	default "586"        if BR2_x86_i586
+	default "586MMX"     if BR2_x86_pentium_mmx
+	default "686"	     if BR2_x86_i686 || BR2_x86_pentiumpro
+	default "PENTIUMII"  if BR2_x86_pentium2
+	default "PENTIUMIII" if BR2_x86_pentium3
+	default "PENTIUM4"   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
+	                        BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
 
 endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
