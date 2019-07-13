From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jul 2019 23:51:53 +0200
Subject: [Buildroot] [PATCH v4 14/15] arch/arm: add two new
 non-cortex-based armv8.2a cores
In-Reply-To: <2c02775a-4ccd-88f7-1306-71940e794e0b@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-15-giulio.benetti@micronovasrl.com>
 <2c02775a-4ccd-88f7-1306-71940e794e0b@mind.be>
Message-ID: <20190713215153.GH2680@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-07-13 23:22 +0200, Arnout Vandecappelle spake thusly:
> On 20/06/2019 12:07, Giulio Benetti wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> > +config BR2_tsv110
> > +	bool "tsv110"
> > +	depends on BR2_ARCH_IS_64
> > +	select BR2_ARM_CPU_HAS_FP_ARMV8
> > +	select BR2_ARM_CPU_ARMV8A
> > +	select BR2_ARCH_HAS_MMU_OPTIONAL
>  Somewhat unrelated to this patch, but: is this really correct? I thought the
> MMU was mandatory on 64-bit ARM. At least, the kernel forces MMU on for arm64.

TBH, I don't know. I stupidly replicated the settings from the other
existing AArch64 cores we already had in the list.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
