From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 18:06:26 +0200
Subject: [Buildroot] [PATCH 13/14] package/uclibc: drop
 BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
In-Reply-To: <1428754662-27829-13-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-13-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412160626.GB19416@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> Kill the option to build the non-IPv6 variant and remove the hidden
> option since it's now unused.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/Config.in | 4 ----
>  package/uclibc/uclibc.mk | 4 ----
>  2 files changed, 8 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 5bd9098..4d464a6 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -86,10 +86,6 @@ config BR2_UCLIBC_CONFIG
>  	  See also docs/README in this package.
>  	  If unsure, use the default.
>  
> -config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
> -	bool
> -	default y
> -
>  config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
>  	bool "Enable RPC support"
>  	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 72a46d9..07ff8e5 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -212,11 +212,7 @@ endif
>  # IPv6
>  #
>  
> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
>  UCLIBC_IPV6_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_IPV6,$(@D)/.config)
> -else
> -UCLIBC_IPV6_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_IPV6,$(@D)/.config)
> -endif
>  
>  #
>  # RPC
> -- 
> 2.0.5
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
