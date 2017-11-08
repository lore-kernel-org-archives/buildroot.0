From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  8 Nov 2017 22:43:31 +0300
Subject: [Buildroot] [PATCH 0/3] orangepi_pc_plus: new board and its drivers
Message-ID: <20171108194334.10031-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patchset adds support for orange-pi-pc-plus board and its wireless driver.
In fact this board is a variant of orangepi-pc board. It adds 8GB eMMC and
Realtek RTL8189FTV SDIO WiFi chip. On the other hand, this variant has
a separate support in U-Boot and kernel. So it looks like it makes
sense to create a separate entry for this board in buildroot.

Patches are rebased on top of the up-to-date master branch.

Regards,
Sergey

Sergey Matyukevich (3): 
  board/orangepi: add support for orangepi-pc-plus board
  rtl8189fs: new package
  orangepi-pc-plus: enable WiFi support

 DEVELOPERS                                          |    1 
 board/orangepi/orangepi-pc-plus/boot.cmd            |    8 +++
 board/orangepi/orangepi-pc-plus/genimage.cfg        |   36 ++++++++++++++++
 board/orangepi/orangepi-pc-plus/linux-extras.config |    8 +++
 board/orangepi/orangepi-pc-plus/post-build.sh       |    1 
 board/orangepi/orangepi-pc-plus/post-image.sh       |    1 
 board/orangepi/orangepi-pc-plus/readme.txt          |   29 +++++++++++++
 configs/orangepi_pc_plus_defconfig                  |   44 ++++++++++++++++++++
 package/Config.in                                   |    1 
 package/rtl8189fs/Config.in                         |   10 ++++
 package/rtl8189fs/rtl8189fs.hash                    |    2 
 package/rtl8189fs/rtl8189fs.mk                      |   17 +++++++
  12 files changed, 158 insertions(+)
