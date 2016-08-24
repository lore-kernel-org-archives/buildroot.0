From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 24 Aug 2016 23:20:37 +0200
Subject: [Buildroot] [PATCH 1/3] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <dc3618df-52c5-c209-30a4-ea351fb2c49c@flatmax.org>
References: <1471913603-21487-1-git-send-email-flatmax@flatmax.org>
 <1471913603-21487-2-git-send-email-flatmax@flatmax.org>
 <20160824000345.264d6d2a@free-electrons.com>
 <dc3618df-52c5-c209-30a4-ea351fb2c49c@flatmax.org>
Message-ID: <20160824212037.GA2007@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,
Matt Flax wrote,

> On 24/08/16 08:03, Thomas Petazzoni wrote:
> >Hello,
> >
> >On Tue, 23 Aug 2016 10:53:21 +1000, Matt Flax wrote:
> >>Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
> >>the toolchain to use cortex-a53 as the target. The effect is that various
> >>cortex-a53 tunings are enabled for the compilation of packages.
> >>
> >>Signed-off-by: Matt Flax <flatmax@flatmax.org>
> >Thanks, but as I said, I don't want to duplicate definitions of 64 bits
> >ARM cores between Config.in.arm and Config.in.aarch64. So I've pushed
> >at
> >http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=aarch64
> >a branch that does the necessary rework: it merges Config.in.aarch64
> >into Config.in.arm, does a few preparation steps, and finally adds your
> >commit on top of that. Could you have a look and let me know what you
> >think?
> Looks good. One thing though, my original Cortex-A53 patch selected VFPV4
> which is now incorrect,
> that should be removed ... however that wouldn't enable any HF settings ...
> Also I don't understand why we need "select BR2_ARCH_HAS_MMU_OPTIONAL" but
> as I mentioned,
> uclibc doesn't compile cleanly without it ... seems like a deep rooted
> problem.

Can you provide a simple .config for this failure?
I use uClibc-ng on rpi3 with cortex-A53 optimization and fixed a
problem some releases ago. 
So I am wondering what kind of problem you have.

best regards
 Waldemar
