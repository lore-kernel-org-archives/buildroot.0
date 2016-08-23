From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 00:03:45 +0200
Subject: [Buildroot] [PATCH 1/3] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <1471913603-21487-2-git-send-email-flatmax@flatmax.org>
References: <1471913603-21487-1-git-send-email-flatmax@flatmax.org>
 <1471913603-21487-2-git-send-email-flatmax@flatmax.org>
Message-ID: <20160824000345.264d6d2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 10:53:21 +1000, Matt Flax wrote:
> Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
> the toolchain to use cortex-a53 as the target. The effect is that various
> cortex-a53 tunings are enabled for the compilation of packages.
> 
> Signed-off-by: Matt Flax <flatmax@flatmax.org>

Thanks, but as I said, I don't want to duplicate definitions of 64 bits
ARM cores between Config.in.arm and Config.in.aarch64. So I've pushed
at
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=aarch64
a branch that does the necessary rework: it merges Config.in.aarch64
into Config.in.arm, does a few preparation steps, and finally adds your
commit on top of that. Could you have a look and let me know what you
think?

I haven't yet looked in detail at your PATCH 3/3 about the FPU support
for ARMv8. It's still a bit unclear to me what level of FPU support is
mandatory/optional in ARMv8, and whether we can just use
crypto-neon-fp-armv8 all the time, or whether we should allow using
fp-armv8, neon-fp-armv8 and crypto-neon-fp-armv8. Do you have some more
detailed information about which feature is mandatory/optional in the
various ARM64 cores?

Also, it is worth reminding that there are some ARMv8-A cores that are
32-bits only: the Cortex-A32 is one example. So ARMv8-A is not equal to
64 bits support.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
