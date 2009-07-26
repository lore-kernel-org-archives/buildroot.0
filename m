From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 21:06:09 +0200
Subject: [Buildroot] [PATCH] Fix naming mismatch between directfb and
 kernel on "fusion" version numbers
In-Reply-To: <874oszshqp.fsf@macbook.be.48ers.dk>
References: <4A6BE6A8.9080400@atmel.com>
	<87k51vsxz0.fsf@macbook.be.48ers.dk>	<4A6C2534.3000503@atmel.com>
	<874oszshqp.fsf@macbook.be.48ers.dk>
Message-ID: <4A6CA921.7040807@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard skrev:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> But aren't those kernel modules part of directfb? If not, does
>  >> stuff actually work (not just build) if you workaround this
>  >> version incompatibility? Wouldn't it make more sense to fix where
>  >> the define is set in the first place? Have you sent this by the
>  >> directfb developers?
>  >> 
>  Ulf> As far as I see, the major/minor version numbers provided
>  Ulf> are the same as requested, but the naming is different.
> 
> OK, what driver / setup exactly? Isn't the problem just that we need
> to bump the linux-fusion package version?

The module is 8.0 and the requirement is 8.0
but since they use different defines it wont work.

It is really very simple

#define	A 8
#define B 8
#if A == B_PROVIDED
/* OK */
#else
#warning ""
#endif

The code should emit a warning if version A and B are not the same.
They are the same, but the warning will still occur,
since there is no definition of B_PROVIDED.

BR
Ulf Samuelsson
