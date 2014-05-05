From: Mike Zick <minimod@morethan.org>
Date: Mon, 5 May 2014 03:33:09 -0500
Subject: [Buildroot] [PATCH] czmq: needs MMU
In-Reply-To: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
References: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
Message-ID: <20140505033309.1dfc5aa8@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 May 2014 06:58:03 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

>  config BR2_PACKAGE_CZMQ
>  	bool "czmq"
>  	select BR2_PACKAGE_ZEROMQ
> +	depends on BR2_USE_MMU # fork()

  ^ ^ ^ ^
>  	depends on BR2_INSTALL_LIBSTDCPP # zeromq
>  	depends on BR2_INET_IPV6 # zeromq
>  	depends on BR2_LARGEFILE # util-linux
>  	depends on BR2_USE_WCHAR # util-linux
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> -	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
> -	# support
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> && \
> -		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
>  	help
>  	  High-level C Binding for 0MQ
>  
>  	  http://czmq.zeromq.org/
>  
>  comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar,
> threads"
> -	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> && \
> -		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
> +	depends on BR2_USE_MMU

  ^ ^ ^ ^
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
> BR2_LARGEFILE \ && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
>

Shouldn't the option and the comment have opposite conditions?
I.E: Either display the option or the comment?

Mike
