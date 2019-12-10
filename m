From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 14:11:45 +0100
Subject: [Buildroot] Custom tarball and .config file
In-Reply-To: <1575964472511-0.post@n4.nabble.com>
References: <1575964472511-0.post@n4.nabble.com>
Message-ID: <20191210141145.5969eb63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 01:54:32 -0600 (CST)
rscr <rafacrespiramon@gmail.com> wrote:

> Hello, 
> 
> I am trying to use my Custom Tarball and I would like to use the
> bcmrpi_defconfig as a base config for creating my custom linux config file. 
> 
> Here are the paths I am using.
> 
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="file://home/tec/rcr/tools/src/linux-rpi-4.19.y.tar.gz"
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/tec/rcr/projects/cp4/rscr_br2_extree/configs/ibLinux_defconfig"
> 
> I can build an image with that BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION and
> the bcmrpi_defconfig, but now I would like to use my own .config based on
> bcmrpi

So if I understand, the above configuration is working well for you ?

> 1) Is there any way of using "make linux-menuconfig" pointing to my
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION path instead of  the /dl/linux
> sources?

Well, if the above configuration with a file:// path is working for
you, why don't you simply use this ?

> 2) Is there any way of doing something like "make bcmrpi_defconfig", "make
> linux-menuconfig"...just as for  the buildroot defconfig file?

I'm not sure to follow you here. As long as Buildroot is configured
with the Linux kernel package enabled, you can run "make
linux-menuconfig".

To be honest, I am quite puzzled by your questions, so I believe there
is a misunderstanding somewhere.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
