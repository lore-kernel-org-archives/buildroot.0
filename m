From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 11:43:16 +0200
Subject: [Buildroot] [PATCH] Fix naming mismatch between directfb and
 kernel on "fusion" version numbers
In-Reply-To: <87k51vsxz0.fsf@macbook.be.48ers.dk>
References: <4A6BE6A8.9080400@atmel.com> <87k51vsxz0.fsf@macbook.be.48ers.dk>
Message-ID: <4A6C2534.3000503@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard skrev:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>>>>>>             
>
>  Ulf> directfb expects FUSION_API_MAJOR_PROVIDED and FUSION_API_MINOR_REQUIRED
>  Ulf> At least some kernel versions provides FUSION_API_MAJOR and FUSION_API_MINOR
>  Ulf> Since the expected names are not defined, directfb will break with the
>  Ulf> error message:
>
>  Ulf> "../../../lib/fusion/types.h:42:2: error: #error Major version of Fusion
>  Ulf> Kernel Module too low! Upgrade your kernel."
>
>  Ulf> This patch will set XXX_PROVIDED from XXX.
>
> But aren't those kernel modules part of directfb? If not, does stuff
> actually work (not just build) if you workaround this version
> incompatibility? Wouldn't it make more sense to fix where the define
> is set in the first place? Have you sent this by the directfb
> developers?
>   
As far as I see, the major/minor version numbers provided
are the same as requested, but the naming is different.

BR
Ulf Samuelsson
