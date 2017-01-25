From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 25 Jan 2017 10:24:59 +0100
Subject: [Buildroot] [PATCH] tslib: needs kernel headers 3.12
In-Reply-To: <87r33xsv2y.fsf@dell.be.48ers.dk>
References: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
 <20170120112630.557f297d@free-electrons.com>
 <20170120033551.4cpamcz63irneymp@tarshish> <87r33xsv2y.fsf@dell.be.48ers.dk>
Message-ID: <aca25d05-0dd2-cb1c-87bf-4475e18991e4@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-01-20 14:46, Peter Korsgaard wrote:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
> Hi,
> 
>  >> Isn't this a bit annoying for people using tslib on kernel olders than
>  >> 3.12 ? Isn't there a simpler patch to tslib to avoid depending on
>  >> headers >= 3.12 ?
> 
>  > The present build failure seems to be easy to fix by skipping the ts_uinput 
>  > tool on pre 3.12 kernels. But since upstream explicitly states that 3.12 is 
>  > the oldest supported kernel (see commit message link) we are on our own here.
> 
> I had the same idea originally, but as it isn't completely nontrivial to
> disable the new code and against the wishes of upstream I decided to
> leave that work for people needing it on pre-3.12 kernels.
> 
> With that said, if upstream isn't interested in integrating such a patch
> then it isn't really nice having to carry it in Buildroot either.
> 

I (as the upstream maintainer) would happily take a patch that brings
back support for old kernels. plugins/input-raw and tools/ts_uinput
should be affected as they use multitouch.

Simply properly disabling them during configure would be an acceptable
first step to have as a requirement for old kernels.

A github pull request or a patch here would be equally fine with me and
I'd be happy to have it in version 1.4.
