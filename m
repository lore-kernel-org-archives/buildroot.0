From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Oct 2019 21:57:35 +0200
Subject: [Buildroot] [PATCH] package/jitterentropy-library: fix build
 failure due to missing -fPIC
In-Reply-To: <87d0ekiq8p.fsf@dell.be.48ers.dk>
References: <20191023110605.23836-1-giulio.benetti@benettiengineering.com>
 <831e0090-8e52-9c2c-6d06-4557d21fde79@mind.be>
 <8736fgkdas.fsf@dell.be.48ers.dk>
 <2f610d45-59a6-da96-b32e-ed1ff8c2dfbd@mind.be>
 <87d0ekiq8p.fsf@dell.be.48ers.dk>
Message-ID: <5cc9edf8-190b-b742-4986-e9b85d8531e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/10/2019 21:23, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> >  Hm, but maybe there are indeed good reasons to override the CFLAGS, because the
>  >> > fstack-protector-all requires support from the toolchain. On the other hand, we
>  >> > probably *do* want to keep the -O0 and -fwrapv flags...
>  >> 
>  >> The fstack-protector-* options should be handled by BR2_SSP_* and
>  >> hardcoded in the package. 
> 
>  >  If with "hardcoded in the package" you mean "set by the package's .mk file",
>  > then I disagree, since it is passed by the toolchain wrapper.
> 
> Sorry, there was a NOT missing, E.G. NOT hardcoded in .mk.

 Yes, that's what I meant to say: CFLAGS should be overridden because we *don't*
want the Makefile's stack-protector option, because the toolchain may not
support it.

 Regards,
 Arnout

> 
>  >> Why would we want to use -O0?
> 
>  >  The package description is "Hardware RNG based on CPU timing jitter." I expect
>  > that compiler optimisations mess with CPU timing jitter.
> 
> Ah yes, possibly.
> 
