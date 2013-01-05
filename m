From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jan 2013 18:58:34 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <201301051636.51883.yann.morin.1998@free.fr>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <201301051636.51883.yann.morin.1998@free.fr>
Message-ID: <20130105185834.2f1fb7bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 5 Jan 2013 16:36:51 +0100, Yann E. MORIN wrote:

> > +++ b/package/rpi-fw/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_RPI_FW
> > +	bool "RaspberryPi Firmware"
> 
> Today, this package is only used fior the RPI. But that GPU is not specific
> to the RPI, so what about calling that package "VideoCore bootloader" ?

I am quite sure the start.elf code is Rasberry Pi specific, so I don't
think this package is just a "VideoCore bootloader".

> > +++ b/package/rpi-fw/cmdline.txt
> > @@ -0,0 +1 @@
> > +dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait
> 
> This is typically a reason why I'd like to have a generic way to expressing
> the different filesystems tht form a sinlge firmware. Here, my root partition
> is *not* mmcblk0p2, it's p3. And the rootfstype is *not* ext4, it's ext2.
> 
> But, I guess we'll have to live with that commandline for now... :-/
> 
> Maybe you could just omit the root settings (or replace them with place-
> holders: root=/dev/XXXX rootfstype=XXXX). Of course, that will depend on
> the maintainer's opinion. ;-)

I would like to see a comment added in this file, which mentions this
is only a sample command line, and we recommend to override it on a
per-project basis using a post-build script.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
