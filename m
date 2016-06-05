From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jun 2016 00:00:21 +0200
Subject: [Buildroot] [PATCH] uclibc: the internal toolchain only uses
 uClibc-ng
In-Reply-To: <20160604205347.GA13841@waldemar-brodkorb.de>
References: <20160604205347.GA13841@waldemar-brodkorb.de>
Message-ID: <20160605220021.GD3832@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2016-06-04 22:53 +0200, Waldemar Brodkorb spake thusly:
> Point to the right website and tell the user the right name.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-buildroot/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 2b0ebc1..0cf632f 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -27,7 +27,7 @@ choice
>  		|| BR2_microblaze || BR2_powerpc64
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> -	bool "uClibc"
> +	bool "uClibc-ng"
>  	select BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
>  		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
> @@ -37,10 +37,10 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	# Unsupported for MIPS R6
>  	depends on !BR2_mips_32r6 && !BR2_mips_64r6
>  	help
> -	  This option selects uClibc as the C library for the
> +	  This option selects uClibc-ng as the C library for the
>  	  cross-compilation toolchain.
>  
> -	  http://uclibc.org
> +	  http://uclibc-ng.org
>  
>  config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	bool "glibc"
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
