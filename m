From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 08:55:38 +0200
Subject: [Buildroot] [PATCH] bfin: default to bf532,
 disable bf6xx for internal toolchain
In-Reply-To: <20160706055113.GA25276@waldemar-brodkorb.de>
References: <20160706055113.GA25276@waldemar-brodkorb.de>
Message-ID: <20160706085538.5ece24f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 07:51:13 +0200, Waldemar Brodkorb wrote:

> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
> index 415fc89..9ffdb94 100644
> --- a/arch/Config.in.bfin
> +++ b/arch/Config.in.bfin
> @@ -1,17 +1,21 @@
>  choice
>  	prompt "Target CPU"
>  	depends on BR2_bfin
> -	default BR2_bf609
> +	default BR2_bf532
>  	help
>  	  Specify target CPU
>  config BR2_bf606
>  	bool "bf606"
> +	depends on BR2_TOOLCHAIN_EXTERNAL
>  config BR2_bf607
>  	bool "bf607"
> +	depends on BR2_TOOLCHAIN_EXTERNAL
>  config BR2_bf608
>  	bool "bf608"
> +	depends on BR2_TOOLCHAIN_EXTERNAL
>  config BR2_bf609
>  	bool "bf609"
> +	depends on BR2_TOOLCHAIN_EXTERNAL

No, we want the dependency the other way around. Since the user selects
first the Target Architecture, and then the toolchain, it is a lot more
logical to not show the internal toolchain backend when the selected
Blackfin core is not supported by the internal backend.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
