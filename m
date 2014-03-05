From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Mar 2014 23:23:38 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: remove useless info in
	help text of Linaro ARM toolchains
In-Reply-To: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1394058220-5863-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The information "To use this toolchain, you must disable soft float
usage." which was visible in the help text of Linaro toolchains is no
longer useful, since those toolchains are only visible when the ARM
EABIhf ABI is selected, which by design is not compatible with
soft-float.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index fd1a826..8647357 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -27,8 +27,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
 	bool "Linaro 2014.01"
 	depends on BR2_arm
@@ -50,8 +48,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
 	bool "Linaro 2013.12"
 	depends on BR2_arm
@@ -73,8 +69,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
-- 
1.8.3.2
