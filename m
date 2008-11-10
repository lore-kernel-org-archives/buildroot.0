From: Nick.Thompson at infineon.com <Nick.Thompson@infineon.com>
Date: Mon, 10 Nov 2008 16:10:38 +0100
Subject: [Buildroot] bluez
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF32B2E75@bfl-exchange-1.BFL.local>
References: <c88e466f0811060612r70f1d4f7nec4376aca9414dbe@mail.gmail.com><20081106174340.208dc156@surf>
	<49142122.7020405@free.fr>
	<8CF9D79FB605004381900048F6005988032DDE4169@mucse405.eu.infineon.com>
	<49ED01FC03EE524BB7BB258E8F93BFF32B2E75@bfl-exchange-1.BFL.local>
Message-ID: <8CF9D79FB605004381900048F6005988032DFBE2B3@mucse405.eu.infineon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm preparing a patch for the bug system. The port is being tested by Michel Benoit. He is having a few problems building, that I want to see resolved before I submit the patch though.

This will be for BlueZ 3.36 however.

Nick.

> -----Original Message-----
> From: Matuschka, Sebastian [mailto:Sebastian.Matuschka at gcd-solutions.de]
> Sent: Monday, November 10, 2008 2:56 PM
> To: Thompson Nick (IFGB COM PS CE PLSA CA); julien.boibessot at free.fr;
> thomas.petazzoni at free-electrons.com
> Cc: buildroot at uclibc.org
> Subject: RE: [Buildroot] bluez
>
> I need bluez for a CSR BlueCore 4 too. It is connected to an Atmel AVR32.
> For me it would be nice to see bluez in Buildroot.
> I'm getting an error when trying to compile the gumstix version:
>    root/usr/lib/libbluetooth.so: cannot execute binary file
> Don't know what this means.
> I've added these update commands to bluez.mk so it accepts avr32:
> $(CONFIG_UPDATE) $(BLUEZ_LIBS_BUILD_DIR)
> $(CONFIG_UPDATE) $(BLUEZ_UTILS_BUILD_DIR)
> $(CONFIG_UPDATE) $(BLUEZ_HCIDUMP_BUILD_DIR)
>
> Regards
> Sebastian
>
> > -----Original Message-----
> > From: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org]
> > On Behalf Of Nick.Thompson at infineon.com
> > Sent: Friday, November 07, 2008 12:16 PM
> > To: julien.boibessot at free.fr; thomas.petazzoni at free-electrons.com
> > Cc: buildroot at uclibc.org
> > Subject: Re: [Buildroot] bluez
> >
> >
> >
> > > -----Original Message-----
> > > From: buildroot-bounces at uclibc.org [mailto:buildroot-
> bounces at uclibc.org]
> > > On Behalf Of Julien Boibessot
> > > Sent: Friday, November 07, 2008 11:06 AM
> > > To: Thomas Petazzoni
> > > Cc: buildroot at uclibc.org
> > > Subject: Re: [Buildroot] bluez
> > >
> > > Thomas Petazzoni a ?crit :
> > > > Anyway, adding support for bluez-libs and bluez-utils to buildroot
> > > > should be relatively simple, since they use the classical autotools.
> A
> > > > few lines of .mk and Config.in should do the basic things.
> > > >
> > > > Do you want to provide a patch for these ?
> > > >
> > > If it can help, Gumstix guys seem to already have done the job:
> > > http://www.daimi.au.dk/~spider/gumstix/gumstix-
> buildroot/package/bluez/
> >
> > Well I'll be damned - I just subscribed to the list 5 mins ago, to offer
> > up my work getting the 3.36 version of bluez added to buildroot. It
> seems
> > the gumstix guys have 2.24.
> >
> > 3.36 *requires* dbus (and therefore either expat or libxml), 2.24 does
> > not. The 2.x releases are no longer supported. 3.x is in maintenance
> mode.
> > 4.x is active (and also requires dbus), though they say 3.x is still the
> > most common.
> >
> > If you want me to submit my stuff, just let me know what format you
> would
> > like it in and where to send it - I am new here remember :)
> >
> > I've tested my builds on an ARM926-EJS with a CSR BlueCore4 BT device
> > using BCSP transport.
> >
> > Nick.
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
