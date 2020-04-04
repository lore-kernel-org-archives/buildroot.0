From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 22:40:18 +0200
Subject: [Buildroot] [git commit]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.0.p1.0
Message-ID: <20200404202740.BDB1B8B6CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8b39ad9019afa0636a96f3a5f32041976a20c70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package has been tested on Nitrogen8M with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Also update the help text as we shouldn't specify a kernel revision. It
is just that this module isn't meant for mainline kernel, only its NXP
forked version.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in               | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
index 038bd4d483..4cea37a46c 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV
 	  source code of the same version as base and include fixes
 	  and improvements developed by FSL Community.
 
-	  This module is only meant for NXP-based kernel up to 4.1.x.
+	  This module is only meant for NXP-based kernel.
 
 	  https://github.com/Freescale/kernel-module-imx-gpu-viv
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 19341db6ba..fe40692a6b 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ad910b7d36dc433bbbe85808d278312e9199635aaa5d00097b70ffab11bde9e6  kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8.tar.gz
+sha256  d747c39f900315f2f46b8397f55d199c7ece7328ae91ce21a2f5eb0895603865  kernel-module-imx-gpu-viv-4cc1368dc05073b368cfdbadfdf5de3a3d3b15f4.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index c76a5ee386..e087ccaa12 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 86354002bea77acd9ce1812712e9d8485b377ec8
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 4cc1368dc05073b368cfdbadfdf5de3a3d3b15f4
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
