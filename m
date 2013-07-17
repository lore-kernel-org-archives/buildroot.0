From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Jul 2013 21:32:45 -0300
Subject: [Buildroot] [PATCH] arch/arm: arm926 may have VFP
Message-ID: <1374021165-30809-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The VFP9-S FPU (VFPv2) is optional for ARM926EJ-S, see:
http://www.arm.com/products/processors/classic/arm9/arm926.php?tab=Specifications+
Real silicon:
http://www.nxp.com/documents/data_sheet/LPC3180.pdf

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 94c32c9..b2fe257 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -51,6 +51,7 @@ config BR2_arm922t
 	bool "arm922t"
 config BR2_arm926t
 	bool "arm926t"
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 config BR2_arm10t
 	bool "arm10t"
 config BR2_arm1136jf_s_r0
-- 
1.8.1.5
