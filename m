From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:17:48 +0100
Subject: [Buildroot] [git commit] arch/arm: only expose VFP in FP strategy
	when the CPU *has* a VFP unit
Message-ID: <20151227112454.94281822CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=110fecf1f50b766813335dd5d70cb4b31c30c088
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no point in offering the user an option to select an FP strategy
when the CPU does not actually have a VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index d63a26c..01555a6 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -276,7 +276,7 @@ config BR2_ARM_SOFT_FLOAT
 
 config BR2_ARM_FPU_VFPV2
 	bool "VFPv2"
-	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2
 	help
 	  This option allows to use the VFPv2 floating point unit, as
 	  available in some ARMv5 processors (ARM926EJ-S) and some
@@ -289,7 +289,7 @@ config BR2_ARM_FPU_VFPV2
 
 config BR2_ARM_FPU_VFPV3
 	bool "VFPv3"
-	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on BR2_ARM_CPU_HAS_VFPV3
 	help
 	  This option allows to use the VFPv3 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{8, 9}). This
@@ -305,7 +305,7 @@ config BR2_ARM_FPU_VFPV3
 
 config BR2_ARM_FPU_VFPV3D16
 	bool "VFPv3-D16"
-	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on BR2_ARM_CPU_HAS_VFPV3
 	help
 	  This option allows to use the VFPv3 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{8, 9}). This
@@ -320,7 +320,7 @@ config BR2_ARM_FPU_VFPV3D16
 
 config BR2_ARM_FPU_VFPV4
 	bool "VFPv4"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	help
 	  This option allows to use the VFPv4 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
@@ -335,7 +335,7 @@ config BR2_ARM_FPU_VFPV4
 
 config BR2_ARM_FPU_VFPV4D16
 	bool "VFPv4-D16"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	help
 	  This option allows to use the VFPv4 floating point unit, as
 	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
@@ -360,7 +360,7 @@ config BR2_ARM_FPU_NEON
 
 config BR2_ARM_FPU_NEON_VFPV4
 	bool "NEON/VFPv4"
-	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_VFPV4
 	depends on BR2_ARM_CPU_HAS_NEON
 	help
 	  This option allows to use both the VFPv4 and the NEON SIMD
