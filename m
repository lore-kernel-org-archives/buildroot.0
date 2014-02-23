From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 18:42:21 +0100
Subject: [Buildroot] [PATCH] package/rt-tests: fix Kconfig syntax
In-Reply-To: <1393176587-27407-1-git-send-email-yann.morin.1998@free.fr>
References: <1393176587-27407-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140223184221.2649dcb1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 23 Feb 2014 18:29:47 +0100, Yann E. MORIN wrote:

> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index ff4284e..605635c 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -6,8 +6,8 @@ config BR2_PACKAGE_RT_TESTS
>  	# no NPTL for these archs
>  	depends on !BR2_avr32 && !BR2_xtensa && !BR2_arc && !BR2_bfin
>  	# no _tid field in 'struct sigevent'
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC if (BR2_mips || BR2_mipsel || \
> -		BR2_mips64 || BR2_mips64el)
> +	depends on ! ( BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
> +		BR2_mips64 || BR2_mips64el) )

I know it's nitpicking, but I must say I personally dislike these
spaces between !, parenthesis and the rest. I very much prefer:

	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_mips || BR2_mipsel || \
		BR2_mips64 || BR2_mips64el))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
