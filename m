From: Andrew Webster <awebster@arcx.com>
Date: Fri, 10 Jun 2016 14:09:04 -0400
Subject: [Buildroot] [PATCH v2 00/14] Bump NXP package versions
In-Reply-To: <cover.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
Message-ID: <cover.1465578220.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The two patches for nxp defconfigs and the patch for imx-kobs have been build
tested but not run-time tested.

Changes v1 -> v2:
  - Reordered patches to keep gpu related patches together and multimedia
  patches together.
  - Added patches for bumping the kernel/u-boot versions of NXP defconfigs
  - Added patch to bump version of imx-kobs
  - Added patch to bump version of kernel-module-imx-gpu-viv

Andrew Webster (14):
  nxp defconfigs: bump u-boot version to 4.1.15_1.1.0_ga
  nxp defconfigs: bump kernel version to 4.1.15
  kernel-module-imx-gpu-viv: bump version to that of the 5.0.11.p8.4
    release
  imx-gpu-viv: bump version to 5.0.11-p8.4
  xdriver_xf86-video-imx-viv: bump version to 5.0.11-p8.4
  firmware-imx: bump to version 5.4
  gst1-imx: bump to version 0.12.1
  imx-vpu: bump to version 5.4.33
  imx-codec: rename from libfslcodec and bump version to 4.0.9
  imx-parser: rename from libfslparser and bump version to 4.0.9
  imx-vpuwrap: rename from libfslvpuwrap and bump version to 1.0.65
  libimxvpuapi: bump version to 0.10.2
  imx-lib: bump version to 5.4
  imx-kobs: bump version to 5.4

 Config.in.legacy                                   | 21 ++++++
 configs/freescale_imx6dlsabreauto_defconfig        |  8 +-
 configs/freescale_imx6dlsabresd_defconfig          |  8 +-
 configs/freescale_imx6qsabreauto_defconfig         |  8 +-
 configs/freescale_imx6qsabresd_defconfig           |  8 +-
 configs/freescale_imx6sololiteevk_defconfig        |  8 +-
 configs/freescale_imx6sxsabresd_defconfig          |  8 +-
 configs/freescale_imx6ulevk_defconfig              |  8 +-
 package/Config.in                                  |  3 -
 package/freescale-imx/Config.in                    |  3 +
 .../freescale-imx/firmware-imx/firmware-imx.hash   |  2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk |  5 +-
 .../imx-codec}/Config.in                           |  6 +-
 package/freescale-imx/imx-codec/imx-codec.hash     |  2 +
 package/freescale-imx/imx-codec/imx-codec.mk       | 23 ++++++
 package/freescale-imx/imx-gpu-viv/Config.in        |  6 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 10 +--
 package/freescale-imx/imx-kobs/imx-kobs.hash       |  3 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.hash         |  2 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |  2 +-
 .../imx-parser}/Config.in                          |  4 +-
 package/freescale-imx/imx-parser/imx-parser.hash   |  2 +
 package/freescale-imx/imx-parser/imx-parser.mk     | 23 ++++++
 package/freescale-imx/imx-vpu/imx-vpu.hash         |  2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk           |  4 +-
 .../imx-vpuwrap}/Config.in                         |  8 +-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash |  2 +
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 21 ++++++
 .../kernel-module-imx-gpu-viv.hash                 |  2 +-
 .../kernel-module-imx-gpu-viv.mk                   |  2 +-
 package/gstreamer/gst-fsl-plugins/Config.in        |  8 +-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  4 +-
 package/gstreamer1/gst1-imx/Config.in              |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash          |  2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk            |  6 +-
 package/kodi/kodi.mk                               |  4 +-
 package/libfslcodec/libfslcodec.hash               |  2 -
 package/libfslcodec/libfslcodec.mk                 | 23 ------
 package/libfslparser/libfslparser.hash             |  2 -
 package/libfslparser/libfslparser.mk               | 23 ------
 package/libfslvpuwrap/libfslvpuwrap.hash           |  2 -
 package/libfslvpuwrap/libfslvpuwrap.mk             | 21 ------
 package/libimxvpuapi/libimxvpuapi.hash             |  2 +-
 package/libimxvpuapi/libimxvpuapi.mk               |  2 +-
 .../0001-Remove-dix-internal-header-usage.patch    | 31 --------
 ...001-Stop-using-Git-to-write-local-version.patch | 87 ++++++++++++++++++++++
 .../xdriver_xf86-video-imx-viv.hash                |  3 +-
 .../xdriver_xf86-video-imx-viv.mk                  |  2 +-
 50 files changed, 259 insertions(+), 187 deletions(-)
 rename package/{libfslcodec => freescale-imx/imx-codec}/Config.in (75%)
 create mode 100644 package/freescale-imx/imx-codec/imx-codec.hash
 create mode 100644 package/freescale-imx/imx-codec/imx-codec.mk
 rename package/{libfslparser => freescale-imx/imx-parser}/Config.in (78%)
 create mode 100644 package/freescale-imx/imx-parser/imx-parser.hash
 create mode 100644 package/freescale-imx/imx-parser/imx-parser.mk
 rename package/{libfslvpuwrap => freescale-imx/imx-vpuwrap}/Config.in (69%)
 create mode 100644 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
 create mode 100644 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
 delete mode 100644 package/libfslcodec/libfslcodec.hash
 delete mode 100644 package/libfslcodec/libfslcodec.mk
 delete mode 100644 package/libfslparser/libfslparser.hash
 delete mode 100644 package/libfslparser/libfslparser.mk
 delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.hash
 delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch

-- 
1.9.1
