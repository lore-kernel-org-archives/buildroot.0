From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 7 Jan 2021 02:23:42 +0100
Subject: [Buildroot] Patch for linux-headers
In-Reply-To: <87czyj3rv8.fsf@dell.be.48ers.dk>
References: <20201217003006.GA343694@pevik> <87czyj6p8i.fsf@dell.be.48ers.dk>
 <20210105224940.GA158146@pevik> <87czyj3rv8.fsf@dell.be.48ers.dk>
Message-ID: <20210107012342.GA98187@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> >>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

> Hi,

>  >> It can be done if needed, but it is naturally easier to handle
>  >> without.
>  > Understand. More versions and kernel checking would be needed.
>  > I implemented it, but IMHO it'd have to also require Buildroot toolchain
>  > rebuild.

> Indeed.
I backported it to all LTS and stable branches (except 5.9 which is EOL)
It has been released to some of them, for the rest the patch is in
stable-queue.git => will be released soon.

>  >> I noticed that you got some patches applied to the stable
>  >> kernels related to this recently - Do those fix the issues, or is an
>  >> additional patch needed?
>  > Yes, it fixes the issue. Thus no patching is needed.

> Ok, great!

>  > OK, we need to wait till kernel stable releases, update kernel versions in
>  > Buildroot. But IMHO it still requires Buildroot toolchain rebuild. Or am I wrong?

> Yes, the external toolchains will need to be rebuilt, but perhaps we can
> blacklist those in the autobuilders until the toolchains are all rebuilt.
Do you mean to disable MUSL based toolchains for affected packages?
I'm carrying patch for LTP, which is not going to be upstreamed.
Sure, I could drop this patch and add: depends on !BR2_TOOLCHAIN_USES_MUSL,
but I expect more packages affected by <linux/sysinfo.h> bug.

>  > BTW I'm waiting for it for iproute2 upgrade (originally [1] and [2], now [3]).

> Ahh, ok.
I've prepared package for v5.8.0 which was blocked by this, then v5.9.0.
There is already v5.10.0. I'm not sure what is better: allow BR2_TOOLCHAIN_USES_UCLIBC
to have iproute2, but block new features (we still have v5.7.0).

Kind regards,
Petr
