From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 12:25:34 +0200
Subject: [Buildroot] [PATCH 2/5] arch/arm: fix defaults for AArch64 in
	64-bit mode
In-Reply-To: <cover.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <354db2be118602b0b12429d6d0f897455918ea12.1499250321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even in 64-bit mode we have to specify the -mcpu value.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index aaf4506d7f..e6beacf3d8 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -534,9 +534,9 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
-	default "cortex-a53"		if (BR2_cortex_a53 && !BR2_ARCH_IS_64)
-	default "cortex-a57"		if (BR2_cortex_a57 && !BR2_ARCH_IS_64)
-	default "cortex-a72"		if (BR2_cortex_a72 && !BR2_ARCH_IS_64)
+	default "cortex-a53"		if (BR2_cortex_a53)
+	default "cortex-a57"		if (BR2_cortex_a57)
+	default "cortex-a72"		if (BR2_cortex_a72)
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.11.0
