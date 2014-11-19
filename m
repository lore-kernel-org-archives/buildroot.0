From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 23:10:10 +0100
Subject: [Buildroot] [PATCH 1/9] package/*/*.mk: Fix indent
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141119221010.GD3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-11-15 17:29 +0100, Maxime Hadjinlian spake thusly:
> Change LIBFOO_PERMISSIONS everywhere to be a space-separated list.
> As nothing was specified in the manual but all our lists are space
> separated, there is no reason that this one should be made an exception.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v1 -> v2:
>    - Align busybox permissions using spaces as required by Arnout Vandecappelle
> ---
>  package/busybox/busybox.mk | 4 ++--
>  package/nginx/nginx.mk     | 2 +-
>  package/sudo/sudo.mk       | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 0ceaab1..f0fa851 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -50,8 +50,8 @@ BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
>  define BUSYBOX_PERMISSIONS
> -	/bin/busybox			 f 4755	0 0 - - - - -
> -	/usr/share/udhcpc/default.script f 755  0 0 - - - - -
> +	/bin/busybox                     f 4755 0  0 - - - - -
> +	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
>  endef
>  
>  # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 5a65c52..55ae844 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -25,7 +25,7 @@ NGINX_CONF_OPTS = \
>  # So, we just need to create the directories used by nginx with the right
>  # ownership.
>  define NGINX_PERMISSIONS
> -	/var/lib/nginx	d	755	33	33	-	-	-	-	-
> +	/var/lib/nginx d 755 33 33 - - - - -
>  endef
>  
>  # disable external libatomic_ops because its detection fails.
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 283a40c..61635ec 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -29,7 +29,7 @@ endef
>  SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
>  
>  define SUDO_PERMISSIONS
> -	/usr/bin/sudo			 f 4755	0 0 - - - - -
> +	/usr/bin/sudo f 4755 0 0 - - - - -
>  endef
>  
>  $(eval $(autotools-package))
> -- 
> 2.1.3
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
