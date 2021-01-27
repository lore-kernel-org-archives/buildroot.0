From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 27 Jan 2021 09:05:17 +0300
Subject: [Buildroot] [PATCH 0/3] allwinner: update BSP for several boards
Message-ID: <20210127060520.616445-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas, and all

Here is a patch series that updates BSP for several boards with
Allwinner CPU. U-Boot version updated to 2020.10 and Linux
version updated to 5.10.10.

Note that in the new kernel sunxi-mmc driver has been switched to
asynchronous probe. As a result, on OrangePi Zero Plus2 board
SDCard/WiFi/eMMC indexes can be shuffled breaking its boot. Add
patch that pins mmc indexes to their original ordered values.
This patch has been also submitted to Linux mailing lists, so
it will be removed during one of the next BSP updates.

Regards,
Sergey

Sergey Matyukevich (3):
  configs/linksprite_pcduino: bump BSP versions
  configs/orangepi_zero_defconfig: bump BSP versions
  configs/orangepi_zero_plus2_defconfig: bump BSP versions

 ...-pi-zero-plus2-use-fixed-mmc-indexes.patch | 33 +++++++++++++++++++
 configs/linksprite_pcduino_defconfig          |  9 ++---
 configs/orangepi_zero_defconfig               |  6 ++--
 configs/orangepi_zero_plus2_defconfig         |  8 +++--
 4 files changed, 46 insertions(+), 10 deletions(-)
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/0001-ARM-dts-orange-pi-zero-plus2-use-fixed-mmc-indexes.patch

-- 
2.30.0
