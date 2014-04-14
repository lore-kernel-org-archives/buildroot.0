From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:08:22 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove useless info in
	help text of Linaro ARM toolchains
Message-ID: <20140414211059.F1D5E9BF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6283788656a49a2b6d10e2a890be576a23ea8c1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The information "To use this toolchain, you must disable soft float
usage." which was visible in the help text of Linaro toolchains is no
longer useful, since those toolchains are only visible when the ARM
EABIhf ABI is selected, which by design is not compatible with
soft-float.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2425d63..a36b638 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -28,8 +28,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_02
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
 	bool "Linaro 2014.01"
 	depends on BR2_arm
@@ -52,8 +50,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2014_01
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
 	bool "Linaro 2013.12"
 	depends on BR2_arm
@@ -76,8 +72,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_12
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
-	  To use this toolchain, you must disable soft float usage.
-
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
