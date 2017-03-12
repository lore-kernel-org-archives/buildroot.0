From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 12 Mar 2017 13:14:04 +0100
Subject: [Buildroot] [PATCH] boost: add patch to fix test of FPE support
In-Reply-To: <20170312113117.6532fae5@free-electrons.com>
References: <20170311203337.31569-1-joerg.krause@embedded.rocks>
 <20170312113117.6532fae5@free-electrons.com>
Message-ID: <1489320844.14721.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2017-03-12 at 11:31 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 11 Mar 2017 21:33:37 +0100, J?rg Krause wrote:
> > We recently bumped boost from version 1.61.0 to 1.63.0.
> > 
> > Upstream has updated the handling of FPE support in 1.63.0
> > resulting in build
> > errors for some architectures, like SH4 and OpenRISC, which were
> > build
> > successfully with 1.61.0.
> 
> Sorry, I'm only seeing this patch now. I reverted the 1.63.0 bump of
> Boost just a few minutes ago.

All build errors from the autobuilders are related to the issue covered
by the patch.

> So, could you cook a new patch that bumps boost, test it with the
> test-pkg utility (with all boost sub-options enabled), and if it
> succeeds, submit it?

I only enabled the boost-test module, as to many toolchains are skipped
otherwise. None has failed :-)

> Thanks a lot for your work. Bumping boost has never been very easy :-
> /

I'll resubmit the commit with the patch from upstream included.

J?rg
