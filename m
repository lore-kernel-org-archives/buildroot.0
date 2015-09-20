From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:45:49 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain/external: commonalise comments
	about Linaro toolchains
In-Reply-To: <cover.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <376787b59e2113f2b072918ed14fae488f144bd2.1442785491.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those two comments:
  - are exactly the same
  - have the same dependencies (except for arm/armeb)

So, make it a common comment. It will be useful to have that comment
when we introduce new Linaro toolchain versions.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 18bf98c..0897192 100644
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
-- 
1.9.1
