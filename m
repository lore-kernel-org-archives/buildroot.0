From: Jorge S. <jorgesolla@gmail.com>
Date: Mon, 8 Oct 2007 20:40:01 +0200
Subject: [Buildroot] Fwd: Best buildroot options for a custom AT91RM9200
	board?
In-Reply-To: <6090c5eb0710081139n6d5766c2o72c5b6b425ef1a39@mail.gmail.com>
References: <6090c5eb0710080804n3f6d4f0bj42b0d31d24d01e9@mail.gmail.com>
	<01fe01c809d5$0d2d3650$d7033b0a@atmel.com>
	<6090c5eb0710081139n6d5766c2o72c5b6b425ef1a39@mail.gmail.com>
Message-ID: <6090c5eb0710081140x7dcb8643s2d2ecab1398c0733@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/10/8, Ulf Samuelsson <ulf@atmel.com>:
>
> ----- Original Message -----
> From: "Jorge S." <jorgesolla@gmail.com>
> To: <buildroot@uclibc.org>
> Sent: Monday, October 08, 2007 5:04 PM
> Subject: [Buildroot] Best buildroot options for a custom AT91RM9200 board?
>
>
> > Hi,
> >
> > I'm trying to create a root fs for a custom board wich is AT91rm9200
> based.
> > So i have several newbie (maybe dumb) questions.
> >
> > I've started with the svn version of buildroot and after dealing with
> lots
> > of "soft-float"/uCLibc problems i finally discovered that
> > there's a prebuilt setup from the Atmel people that seems to work.
> >
> > Since the AT91.com buildroot project section is broken, im unable to
> find
> > further documentation regarding this matter appart from some posts from
> Ulf
> > Samuelsson on this list.
> >
> > Can somebody tell me wich version is best for the AT91RM9200? I only see
> 2
> > options:
> >
> > 1) Last buildroot svn version
> > 2)
> > ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Buildroot/buildroot-20070116-RC2.tar.bz2
>
> >
> > Are there any other options?
> >
>
>
> ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Buildroot/Source/buildroot-atmel-2007-06-07.cpio.bz2
>
>
> svn should be OK if NWFPE is used, soft-float does not work with current
> setup.
> It worked 1-2 weeks ago for ARM integrator, but now this is broken as
> well.
> Don't know what happened.
>
> Best Regards
> Ulf Samuelsson




So can i assume that is OK to use the default toolchain (built using "make
at91rm9200df_defconfig") that comes with the "Use software floating point by
default" option disabled *ONLY* if i have a NWFPE enabled kernel? or should
i take another things into account?


Btw if you enable the "software floating point" it always fails while trying
to link uCLibc, googling around i saw somewhere that its a problem with the
binutils silently ignoring the "-soft-float" option.

Thanks for helping.

Jorge.


>
> >
> >
> > Thanks all for your time and sorry about my poor english.
> >
>
>
>
> --------------------------------------------------------------------------------
>
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071008/6f0e0a37/attachment-0001.htm 
