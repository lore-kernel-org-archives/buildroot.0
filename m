From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 23:23:31 +0200
Subject: [Buildroot] [PATCH v2 3/3] libgtk2: adjust style
In-Reply-To: <1427750190-10801-3-git-send-email-gustavo@zacarias.com.ar>
References: <1427750190-10801-1-git-send-email-gustavo@zacarias.com.ar>
 <1427750190-10801-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330212331.GH4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-30 18:16 -0300, Gustavo Zacarias spake thusly:
> Cleanup indentation and mention why we need AUTORECONF.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgtk2/libgtk2.mk | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index c92bbd2..fbc0d08 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -11,7 +11,7 @@ LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJ
>  LIBGTK2_INSTALL_STAGING = YES
>  LIBGTK2_LICENSE = LGPLv2+
>  LIBGTK2_LICENSE_FILES = COPYING
> -
> +# For 0001-reduce-dependencies.patch
>  LIBGTK2_AUTORECONF = YES
>  
>  LIBGTK2_CONF_ENV = \
> @@ -85,37 +85,37 @@ LIBGTK2_DEPENDENCIES += \
>  	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
> -	LIBGTK2_CONF_OPTS += --enable-xinerama
> -	LIBGTK2_DEPENDENCIES += xlib_libXinerama
> +LIBGTK2_CONF_OPTS += --enable-xinerama
> +LIBGTK2_DEPENDENCIES += xlib_libXinerama
>  else
> -	LIBGTK2_CONF_OPTS += --disable-xinerama
> +LIBGTK2_CONF_OPTS += --disable-xinerama
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
> -	LIBGTK2_CONF_OPTS += --with-xinput=yes
> -	LIBGTK2_DEPENDENCIES += xlib_libXi
> +LIBGTK2_CONF_OPTS += --with-xinput=yes
> +LIBGTK2_DEPENDENCIES += xlib_libXi
>  else
> -	LIBGTK2_CONF_OPTS += --with-xinput=no
> +LIBGTK2_CONF_OPTS += --with-xinput=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
> -	LIBGTK2_DEPENDENCIES += xlib_libXrandr
> +LIBGTK2_DEPENDENCIES += xlib_libXrandr
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
> -	LIBGTK2_DEPENDENCIES += xlib_libXcursor
> +LIBGTK2_DEPENDENCIES += xlib_libXcursor
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
> -	LIBGTK2_DEPENDENCIES += xlib_libXfixes
> +LIBGTK2_DEPENDENCIES += xlib_libXfixes
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
> -	LIBGTK2_DEPENDENCIES += xlib_libXcomposite
> +LIBGTK2_DEPENDENCIES += xlib_libXcomposite
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
> -	LIBGTK2_DEPENDENCIES += xlib_libXdamage
> +LIBGTK2_DEPENDENCIES += xlib_libXdamage
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
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
