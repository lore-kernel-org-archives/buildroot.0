From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 18 Jun 2014 21:03:54 -0700
Subject: [Buildroot] [PATCH 0/5] freescale: update userspace packages
Message-ID: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

All the packages are now updated to their latest stable version. Here is a serie of patches to update them all at once to be in sync.

It is to be noted that the packages version described in the release notes are wrong, therefore I used the versions from the Yocto layer tag 1.6 (daisy):
https://github.com/Freescale/meta-fsl-arm/tree/1.6/recipes-bsp
https://github.com/Freescale/meta-fsl-arm/tree/1.6/recipes-multimedia
https://github.com/Freescale/meta-fsl-arm/tree/1.6/recipes-graphics

Testing has been done on a Nitrogen6x using the kernel patch committed last week.

GPU test (gpu-viv-bin-mx6q):
# cd /usr/share/examples/viv_samples/vdk/
# ./tutorial7

VPU test (libfslvpuwrap, libfslcodec, gst-fsl-plugins, imx-vpu):
# gst-launch-0.10 filesrc location=trailer_1080p_h264_mp3.avi ! avidemux ! vpudec ! mfw_isink

If needed the output of the above tests as well as the video file (big buck bunny) can be provided.

Regards,
Gary

Gary Bisson (5):
  freescale-imx: bump to version 3.10.17-1.0.0
  libfslvpuwrap: bump to version 1.0.46
  libfslcodec: bump to version 3.0.11
  libfslparser: bump to version 3.0.11
  gst-fsl-plugins: bump to version 3.0.11

 package/freescale-imx/Config.in                    |   1 +
 package/freescale-imx/freescale-imx.mk             |   2 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |  26 +-
 package/freescale-imx/imx-vpu/Config.in            |  53 ++
 .../imx-vpu-0001-fix-IOSystemInit-failure.patch    |  21 +
 package/freescale-imx/imx-vpu/imx-vpu.mk           |  57 ++
 ...gins-0002-Fix-bashism-in-configure-script.patch |  25 +-
 .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |   6 +-
 ...sl-linkage-add-lrt-for-shared-memory-func.patch |   2 +-
 ...-plugins-0005-build-Fix-out-of-tree-build.patch | 616 +++++++++++++++++++++
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  13 +-
 package/libfslcodec/libfslcodec.mk                 |   2 +-
 package/libfslparser/libfslparser.mk               |   2 +-
 package/libfslvpuwrap/Config.in                    |   2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk             |   4 +-
 15 files changed, 777 insertions(+), 55 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu/Config.in
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk
 create mode 100644 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins-0005-build-Fix-out-of-tree-build.patch

-- 
2.0.0
