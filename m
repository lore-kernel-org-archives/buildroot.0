From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 8 May 2018 19:36:31 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
In-Reply-To: <20180508153420.0c334f27@windsurf.home>
References: <20180505160530.GA1774@waldemar-brodkorb.de>
 <20180508153420.0c334f27@windsurf.home>
Message-ID: <20180508173631.GP31635@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Thanks Waldemar for fixing this issue. Some questions below, though.
> 
> On Sat, 5 May 2018 18:05:31 +0200, Waldemar Brodkorb wrote:
> > This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.
> > 
> > Latest uClibc-ng release supports the missing functions even for
> 
> What is "Latest" ? 1.0.30 ?

Yes, 1.0.30. Or do you know of any newer release? ;)
 
> In fact, it's not even in an uClibc-ng release I believe, it's fixed by
> 0002-librt-declare-clock_nanosleep-independent-of-thread-.patch, which
> will be part of 1.0.31. Is this correct ?

No. ZeroMQ introduced the usage of pthread_condattr_{s,g}etclock(),
which was added here 04a676f3c8d2443499f27612f69ee88e12089e61 for
Linuxthreads.
It compiled very well without the hotfix for clock_nanosleep
declaration added via
0002-librt-declare-clock_nanosleep-independent-of-thread-.patch.

best regards
 Waldemar
