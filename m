From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:41:48 +0100
Subject: [Buildroot] [PATCH 3/3] arch/mips: add (Marvell) Octeon III
 processor
In-Reply-To: <20190130212938.11cdb74b@windsurf>
References: <20190130201224.6555-1-patrickdepinguin@gmail.com>
 <20190130201224.6555-3-patrickdepinguin@gmail.com>
 <20190130212938.11cdb74b@windsurf>
Message-ID: <CAAXf6LV9Ebrn4kzwszd0WDji8P-dy0OUK1nVqEvEF9CF9kh0hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 30 ene. 2019 a las 21:29, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello Thomas,
>
> On Wed, 30 Jan 2019 21:12:24 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > @@ -156,6 +163,7 @@ endchoice
> >  config BR2_MIPS_SOFT_FLOAT
> >       bool "Use soft-float"
> >       default y
>
> Not related directly to your patch, but MIPS related anyway: does it
> make sense to default to soft-float ?
>
> Wouldn't it better to have, like on ARM, an indication of which MIPS
> cores support hardware floating point, and for those, default to using
> hardware floating point ?

I don't know the reason why it was done this way. Perhaps historically
most MIPS had no floating-point unit?
Or maybe because originally there were only 'generic' variants
described, like 'mips32r2' for which it is not defined if there is a
floating-point unit in the actual SoC implementation.

In any case, the strategy you describe sounds more 'neutral'.
But it requires investigating whether or not the existing processors
definitely/maybe/never have an FPU.

/Thomas
