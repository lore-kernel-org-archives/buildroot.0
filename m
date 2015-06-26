From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 26 Jun 2015 14:33:19 -0300
Subject: [Buildroot] [PATCH 1/4] arm: update processor types
In-Reply-To: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1435340002-20396-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Cortex M3 variant. These microcontrollers don't support regular
ARM instructions and don't have an MMU.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 arch/Config.in.arm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a2f00d2..9aa23a3 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -146,6 +146,10 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_m3
+	bool "cortex-M3"
+	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_HAS_THUMB2
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
@@ -408,6 +412,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
+	default "cortex-m3"	if BR2_cortex_m3
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
 	default "strongarm"	if BR2_strongarm
-- 
2.1.4
