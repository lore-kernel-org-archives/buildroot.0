From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Tue, 07 Aug 2007 07:47:06 +0200
Subject: [Buildroot] [Patch] internal toolchain for avr32
In-Reply-To: <03aa01c7d86f$41c7c890$dcc4af0a@atmel.com>
References: <20070806083229.GB4699@firebird.dresden.micronet24.de>
	<20070806201256.GA7043@firebird.dresden.micronet24.de>
	<03aa01c7d86f$41c7c890$dcc4af0a@atmel.com>
Message-ID: <1186465626.17687.8.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-08-06 at 22:58 +0200, Ulf Samuelsson wrote:
> > Since my revision wasn't the latest, I didn't got the nice mud ulf
> > created with his vendor-supplied toolchain. I'm sorry.
> > 
> > attached a patch that revert that misconfiguration.
> > 
> > @Ulf: Not everybody is happy about a vendor-supplied toolchain! So at
> > least give everybody the chance to decide whether to use it or not.
> 
> I am not happy about doubling the size of buildroot just because
> the "configure" files are patched by the avr32 patches.
> That is why I did it this way.
> I believe that the buildroot stuff will be downloaded many times
> and the toolchain only once.
> If there are modifications later, then they will most likely be patches
> against the prepatched toolset.

You do not double the size of buildroot, you add roughly 600 kB to the
compressed size.

> > It would help even more, if Atmel would give external developers access
> > to their patches; those from avr32linux.org becoming older more and more
> > whilest pointing to download everything in ONE packet from Atmel. Thats
> > a really big download...
> 
> Download the stuff from buildroot and diff against vanilla + buildroot patches and you have it.
> If you have a slow line, then you can probably get access to a fast line somewhere else
> to download it once.

I do not really understand the crisis if buildroot grows a bit (until
patches are upstream, etc). My download folder is 350 MB, which is some
magnitudes larger than buildroot. The user will have to wait for all the
other source files to download anyway.

> While I work for Atmel, I am not in the AVR32 product line.
> The product line guys makes decisions what to publish, - I don't.

The patches on avr32linux.org for the toolchain should be the latest,
but they are actually quite some off. I will prod to see what the
intention about the patch pages are.

The problem with GCC and binutils is that the configure scripts have to
be regenerated, and thus producing an enormous diff :/

<cut>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
