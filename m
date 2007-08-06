From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 6 Aug 2007 22:58:36 +0200
Subject: [Buildroot] [Patch] internal toolchain for avr32
References: <20070806083229.GB4699@firebird.dresden.micronet24.de>
	<20070806201256.GA7043@firebird.dresden.micronet24.de>
Message-ID: <03aa01c7d86f$41c7c890$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Since my revision wasn't the latest, I didn't got the nice mud ulf
> created with his vendor-supplied toolchain. I'm sorry.
> 
> attached a patch that revert that misconfiguration.
> 
> @Ulf: Not everybody is happy about a vendor-supplied toolchain! So at
> least give everybody the chance to decide whether to use it or not.

I am not happy about doubling the size of buildroot just because
the "configure" files are patched by the avr32 patches.
That is why I did it this way.
I believe that the buildroot stuff will be downloaded many times
and the toolchain only once.
If there are modifications later, then they will most likely be patches
against the prepatched toolset.

> It would help even more, if Atmel would give external developers access
> to their patches; those from avr32linux.org becoming older more and more
> whilest pointing to download everything in ONE packet from Atmel. Thats
> a really big download...

Download the stuff from buildroot and diff against vanilla + buildroot patches and you have it.
If you have a slow line, then you can probably get access to a fast line somewhere else
to download it once.

While I work for Atmel, I am not in the AVR32 product line.
The product line guys makes decisions what to publish, - I don't.

> And another thing to add: get your vendor-specific stuff out of the
> general Makefiles and Config.ins (it even would be nice if you could use

I did...
Now it is a generalized framework allowing anyone to add 
a prepatched framework by setting the VENDOR_* stuff.

In target/device you select which vendor. Obviously only Atmel available now
but others can be added.
For most architecture, there is already support in the gcc toolchain
so using a prepatched toolchain is not a good idea.
When AVR32 will get merged, then I think it is the time
to adopt the normal method.

> the default names; it would make searching through them much easier).

> There are ways to do that. the vendor can redifine nearly all vars in
> their own Makefiles; including default download-locations. And adding
> additional patches isn't that difficult too. See the Makefile.in in
> target/device/Atmel/avr32patches in my patch.

You have to consider visibility.
The target/device stuff is not included until *after* the toolchain has been read in
so you can't change the download location of gcc etc. as far as I understand.


Best Regards
Ulf Samuelsson
