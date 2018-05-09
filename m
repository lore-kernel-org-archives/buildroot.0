From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 09:22:54 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
In-Reply-To: <20180508173631.GP31635@waldemar-brodkorb.de>
References: <20180505160530.GA1774@waldemar-brodkorb.de>
 <20180508153420.0c334f27@windsurf.home>
 <20180508173631.GP31635@waldemar-brodkorb.de>
Message-ID: <20180509092254.24a64713@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 May 2018 19:36:31 +0200, Waldemar Brodkorb wrote:

> > Thanks Waldemar for fixing this issue. Some questions below, though.
> > 
> > On Sat, 5 May 2018 18:05:31 +0200, Waldemar Brodkorb wrote:  
> > > This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.
> > > 
> > > Latest uClibc-ng release supports the missing functions even for  
> > 
> > What is "Latest" ? 1.0.30 ?  
> 
> Yes, 1.0.30. Or do you know of any newer release? ;)

No, but the problem with saying "Latest uClibc-ng release" in a commit
log is that it's not going to be very informative 6 months or 2 years
from now, when someone reads the commit log :-)

Saying "Since uClibc-ng 1.0.30, the missing functions are supported"
makes it very clear, and will remain useful in the future.

> > In fact, it's not even in an uClibc-ng release I believe, it's fixed by
> > 0002-librt-declare-clock_nanosleep-independent-of-thread-.patch, which
> > will be part of 1.0.31. Is this correct ?  
> 
> No. ZeroMQ introduced the usage of pthread_condattr_{s,g}etclock(),
> which was added here 04a676f3c8d2443499f27612f69ee88e12089e61 for
> Linuxthreads.
> It compiled very well without the hotfix for clock_nanosleep
> declaration added via
> 0002-librt-declare-clock_nanosleep-independent-of-thread-.patch.

OK, thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
