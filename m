From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:07 +0100
Subject: [Buildroot] [PATCH 4/8] arch/arm: drop legacy dependency for
	floating point strategy
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <0f6751e4659ce029f1a3a148fc199e3cb08e56f4.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The floating point strategy currently depends on EABI || EABIHF. The
reason was that, wayback when we also supported OABI, we only exposed FP
for EABI or EABIHF, and hide it for OABI, which did not support FP.

It's been a while now that we do not support OABI, but the dependency
stuck all along.

Remove it as it is no longer needed, and is always true.

However, the choice is empty for AArch64, as we still have no entry for
their floating point strategy yet.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 9e5accc..fa999d5 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -308,7 +308,6 @@ endchoice
 
 choice
 	prompt "Floating point strategy"
-	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
 	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
 	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
 	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
-- 
2.7.4
