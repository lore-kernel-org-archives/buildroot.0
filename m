From: Jens Kleintje <Scooby22@web.de>
Date: Mon, 11 Nov 2019 14:48:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
In-Reply-To: <20191111141609.757023f1@windsurf>
References: <20191106155611.31575-1-scooby22@web.de>
 <20191106155611.31575-2-scooby22@web.de> <20191106230831.0a4017c6@windsurf>
 <trinity-e5303488-a97e-46bb-8738-520846b1c6db-1573110060239@3c-app-webde-bap18>
 <trinity-5b74f91d-c30f-42b7-9c54-1a49e1f58aee-1573467571744@3c-app-webde-bs25>
 <20191111141609.757023f1@windsurf>
Message-ID: <trinity-d44d2103-0290-4df8-bdc8-499800075a5c-1573480088102@3c-app-webde-bs25>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Gesendet: Montag, 11. November 2019 um 14:16 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> An: "Jens Kleintje" <Scooby22@web.de>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
>
> Hello Jens,
>
> On Mon, 11 Nov 2019 11:19:31 +0100
> "Jens Kleintje" <Scooby22@web.de> wrote:
>
> > > Please use the "github" helper macro:
> >
> > > GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
> > > GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
> >
> > > and remove the _SITE_METHOD variable.
> > The page (https://github.com/STMicroelectronics/gcnano-binaries)
> > has no release and no tag. So I think there is no archive directory.
>
> Not a problem, the github macro works with any arbitrary commit.
The problem is, that I get everytime the HEAD and not the commit with SHA c01642ed5e18cf09ecd905af193e935cb3be95ed.
Today I got the commit with SHA 271f87d816a957bf196f6328c34110cab1224d4d.
Did I miss something?
>
> > > > + rm -f $(STAGING_DIR)/usr/lib/pkgconfig/wayland-egl.pc
> >
> > > Why are you removing this .pc file ?
> > The file is already provided by wayland package.
> > I saw it from in the yocto package
> > https://github.com/STMicroelectronics/meta-st-stm32mp/blob/thud/recipes-graphics/gcnano-userland/gcnano-userland-binary.inc
>
> Then, if you could add a comment in the .mk file about this, it would
> be good.
>
> > > Could you rework your patch to take into account those comments ?
> > Will come soon.
>
> Great, thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
