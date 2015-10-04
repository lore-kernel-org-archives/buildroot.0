From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:33:57 +0100
Subject: [Buildroot] [git commit] toolchain/external: commonalise comments
	about Linaro toolchains
Message-ID: <20151004173401.538B88198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87785ec15979bfc4f5fa12baf9b1a2308976f6cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those two comments:
  - are exactly the same
  - have the same dependencies (except for arm/armeb)

So, make it a common comment. It will be useful to have that comment
when we introduce new Linaro toolchain versions.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c252d3f..1bf97b8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,6 +6,11 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
+comment "Linaro toolchains available for Cortex-A + EABIhf"
+	depends on BR2_arm || BR2_armeb
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.09"
 	depends on BR2_arm
@@ -28,11 +33,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_arm
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
@@ -55,11 +55,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	  generated is Thumb 2, with the hard floating point calling
 	  convention, and uses the VFPv3-D16 FPU instructions.
 
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_armeb
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
 	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
