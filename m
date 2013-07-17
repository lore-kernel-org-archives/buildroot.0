From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Jul 2013 07:29:27 +0200
Subject: [Buildroot] [git commit] arch/arm: arm926 may have VFP
Message-ID: <20130717053008.A09239A610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b3a0417c468617e7619b244e9d29d06224249ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The VFP9-S FPU (VFPv2) is optional for ARM926EJ-S, see:
http://www.arm.com/products/processors/classic/arm9/arm926.php?tab=Specifications+
Real silicon:
http://www.nxp.com/documents/data_sheet/LPC3180.pdf

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
