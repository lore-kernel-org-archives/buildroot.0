From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:53:39 +0200
Subject: [Buildroot] [git commit] freescale-imx: bump to 3.10.53-1.1.0 GA
	release
Message-ID: <20150711112619.9019E7FC81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b9327f2645374861bcd2560a34cf0e6796d792e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version now only applies to imx-lib and firmware-imx. All other
Freescale packages have their own version from now on.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/80ad0f2e5447c1fef976ff9a494d39f78b0eb6d1
https://github.com/Freescale/meta-fsl-arm/commit/b12d193092484c02d7ccf2e6d98c4887aa41b408

Those packages have been implicitely tested through gstreamer as the plugins
rely on them for vpu decoding for instance:
 # gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/freescale-imx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 64f3b6b..26c591b 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESCALE_IMX_VERSION = 3.10.17-1.0.0
+FREESCALE_IMX_VERSION = 3.10.53-1.1.0
 FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 # Helper for self-extracting binaries distributed by Freescale.
