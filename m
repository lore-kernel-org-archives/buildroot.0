From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 22:35:22 +0100
Subject: [Buildroot] [git commit] Add ARM11 MPCore CPU target support
Message-ID: <20160103215517.D184881DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=449d7b9127096cf0a40118b298bc2fbbdac99d2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc differentiates the mpcore-with-vfp from the mcpore-without-vfp
CPUs. The former is named just 'mpcore', while the latter is named
'mpcorenovfp'.

We only add one entry, 'mpcore' and let the user select whether or
not to use the VFP. We then name the CPU according to the user's
selection.

Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ea84147..60cd3a7 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -104,6 +104,13 @@ config BR2_arm1176jzf_s
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_arm11mpcore
+	bool "mpcore"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV6
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -430,6 +437,8 @@ config BR2_GCC_TARGET_CPU
 	default "arm1136jf-s"	if BR2_arm1136jf_s
 	default "arm1176jz-s"	if BR2_arm1176jz_s
 	default "arm1176jzf-s"	if BR2_arm1176jzf_s
+	default "mpcore"	if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
+	default "mpcorenovfp"	if BR2_arm11mpcore
 	default "cortex-a5"	if BR2_cortex_a5
 	default "cortex-a7"	if BR2_cortex_a7
 	default "cortex-a8"	if BR2_cortex_a8
