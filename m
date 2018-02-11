From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 11 Feb 2018 18:56:47 +0300
Subject: [Buildroot] [PATCH/next 0/2] orange-pi-zero-plus2: BSP update and
 WiFi support
Message-ID: <20180211155649.21996-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here are two patches for Orange Pi Zero Plus2 board. The first
patch updates mainline kernel and U-Boot versions. The second
patch enables wireless networking by default on that board.

Regards,
Sergey

Sergey Matyukevich (2):
  orange-pi-zero-plus2: bump kernel and u-boot versions
  orange-pi-zero-plus2: enable WiFi support


 board/orangepi/orangepi-zero-plus2/linux-extras.config                                                           |   10 +
 board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch   |   73 ++++++++++
 board/orangepi/orangepi-zero-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt                       |   54 +++++++
 configs/orangepi_zero_plus2_defconfig                                                                            |   24 ++-
 board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch |   30 ----
 5 files changed, 155 insertions(+), 36 deletions(-)
