From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Tue, 28 Apr 2020 09:33:49 +0200
Subject: [Buildroot] [PATCH 0/4] imx: add i.MX8M Nano EVK board support
Message-ID: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for the NXP i.MX8M Nano EVK board.

Since the i.MX8M Nano CPU was added for the Nitrogen8MNano board, which has a
type of memory (LPDDR4) different from the NXP reference board (DDR4), the first
couple of patches introduce the DDR training selection.

The second half of the series adds support for i.MX8M Nano EVK Board with kernel/
U-Boot based on 4.19.35_1.1.0, which is the current preferred version for all NXP
reference boards.

BR, 
Stephane.

Stephane Viau (4):
  package/freescale-imx/firmware-imx: add choice for DDR training
    binaries
  board/freescale/common/imx: use generic ddr_fw.bin name
  board/freescale/common/imx: add support for i.MX8M Nano
  configs/freescale_imx8mnevk: new defconfig

 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  4 ++
 .../common/imx/imx8-bootloader-prepare.sh          |  2 +-
 board/freescale/common/imx/post-image.sh           |  2 +
 board/freescale/imx8mnevk/readme.txt               | 74 ++++++++++++++++++++++
 configs/freescale_imx8mnevk_defconfig              | 43 +++++++++++++
 package/freescale-imx/firmware-imx/Config.in       | 24 +++++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 29 ++++++++-
 8 files changed, 177 insertions(+), 2 deletions(-)
 create mode 100644 board/freescale/imx8mnevk/readme.txt
 create mode 100644 configs/freescale_imx8mnevk_defconfig

-- 
2.7.4
