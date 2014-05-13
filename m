From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Mon, 12 May 2014 21:03:17 -0700
Subject: [Buildroot] [PATCH v4 7/9] powerpc: add power{4,5,6,7,8} cpus
In-Reply-To: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
References: <1399953799-32054-1-git-send-email-cody@linux.vnet.ibm.com>
Message-ID: <1399953799-32054-8-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 arch/Config.in.powerpc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ef33e6e..6b9a56f 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -110,6 +110,19 @@ config BR2_powerpc_e300c3
 config BR2_powerpc_e500mc
 	bool "e500mc"
 	depends on !BR2_ARCH_IS_64
+config BR2_powerpc_power4
+	bool "power4"
+config BR2_powerpc_power5
+	bool "power5"
+config BR2_powerpc_power6
+	bool "power6"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+config BR2_powerpc_power7
+	bool "power7"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+config BR2_powerpc_power8
+	bool "power8"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 endchoice
 
 choice
@@ -176,6 +189,11 @@ config BR2_GCC_TARGET_TUNE
 	default "e300c2"	if BR2_powerpc_e300c2
 	default "e300c3"	if BR2_powerpc_e300c3
 	default "e500mc"	if BR2_powerpc_e500mc
+	default "power4"	if BR2_powerpc_power4
+	default "power5"	if BR2_powerpc_power5
+	default "power6"	if BR2_powerpc_power6
+	default "power7"	if BR2_powerpc_power7
+	default "power8"	if BR2_powerpc_power8
 
 config BR2_GCC_TARGET_ABI
 	default "altivec"		if BR2_PPC_ABI_altivec
-- 
1.9.3
