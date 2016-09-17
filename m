From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Date: Sat, 17 Sep 2016 16:23:22 -0400
Subject: [Buildroot] [PATCH v2 0/2] configs: Add ts4900 basic board support
Message-ID: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie of patches add the support for the TS-4900 SoM manufactured by
Technologic Systems based on an i.MX6 SoC from Freescale.

Changes in v2:
 - add a paragraph in the readme about the pre-flashed bootloader
 - clean defconfig
 - improve help text in ts4900-fpga package
 - add a locally calculated sha256 for ts4900-fpga.bin
 - ts4900-fpga version is now 0930 instead of 0326
 - copy bitstream during target stage instead of image stage

Mathieu Audat (2):
  ts4900-fpga: add ts4900-fpga package
  configs: add defconfig for TS-4900

 board/technologic/ts4900/genimage.cfg  | 10 +++++++
 board/technologic/ts4900/post-image.sh | 20 ++++++++++++++
 board/technologic/ts4900/readme.txt    | 50 ++++++++++++++++++++++++++++++++++
 configs/ts4900_defconfig               | 19 +++++++++++++
 package/Config.in                      |  1 +
 package/ts4900-fpga/Config.in          | 11 ++++++++
 package/ts4900-fpga/ts4900-fpga.hash   |  5 ++++
 package/ts4900-fpga/ts4900-fpga.mk     | 21 ++++++++++++++
 8 files changed, 137 insertions(+)
 create mode 100644 board/technologic/ts4900/genimage.cfg
 create mode 100755 board/technologic/ts4900/post-image.sh
 create mode 100644 board/technologic/ts4900/readme.txt
 create mode 100644 configs/ts4900_defconfig
 create mode 100644 package/ts4900-fpga/Config.in
 create mode 100644 package/ts4900-fpga/ts4900-fpga.hash
 create mode 100644 package/ts4900-fpga/ts4900-fpga.mk

-- 
1.9.1
