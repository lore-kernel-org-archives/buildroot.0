From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 8 Apr 2021 21:45:15 +0300
Subject: [Buildroot] [PATCH 1/1] package/uftrace: new package
In-Reply-To: <20210404120713.42dc0952@windsurf.home>
References: <20210403191609.1168606-1-asafka7@gmail.com>
 <20210404090338.GD2252@scaer>
 <20210404120713.42dc0952@windsurf.home>
Message-ID: <CALFsTFUmoDJA5TEX=HUCVoMgCeUZOmLr9h+0PdJGAsjdHPSD4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Sun, Apr 4, 2021 at 1:07 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> (In addition to Yann comments)
>
> On Sun, 4 Apr 2021 11:03:38 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > > +UFTRACE_LICENSE = GPL-2.0
> > > +UFTRACE_LICENSE_FILES = COPYING
> > > +
> > > +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> > > +UFTRACE_DEPENDENCIES += elfutils
> > > +endif
>
> This optional dependency is a bit odd. How does the uftrace build
> system detects the availability of elfutils? You're not passing any
> specific option when elfutils is available or not available.

uftrace does it strangely - it has a bunch of C files that check if a
possible extension exists.
Those test files are compiled anyway, or at least uftrace tries to
compile them and ignore the error in case of a failure.
After that, it checks if an executable with a specific name was
created. If yes, it adds the dependency.
So there's no flag that enables this dependency, it just has to be
installed and uftrace will try to add it.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf
