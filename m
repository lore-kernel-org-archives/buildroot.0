From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:08:15 +0100
Subject: [Buildroot] [PATCH v2 01/17] arch/arm: introduce and use
 BR2_ARM_CPU_ARMV7M
In-Reply-To: <20160319135946.GA3426@free.fr>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160318223050.GB32171@free.fr>
 <20160319143333.69823e82@free-electrons.com>
 <20160319135946.GA3426@free.fr>
Message-ID: <20160319150815.27170f54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 14:59:46 +0100, Yann E. MORIN wrote:

> > Are you suggesting that a change is needed?
> 
> No, it's OK (hence ny acked-by). However, I had to do a bit of research
> in the tree to see ehre such options were used, only to discover that
> packages did use them, not the toolchain.
> 
> Those variables are specific to ARM, and we have no such counterparts in
> any of the others archs. So maybe we could have a little comment at the
> top of arch/Config/in.arm that explains what those kconfig variables are
> for?

IIRC, we originally added them because some packages were doing
$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_aX)... to find out whether
we're on ARMv7 or not, and it was starting to be a bit annoying.

Or some others were doing similar things to say "I need ARMv5" at
least, etc.

But yes, they are only used by packages. For the toolchain build
process itself, only the BR2_cortex*, BR2_arm* options are useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
