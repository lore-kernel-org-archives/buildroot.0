From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 May 2019 17:02:29 +0800
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <20190529103824.58560e4e@windsurf.home>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org>
 <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home>
 <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home>
Message-ID: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 29, 2019 at 4:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 16:12:25 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > Not just two patches: also a better commit log for the DSP -> VDSP
> > > change.
> >
> > I want these two patches:
> >
> > 1. Remove DSP, because it's no use in current buildroot.
> > 2. Add VDSP support
>
> OK, but then please split in yet another patch the fact of using
> arch.mk.csky to build the GCC_TARGET_CPU variable.

I changemind and I'll follow the above patches which you prior mentioned

- One switching to using arch.mk.sky, without changing DSP -> VDSP
- A follow-up one changing DSP -> VDSP, with a commit log that
   explains why you make this chang

>
> > Here is my commit log for Introduce VDSP feature:
> >
> > VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> > operation. It could be support by abiv2 (ck807, ck810, ck860).
> >
> > Is that OK?
>
> Yes. But please add a proper commit log in the patch removing the DSP
> option.
DSP -> VDSP, with a commit log, like this:

Subject: Change DSP to VDSP for -mcpu

DSP is no use in current buildroot and gcc default enable the DSP
feature for C-SKY.
So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.

VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
operation. It could be support by abiv2 (ck807, ck810, ck860).

Best Regards
 Guo Ren
