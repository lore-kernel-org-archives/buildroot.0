From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Tue,  8 Oct 2013 20:05:29 -0700
Subject: [Buildroot] [PATCH V4 0/2] i.MX updates
Message-ID: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates Freescale packages for i.MX processors
to use the Freescale MAD/YOCTO repository and updates the versions
to match the latest release.

Eric Nelson (2):
  i.MX: Use FREESCALE_IMX_SITE for Freescale packages
  i.MX: Update versions to match latest Freescale release

V2 skipped moving libfslx packages into packages/freescale-imx
V3 incorporates gstreamer plugin patch from
	http://patchwork.ozlabs.org/patch/279625
   and re-works the patch into two steps as suggested by 
   Thomas Petazzoni:
	- rename and use FREESCALE_IMX_SITE
	- bump revisions and change site to freescale.com
V4 addresses comments by Arnout regarding license files
   and comments

 package/freescale-imx/firmware-imx/firmware-imx.mk |  2 +-
 package/freescale-imx/freescale-imx.mk             |  6 ++----
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  8 +++++--
 package/freescale-imx/imx-lib/imx-lib.mk           | 24 ++++++++++++++++++---
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  5 ++---
 package/libfslcodec/libfslcodec.mk                 |  5 ++---
 package/libfslparser/libfslparser.mk               | 10 ++++++---
 package/libfslvpuwrap/libfslvpuwrap.mk             | 25 ++++++++++++++++++----
 8 files changed, 62 insertions(+), 23 deletions(-)

-- 
1.8.1.2
