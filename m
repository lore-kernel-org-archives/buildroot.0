From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 14 Jul 2015 17:12:14 +0200
Subject: [Buildroot] [PATCH v4 0/7 Make Buildroot for Zedboard independent
 on Xilinx tools
In-Reply-To: <20150704160716.347e3e35@free-electrons.com>
Message-ID: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

here follows another version of the patch series. I have rewritten it
based on the previous discussion with Yann, Arnout and Thomas.

The patch 1 is unrelated, I did not know whether to post it alone
or if it is OK to put it here...

The host-zynq-boot-bin is just "download & install" now.

I've added a new output format of U-Boot to generate u-boot-dtb.img which
is booted by the SPL. The generation of the BOOT.BIN file is moved into
uboot.mk as suggested by Thomas. I am little bit unsure about the config
BR2_TARGET_UBOOT_ZYNQ_IMAGE (the depends on/select). To enable the BOOT.BIN
generation, the user must set the dtb.img format and enable SPL. However,
the zedboard_defconfig does it so it might be OK.

The zedboard related changes are slightly modified but almost the same.

Regards
Jan Viktorin


Jan Viktorin (7):
  docs/manual: Fix trivial typo
  host-zynq-boot-bin: new package
  boot/uboot: Add support for dtb.img format
  boot/uboot: Generate BOOT.BIN file when building for Xilinx Zynq
  zedboard: Generate BOOT.BIN automatically
  zedboard: Patch default U-Boot environment for zedboard
  zedboard: Update readme.txt to reflect BOOT.BIN generation

 board/avnet/zedboard/readme.txt                    | 84 ++++++++++------------
 ...eate-zedboard-specific-U-Boot-environment.patch | 46 ++++++++++++
 boot/uboot/Config.in                               | 16 +++++
 boot/uboot/uboot.mk                                | 12 ++++
 configs/zedboard_defconfig                         |  9 +--
 docs/manual/adding-packages-python.txt             |  2 +-
 package/Config.in.host                             |  1 +
 package/zynq-boot-bin/Config.in.host               |  8 +++
 package/zynq-boot-bin/zynq-boot-bin.hash           |  2 +
 package/zynq-boot-bin/zynq-boot-bin.mk             | 22 ++++++
 10 files changed, 151 insertions(+), 51 deletions(-)
 create mode 100644 board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

-- 
2.4.5




-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech                    Phone:  +420 606 201 868
   Brno, Czech Republic
