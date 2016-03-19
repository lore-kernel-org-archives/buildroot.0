From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Mar 2016 14:59:46 +0100
Subject: [Buildroot] [PATCH v2 01/17] arch/arm: introduce and use
 BR2_ARM_CPU_ARMV7M
In-Reply-To: <20160319143333.69823e82@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160318223050.GB32171@free.fr>
 <20160319143333.69823e82@free-electrons.com>
Message-ID: <20160319135946.GA3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 14:33 +0100, Thomas Petazzoni spake thusly:
> On Fri, 18 Mar 2016 23:30:50 +0100, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2016-03-18 22:08 +0100, Thomas Petazzoni spake thusly:
> > > All ARM cores should select a BR2_ARM_CPU_* option. Currently, the
> > > cortex-m3 does not, which this commit fixes by introducing a
> > > BR2_ARM_CPU_ARMV7M option.
> > 
> > Tangentially related: those options are not user to sepcify iany of the
> > gcc options, but to allow packages that have CPU-specific code todepend
> > on it or to enable such support it.
> 
> Hum, yes. But I don't understand what I'm supposed to do with your
> comment?

You could fix my many typoes! ;-)

> Are you suggesting that a change is needed?

No, it's OK (hence ny acked-by). However, I had to do a bit of research
in the tree to see ehre such options were used, only to discover that
packages did use them, not the toolchain.

Those variables are specific to ARM, and we have no such counterparts in
any of the others archs. So maybe we could have a little comment at the
top of arch/Config/in.arm that explains what those kconfig variables are
for?

But really, not related to your patch...

Regards,
Yann E. MORIN.

> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > 
> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
