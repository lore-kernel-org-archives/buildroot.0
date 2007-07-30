From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 31 Jul 2007 01:59:14 +0200
Subject: [Buildroot] Redundant kernel patches in the
	snapshot	from20070718
In-Reply-To: <20070730200247.GC29064@aon.at>
References: <1185459798.1044.43.camel@localhost.localdomain>
	<1185468722.5580.107.camel@elrond.sweden.atmel.com>
	<20070727113002.GF22789@aon.at>
	<026b01c7d2c2$cbcd3460$dcc4af0a@atmel.com>
	<20070730192728.GA27993@aon.at>  <20070730200247.GC29064@aon.at>
Message-ID: <1185839954.30603.36.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-30 klockan 22:02 +0200 skrev Bernhard Fischer:
> On Mon, Jul 30, 2007 at 09:27:28PM +0200, Bernhard Fischer wrote:
> [I deliberately do not correct the gazillions of typos i made]
> 
> >>>>* Cannot apply architecture specific patches, since
> >>>>  you may have conflicts between several patch-set's.
> >>>>* Cluttered directory
> >>> 
> >>> hm? Please explain.
> >>> 
> >>
> >>The AVR32 chips and the AT91 ARM chips uses the same peripherals,
> >>and therefore can use the same drivers.
> >
> >fair enough.
> >
> >So there is _one_ patch which is submitted upstream that is
> >linux-1.2.3.4-add-thisSpecificDevice.patch
> 
> ... where this patch adds _just_ the device. Accompanying
> infrastructure which may be used by a friend class of HW of course has
> to be in a separate patch. This obviously prevents attempts to apply any
> hunk twice, fwiw.

You make the assumption that two different groups
supplying patches actually tests their patches
against the patches for the other group.
Please don't.
Eadch group assumes that their patches are patched
on top of the kernel-patches.
It is the person trying to apply both patchsets 
in the same tree that is causing the error.
Buildroot of today encourages people to apply
patches on top of each other.
If you first build one target and then build another
target in the same tree, then the error occurs...

Your counter argument is that you should use a new tree,
but that is not desirable, so pls use other arguments.

Best Regards
Ulf Samuelsson.
