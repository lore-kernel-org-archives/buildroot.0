From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Fri, 19 Jun 2015 15:38:43 +0200
Subject: [Buildroot] [PATCH v1 0/2] Make Buildroot for Zedboard independent
	on Xilinx tools
In-Reply-To: <20150618231816.513316f9@free-electrons.com>
References: <20150618231816.513316f9@free-electrons.com>
Message-ID: <1434721125-5688-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

Dear Thomas,

thank you for the review. I've made the changes accordingly.

I've created host-zynq-boot-bin package to cover the small
python script. It downloads U-Boot xilinx-v2015.1 from Xilinx
github for this purpose (quite an overkill, isn't it...).

There are now just 2 patches of U-Boot 2015.07. 0001 adds
calling of the zynq-boot-bin.py and 0002 fixes the default
U-Boot environment to boot out-of-the-box from SD card.

There is still one thing to solve (I wasn't sure how).
There is no dependency specified between U-Boot and the
host-zynq-boot-bin package. It should be probably conditional
but what kind of condition to write there? Should we use
it for every Zynq architecture? (Is it possible to detect
it by Buildroot?)

Regards
Jan Viktorin


Jan Viktorin (2):
  host-zynq-boot-bin: new package
  zedboard: Upgrade to U-Boot 2015.07

 board/avnet/zedboard/readme.txt                    | 95 ++++++++++------------
 ...oot.bin-automatically-by-zynq-boot-bin.py.patch | 38 +++++++++
 ...eate-zedboard-specific-U-Boot-environment.patch | 46 +++++++++++
 configs/zedboard_defconfig                         |  6 +-
 package/Config.in.host                             |  1 +
 package/zynq-boot-bin/Config.in.host               |  7 ++
 package/zynq-boot-bin/zynq-boot-bin.mk             | 16 ++++
 7 files changed, 156 insertions(+), 53 deletions(-)
 create mode 100644 board/avnet/zedboard/uboot-2015.07/0001-Generate-boot.bin-automatically-by-zynq-boot-bin.py.patch
 create mode 100644 board/avnet/zedboard/uboot-2015.07/0002-zynq-Create-zedboard-specific-U-Boot-environment.patch
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

-- 
2.4.3
