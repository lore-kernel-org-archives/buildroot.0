From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sat, 05 Oct 2013 13:21:27 +0300
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <87mwmohyie.fsf@dell.be.48ers.dk>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <4620256.4JgqIslJcA@asici> <87mwmohyie.fsf@dell.be.48ers.dk>
Message-ID: <2072070.rCLOs5ZVTX@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 05 October 2013 11:12:41 Peter Korsgaard wrote:
> >>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:
> Hi,
> 
>  >> I would like to keep it with ext2 just to keep it similar to the other
>  >> defconfigs. Then we also don't need to carry the u-boot patch.
> 
>  Fatih> A patch is still needed since the default am335x_evm (also
>  Fatih> omap[45]) config changes "bootdir" to "/boot" unlike the other
>  Fatih> u-boot configs. I don't have an idea about the other options;
>  Fatih> but at least this change is needed for a familiar experience
>  Fatih> with other boards.
> 
> So it looks for uImage and .dtb files in rootfs:/boot? That sounds fine,
> as that's where we're installing them.

That's true; but we should enable BR2_LINUX_KERNEL_INSTALL_TARGET in defconfig 
too. It is not enabled by default.

Some defconfigs already have this:

$ git grep BR2_LINUX_KERNEL_INSTALL_TARGET
configs/calao_snowball_defconfig:BR2_LINUX_KERNEL_INSTALL_TARGET=y
configs/gnublin_defconfig:BR2_LINUX_KERNEL_INSTALL_TARGET=y
configs/nitrogen6x_defconfig:BR2_LINUX_KERNEL_INSTALL_TARGET=y
configs/wandboard_defconfig:BR2_LINUX_KERNEL_INSTALL_TARGET=y
linux/Config.in:config BR2_LINUX_KERNEL_INSTALL_TARGET
linux/linux.mk:ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
