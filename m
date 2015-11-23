From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:22:52 +0100
Subject: [Buildroot] [PATCH 0/51] legal-info: unassorted improvements
 and fixes (branch yem/legal)
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <20151123212252.5ec59f4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Nov 2015 15:48:16 +0100, Yann E. MORIN wrote:

> The series is not completely 'logically' organised, but rather tells a
> story, that of how I got side-tracked from just wanting to save the
> patches alongside the sources, up to when I eventually cleaned up the
> handling of the Xtensa overlay, after reogarnising the gcc packages and
> defining their licensing terms. It was prompted by a discussion we had
> with Luca during the last DevDays in Dublin, when we talked about the
> need to save the patches as well as the source archives.

Can you summarize what is the motivation for saving the patches as well
as the source archives ?

> Patches 10-17 actually implement saving the patches alongside the
> sources. Even though we suggest users to provide their Buildroot tree to
> be compliant, this is by far incpomplete, because not all patches may be
> there (patches can be downloaded or can be in a global patch dir):

I would have assumed patches in a global patch dir should be taken care
of by users. But indeed, if patches expressed via <pkg>_PATCH are not
copied, this is wrong.

However, files mentioned in <pkg>_EXTRA_DOWNLOADS should also be copied
to the legal-info output.

There is possibly one reason why distributing the entire Buildroot may
be problematic. If you distribute the entire Buildroot, it means you
are distributing code (in the form of patches) for a large number of
packages, many of which you are most likely not using in your actual
product. However, the simple fact of distributing patches to (L)GPLv3
code has some implication in terms of patents licensing, which
companies may not like. Therefore, distributing Buildroot completely
may not necessarily be acceptable for certain companies. Do we have a
way around that ?

> Patches 18-27 re-organise the gcc packages. The ultimate goal is to be
> able to save the legal-info for both the host and target variants. For
> that, we want to introduce a target gcc variant (which would not install
> a native compiler) to define the licensing terms. That has not been done
> in this series, for two reasons: first, the series is already very long;
> second, that target package needs some mor ere-organising in the gcc
> infra. Otherwise:
>   - the gcc common definitions ar emoved to gcc-common,
>   - gcc-initial remains as-is,
>   - gcc-final is renamed to just 'gcc',
>   - licensing information is added to gcc (the final one),
>   - the custom patch command is dropped, to use the generic patch infra,
>     so symlinks to patch directories are added to gcc-initial and
>     gcc (-final).

I am wondering why this is part of the same series really. It should be
a completely separated matter IMO.

> Starting from there, the series diverges from its original intent, but
> is a logical/historical followup because I noticed the Xtensa overlay
> handling was really a mess.

Ditto, why isn't that a separate patch series?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
