From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:17:55 +0200
Subject: [Buildroot] [PATCH 0/7] zynq: bump all Zynq boards to newest
 U-Boot, Linux, unifying readme.txt
In-Reply-To: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20160730181755.16e4705e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 18:38:16 +0900, Masahiro Yamada wrote:

> Currently, Buildroot supports three Zynq boards.  This series bumps
> all of them to the latest U-Boot and Linux which are available in
> the Xilinx GitHub repository.
> 
> Building systems for Zynq boards is getting easy and easy.  With this
> series, we need no more manual intervention, no more local patches.
> 
> Also, three similar readme files are merged together.  Maintaining
> the documents will be easier too.
> 
> After bumped to the same version, the build procedure is almost the
> same for the Zynq-based boards.  The difference is only in U-Boot
> board defconfig and the Device Tree file name.  This applies to other
> Zynq boards that are not supported by Buildroot natively.
> 
> So, I come up with one question; how many defconfigs we want to
> support for similar build steps?  I know the support for Zynq Zybo
> board is being proposed.
> 
> We can boot the system on Zybo board, starting from zynq_zed_defconfig,
> by changing two options from "make menuconfig":
> BR2_LINUX_KERNEL_INTREE_DTS_NAME=zynq-zybo
> BR2_TARGET_UBOOT_BOARDNAME=zynq_zybo

Thanks, I've applied the entire patch series. To be honest, I was not
sure with your change moving from the mainline U-Boot back to the
Xilinx-specific U-Boot. In general, we try to use the mainline version
of the Linux kernel or U-Boot. But since the patches have been sent
some time ago, and nobody else commented, I took your approach.

One thing that would be good it to add genimage support to
automatically generate the SD card image with the VFAT partition.

Also, why is an initramfs use, rather than a more standard filesystem
like ext4 on a second partition of the SD card?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
