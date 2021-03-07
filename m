From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 23:16:00 +0100
Subject: [Buildroot] [PATCH] package/wine: bump to version 6.0
In-Reply-To: <20210307215403.887067-1-nerv@dawncrow.de>
References: <20210307215403.887067-1-nerv@dawncrow.de>
Message-ID: <20210307221600.GH2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2021-03-07 22:54 +0100, Andr? Hentschel spake thusly:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
[--SNIP--]
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 80c9d20d3d..f1b76736ad 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
[--SNIP--]
> @@ -340,14 +320,13 @@ endif
>  # Wine only needs the host tools to be built, so cut-down the
>  # build time by building just what we need.
>  define HOST_WINE_BUILD_CMDS
> -	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> -	  tools \
> -	  tools/sfnt2fon \
> -	  tools/widl \
> -	  tools/winebuild \
> -	  tools/winegcc \
> -	  tools/wmc \
> -	  tools/wrc
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/sfnt2fon
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/widl
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/winebuild
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/winegcc
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/wmc
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools/wrc

Why did you need change this?

Basically, your commit log is empty, when there are things that you
should explain. For example, for zlib, ncurses and GLU, stating they
are no longer used would be sufficient. But really, what needs to be
explained is that part about the host build.

Regards,
Yann E. MORIN.

>  endef
>  
>  # Wine only needs its host variant to be built, not that it is
> @@ -368,11 +347,9 @@ HOST_WINE_CONF_OPTS += \
>  	--without-coreaudio \
>  	--without-faudio \
>  	--without-cups \
> -	--without-curses \
>  	--without-dbus \
>  	--without-fontconfig \
>  	--without-gphoto \
> -	--without-glu \
>  	--without-gnutls \
>  	--without-gsm \
>  	--without-gssapi \
> @@ -381,6 +358,7 @@ HOST_WINE_CONF_OPTS += \
>  	--without-jpeg \
>  	--without-krb5 \
>  	--without-ldap \
> +	--without-mingw \
>  	--without-mpg123 \
>  	--without-netapi \
>  	--without-openal \
> @@ -410,8 +388,7 @@ HOST_WINE_CONF_OPTS += \
>  	--without-xshape \
>  	--without-xshm \
>  	--without-xslt \
> -	--without-xxf86vm \
> -	--without-zlib
> +	--without-xxf86vm
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.25.1
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
