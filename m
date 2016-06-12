From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 21:18:16 +0200
Subject: [Buildroot] [PATCH 2/5] package/libv4l: qt4 support depends on
 OpenGL
In-Reply-To: <1465723823-6113-2-git-send-email-bernd.kuhls@t-online.de>
References: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
 <1465723823-6113-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160612191816.GB3711@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-06-12 11:30 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/8fc/8fc8cbc85dacebce5cb6ab13f5ff3b0764117471/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Of course, that can't go in before your previous patch is fixed.)

Regards,
Yann E. MORIN.

> ---
>  package/libv4l/libv4l.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index bdd28bf..d0a0369 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -54,7 +54,7 @@ LIBV4L_CONF_ENV += \
>  	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
>  	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
>  	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
> -else ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
> +else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
>  LIBV4L_CONF_OPTS += --enable-qv4l2
>  LIBV4L_DEPENDENCIES += qt
>  else
> -- 
> 2.8.1
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
