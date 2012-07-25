From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 20:27:58 +0200
Subject: [Buildroot] [git commit] Remove unused TARGET_ABI values
Message-ID: <20120725182837.A752596BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd08153b9d677d654add6c580b9ccc5c27d672e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_mmix and BR2_arm_dunno configuration options do not exist, so
there is no chance for these values to be useful in any way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index e7aec56..75c5499 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -900,16 +900,12 @@ config BR2_GCC_TARGET_ARCH
 config BR2_GCC_TARGET_ABI
 	string
 	default apcs-gnu	if BR2_ARM_OABI
-	default atpcs		if BR2_arm_dunno
-	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_ARM_EABI
 	default 32		if BR2_MIPS_OABI32
 	default n32		if BR2_MIPS_ABI32
 	default eabi		if BR2_MIPS_EABI
 	default o64		if BR2_MIPS_OABI64
 	default 64		if BR2_MIPS_ABI64
-	default mmixware	if BR2_mmix && BR2_MMIX_ABI_native
-	default gnu		if BR2_mmix && !BR2_MMIX_ABI_native
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
 	default no-altivec	if BR2_powerpc && BR2_PPC_ABI_no-altivec
 	default spe		if BR2_powerpc && BR2_PPC_ABI_spe
