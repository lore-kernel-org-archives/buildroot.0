From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 09:21:28 +0200
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <1559114328-23357-2-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org>
Message-ID: <20190529092128.36183371@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

Thanks for this new iteration. I apologize, but unfortunately it's
still not good, and doesn't match the suggestions I did.

On Wed, 29 May 2019 15:18:39 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Use VDSP enhanced instructions Co-processor instead of DSP.

Your commit log should explain why.

> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  arch/Config.in.csky | 17 +++--------------
>  arch/arch.mk.csky   | 24 ++++++++++++++++++++++++

The change to using arch.mk.csky should be done separately. So this
commit should be split into two:

 - One switching to using arch.mk.sky, without changing DSP -> VDSP

 - A follow-up one changing DSP -> VDSP, with a commit log that
   explains why you make this chang

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
