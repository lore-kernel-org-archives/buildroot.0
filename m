From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Tue, 23 Jun 2015 14:49:09 +0200
Subject: [Buildroot] [PATCH v3 0/2] Make Buildroot for Zedboard independent
	on Xilinx tools
In-Reply-To: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

Hello,

thanks to Baruch and Arnout for comments. I think this the final
version. The host-zynq-boot-bin now downloads just the python script
(thank you for this tip, I was looking for such solution).

The second commit is unchanged.

Regards
Jan Viktorin


Jan Viktorin (2):
  host-zynq-boot-bin: new package
  zedboard: Upgrade to U-Boot 2015.07

 board/avnet/zedboard/readme.txt        | 95 ++++++++++++++++------------------
 configs/zedboard_defconfig             |  7 +--
 package/Config.in.host                 |  1 +
 package/zynq-boot-bin/Config.in.host   |  8 +++
 package/zynq-boot-bin/zynq-boot-bin.mk | 24 +++++++++
 5 files changed, 81 insertions(+), 54 deletions(-)
 create mode 100644 package/zynq-boot-bin/Config.in.host
 create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

-- 
2.4.4
