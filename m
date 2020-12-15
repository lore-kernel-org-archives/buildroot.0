From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 15 Dec 2020 11:06:22 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: Drop PPC601 support
In-Reply-To: <20201215081433.4254-1-michael@walle.cc>
References: <20201215081433.4254-1-michael@walle.cc>
Message-ID: <09b2f8e8-da8e-63d1-7b07-55a2d87280ad@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Le 15/12/2020 ? 09:14, Michael Walle a ?crit?:
> Linux support was removed in 5.10 [1]. Since no in-tree defconfig
> depends on it, just remove it.

Thanks for the patch.

I'm ok with this patch but I would like a feedback from maintainers because
PPC601 removal from the latest kernel doesn't mean that we have to remove it
from Buildroot immediately.
OTOH who is still using PPC601 in 2020 with the latest Buildroot ?
Also, since there was no kernel in-tree defconfig for this target I'm not sure
it worth the effort.

Best regards,
Romain

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc?id=f0ed73f3fa2cdca65973659689ec9e46d99a5f60
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  Config.in.legacy       | 6 ++++++
>  arch/Config.in.powerpc | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 6d8acadf9c..0b963cba3a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -160,6 +160,12 @@ config BR2_PACKAGE_IPSEC_TOOLS
>  	  This package has been removed as it has security issues and
>  	  has been abandoned since 2014.
>  
> +config BR2_powerpc_601
> +	bool "PowerPC 601 support removed"
> +	select BR2_LEGACY
> +	help
> +	  The support for the PowerPC 601 processors has been removed.
> +
>  comment "Legacy options removed in 2020.11"
>  
>  config BR2_PACKAGE_OPENCV
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 56c4b526ec..ba56c9c721 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -44,9 +44,6 @@ config BR2_powerpc_476fp
>  config BR2_powerpc_505
>  	bool "505"
>  	depends on !BR2_ARCH_IS_64
> -config BR2_powerpc_601
> -	bool "601"
> -	depends on !BR2_ARCH_IS_64
>  config BR2_powerpc_602
>  	bool "602"
>  	depends on !BR2_ARCH_IS_64
> @@ -176,7 +173,6 @@ config BR2_GCC_TARGET_CPU
>  	default "476"		if BR2_powerpc_476
>  	default "476fp"		if BR2_powerpc_476fp
>  	default "505"		if BR2_powerpc_505
> -	default "601"		if BR2_powerpc_601
>  	default "602"		if BR2_powerpc_602
>  	default "603"		if BR2_powerpc_603
>  	default "603e"		if BR2_powerpc_603e
> 
