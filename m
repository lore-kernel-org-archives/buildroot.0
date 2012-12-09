From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 18:54:02 -0300
Subject: [Buildroot] [PATCH 1/2] powerpc: update processor types
Message-ID: <1355090043-12326-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the powerpc processor types.
Remove the 801, it's the original IBM experimental implementation.
Add the 464, 464fp, 476 and 476fp cores.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.powerpc  |   15 ++++++++++++---
 toolchain/gcc/Config.in |    4 ++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 693246b..8643efc 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -18,6 +18,14 @@ config BR2_powerpc_440
 	bool "440"
 config BR2_powerpc_440fp
 	bool "440 with FPU"
+config BR2_powerpc_464
+	bool "464"
+config BR2_powerpc_464fp
+	bool "464 with FPU"
+config BR2_powerpc_476
+	bool "476"
+config BR2_powerpc_476fp
+	bool "476 with FPU"
 config BR2_powerpc_505
 	bool "505"
 config BR2_powerpc_601
@@ -44,8 +52,6 @@ config BR2_powerpc_7450
 	bool "7450"
 config BR2_powerpc_750
 	bool "750"
-config BR2_powerpc_801
-	bool "801"
 config BR2_powerpc_821
 	bool "821"
 config BR2_powerpc_823
@@ -95,6 +101,10 @@ config BR2_GCC_TARGET_TUNE
 	default "405fp"		if BR2_powerpc_405fp
 	default "440"		if BR2_powerpc_440
 	default "440fp"		if BR2_powerpc_440fp
+	default "464"		if BR2_powerpc_464
+	default "464fp"		if BR2_powerpc_464fp
+	default "476"		if BR2_powerpc_476
+	default "476fp"		if BR2_powerpc_476fp
 	default "505"		if BR2_powerpc_505
 	default "601"		if BR2_powerpc_601
 	default "602"		if BR2_powerpc_602
@@ -108,7 +118,6 @@ config BR2_GCC_TARGET_TUNE
 	default "7400"		if BR2_powerpc_7400
 	default "7450"		if BR2_powerpc_7450
 	default "750"		if BR2_powerpc_750
-	default "801"		if BR2_powerpc_801
 	default "821"		if BR2_powerpc_821
 	default "823"		if BR2_powerpc_823
 	default "860"		if BR2_powerpc_860
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 6456502..de79452 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -15,11 +15,11 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_x86_atom
+		depends on !BR2_avr32 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-- 
1.7.8.6
