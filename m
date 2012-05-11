From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:36:06 -0300
Subject: [Buildroot] [PATCH 2/2] toolchain/gcc: block unsupported CPUs
	according to version
In-Reply-To: <1336743366-20014-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336743366-20014-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336743366-20014-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Block unsupported processors according to gcc version.
Also remove the comments since we now hide them according to this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 target/Config.in.arch   |    7 -------
 toolchain/gcc/Config.in |    4 ++--
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 6eaa951..25ff750 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -172,7 +172,6 @@ config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
-comment "cortex-A8/A9 needs gcc >= 4.4.x"
 config BR2_cortex_a8
 	bool "cortex-A8"
 config BR2_cortex_a9
@@ -361,7 +360,6 @@ config BR2_x86_core2
 	bool "core2"
 config BR2_x86_atom
 	bool "atom"
-comment "atom needs gcc >= 4.5.x"
 config BR2_x86_k6
 	bool "k6"
 config BR2_x86_k6_2
@@ -409,7 +407,6 @@ config BR2_x86_64_core2
 	bool "core2"
 config BR2_x86_64_atom
 	bool "atom"
-comment "atom needs gcc >= 4.5.x"
 endchoice
 
 choice
@@ -425,7 +422,6 @@ config BR2_sparc_cypress
 	bool "cypress"
 config BR2_sparc_v8
 	bool "v8"
-comment "LEON SPARC needs gcc = 4.4.x"
 config BR2_sparc_sparchfleon
 	bool "hfleon"
 config BR2_sparc_sparchfleonv8
@@ -549,13 +545,10 @@ config BR2_powerpc_8540
 	bool "8540 / e500v1"
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
-comment "e300c2 needs gcc >= 4.4.x"
 config BR2_powerpc_e300c2
 	bool "e300c2"
-comment "e300c3 needs gcc >= 4.4.x"
 config BR2_powerpc_e300c3
 	bool "e300c3"
-comment "e500mc needs gcc >= 4.4.x"
 config BR2_powerpc_e500mc
 	bool "e500mc"
 endchoice
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 0c1243f..eb4d5ea 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -15,11 +15,11 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_x86_64_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_x86_atom && !BR2_x86_64_atom
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-- 
1.7.3.4
