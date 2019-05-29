From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 May 2019 16:53:29 +0800
Subject: [Buildroot] [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <20190529103930.35f88870@windsurf.home>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-4-git-send-email-guoren@kernel.org>
 <20190529092307.6c78996b@windsurf.home>
 <CAJF2gTSgReEOOJAvXY=MraqTLV4DwkKOqsbQ-4rBdNiaibxQfQ@mail.gmail.com>
 <20190529095739.18d4d3c8@windsurf.home>
 <CAJF2gTRb4W=ZUz4-WxPwzdaQMMo1suwPsxU47QeGdjfBvgs3og@mail.gmail.com>
 <20190529103930.35f88870@windsurf.home>
Message-ID: <CAJF2gTQtG+Az=GmKqJkZa0KSDXU=Q=Hp-UD+z92ixoN=X38L-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx,

On Wed, May 29, 2019 at 4:39 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> On Wed, 29 May 2019 16:30:43 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > OK, change the commit log with:
> >
> > C-SKY CPU is seperated into two ABIs:
> >  - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
> >  - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
> > 807, 810, 860)
> >
> > So we don't care BR2_GCC_TARGET_FLOAT_ABI for abiv1, because it based
> > on CSKY_FPU and it'll
> > never be selected by ck610.
>
> This last part is not correct: BR2_GCC_TARGET_FLOAT_ABI *will* have a
> value for abiv1. Except the value will always be "soft" because there's
> no FPU support in ck610, which is the only core using abiv1. So saying
> "We don't care about BR2_GCC_TARGET_FLOAT_ABI for abiv1" is not correct.
Yes, Approved and I'll change it like this:

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ELF_NUM:39 and do not support FPU & VDSP. (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP. (CPU:
807, 810, 860)

BR2_GCC_TARGET_FLOAT_ABI *will* have a value for abiv1. Except the
value will always be "soft"
because there's no FPU support in ck610, which is the only core using abiv1.

Best Regards
 Guo Ren
