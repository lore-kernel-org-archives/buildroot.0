From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Sep 2019 16:51:47 +0200
Subject: [Buildroot] Systemd default console
In-Reply-To: <CAJ4jsafoQPnGzdvHzn2c7LAZRbORVOhb7PinuSVEmw6_ZitWiQ@mail.gmail.com>
References: <CADYdroO1n5J9ssSmV=_TY=FDw4WriNuB_-M09UES3o-qkQtPuA@mail.gmail.com>
 <CAJ4jsafoQPnGzdvHzn2c7LAZRbORVOhb7PinuSVEmw6_ZitWiQ@mail.gmail.com>
Message-ID: <20190920165147.765ee765@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Sep 2019 11:47:08 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > -   busybox creates the link
> > /etc/systemd/system/getty.target.wants/console-getty.service, which
> > starts a getty on ttyS0
> > -   systemd itself create
> > /run/systemd/generator/getty.target.wants/serial-getty at ttyS0.service
> > automatically (no idea when and how)
> >
> > in and output is perfectly garbled until one of those services is killed.
> > Given that systemd automatically picks up the getty from the
> > commandline, is there any reason for busybox to setup /dev/console?  
> 
> Do not use BR2_TARGET_GENERIC_GETTY_PORT with systemd.

There's a whole bunch of logic at
https://git.buildroot.org/buildroot/tree/package/systemd/systemd.mk#n435
to do stuff depending on the value of BR2_TARGET_GENERIC_GETTY_PORT. So
it seems kind of odd to recommend to not use
BR2_TARGET_GENERIC_GETTY_PORT with systemd. Shouldn't we fix what's in
systemd.mk so that it works as expected ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
