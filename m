From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 09:42:03 +0200
Subject: [Buildroot] [PATCH 1/4] Rework support for the device tree
In-Reply-To: <5006E601.4080807@essensium.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
 <1341309676-18681-2-git-send-email-maxime.ripard@free-electrons.com>
 <20120716145708.5f2a1bf7@skate> <5006E601.4080807@essensium.com>
Message-ID: <20120719094203.493bd336@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 18:36:17 +0200,
Arnout Vandecappelle <arnout.vandecappelle@essensium.com> a ?crit :

> > Do you really need to create the directory here? I would suspect that
> > all arches supporting the Device Tree already have their boot/dts/
> > directory, no?
> 
>   Nope.  For instance in 3.0 there was preliminary DTS support for ARM,
> but no arch/arm/boot/dts directory.  That said, I'm not entirely sure if the
> foo.dtb target would even work, because I don't see a rule for producing
> it for arm in 3.0...

Realistically, the ARM DT support was so limited (in number of
platforms supported) in 3.0 that I don't think it's worth the effort. I
think we can safely assume that for all practical cases,
arch/<ARCH>/boot/dts exists.

> > Hum, here when I do a make foobar.dtb, the foobar.dtb file ends up in
> > the main kernel source tree, not in arch/arm/boot/.
>   That's strange... For which architecture and kernel version?

That's just complete crap from my side. I got confused by the big
command line I typically use to build the kernel and concatenate the
DTB. The DTB indeed ends up in arch/arm/boot and Maxime's code is
correct in that respect.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
