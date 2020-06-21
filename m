From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 09:20:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: remove ipv6 option
In-Reply-To: <20200611062505.642881-1-fontaine.fabrice@gmail.com>
References: <20200611062505.642881-1-fontaine.fabrice@gmail.com>
Message-ID: <20200621072002.GU2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-11 08:25 +0200, Fabrice Fontaine spake thusly:
> Remove --with-ipv6 as this option does nothing since version 1.11.5 and
> https://github.com/nginx/nginx/commit/2c84f7af2c97a55bf138a5fcedeb164733dc9bea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nginx/nginx.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 9bbb3fc201..0ceed7857f 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -14,8 +14,7 @@ NGINX_CONF_OPTS = \
>  	--crossbuild=Linux::$(BR2_ARCH) \
>  	--with-cc="$(TARGET_CC)" \
>  	--with-cpp="$(TARGET_CC)" \
> -	--with-ld-opt="$(TARGET_LDFLAGS)" \
> -	--with-ipv6
> +	--with-ld-opt="$(TARGET_LDFLAGS)"
>  
>  # www-data user and group are used for nginx. Because these user and group
>  # are already set by buildroot, it is not necessary to redefine them.
> -- 
> 2.26.2
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
