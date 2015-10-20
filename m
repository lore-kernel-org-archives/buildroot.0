From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 20 Oct 2015 13:32:18 +0200
Subject: [Buildroot] [PATCH v2 0/7] Attempt to improve support for Altera
	SoC FPGA boards
In-Reply-To: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445291141-6182-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I've integrated the changes by Maxime into my patch series. I've also
reworked the readme changes.

First, the readme is a little bit more verbose about the support of
the SoC DK board (and not just the SoCkit). Second, I've updated the
notes about mkpimage and "signing" of the SPL.

The last three patches related to that readme are less important.
They just improve the text a little bit.

Regards
Jan

Jan Viktorin (7):
  mkpimage: new host package
  boot/uboot: compute CRC on SPLs for Altera SoC FPGA
  altera: improve readme to cover both supported boards
  altera: update text about the mkpimage
  altera: change mmcblk0 to sdc
  altera: improve fdisk instructions
  altera: remove whitespace before colon

 board/altera/readme.txt      |  80 ++++++------
 boot/uboot/Config.in         |  10 ++
 boot/uboot/uboot.mk          |   9 ++
 package/mkpimage/mkpimage.c  | 287 +++++++++++++++++++++++++++++++++++++++++++
 package/mkpimage/mkpimage.mk |  22 ++++
 5 files changed, 371 insertions(+), 37 deletions(-)
 create mode 100644 package/mkpimage/mkpimage.c
 create mode 100644 package/mkpimage/mkpimage.mk

-- 
2.6.1
