From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 25 Sep 2013 12:07:48 -0700
Subject: [Buildroot] [PATCH 0/4] i.MX6 and Nitrogen6x updates
Message-ID: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates U-Boot and the Linux kernel for the
Boundary Devices Nitrogen6x board to the latest production-ready
releases and also updates Freescale-provided packages to the
matching versions to maintain ABI compatibility.

Eric Nelson (4):
  nitrogen6x: bump U-Boot to latest production version (2013.07)
  nitrogen6x: use 6x_bootscript/6x_upgrade instead of older 6q_ versions
  nitrogen6x: bump kernel to latest version (3.0.35-4.1.0)
  i.MX6: Update Freescale hardware-acceleration bits to latest versions

 board/boundarydevices/nitrogen6x/6q_bootscript     | Bin 455 -> 0 bytes
 board/boundarydevices/nitrogen6x/6q_upgrade        | Bin 1587 -> 0 bytes
 board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 0 -> 1653 bytes
 board/boundarydevices/nitrogen6x/6x_upgrade        | Bin 0 -> 1744 bytes
 board/boundarydevices/nitrogen6x/post-build.sh     |  14 +++++++------
 configs/nitrogen6x_defconfig                       |   4 ++--
 package/freescale-imx/freescale-imx.mk             |   4 ++--
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   8 +++++---
 package/freescale-imx/imx-lib/imx-lib.mk           |  11 ++++++++++-
 .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |   4 ++--
 package/libfslcodec/libfslcodec.mk                 |   4 ++--
 package/libfslparser/libfslparser.mk               |   8 +++++---
 package/libfslvpuwrap/libfslvpuwrap.mk             |  22 +++++++++++++++++++--
 13 files changed, 56 insertions(+), 23 deletions(-)
 delete mode 100644 board/boundarydevices/nitrogen6x/6q_bootscript
 delete mode 100644 board/boundarydevices/nitrogen6x/6q_upgrade
 create mode 100644 board/boundarydevices/nitrogen6x/6x_bootscript
 create mode 100644 board/boundarydevices/nitrogen6x/6x_upgrade

-- 
1.8.1.2
