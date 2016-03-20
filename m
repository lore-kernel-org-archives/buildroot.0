From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:37:30 +0100
Subject: [Buildroot] [git commit] arch/arm: add Cortex-M4 entry
Message-ID: <20160320143819.D1D8F802A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=472434323663d31e2aa6162b6907f6e6828669a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the option to select the Cortex-M4 ARM core, in the
same family as Cortex-M3. This will be useful to enable the internal
toolchain backend for this ARM core, and provide some defconfigs for
Cortex-M4 platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index cd1ec33..ee612f5 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -174,6 +174,10 @@ config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7M
+config BR2_cortex_m4
+	bool "cortex-M4"
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
@@ -455,6 +459,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a15"	if BR2_cortex_a15
 	default "cortex-a17"	if BR2_cortex_a17
 	default "cortex-m3"	if BR2_cortex_m3
+	default "cortex-m4"	if BR2_cortex_m4
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
 	default "strongarm"	if BR2_strongarm
