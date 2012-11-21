From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 13:30:36 +0100
Subject: [Buildroot] Xtensa in the autobuilders, first build failures
In-Reply-To: <50AC21D6.2080405@zankel.net>
References: <20121118232518.091b6154@skate> <50AAA88E.3090603@zankel.net>
 <20121119234601.6274d4a6@skate> <50AC21D6.2080405@zankel.net>
Message-ID: <20121121133036.65f48bc9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Tue, 20 Nov 2012 16:35:34 -0800, Chris Zankel wrote:

> > Ah, sorry, my bad. Don't hesitate to send a follow-up patch that
> > fixes the remaining problems.
> No worries, I think my email system wasn't working, so maybe you
> didn't even get them.

Yeah, after seeing your patch, I don't think I had seen those changes
before, but I may well have overlooked them.

> > Adding support for one architecture in libffi is not very simple,
> > so if you don't need it for your own projects, I don't think you'll
> > have the energy to work on this. 
> You are right, it looks like some work, and it would be lower
> priority. I'll just disable it for Xtensa for now.

Right, but as I replied, it's not that easy :)

> >>> Besides those issues, I'm just reminding you that we are still
> >>> very interested in having a Qemu Xtensa configuration to be able
> >>> to run the Xtensa systems we generate with Buildroot.
> >> I'm juggling between kernel, uClibc, and buildroot, so, please
> >> allow me some more time.
> > Sure, no problem!
> How do you actually build qemu inside buildroot, or is this not
> supported?

We have a host-qemu package, but it only builds the user-mode
emulation, and is not visible in menuconfig. For now, I think you can
just use the latest version of Qemu and compile it on your own. Unless
you have some time and want to extend the existing host-qemu package,
of course.

> I couldn't find any config option to enable it.
> Also note that the current kernel version (3.6) doesn't have all
> required patches, we are 'forward-focusing' at the moment, so things
> will be easier in the future.

That's a good strategy indeed. I don't mind if the Xtensa Qemu
defconfig currently points to a special Git tree for the kernel
sources, or if we have a few kernel patches in board/qemu/xtensa/, for
example.

Just let us what kernel version + patches, or kernel Git tree and we'll
figure out together how to make that fit into Buildroot.

> >> Regarding patches, should I send them to you and cc buildroot, or
> >> only to the mailing list? What's the best path to get them looked
> >> at and integrated into the tree?
> > Just send them to the list. You can Cc: me as well if you want, but
> > I'm basically reading everything that goes on the Buildroot list,
> > so I should catch them even if you don't Cc: me.
> Thanks. I'll keep them coming :-)

Seen them, the first two got applied, the last one about libffi is more
problematic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
