From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:37:07 +0100
Subject: [Buildroot] [git commit] arch/arm: introduce and use
	BR2_ARM_CPU_ARMV7M
Message-ID: <20160320143819.B187380509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5152f0cb0fcd496a9dabca4a1e07be98fed5679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All ARM cores should select a BR2_ARM_CPU_* option. Currently, the
cortex-m3 does not, which this commit fixes by introducing a
BR2_ARM_CPU_ARMV7M option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 04f0369..33f763a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -52,6 +52,9 @@ config BR2_ARM_CPU_ARMV6
 config BR2_ARM_CPU_ARMV7A
 	bool
 
+config BR2_ARM_CPU_ARMV7M
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
@@ -171,6 +174,7 @@ config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
