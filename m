From: Robert Schwebel <r.schwebel@pengutronix.de>
Date: Tue, 25 Oct 2011 08:34:44 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <87vcrdy5g4.fsf@macbook.be.48ers.dk>
References: <20111024173815.2277c6dd@skate>
 <20111024165904.GB9199@pengutronix.de>
 <20111024214747.279c6e72@skate> <4EA5C53B.5000406@eukrea.com>
 <87vcrdy5g4.fsf@macbook.be.48ers.dk>
Message-ID: <20111025063444.GI9199@pengutronix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 25, 2011 at 08:02:19AM +0200, Peter Korsgaard wrote:
> Yes, I'm using buildbot at work for the defconfigs we use, and it
> works very well - But the problem is how to get good test coverage of
> our 700+ package / toolchain / kernel combinations?
> 
> What I'm currently doing is simply lots of 'make randpackageconfig'
> builds - But it generates lots of data, so I haven't found a good way
> of putting this information online.

When we started with tests, we quickly found out that you don't only
have to be able to test, but also have to cope with what you'll find :)
So if you find lots of broken things, you have to fix them, and that
quickly becomes a lot of work.

So our current strategy is to have a set of "real-life" configs
(customer BSPs), plus corner cases (a config with all-yes). We build
that for the most important platforms (x86/powerpc/arm) and on the
kernels which have most relevance for us (linus-git, linux-next) on a
nightly base. That doesn't cover everything, but seems to be a good
compromise.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
