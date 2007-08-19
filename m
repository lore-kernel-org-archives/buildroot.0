From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sun, 19 Aug 2007 15:56:59 +0100
Subject: [Buildroot] How to change kernel version
In-Reply-To: <1187535085.31921.5.camel@elrond.sweden.atmel.com>
References: <d6cda7730708190608i1b754e71r25dac548fd1c922@mail.gmail.com>
	<20070819152845.a2be6def.philippe.ney@tizoo.com>
	<1187535085.31921.5.camel@elrond.sweden.atmel.com>
Message-ID: <d6cda7730708190756y64362d58x28fffa6d014b182c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulf,

   Not yet, I'm still unable to find the right place.
    In target/device/Atmel/Makefile.in there is a
LINUX26_VERSION=$(LINUX_HEADERS_VERSION)  but my grep for that
variable doesn't seam to reveal anything usable *g*.

   I was planning on adding the patches from avr32linux.org into the
buildroot patches folder.

  There is also another problem with the vanilla buildroot, it tries
to download a version of uClibc from atmel ftp that doesn't exist
according to wget error, so I was about to try this on the atmel
snapshot of buildroot.

On 8/19/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> s?n 2007-08-19 klockan 15:28 +0200 skrev Philippe Ney:
> > > Hi,
> > >
> > >   I searched over the archives but I couldn't find anything about how
> > > one could change the kernel version. The only available option for
> > > AVR32, 2.6.22, is unable to boot on an STK1000 due to a bug in the MMC
> > > drivers, so I would like to change it to 2.6.18 which actually works.
> > >
> > > Kind Regards,
> > >    Thiago A. Correa
> >
> > Hi,
> >
> > Check the makefiles (Makefile.in, *.mk) to find which one define the linux
> > kernel you build. Its name should be linux.mk. And you can change the
> > kernel version directly in this file.
> >
>
> Did you try this?
> AFAIK, this will cause the build to fail.
> The kernel headers and the kernel have to be the same.
>
> The vanilla 2.6.18 does not have any support for AVR32.
> There are no AVR32 patches for 2.6.18 in buildroot.
>
> Will be much simpler to not set the linux option
> and build it outside.
>
>
> > Or if you want configuration options, modify the Config.in file related to
> > kernel choice for your platforme.
> >
> > Philippe
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
