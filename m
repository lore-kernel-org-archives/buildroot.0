From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 17:32:22 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-common.in: update
 definition of BR2_TOOLCHAIN_HAS_GCC_BUG_64735 for GCC 7
In-Reply-To: <20170606140850.5823-1-joerg.krause@embedded.rocks>
References: <20170606140850.5823-1-joerg.krause@embedded.rocks>
Message-ID: <20170606173222.537500c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Jun 2017 16:08:50 +0200, J?rg Krause wrote:

> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index d670f44747..06986abdd2 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -13,10 +13,9 @@ comment "Toolchain Generic Options"
>  # ints before GCC 7
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  	bool
> -	default y if BR2_nios2
> -	default y if BR2_ARM_CPU_ARMV4
> -	default y if BR2_ARM_CPU_ARMV5
> -	default y if BR2_sparc_v8
> +	default y if (BR2_nios2 || BR2_ARM_CPU_ARMV4 || \
> +		BR2_ARM_CPU_ARMV5 || BR2_sparc_v8) && \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7

This feels very complicated. What about just:

	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
