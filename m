From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Fri, 20 Mar 2020 17:31:53 +0100
Subject: [Buildroot] [PATCH 0/5] updates of the NXP i.MX8QM/QXP
Message-ID: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch queue updates the defconfigs for NXP i.MX8QM and i.MX8QXP to NXP BSP 4.19.35_1.1.0
and the necessary BSP dependancies (imx-seco, firmware-imx, imx-sc-firmware, imx-mkimage).

Maeva Manuel (5):
  package/freescale-imx/imx-seco: new package
  package/freescale-imx/firmware-imx: bump version to 8.5
  package/freescale-imx/imx-sc-firmware: bump to version 1.2.7.1
  package/imx-mkimage: bump to version rel_imx_4.19.35_1.1.0
  configs/freescale_imx8q{m,xp}mek: bump BSP components to 4.19.35_1.1.0

 DEVELOPERS                                    |  1 +
 configs/freescale_imx8qmmek_defconfig         |  9 ++---
 configs/freescale_imx8qxpmek_defconfig        |  9 ++---
 package/freescale-imx/Config.in               |  1 +
 .../firmware-imx/firmware-imx.hash            |  2 +-
 .../firmware-imx/firmware-imx.mk              | 16 +--------
 .../imx-sc-firmware/imx-sc-firmware.hash      |  6 ++--
 .../imx-sc-firmware/imx-sc-firmware.mk        |  2 +-
 package/freescale-imx/imx-seco/Config.in      |  9 +++++
 package/freescale-imx/imx-seco/imx-seco.hash  |  4 +++
 package/freescale-imx/imx-seco/imx-seco.mk    | 35 +++++++++++++++++++
 ...verriding-BL32-and-BL33-not-only-BL.patch} | 28 ++++++++-------
 .../0002-Add-LDFLAGS-to-link-step.patch       | 26 ++++++++++++++
 .../0002-add-ldflags-to-link-step.patch       | 26 --------------
 .../0003-Add-unused-fake-version.patch        | 11 +++---
 package/imx-mkimage/imx-mkimage.hash          |  2 +-
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 17 files changed, 116 insertions(+), 73 deletions(-)
 create mode 100644 package/freescale-imx/imx-seco/Config.in
 create mode 100644 package/freescale-imx/imx-seco/imx-seco.hash
 create mode 100644 package/freescale-imx/imx-seco/imx-seco.mk
 rename package/imx-mkimage/{0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch => 0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch} (65%)
 create mode 100644 package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
 delete mode 100644 package/imx-mkimage/0002-add-ldflags-to-link-step.patch

-- 
2.17.1
