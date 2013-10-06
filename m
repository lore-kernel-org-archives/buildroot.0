From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun,  6 Oct 2013 12:47:46 -0700
Subject: [Buildroot] [PATCH V3 0/2] i.MX updates
Message-ID: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates Freescale packages for i.MX processors
to use the Freescale MAD/YOCTO repository and updates the versions
to match the latest release.

V2 skipped moving libfslx packages into packages/freescale-imx
V3 incorporates gstreamer plugin patch from
	http://patchwork.ozlabs.org/patch/279625/
   and re-works the patch into two steps as suggested by 
   Thomas Petazzoni:
	- rename and use FREESCALE_IMX_SITE
	- bump revisions and change site to freescale.com

Eric Nelson (2):
  i.MX: Use FREESCALE_IMX_SITE for Freescale packages
  i.MX: Update versions to match latest Freescale release

 package/freescale-imx/firmware-imx/firmware-imx.mk |  2 +-
 package/freescale-imx/freescale-imx.mk             |  6 ++----
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  8 ++++++--
 package/freescale-imx/imx-lib/imx-lib.mk           | 18 ++++++++++++++---
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  5 ++---
 package/libfslcodec/libfslcodec.mk                 |  5 ++---
 package/libfslparser/libfslparser.mk               |  7 ++++---
 package/libfslvpuwrap/libfslvpuwrap.mk             | 23 +++++++++++++++++++---
 8 files changed, 52 insertions(+), 22 deletions(-)

-- 
1.8.1.2
