From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:32:25 +0200
Subject: [Buildroot] [git commit] arm: update processor types
Message-ID: <20150628123231.8D19C80DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9971ebfe9d17efeddec76b40bf4b3714d175680b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the Cortex M3 variant. These microcontrollers don't support regular
ARM instructions and don't have an MMU.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
