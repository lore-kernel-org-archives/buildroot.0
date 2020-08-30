From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 22:18:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrp: new package
In-Reply-To: <CAKcgs2w58TBPMAB5-V7wi3S5N-PLxwOGOy1DYFt47LWUmxPksA@mail.gmail.com>
References: <20200830083845.1402501-1-horatiu.vultur@microchip.com>
 <CAKcgs2w58TBPMAB5-V7wi3S5N-PLxwOGOy1DYFt47LWUmxPksA@mail.gmail.com>
Message-ID: <20200830221826.57ccade3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gilles,

Thanks for reviewing patches from others! See below for a few comments.

On Sun, 30 Aug 2020 17:52:17 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> >  N:     Horatiu Vultur <horatiu.vultur@microchip.com>
> >  F:     package/easyframes/
> > +F:     package/mrp/  
> This patch will not apply because the easyframes package is not in master yet.
> You need to rebase to master before sending your patch.

Actually, when the "next" branch is open (as it is currently), new
packages are going to be applied to the next branch, so it makes sense
to have this patch based on the next branch. And the easyframes package
was merged in the next branch a few days ago.

> > +config BR2_PACKAGE_MRP
> > +       bool "Media Redundancy Protocol"

Should be just:

	bool "mrp"

> > +       select BR2_PACKAGE_LIBEV
> > +       select BR2_PACKAGE_LIBMNL
> > +       select BR2_PACKAGE_LIBNL  
> libnl needs threads so mrp inherits its dependency (depends on
> BR2_TOOLCHAIN_HAS_THREADS)

Absolutely, and therefore, a Config.in comment must be added:

comment "mrp needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> > +MRP_VERSION = 1.1
> > +MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
> > +MRP_DEPENDENCIES = libev libmnl libnl
> > +MRP_LICENSE = GPLv2  
> I would say it is GPLv2+ ("or any later version"), but I can never
> tell to be honest

I haven't checked GPLv2 or GPLv2+. However, the proper encoding in
Buildroot is GPL-2.0 or GPL-2.0+.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
