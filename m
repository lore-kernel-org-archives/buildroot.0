From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:55 +0100
Subject: [Buildroot] [PATCH 13/14] target: added BR2_KARCH option
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-14-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

For packages building kernel modules (ie linux-fusion), it is required
to give the ARCH=some_arch argument to make so the kernel's makefile
are aware of the target architecture. We didn't had the value to fill
the ARCH variable. BR2_KARCH variable is computed using the BR2_ARCH
variable.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 target/Config.in.arch |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 1e3c78c..91d827f 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -140,7 +140,7 @@ choice
 	default BR2_mips_1 if BR2_mipsel
 	help
 	  Specific CPU variant to use
-	
+
 	  64bit cabable: 3, 4, 64, 64r2
 	  non-64bit capable: 1, 2, 32, 32r2
 
@@ -539,6 +539,24 @@ config BR2_ARCH
 	default "x86_64"	if BR2_x86_64_barcelona
 	default "xtensa"	if BR2_xtensa
 
+config BR2_KARCH
+	string
+	default "alpha"		if BR2_alpha
+	default "arm"		if BR2_arm || BR2_armeb
+	default "avr32"		if BR2_avr32
+	default "cris"		if BR2_cris
+	default "i386"		if BR2_x86_i386 || BR2_x86_i486 || BR2_x86_i586 || BR2_x86_pentium_mmx || BR2_x86_geode || BR2_x86_i686 || BR2_x86_pentium2 || BR2_x86_pentium3 || BR2_x86_pentium4 || BR2_x86_pentium_m || BR2_x86_pentiumpro || BR2_x86_nocona || BR2_x86_core2
+	default "ia64"		if BR2_ia64
+	default "m68k"		if BR2_m68k
+	default "mips"		if BR2_mips || BR2_mipsel
+	default "nios2"		if BR2_nios2
+	default "powerpc"	if BR2_powerpc
+	default "sh"	        if BR2_sh2a_nofpueb || BR2_sh2eb || BR2_sh3 || BR2_sh3eb || BR2_sh4 || BR2_sh4eb
+	default "sh64"		if BR2_sh64
+	default "sparc"		if BR2_sparc
+	default "sparc64"	if BR2_sparc64
+	default "x86_64"	if BR2_x86_64 || BR2_x86_64_generic || BR2_x86_64_nocona || BR2_x86_64_core2 || BR2_x86_64_opteron || BR2_x86_64_opteron_sse3 || BR2_x86_64_barcelona
+	default "xtensa"	if BR2_xtensa
 
 config BR2_ENDIAN
 	string
-- 
1.6.6
