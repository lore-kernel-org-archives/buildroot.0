From: Chris Wardman <cjwfirmware@vxmdesign.com>
Date: Sun, 13 Sep 2015 03:02:47 -0400
Subject: [Buildroot] [PATCH 2/3] New entry for the Cortex-M4 processor
In-Reply-To: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
Message-ID: <1442127768-26447-2-git-send-email-cjwfirmware@vxmdesign.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I created a new entry for the Cortex-M4 processor in the processor list.
Right now it is being tested against a STM32F4disovery board.
This is technically an M4F. I will add that entry with the floating point in the future

Signed-off-by: Chris Wardman <cjwfirmware@vxmdesign.com>
---
 arch/Config.in.arm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4d10f4c..2692402 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -156,6 +156,11 @@ config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_HAS_THUMB2
+config BR2_cortex_m4
+       bool "cortex-M4"
+        select BR2_ARM_CPU_HAS_THUMB
+        select BR2_ARM_CPU_HAR_THUMB2
+        select BR2_ARM_CPU_ARMV7M
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
@@ -419,6 +424,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
 	default "cortex-m3"	if BR2_cortex_m3
+	default "cortex-m4"     if BR2_cortex_m4
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
 	default "strongarm"	if BR2_strongarm
-- 
1.9.1
