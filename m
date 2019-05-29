From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 09:57:39 +0200
Subject: [Buildroot] [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org>
 <20190529092307.6c78996b@windsurf.home>
 <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
Message-ID: <20190529095739.18d4d3c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 15:30:14 +0800
Guo Ren <guoren@kernel.org> wrote:

> > What is abiv1 vs. abiv2 ? Also, in your next commit, abiv1 is
> > apparently used for ck610, but here this BR2_GCC_TARGET_FLOAT_ABI is
> > defined for all cases, which seems to contradict your commit log.  
> abiv1 contain: ck610
> abiv2 contain: ck807 ck810 ck860
> 
> Abiv1 is almost the same as mcore and it's ELF_CODE is 39
> Abiv2 is C-SKY own ISA and it's ELF_CODE is 252
> 
> We don't support FPU in abiv1, because its opcode width is only
> 16-bits and we don't want to continue developing it.

Ah, and indeed BR2_CSKY_FPU cannot be selected for BR2_ck610.

Please explain all of this in the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
