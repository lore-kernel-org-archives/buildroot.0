From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:35 +0200
Subject: [Buildroot] [PATCH v2 06/13] freescale-imx: bump to 3.10.53-1.1.0
	GA release
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432628382-16799-7-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version now only applies to imx-lib and firmware-imx. All other
Freescale packages have their own version from now on.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/80ad0f2e5447c1fef976ff9a494d39f78b0eb6d1
https://github.com/Freescale/meta-fsl-arm/commit/b12d193092484c02d7ccf2e6d98c4887aa41b408

Those packages have been implicitely tested through gstreamer as the plugins
rely on them for vpu decoding for instance:
# gst-launch-0.10 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
# gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
  matroskademux ! imxvpudec ! imxipuvideosink

Regards,
Gary
---
 package/freescale-imx/freescale-imx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.1.4
