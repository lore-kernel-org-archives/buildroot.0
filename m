From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Feb 2014 23:10:27 +0100
Subject: [Buildroot] [PATCH] zedboard: add Avnet Zedboard support.
In-Reply-To: <1391724285-23135-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 6 Feb 2014 23:04:45 +0100")
References: <1391724285-23135-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878utnnb8s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Spenser Gilliland <spenser@gillilanding.com>
 > [Thomas: update to recent Buildroot which had renamed several
 > Config.in options, lock down kernel headers version]

 > Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

 > +++ b/board/avnet/zedboard/readme.txt
 > @@ -0,0 +1,13 @@
 > +This is the buildroot board support for the Avnet Zedboard. The Zedboard is
 > +a development board based on the Xilinx Zynq-7000 based All-Programmable
 > +System-On-Chip.
 > +
 > +Zedboard information including schematics, reference designs, and manuals are
 > +available from http://www.zedboard.org .
 > +
 > +To boot the Zedboard using a buildroot generated image copy the following files
 > +to the sdcard:
 > +	zynq-zed.dtb -> devicetree.dtb
 > +	rootfs.cpio.gz.uboot -> uramdisk.image.gz
 > +	uImage -> uImage

What about u-boot?

 > +# Bootloader
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v14.5"
 > +BR2_TARGET_UBOOT_FORMAT_ELF=y

-- 
Bye, Peter Korsgaard
