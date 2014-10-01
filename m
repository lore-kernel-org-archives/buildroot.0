From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  1 Oct 2014 17:03:43 +0200
Subject: [Buildroot] [PATCH v2 0/3] i.MX6 SABRESD improvements (using a
	Freescale kernel)
Message-ID: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here are 3 little improvements to the i.MX6 SABRESD board support in Buildroot,
both suggested by Thomas Petazzoni in [1].

This differs from the patchest I sent earlier [2] in the kernel origin:
keep using git.freescale.com instead of switching to a mainline kernel, as
per the discussion in [2].

Patches 1 and 2 are unchanged from v1.
They have been built and run on an i.MX6DL SABRESD board by me and on the
i.MX6Q variant by Vincent Stehl?, so I added his Tested-by tag.

Patch 3 is new in this series and adds a very handy tool to boot a board from
USB.

Luca Ceresoli (3):
  freescale/imx6-sabresd: use global patch dir for U-Boot patches
  freescale/imx6-sabresd: lock down kernel headers to the kernel version
  imx-usb-loader: new package

 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ++++++++++++++++++++++
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ----------------------
 configs/freescale_imx6dlsabresd_defconfig          |  9 +++++-
 configs/freescale_imx6qsabresd_defconfig           |  9 +++++-
 package/Config.in.host                             |  1 +
 package/imx-usb-loader/Config.in.host              | 14 +++++++++
 package/imx-usb-loader/imx-usb-loader.mk           | 22 +++++++++++++
 7 files changed, 89 insertions(+), 38 deletions(-)
 create mode 100644 board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 delete mode 100644 board/freescale/imx6sabresd/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 create mode 100644 package/imx-usb-loader/Config.in.host
 create mode 100644 package/imx-usb-loader/imx-usb-loader.mk

[1] http://lists.busybox.net/pipermail/buildroot/2014-September/106704.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-September/106972.html

-- 
1.9.1
