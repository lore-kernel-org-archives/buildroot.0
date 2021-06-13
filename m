From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 13 Jun 2021 19:19:20 +0300
Subject: [Buildroot] [PATCH 0/6] allwinner: arm32: misc BSP updates
Message-ID: <20210613161926.2790763-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a patch set with BSP updates for several boards with Allwinner
32-bit CPU. U-Boot version updated to 2021.04 and Linux version updated
to 5.12.2. Besides, rtl8189fs out-of-tree wireless driver revision was
updated to compile it with new kernel.

Regards,
Sergey


Sergey Matyukevich (6):
  rtl8189fs: bump revision to 62c31d57
  rtl8189fs: disable debug messages
  configs/orangepi_zero_defconfig: bump BSP versions
  configs/orangepi_one_defconfig: bump BSP versions
  configs/orangepi_pc_plus_defconfig: bump BSP versions
  board/orangepi-pc-plus: switch to GPT partitions for PARTLABEL support

 board/orangepi/orangepi-pc-plus/boot.cmd      |  2 +-
 board/orangepi/orangepi-pc-plus/genimage.cfg  |  8 +++++-
 configs/orangepi_one_defconfig                | 13 +++++----
 configs/orangepi_pc_plus_defconfig            | 11 ++++----
 configs/orangepi_zero_defconfig               | 10 +++----
 .../0001-include-disable-debug-messages.patch | 28 +++++++++++++++++++
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                |  2 +-
 8 files changed, 56 insertions(+), 20 deletions(-)
 create mode 100644 package/rtl8189fs/0001-include-disable-debug-messages.patch

-- 
2.32.0
