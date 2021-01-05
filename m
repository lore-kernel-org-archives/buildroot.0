From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 5 Jan 2021 23:49:40 +0100
Subject: [Buildroot] Patch for linux-headers
In-Reply-To: <87czyj6p8i.fsf@dell.be.48ers.dk>
References: <20201217003006.GA343694@pevik> <87czyj6p8i.fsf@dell.be.48ers.dk>
Message-ID: <20210105224940.GA158146@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> >>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

>  > Hi,
>  > I wonder if it's allowed to add patch to add patch for linux-headers.
>  > There would have to be more versions for the patch (due headers being built for
>  > more versions). I'd like to use my upstreamed patch [1] which fixes
>  > "redefinition of struct sysinfo" build failure on MUSL.
>  > This so far required to patch affected packages or simply disable them
>  > (depends on !BR2_TOOLCHAIN_USES_MUSL).

>  > Actually, much simpler patch from Khem Raj could be used [2].

> It can be done if needed, but it is naturally easier to handle
> without.
Understand. More versions and kernel checking would be needed.
I implemented it, but IMHO it'd have to also require Buildroot toolchain
rebuild.

> I noticed that you got some patches applied to the stable
> kernels related to this recently - Do those fix the issues, or is an
> additional patch needed?
Yes, it fixes the issue. Thus no patching is needed.

I didn't expect the fix would be accepted in stable,
but it has been accepted (in the end it's a fix).

OK, we need to wait till kernel stable releases, update kernel versions in
Buildroot. But IMHO it still requires Buildroot toolchain rebuild. Or am I wrong?

BTW I'm waiting for it for iproute2 upgrade (originally [1] and [2], now [3]).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200818183832.7947-2-petr.vorel at gmail.com/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20200903155728.19448-2-petr.vorel at gmail.com/
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20201104171416.1062-1-petr.vorel at gmail.com/
