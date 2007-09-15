From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 15 Sep 2007 05:16:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070915121625.84D9230048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-15 05:16:25 -0700 (Sat, 15 Sep 2007)
New Revision: 19853

Log:
- add sparc64 arch as noticed by Blue Swirl
- add sparc{,64} CPU variants


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-15 12:12:56 UTC (rev 19852)
+++ trunk/buildroot/Config.in	2007-09-15 12:16:25 UTC (rev 19853)
@@ -46,6 +46,8 @@
 	bool "superh64"
 config BR2_sparc
 	bool "sparc"
+config BR2_sparc64
+	bool "sparc64"
 config BR2_x86_64
 	bool "x86_64"
 endchoice
@@ -284,6 +286,46 @@
 
 choice
 	prompt "Target Architecture Variant"
+	depends BR2_sparc || BR2_sparc64
+	default BR2_sparc_v7
+	help
+	  Specific CPU variant to use
+
+config BR2_sparc_v7
+	bool "v7"
+config BR2_sparc_cypress
+	bool "cypress"
+config BR2_sparc_v8
+	bool "v8"
+config BR2_sparc_supersparc
+	bool "supersparc"
+config BR2_sparc_sparclite
+	bool "sparclite"
+config BR2_sparc_f930
+	bool "f930"
+config BR2_sparc_f934
+	bool "f934"
+config BR2_sparc_hypersparc
+	bool "hypersparc"
+config BR2_sparc_sparclite86x
+	bool "sparclite86x"
+config BR2_sparc_sparclet
+	bool "sparclet"
+config BR2_sparc_tsc701
+	bool "tsc701"
+config BR2_sparc_v9
+	bool "v9"
+config BR2_sparc_ultrasparc
+	bool "ultrasparc"
+config BR2_sparc_ultrasparc3
+	bool "ultrasparc3"
+config BR2_sparc_niagara
+	bool "niagara"
+endchoice
+
+
+choice
+	prompt "Target Architecture Variant"
 	depends BR2_ia64
 	default BR2_ia64_itanium2
 	help
@@ -385,6 +427,7 @@
 	default "sh4eb"		if BR2_sh4eb
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
+	default "sparc64"	if BR2_sparc64
 	default "x86_64"	if BR2_x86_64
 	default "x86_64"	if BR2_x86_64_nocona
 	default "x86_64"	if BR2_x86_64_core2
@@ -400,7 +443,7 @@
 			    BR2_sh64
 	default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-			    BR2_sh3eb || BR2_sh4eb || BR2_sparc
+			    BR2_sh3eb || BR2_sh4eb || BR2_sparc || BR2_sparc64
 
 config BR2_GCC_TARGET_TUNE
 	string
@@ -503,13 +546,18 @@
 	default 860		if BR2_powerpc_860
 	default 970		if BR2_powerpc_970
 	default 8540		if BR2_powerpc_8540
+	default v7		if BR2_sparc_v7
 	default cypress		if BR2_sparc_cypress
+	default v8		if BR2_sparc_v8
 	default supersparc	if BR2_sparc_supersparc
 	default hypersparc	if BR2_sparc_hypersparc
+	default sparclite	if BR2_sparc_sparclite
 	default f930		if BR2_sparc_f930
 	default f934		if BR2_sparc_f934
 	default sparclite86x	if BR2_sparc_sparclite86x
+	default sparclet	if BR2_sparc_sparclet
 	default tsc701		if BR2_sparc_tsc701
+	default v9		if BR2_sparc_v9
 	default ultrasparc	if BR2_sparc_ultrasparc
 	default ultrasparc3	if BR2_sparc_ultrasparc3
 	default niagara		if BR2_sparc_niagara
