From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 00:47:22 +0200
Subject: [Buildroot] [PATCH] packages/*.mk: Remove duplicate options
In-Reply-To: <1413656413-22546-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413656413-22546-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141018224722.GD14899@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-18 20:20 +0200, Maxime Hadjinlian spake thusly:
> These flags are already defined in pkg-autotools.mk.
> There is no need to have them twice.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[--SNIP--]
> diff --git a/package/opus/opus.mk b/package/opus/opus.mk
> index 04ffa57..c8ba5c6 100644
> --- a/package/opus/opus.mk
> +++ b/package/opus/opus.mk
> @@ -9,11 +9,10 @@ OPUS_SITE = http://downloads.xiph.org/releases/opus
>  OPUS_LICENSE = BSD-3c
>  OPUS_LICENSE_FILES = COPYING
>  OPUS_INSTALL_STAGING = YES
> -OPUS_CONF_OPTS = --disable-doc
>  OPUS_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
> -OPUS_CONF_OPTS += --enable-fixed-point
> +OPUS_CONF_OPTS = --enable-fixed-point

Although technically correct, I would not mind the += to stick.
Variables are always initialised to empty, so it is safe to just append
to them.

Anyway:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endif
>  
>  $(eval $(autotools-package))
> diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
> index cf6ec2b..ac8684e 100644
> --- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
> +++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
> @@ -11,6 +11,5 @@ XLIB_LIBXAW_LICENSE = MIT
>  XLIB_LIBXAW_LICENSE_FILES = COPYING
>  XLIB_LIBXAW_INSTALL_STAGING = YES
>  XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
> -XLIB_LIBXAW_CONF_OPTS = --disable-docs
>  
>  $(eval $(autotools-package))
> -- 
> 2.1.1
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
