From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Dec 2020 19:31:43 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: Drop PPC601 support
In-Reply-To: <20201215081433.4254-1-michael@walle.cc>
References: <20201215081433.4254-1-michael@walle.cc>
Message-ID: <20201215183143.GA3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-12-15 09:14 +0100, Michael Walle spake thusly:
> Linux support was removed in 5.10 [1]. Since no in-tree defconfig
> depends on it, just remove it.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc?id=f0ed73f3fa2cdca65973659689ec9e46d99a5f60
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to master, thanks.

I've just re-ordered the legacy entry: we usually add the new legacy
entries at the to of the list.

Thanks!

Regards,
Yann E. MORIN.

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
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
