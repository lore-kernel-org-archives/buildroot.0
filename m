From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Sun, 18 Dec 2016 23:20:03 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <87eg14gad9.fsf@dell.be.48ers.dk>
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
 <20161218213526.16032-1-theo.debrouwere@skynet.be>
 <87eg14gad9.fsf@dell.be.48ers.dk>
Message-ID: <20161218222003.75z4xo3iejetxu7i@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

>  > +image boot.vfat {
>  > +	vfat {
>  > +		files = {
>  > +			"MLO",
>  > +			"u-boot.img"
> 
> No dtbs? Does it get them from mmc0:2/boot?

Correct. Kernel & dtb's are located on the second partition.
 
>  > +	partition rootfs {
>  > +		partition-type = 0x83
>  > +		image = "rootfs.ext4"
>  > +		size = 1G
> 
> All our other genimage.cfg files use 512M, so I've changed it to that as
> well.

Ok. I wasn't aware of this.

> 
> > diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
>  > new file mode 100644
>  > index 0000000..89f0081
>  > --- /dev/null
>  > +++ b/configs/beagleboardx15_defconfig
>  > @@ -0,0 +1,23 @@
>  > +BR2_arm=y
>  > +BR2_cortex_a15=y
>  > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
>  > +BR2_LINUX_KERNEL=y
>  > +BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am57xx-beagle-x15 am57xx-beagle-x15-revb1"
>  > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  > +BR2_TARGET_ROOTFS_EXT2=y
>  > +BR2_TARGET_ROOTFS_EXT2_4=y
>  > +BR2_TARGET_UBOOT=y
> 
> You forgot to lock the kernel and u-boot versions for reproducable
> builds. I've changed it to explicitly select linux 4.9 and u-boot
> 2016.11 and committed, thanks!

Ok.
