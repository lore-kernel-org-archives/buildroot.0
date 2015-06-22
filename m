From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Mon, 22 Jun 2015 13:15:26 +0200
Subject: [Buildroot] [PATCH v2 0/2] Make Buildroot for Zedboard independent
	on Xilinx tools
In-Reply-To: <20150618231816.513316f9@free-electrons.com>
References: <20150618231816.513316f9@free-electrons.com>
Message-ID: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

Hello,

based on the previous discussions, here are the changes
of the host-zynq-boot-bin which is now calling the zynq-boot-bin.py
script during its HOST_BUILD stage to create a boot.bin image
from the U-Boot's SPL. The host-zynq-boot-bin uses the variable
BR2_TARGET_UBOOT_SPL_NAME to determine the name of the installed
SPL binary.

I've added dependency on host-python, however, I am not sure
whether it is correct this way. It works for me.

There is only one patch for U-Boot attached that creates
an environment that boots out-of-the-box on Zedboard.

Regards
Jan Viktorin


Jan Viktorin (2):
  host-zynq-boot-bin: new package
  zedboard: Upgrade to U-Boot 2015.07

 board/avnet/zedboard/readme.txt        | 95 ++++++++++++++++------------------
 configs/zedboard_defconfig             |  7 +--
 package/Config.in.host                 |  1 +
 package/zynq-boot-bin/Config.in.host   |  8 +++
 package/zynq-boot-bin/zynq-boot-bin.mk | 22 ++++++++
 5 files changed, 79 insertions(+), 54 deletions(-)
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

-- 
2.4.4
