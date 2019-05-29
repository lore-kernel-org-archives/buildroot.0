From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 11:23:17 +0200
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org>
 <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home>
 <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home>
 <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
Message-ID: <20190529112317.08fe1013@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 17:02:29 +0800
Guo Ren <guoren@kernel.org> wrote:

> DSP is no use in current buildroot and gcc default enable the DSP
> feature for C-SKY.
> So DSP is part of our standard ISA, we needn't put it in -mcpu=xxx.

"DSP is no use in current Buildroot" is not correct. The option exists,
and it changes the BR2_GCC_TARGET_CPU value. So it *is* used: it adds
"e" to BR2_GCC_TARGET_CPU. So this explanation is not really
good/sufficient.

I am willing to help you formulate this properly, but since I still
don't understand why you are dropping the DSP option, I can't really
help by proposing a better wording.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
