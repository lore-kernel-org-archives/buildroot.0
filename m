From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Dec 2017 07:45:10 +0200
Subject: [Buildroot] [PATCH v3 2/4] binaries-marvell: new package
In-Reply-To: <20171203230313.2cde5811@windsurf.home>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-3-geomatsi@gmail.com>
 <20171203230313.2cde5811@windsurf.home>
Message-ID: <20171204054510.oui3vvag34655pka@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 03, 2017 at 11:03:13PM +0100, Thomas Petazzoni wrote:
> On Sun,  3 Dec 2017 21:18:16 +0300, Sergey Matyukevich wrote: 
> > diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
> > new file mode 100644
> > index 0000000000..7bb5071aed
> > --- /dev/null
> > +++ b/boot/binaries-marvell/binaries-marvell.mk
> > @@ -0,0 +1,19 @@
> > +################################################################################
> > +#
> > +# Marvell Armada SCP_BL2 firmware images
> > +#
> > +################################################################################
> > +
> > +BINARIES_MARVELL_VERSION = 0dabe23b956420b0928d337d635f0cd5646c33d0
> > +BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
> > +BINARIES_MARVELL_LICENSE = PROPRIETARY
> > +BINARIES_MARVELL_REDISTRIBUTE = NO
> 
> Well, if you can't distribute it... it's a bit problematic no?
> 
> In fact, there is a license on the master branch, i.e at
> https://raw.githubusercontent.com/MarvellEmbeddedProcessors/binaries-marvell/master/README.md.
> And to me, this is GPL-2.0 with the FreeRTOS exception, so I've changed
> the BINARIES_MARVELL_LICENSE variable to that, and dropped
> BINARIES_MARVELL_REDISTRIBUTE. Let me know what you think.

IANAL, but as this text does not appear in the branch we are using, this might 
indicate that it does not apply there. Moreover, the text in README.md refers 
to sources that we do not have. AFAICS, it says nothing about the binaries 
license, and there is no indication that the binaries were generated from GPL 
code.

I believe that this is just an oversight of Marvell, but having an explicit 
assurance would be better.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
