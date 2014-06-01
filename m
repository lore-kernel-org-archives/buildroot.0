From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 1 Jun 2014 10:26:31 -0500
Subject: [Buildroot] [PATCH 1/1] configs: bump zedboard to 2014.1
In-Reply-To: <CALZVapnO=eXG1utmqQM7TTyNbci91K2yYM4uRNQ5N5eQaFRs_A@mail.gmail.com>
References: <CALZVapnO=eXG1utmqQM7TTyNbci91K2yYM4uRNQ5N5eQaFRs_A@mail.gmail.com>
Message-ID: <CAEBucnAifQGsZVyi8z42vkyug31nH_UnvS1hM12+A0x4kd_ESQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Javier,

On Jun 1, 2014 6:49 AM, "Javier Domingo Cansino" <javierdo1@gmail.com>
wrote:
>
> Hello!
>
> I am trying to use this patch to boot a zedboard, but I can't get it
> working, I also tried doing it without the patch, and didn't succeed
> neither.

Thanks for testing my patch!   Please see my comments below for some more
info that may help you get it working.

>
> I had started rewriting a more complete readme.txt to make it easier
> for people create a buildroot based system[1], but didn't get zedboard
> boot with those instructions neither.
>
> Regarding your patch, I followed the specified commands in the readme,
> and I noticed a failure on it, the path to copy the sources to has a
> typo, needs to be board instead of boards:
>
> >+output/build/uboot-xilinx-v2014.1/boards/xilinx/zynq/
> +output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/
>
> The steps I made after make (as stated in the readme) ended, have been
>
> cp output/images/uImage SD/
> cp output/images/rootfs.cpio.uboot SD/uramdisk.image
> gzip SD/uramdisk.image

You should not run gzip this will compress the uboot header which will make
it impossible for uboot to load the rfs.

You will also need to install the u-boot.img binary to the root of the sd
card.

> cp output/images/boot.bin SD/
> cp output/images/zynq-zed.dtb SD/devicetree.dtb
>
> The board doesn't even boot, nor load with the blue led (DONE one).

The blue led will not come on in the current configuration.  This is
because no bitfile is loaded. You will need to install a bitfile on the
sdcard and load it with the fpga command in uboot or the xdevcfg device in
Linux.

Just for reference, the patch changes the initial boot loader from the
Xilinx fsbl based boot loader to the uboot spl loader.

Thanks,
Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140601/99809939/attachment.html>
