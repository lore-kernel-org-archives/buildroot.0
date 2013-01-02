From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jan 2013 10:54:32 -0300
Subject: [Buildroot] [PATCH 1/2] arch/sparc: drop old SUN-specific variants
Message-ID: <1357134873-18514-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the old Sun-specific variants used in old workstations (pre-1997)
and other useless ones.

The V7 ISA is a very old cpu only used in the first Sun workstations,
the toolchain support is broken: the cpu doesn't do hardware div and
it's not handled elsewhere.

The sparclite is also a very old Fujitsu cpu only used in early 90s Sun
machines (includes f930 & f934).

The sparclet (tsc701) was a microcontroller-variant.

The supersparc and hypersparc are just V8 variants also used in old Sun
workstations/servers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.sparc |   32 +-------------------------------
 1 files changed, 1 insertions(+), 31 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index e1f72cc..33204a2 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -1,14 +1,10 @@
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_sparc
-	default BR2_sparc_v7
+	default BR2_sparc_v8
 	help
 	  Specific CPU variant to use
 
-config BR2_sparc_v7
-	bool "v7"
-config BR2_sparc_cypress
-	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
 config BR2_sparc_sparchfleon
@@ -19,22 +15,6 @@ config BR2_sparc_sparcsfleon
 	bool "sfleon"
 config BR2_sparc_sparcsfleonv8
 	bool "sfleonv8"
-config BR2_sparc_supersparc
-	bool "supersparc"
-config BR2_sparc_sparclite
-	bool "sparclite"
-config BR2_sparc_f930
-	bool "f930"
-config BR2_sparc_f934
-	bool "f934"
-config BR2_sparc_hypersparc
-	bool "hypersparc"
-config BR2_sparc_sparclite86x
-	bool "sparclite86x"
-config BR2_sparc_sparclet
-	bool "sparclet"
-config BR2_sparc_tsc701
-	bool "tsc701"
 endchoice
 
 config BR2_ARCH
@@ -44,17 +24,7 @@ config BR2_ENDIAN
 	default "BIG"
 
 config BR2_GCC_TARGET_TUNE
-	default "v7"		if BR2_sparc_v7
-	default "cypress"	if BR2_sparc_cypress
 	default "v8"		if BR2_sparc_v8
-	default "supersparc"	if BR2_sparc_supersparc
-	default "hypersparc"	if BR2_sparc_hypersparc
-	default "sparclite"	if BR2_sparc_sparclite
-	default "f930"		if BR2_sparc_f930
-	default "f934"		if BR2_sparc_f934
-	default "sparclite86x"	if BR2_sparc_sparclite86x
-	default "sparclet"	if BR2_sparc_sparclet
-	default "tsc701"	if BR2_sparc_tsc701
 	default "v9"		if BR2_sparc_v9
 	default "v9"		if BR2_sparc_v9a
 	default "v9"		if BR2_sparc_v9b
-- 
1.7.8.6
