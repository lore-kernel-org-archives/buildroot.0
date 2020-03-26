From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Mar 2020 20:03:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: add missing libmnl
 dependency for nftables
In-Reply-To: <20200308205301.62180-1-james.hilliard1@gmail.com>
References: <20200308205301.62180-1-james.hilliard1@gmail.com>
Message-ID: <20200326190324.GV22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-03-08 14:53 -0600, James Hilliard spake thusly:
> Building with nftables support requires libmnl.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, after adding references to a few autobuild failures.
Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/connman/Config.in  | 1 +
>  package/connman/connman.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index ac012dda54..48a2ee421c 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
>  	bool "nftables"
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	select BR2_PACKAGE_LIBMNL
>  	select BR2_PACKAGE_NFTABLES
>  	help
>  	  Use nftables as firewall.
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 701be8b59d..1ebfe9cf14 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -41,7 +41,7 @@ CONNMAN_CONF_OPTS += --with-firewall=iptables
>  CONNMAN_DEPENDENCIES += iptables
>  else ifeq ($(BR2_PACKAGE_CONNMAN_NFTABLES),y)
>  CONNMAN_CONF_OPTS += --with-firewall=nftables
> -CONNMAN_DEPENDENCIES += nftables
> +CONNMAN_DEPENDENCIES += libmnl nftables
>  endif
>  
>  ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
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
