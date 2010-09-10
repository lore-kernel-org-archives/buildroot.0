From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Fri, 10 Sep 2010 16:47:45 +0100
Subject: [Buildroot] [PATCH] Fix 'make source' when used with external
	toolchains
In-Reply-To: <1284132554.3193.288.camel@dubciaranr1.verifone.com>
References: <AB12B32E73474741A2C5361C433A44DE021912DD@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<1284129272.3193.279.camel@dubciaranr1.verifone.com>
	<AB12B32E73474741A2C5361C433A44DE0219146B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<1284132554.3193.288.camel@dubciaranr1.verifone.com>
Message-ID: <AB12B32E73474741A2C5361C433A44DE02191481@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > > I was about to send to the list for proposed solutions because I
> feared
> > > that just disabling the specific lines wasn't the right approach.
> >
> > It seemed like the simplest approach at the time!
> >
> Oh, I'm not doubting you.  Just that I wasn't sure of it myself. :-)

There are certainly a lot of makefile dependencies to root through :)


> > Unfortunately I'm not around for the next week so I can't check this. I
> also
> > don?t have a uclibc external toolchain...
> >
> I also only use glibc toolchain (CodeSourcery 2010q1) and that's what
> comes out in $(TARGETS_SOURCE): "uclibc-source".

Ah, I see now... the root Makefile does this:
BASE_TARGETS:=uclibc
so toolchain/uClibc/uclibc.mk is always pulled in.

The patch fixes the problem with a glibc external toolchain (also
CodeSourcery) and since uclibc.mk is always pulled in, I can't see this
being a problem.

Thanks
Phil
