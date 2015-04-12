From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:34:31 +0200
Subject: [Buildroot] [PATCH 09/14] system: drop IPv6 depend for systemd
In-Reply-To: <1428754662-27829-9-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412143431.GK21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> It's no longer an option so it must be dropped.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  system/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 431524d..84cde94 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -81,7 +81,6 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_INET_IPV6

I know you're taking care of that in a followup patch, but it seems
weird that you drop the dependency here in the system option, but keep
it in the systemd package, even though it is selected.

I would also remove the dependency in systemd at the same time; or push
this patch after the packages have been cleaned up (I'd prfefer the
first solution, though).

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HAS_SSP
>  	depends on BR2_USE_MMU
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
