From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 10:17:23 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/freescale-imx/imx-gpu-g2d: fix the file name for ARM
Message-ID: <20200508080227.A896A90F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ac9faa318ea2dd6b82d0ea95a446ed74647edc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

NXP apparently changed file naming convention for this particular file.

Fixes: 1d0ea8d433 (package/freescale-imx/imx-gpu-g2d: bump to version 6.4.0.p1.0)
Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd3dc5b4fa59bdb14c3b5f1b46b9a4466982b03b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 8ecfbfe40f..98ca7fbe7e 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2  imx-gpu-g2d-6.4.0.p1.0-aarch32.bin
+sha256	6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2  imx-gpu-g2d-6.4.0.p1.0-arm.bin
 sha256	35885f435dbe951d2c0f439a376ed8a59a50b67a1b7e1e14fa2ab03995abb1ad  imx-gpu-g2d-6.4.0.p1.0-aarch64.bin
 sha256	d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
 sha256	9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 6598e4c32b..7700170970 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -7,7 +7,7 @@
 ifeq ($(BR2_aarch64),y)
 IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch32
+IMX_GPU_G2D_VERSION = 6.4.0.p1.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
