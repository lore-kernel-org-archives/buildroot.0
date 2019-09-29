From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 28 Sep 2019 22:22:15 -0300
Subject: [Buildroot] [PATCH v2] package/cups-filters: select bash
In-Reply-To: <20190928231044.7649d4a7@windsurf>
References: <20190924011542.12831-1-unixmania@gmail.com>
 <20190928231044.7649d4a7@windsurf>
Message-ID: <CAJ4jsac-jvRWTGQx-_EiZbhDcyLtFkgrFKCWhezbwfbbEaXawg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 28, 2019 at 6:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Mon, 23 Sep 2019 22:15:42 -0300
> unixmania at gmail.com wrote:
>
> > diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> > index 5badf0e1f1..bb54bc1d1b 100644
> > --- a/package/cups-filters/Config.in
> > +++ b/package/cups-filters/Config.in
> > @@ -8,6 +8,7 @@ config BR2_PACKAGE_CUPS_FILTERS
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> >       depends on BR2_PACKAGE_CUPS
> >       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> > +     select BR2_PACKAGE_BASH
>
> To select bash, you would have to replicate the:
>
>         depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>
> dependency of bash to cups-filters, which is a bit annoying, as it's
> off by default.
>
> Are the scripts that use #!/bin/bash really using bashims, or are they
> using #!/bin/bash but are in fact POSIX compliant ?

Yes, they are full of bashisms.

> Or could we install them only if bash is available ? Are they useful in
> all situations, or only in some specific cases.

I investigated a bit more and found that the bash scripts belong to
the Braille support, which cannot be enabled anyway, since it requires
liblouis (http://liblouis.org/) which is not available on Buildroot.

> I'm just trying to figure out what is the right solution for this.
> Perhaps ultimately the solution will be to select bash, with "depends
> on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS", but I'd like to explore the other
> possibilities.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

I will send a new patch disabling the Braille support.

-- 
Carlos Santos <unixmania@gmail.com>
