From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2011 00:04:50 +0200
Subject: [Buildroot] Kernel config and recommended books
In-Reply-To: <CAHvj1qY9ZzmuTzcE0W4V4dpErO-0FT4dXphAjA2VC6AFgT3oVw@mail.gmail.com>
References: <CAHvj1qY9ZzmuTzcE0W4V4dpErO-0FT4dXphAjA2VC6AFgT3oVw@mail.gmail.com>
Message-ID: <20110928000450.2d3a2f6b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Sep 2011 22:29:45 +0100,
bruce bushby <bruce.bushby@gmail.com> a ?crit :

> I wanted to ask how I retain a kernel config ".config"?  I'm trying to
> build a kernel for an OMAP3 Beagleboard .....so I run "make
> menuconfig" and select the bare basic but I change my login terminal
> to ttyS2 and for a "defconfig" I enter "omap2plus".

     ^^^^^ must be ttyO2 on OMAP platforms if you use a relatively
     recent kernel (I don't remember if it's > 2.6.35 or > 2.6.37)

> console=ttyS2,115200n8

          ttyO2

> So my question relates to the kernel ".config" .... before running
> make I don't have a kernel ".config" ... after running make I have:
> ./output/build/linux-3.0.4/.config
> 
> and I think it's this file I need to change:
> 
> [root at dlxarm01 buildroot-2011.08]# grep tty ./output/build/linux-3.0.4/.config
> CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
> [root at dlxarm01 buildroot-2011.08]#
> 
> that should be ttyS2....from what I've read on the net. So I take a

No, ttyO2 is correct. The "net" is outdated.

> copy of this file and I run a "make clean" .....but I can't put it
> back because the directory "./output/build/linux-3.0.4/"  no longer
> exists.

Run 'make linux-menuconfig' will automatically open the kernel
menuconfig. Then, if you want to save your kernel configuration:

 * Copy the output/build/linux-x.y.z/.config file somewhere

 * Edit your Buildroot configuration, and instead of using the
   omap2plus defconfig, tell Buildroot to use your own kernel
   configuration.

> and lastly, what is considered the "defacto" book with regards to
> embedded linux kernels?

There is no defacto book, but for the configuration/compilation process
of the kernel, you might want to have a look at
http://www.kroah.com/lkn/.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
