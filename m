From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:19:17 +0200
Subject: [Buildroot] [PATCH] arch: drop now useless support for FDPIC
In-Reply-To: <20180521161706.3151-1-yann.morin.1998@free.fr>
References: <20180521161706.3151-1-yann.morin.1998@free.fr>
Message-ID: <20180701151917.1d1b72bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 18:17:06 +0200, Yann E. MORIN wrote:
> Now that we dropped support for blackfin, we no longer have any
> architecture that supports FDPIC, so BR2_ARCH_HAS_FDPIC_SUPPORT
> is never selected, so we can't select BR2_BINFMT_FDPIC.
> 
> Drop all of that now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in           | 14 --------------
>  package/uclibc/uclibc.mk |  8 --------
>  2 files changed, 22 deletions(-)

Applied to master, thanks. We can indeed revert this commit when/if we
bring back FDPIC support for another architecture in the future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
