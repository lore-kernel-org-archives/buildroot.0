From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 23:22:59 +0200
Subject: [Buildroot] [PATCH v2 2/3] libgtk2: drop libxcomposite
 mandatory dep
In-Reply-To: <1427750190-10801-2-git-send-email-gustavo@zacarias.com.ar>
References: <1427750190-10801-1-git-send-email-gustavo@zacarias.com.ar>
 <1427750190-10801-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330212259.GG4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-30 18:16 -0300, Gustavo Zacarias spake thusly:
> It's not selected, not required and duplicate with the autodep.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgtk2/libgtk2.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
> index 39c629c..c92bbd2 100644
> --- a/package/libgtk2/libgtk2.mk
> +++ b/package/libgtk2/libgtk2.mk
> @@ -82,8 +82,7 @@ LIBGTK2_CONF_OPTS += \
>  	--x-libraries=$(STAGING_DIR)/usr/lib \
>  	--with-gdktarget=x11
>  LIBGTK2_DEPENDENCIES += \
> -	xlib_libXcomposite fontconfig xlib_libX11 \
> -	xlib_libXext xlib_libXrender
> +	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
>  
>  ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
>  	LIBGTK2_CONF_OPTS += --enable-xinerama
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
