From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 4 Feb 2014 14:21:17 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <87zjm7cae2.fsf@dell.be.48ers.dk>
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
 <20140204112654.GD30185@ldesroches-Latitude-E6320>
 <87zjm7cae2.fsf@dell.be.48ers.dk>
Message-ID: <20140204132117.GE30185@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 04, 2014 at 01:47:33PM +0100, Peter Korsgaard wrote:
> >>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:
> 
>  >> Care to send such a minimal defconfig with comments instead?
> 
>  > Sorry, not sure to have understood, you mean I have to put extra packages I
>  > want as comments.
> 
> No, please take a look at our other defconfigs (E.G. nitrogen6x):

I had a look but I didn't understand what you mean by comments. So ok,
those kind of comments.

> 
> # architecture
> BR2_arm=y
> BR2_cortex_a9=y
> 
> # system
> BR2_TARGET_GENERIC_GETTY=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
> 
> # filesystem
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_2r1=y
> 
> # bootloader
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
> BR2_TARGET_UBOOT_FORMAT_IMX=y
> BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/4034391/u-boot-4034391.tar.gz"
> 
> # kernel
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5809938/linux-imx6-5809938.tar.gz"
> BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> 
> 
> It doesn't enable any usecase specific packages, just the needed
> arch/getty/linux/bootloader configuration to start working from.
> 

I understand this point of view and I am fine with it. But my concern is
that some customers want something working out of the box. For instance,
we often use devmem2 for debugging purpose or other tools such as
i2c-tools. It is easier for us to have it in a defconfig file.

I am not trying to convince you to take this defconfig as is! Just to
know if there is a way to provide specific packages? If not, it will be
provided only in our buildroot-at91 repository. I am also fine with
this, if the customer wants something out of the box then he'll have to
use our repository. Otherwise he could use buildroot one.


Regards

Ludovic
