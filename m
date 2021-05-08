From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 May 2021 20:23:36 +0200
Subject: [Buildroot] [PATCH v3 3/7] configs/beaglev_defconfig: new
 defconfig
In-Reply-To: <20210507220232.GD2137340@scaer>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-4-thomas.petazzoni@bootlin.com>
 <20210507220232.GD2137340@scaer>
Message-ID: <20210508202336.0706a584@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 8 May 2021 00:02:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > diff --git a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> > new file mode 100644
> > index 0000000000..74d70f2721
> > --- /dev/null
> > +++ b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> > @@ -0,0 +1,39 @@
> > +From 2c4c813940c577590f3352cef0c49a8def17905d Mon Sep 17 00:00:00 2001
> > +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > +Date: Wed, 28 Apr 2021 22:58:45 +0200
> > +Subject: [PATCH] include/configs/starfive-vic7100: adjust fdt_addr_r
> > +
> > +The default fdt_addr_r of 0x88000000 doesn't work, the kernel never
> > +boots. Using 0x90000000 works fine.
> > +
> > +Since it would overlap with the kernel_comp_addr_r area, this one is
> > +moved 16 MB further, at 0x91000000.  
> 
> Is this something that is so board specific that we can't upstream it?

It's not so much that is it board specific or not, but rather than it's
odd that the default value used in the BeagleV repo doesn't work for
us. So at this point I don't have a very convincing argument for
upstream other than "it doesn't work for me without this change".

> Here, I've used eval, as suggested in the manual:
> 
>     eval $(make -C ${CONFIG_DIR} --no-print-directory QUOTED_VARS=YES VARS=UBOOT_DIR printvars)

Sounds good, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
