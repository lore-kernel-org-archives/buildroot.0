From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Jul 2016 18:38:16 +0900
Subject: [Buildroot] [PATCH 0/7] zynq: bump all Zynq boards to newest U-Boot,
	Linux, unifying readme.txt
Message-ID: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, Buildroot supports three Zynq boards.  This series bumps
all of them to the latest U-Boot and Linux which are available in
the Xilinx GitHub repository.

Building systems for Zynq boards is getting easy and easy.  With this
series, we need no more manual intervention, no more local patches.

Also, three similar readme files are merged together.  Maintaining
the documents will be easier too.

After bumped to the same version, the build procedure is almost the
same for the Zynq-based boards.  The difference is only in U-Boot
board defconfig and the Device Tree file name.  This applies to other
Zynq boards that are not supported by Buildroot natively.

So, I come up with one question; how many defconfigs we want to
support for similar build steps?  I know the support for Zynq Zybo
board is being proposed.

We can boot the system on Zybo board, starting from zynq_zed_defconfig,
by changing two options from "make menuconfig":
BR2_LINUX_KERNEL_INTREE_DTS_NAME=zynq-zybo
BR2_TARGET_UBOOT_BOARDNAME=zynq_zybo

That's it.

So far, new Zynq board supports have been added time to time,
by copy-paste work (see commit 03130f944a2053, for example),
but maintained separately. And now we are going to support another
board maintained by another developer.  We are duplicating efforts.
I want to see improvements for all the Zynq boards synced.
If we use genimage for Zybo board, why not for the existing three
boards?  Let's think about it.  This is my point of this series.

(Moreover, I want to merge three defconfigs into one.)


Masahiro Yamada (7):
  zynq_zed: bump Linux to xilinx-v2016.2
  zynq_zed: bump U-Boot to xilinx-v2016.2
  zynq_microzed: bump Linux to xilinx-v2016.2
  zynq_microzed: bump U-Boot to xilinx-v2016.2
  zynq_zc706: bump Linux to xilinx-v2016.2
  zynq_zc706: bump U-Boot to xilinx-v2016.2
  zynq: unify readme.txt for all Zynq boards

 board/avnet/microzed/readme.txt                    | 68 ----------------------
 ...eate-microzed-specific-U-Boot-environment.patch | 41 -------------
 board/avnet/zedboard/readme.txt                    | 64 --------------------
 ...eate-zedboard-specific-U-Boot-environment.patch | 45 --------------
 board/xilinx/zc706/readme.txt                      | 56 ------------------
 board/zynq/readme.txt                              | 52 +++++++++++++++++
 configs/zynq_microzed_defconfig                    | 15 +++--
 configs/zynq_zc706_defconfig                       | 12 ++--
 configs/zynq_zed_defconfig                         | 15 +++--
 9 files changed, 72 insertions(+), 296 deletions(-)
 delete mode 100644 board/avnet/microzed/readme.txt
 delete mode 100644 board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
 delete mode 100644 board/avnet/zedboard/readme.txt
 delete mode 100644 board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
 delete mode 100644 board/xilinx/zc706/readme.txt
 create mode 100644 board/zynq/readme.txt

-- 
1.9.1
