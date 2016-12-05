From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:07:09 +0100
Subject: [Buildroot] [git commit] arch/arm: drop legacy dependency for
	floating point strategy
Message-ID: <20161205221749.894967FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=743e6639123890f6cbcecdc8d4b935e82a548aca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
