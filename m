From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:07:34 +0100
Subject: [Buildroot] [git commit] arch/arm: remove BR2_GCC_TARGET_ARCH
	definitions on ARM
Message-ID: <20141106233447.04B31B12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd828fd98fecb5b3baf529c8dc6fbd2971e2f172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On ARM, we were defining both the CPU type and the architecture
variant. However, depending on the version of gcc, a given combination
of (CPU, architecture) may not be the same. Since the architecture
variant is implied by the CPU type, given the former is not necessary,
and we can simply specify the latter.

From the gcc documentation:

  This specifies the name of the target ARM processor. GCC uses this
  name to derive the name of the target ARM architecture (as if
  specified by -march) and the ARM processor type for which to tune
  for performance (as if specified by -mtune). Where this option is
  used in conjunction with -march or -mtune, those options take
  precedence over the appropriate part of this option.

Note that we verified that for all BR2_GCC_TARGET_ARCH value that
existed, a proper BR2_GCC_TARGET_CPU value is defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 9257c16..162191b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -381,25 +381,6 @@ config BR2_GCC_TARGET_CPU
 	default "xscale"	if BR2_xscale
 	default "iwmmxt"	if BR2_iwmmxt
 
-config BR2_GCC_TARGET_ARCH
-	default "armv4t"	if BR2_arm920t
-	default "armv4t"	if BR2_arm922t
-	default "armv5te"	if BR2_arm926t
-	default "armv6j"	if BR2_arm1136jf_s
-	default "armv6zk"	if BR2_arm1176jz_s
-	default "armv6zk"	if BR2_arm1176jzf_s
-	default "armv7-a"	if BR2_cortex_a5
-	default "armv7-a"	if BR2_cortex_a7
-	default "armv7-a"	if BR2_cortex_a8
-	default "armv7-a"	if BR2_cortex_a9
-	default "armv7-a"	if BR2_cortex_a12
-	default "armv7-a"	if BR2_cortex_a15
-	default "armv4"		if BR2_fa526
-	default "armv7-a"	if BR2_pj4
-	default "armv4"		if BR2_strongarm
-	default "armv5te"	if BR2_xscale
-	default "iwmmxt"	if BR2_iwmmxt
-
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"
 
