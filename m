From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 13:47:33 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <20140204112654.GD30185@ldesroches-Latitude-E6320> (Ludovic
 Desroches's message of "Tue, 4 Feb 2014 12:26:54 +0100")
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
 <20140204112654.GD30185@ldesroches-Latitude-E6320>
Message-ID: <87zjm7cae2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:

 >> Care to send such a minimal defconfig with comments instead?

 > Sorry, not sure to have understood, you mean I have to put extra packages I
 > want as comments.

No, please take a look at our other defconfigs (E.G. nitrogen6x):

# architecture
BR2_arm=y
BR2_cortex_a9=y

# system
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"

# filesystem
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_2r1=y

# bootloader
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
BR2_TARGET_UBOOT_FORMAT_IMX=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/4034391/u-boot-4034391.tar.gz"

# kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5809938/linux-imx6-5809938.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
BR2_LINUX_KERNEL_INSTALL_TARGET=y


It doesn't enable any usecase specific packages, just the needed
arch/getty/linux/bootloader configuration to start working from.

-- 
Bye, Peter Korsgaard
