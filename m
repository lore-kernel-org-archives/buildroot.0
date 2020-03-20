From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 22:11:31 +0100
Subject: [Buildroot] [PATCH] package/radvd: drop dependency on flex
 runtime library
In-Reply-To: <20200320100720.1850-1-alexander.i.mukhin@gmail.com>
References: <20200320100720.1850-1-alexander.i.mukhin@gmail.com>
Message-ID: <20200320211131.GT10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-03-20 13:07 +0300, Alexander Mukhin spake thusly:
> Radvd has its own main(), and does not use yywrap() from libfl.so,
> because scanner.l module contains noyywrap option. So, none of the
> functions exported by libfl.so are used, and there's no need to have
> the flex runtime on target.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/radvd/Config.in | 1 -
>  package/radvd/radvd.mk  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/radvd/Config.in b/package/radvd/Config.in
> index fa5a20c4c1..f1df0c3cb8 100644
> --- a/package/radvd/Config.in
> +++ b/package/radvd/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_RADVD
>  	bool "radvd"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_FLEX
>  	help
>  	  IPv6 Router Advertisement Daemon.
>  
> diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
> index 3358264f18..ba0c78bd1e 100644
> --- a/package/radvd/radvd.mk
> +++ b/package/radvd/radvd.mk
> @@ -6,7 +6,7 @@
>  
>  RADVD_VERSION = 2.18
>  RADVD_SITE = http://www.litech.org/radvd/dist
> -RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
> +RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
>  # We need to ignore <linux/if_arp.h>, because radvd already includes
>  # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
>  RADVD_CONF_ENV = \
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
