From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 6 Feb 2014 16:28:03 -0600
Subject: [Buildroot] [PATCH] zedboard: add Avnet Zedboard support.
In-Reply-To: <878utnnb8s.fsf@dell.be.48ers.dk>
References: <1391724285-23135-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <878utnnb8s.fsf@dell.be.48ers.dk>
Message-ID: <CAEBucnCGPO1aHe8o0HctLgW2saX3havxJBSf42A4hO2tSJk_+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 6, 2014 at 4:10 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  > From: Spenser Gilliland <spenser@gillilanding.com>
>  > [Thomas: update to recent Buildroot which had renamed several
>  > Config.in options, lock down kernel headers version]
>
>  > Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Committed, thanks.
>
>  > +++ b/board/avnet/zedboard/readme.txt
>  > @@ -0,0 +1,13 @@
>  > +This is the buildroot board support for the Avnet Zedboard. The Zedboard is
>  > +a development board based on the Xilinx Zynq-7000 based All-Programmable
>  > +System-On-Chip.
>  > +
>  > +Zedboard information including schematics, reference designs, and manuals are
>  > +available from http://www.zedboard.org .
>  > +
>  > +To boot the Zedboard using a buildroot generated image copy the following files
>  > +to the sdcard:
>  > +    zynq-zed.dtb -> devicetree.dtb
>  > +    rootfs.cpio.gz.uboot -> uramdisk.image.gz
>  > +    uImage -> uImage
>
> What about u-boot?

Building u-boot for the zed board is not difficult the problem is the
convoluted wrapper which requires the XIlinx tools in order to install
it.  I can add directions to the readme.

The basic process is.

source <path/to/xilinx/settings.sh>
cat <<EOF > boot.bif
{
   [bootloader]<path/to/fsbl.elf>
   <path/to/system.bit>
   <path/to/uboot.elf>
}
bootgen -image boot.bif -o i BOOT.BIN

This file then needs to be placed on the SD Card.

>
>  > +# Bootloader
>  > +BR2_TARGET_UBOOT=y
>  > +BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
>  > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
>  > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v14.5"
>  > +BR2_TARGET_UBOOT_FORMAT_ELF=y
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
