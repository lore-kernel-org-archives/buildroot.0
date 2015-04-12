From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:08:50 +0200
Subject: [Buildroot] [PATCH 02/14] package/uclibc: default to Y for IPv6
In-Reply-To: <1428754662-27829-2-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412140850.GD21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> This will allow us to remove IPv6 handling in the tree without breaking
> things while doing so.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/uclibc/Config.in | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index fdf8351..5bd9098 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -87,11 +87,8 @@ config BR2_UCLIBC_CONFIG
>  	  If unsure, use the default.
>  
>  config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
> -	bool "Enable IPv6 support"
> -	select BR2_INET_IPV6

You should keep the 'select' until is really is gone.

Otherwise, it means uClibc has IPv6 support, but IPv6-dependent packages
are not selectable, because they depend on BR2_INET_IPV6 which is not
set, even though the C library supports it.

Granted, this is not a big problem, but still.

Regards,
Yann E. MORIN.

> -	help
> -	  Enable this option if you want your toolchain to support
> -	  IPv6.
> +	bool
> +	default y
>  
>  config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
>  	bool "Enable RPC support"
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
