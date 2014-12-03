From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 19:31:12 +0100
Subject: [Buildroot] [PATCH 3/3] package/lxc: disable broken toolchains
 on nios2
In-Reply-To: <1417366134-2098-3-git-send-email-bernd.kuhls@t-online.de>
References: <1417366134-2098-1-git-send-email-bernd.kuhls@t-online.de>
 <1417366134-2098-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141203183112.GD4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-30 17:48 +0100, Bernd Kuhls spake thusly:
> As discussed with Thomas
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/100998
> only the current toolchains are broken:
> "it's better to blacklist the individual toolchains that are known
> to be broken, so that if we add another toolchain, we will be able
> to see if the same bug happens as well or not."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/lxc/Config.in |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
> index cf85712..a90e58e 100644
> --- a/package/lxc/Config.in
> +++ b/package/lxc/Config.in
> @@ -6,7 +6,9 @@ config BR2_PACKAGE_LXC
>  	depends on BR2_LARGEFILE
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_avr32 # no timerfd
> -	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
> +	# the toolchain doesn't support setns syscall
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
>  	help
>  	  Linux Containers (LXC), provides the ability to group and isolate
> @@ -18,6 +20,7 @@ config BR2_PACKAGE_LXC
>  comment "lxc needs a toolchain w/ IPv6, threads, largefile, headers >= 3.0"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_avr32 # no timerfd
> -	depends on !BR2_nios2 # the toolchain doesn't support setns syscall
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>  	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS \
>                  || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> -- 
> 1.7.10.4
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
