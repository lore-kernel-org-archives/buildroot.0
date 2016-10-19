From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 19 Oct 2016 16:23:05 +0200
Subject: [Buildroot] [PATCH 0/4] Update i.MX manufacturing tools
Message-ID: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series updates several components necessary during the manufacturing
process:
- imx-kobs: used to flash U-Boot to Nand, now open-source
- imx-uuc: used to communicate using Freescale UTP protocol, now open-source
- imx-usb-loader: used to boot i.MX devices using the SDP protocol
- mfgtools: now open-source and working on Linux

Note that it is nice that many projects are now open-source. Also, NXP has
proven to be very responsive and quickly merges pull-requests.

Let me know if you have any question.

Regards,
Gary

Gary Bisson (4):
  imx-kobs: switch to open source version
  imx-uuc: switch to open source version
  imx-usb-loader: bump version
  mfgtools: new package

 package/Config.in.host                       |  1 +
 package/freescale-imx/imx-kobs/imx-kobs.hash |  2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   |  4 ++--
 package/freescale-imx/imx-uuc/imx-uuc.hash   |  2 +-
 package/freescale-imx/imx-uuc/imx-uuc.mk     |  4 ++--
 package/imx-usb-loader/imx-usb-loader.hash   |  2 +-
 package/imx-usb-loader/imx-usb-loader.mk     |  2 +-
 package/mfgtools/Config.in.host              | 10 ++++++++
 package/mfgtools/mfgtools.hash               |  2 ++
 package/mfgtools/mfgtools.mk                 | 34 ++++++++++++++++++++++++++++
 10 files changed, 55 insertions(+), 8 deletions(-)
 create mode 100644 package/mfgtools/Config.in.host
 create mode 100644 package/mfgtools/mfgtools.hash
 create mode 100644 package/mfgtools/mfgtools.mk

-- 
2.9.3
