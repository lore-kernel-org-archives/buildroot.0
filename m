From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 21:15:27 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/lttng-tools: use
 BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS dependency
In-Reply-To: <1450032471-3405-3-git-send-email-s.martin49@gmail.com>
References: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
 <1450032471-3405-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20151213201527.GD27971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-12-13 19:47 +0100, Samuel Martin spake thusly:
> Using this newly introduced symbol lets to simplify the dependency code.
> 
> This change also adds the missing architecture dependencies on the second
> comment.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1-> v2:
> - new patch
> ---
>  package/lttng-tools/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
> index 4c5b5f6..599095d 100644
> --- a/package/lttng-tools/Config.in
> +++ b/package/lttng-tools/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	# liburcu only works on some architectures and requires thread support
> -	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>  	depends on BR2_USE_WCHAR # util-linux
> @@ -30,10 +30,11 @@ config BR2_PACKAGE_LTTNG_TOOLS
>  	  http://lttng.org
>  
>  comment "lttng-tools needs a toolchain w/ threads, wchar"
> -	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58595 # lttng-tools/gcc-4.{7,8}.x bug
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
>  
>  comment "lttng-tools needs a toolchain not affected by GCC bug 58854 and 58595"
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854 || BR2_TOOLCHAIN_HAS_GCC_BUG_58595
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
