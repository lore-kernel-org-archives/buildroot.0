From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 09:01:43 +0100
Subject: [Buildroot] [PATCH v3 2/4] binaries-marvell: new package
In-Reply-To: <20171204054510.oui3vvag34655pka@sapphire.tkos.co.il>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-3-geomatsi@gmail.com>
 <20171203230313.2cde5811@windsurf.home>
 <20171204054510.oui3vvag34655pka@sapphire.tkos.co.il>
Message-ID: <20171204090143.00298c53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 07:45:10 +0200, Baruch Siach wrote:

> > > +BINARIES_MARVELL_VERSION = 0dabe23b956420b0928d337d635f0cd5646c33d0
> > > +BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
> > > +BINARIES_MARVELL_LICENSE = PROPRIETARY
> > > +BINARIES_MARVELL_REDISTRIBUTE = NO  
> > 
> > Well, if you can't distribute it... it's a bit problematic no?
> > 
> > In fact, there is a license on the master branch, i.e at
> > https://raw.githubusercontent.com/MarvellEmbeddedProcessors/binaries-marvell/master/README.md.
> > And to me, this is GPL-2.0 with the FreeRTOS exception, so I've changed
> > the BINARIES_MARVELL_LICENSE variable to that, and dropped
> > BINARIES_MARVELL_REDISTRIBUTE. Let me know what you think.  
> 
> IANAL, but as this text does not appear in the branch we are using, this might 
> indicate that it does not apply there. Moreover, the text in README.md refers 
> to sources that we do not have. AFAICS, it says nothing about the binaries 
> license, and there is no indication that the binaries were generated from GPL 
> code.

True.

> I believe that this is just an oversight of Marvell, but having an explicit 
> assurance would be better.

Agreed. Perhaps in the mean time, what Sergey originally did is the
safest, i.e assuming is proprietary.

And in fact, my statement about <pkg>_REDISTRIBUTE = NO was incorrect.
In the context of Buildroot <pkg>_REDISTRIBUTE = NO does not mean that
you're not allowed to redistribute the software, it means that it
shouldn't be shipped as part of legal-info. But still, I don't see why
binaries-marvell shouldn't be listed as part of legal-info.

I'll go and ask Marvell about the license of those blobs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
