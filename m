From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 21:05:57 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/liburcu: introduce
 BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS symbol
In-Reply-To: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
References: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151213200557.GA27971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-12-13 19:47 +0100, Samuel Martin spake thusly:
> This new hidden symbol will allow simplifying the architecture dependencies
> on package that depends on liburcu. These packages will be updated in follow-up
> patches.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1->v2:
> - new patch
> ---
>  package/liburcu/Config.in | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
> index a4e8dc8..36d5353 100644
> --- a/package/liburcu/Config.in
> +++ b/package/liburcu/Config.in
> @@ -1,6 +1,11 @@
> +config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> +	bool
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	default y
> +
>  config BR2_PACKAGE_LIBURCU
>  	bool "liburcu"
> -	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
> @@ -18,7 +23,7 @@ config BR2_PACKAGE_LIBURCU
>  	  http://lttng.org/urcu
>  
>  comment "liburcu needs a toolchain w/ threads"
> -	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  
> -- 
> 2.6.4
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
