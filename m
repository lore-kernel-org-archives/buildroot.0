From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 21:56:14 +0100
Subject: [Buildroot] add option to enable AI_ADDRCONFIG support
In-Reply-To: <20120315213337.448d1bfd@skate> (Thomas Petazzoni's message of
 "Thu, 15 Mar 2012 21:33:37 +0100")
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
 <20120308091714.5d60b715@skate> <87wr6q26x5.fsf@macbook.be.48ers.dk>
 <20120315213337.448d1bfd@skate>
Message-ID: <871uotshw1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I believe it's a fairly small impact, but the problem is external uClibc
 >> toolchains (made by BR, ct-NG or elsewhere) which most likely won't have
 >> AI_ADDRCONFIG enabled, so mrouted (and gupnp) will fail at build time.

 Thomas> Is it common to have AI_ADDRCONFIG disabled in external toolchains?
 Thomas> Notice that we have a similar problem with ltp-testsuite at the moment.

Hard to say, but the config option defaults to 'n' in uClibc - So
chances are that it is.

 Thomas> Do we really want to add one more toolchain option just for
 Thomas> this small feature? Sounds like a big hammer, no?

True, but it is the safest approach. I don't feel strongly about it
though - Anybody?

-- 
Bye, Peter Korsgaard
