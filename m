From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:05:04 +0100
Subject: [Buildroot] [PATCHv3 11/74] gdk-pixbuf: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130150504.GP4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gdk-pixbuf/gdk-pixbuf.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
> index 61e7ae9..0977d92 100644
> --- a/package/gdk-pixbuf/gdk-pixbuf.mk
> +++ b/package/gdk-pixbuf/gdk-pixbuf.mk
> @@ -45,13 +45,11 @@ GDK_PIXBUF_DEPENDENCIES += \
>  	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
>  	host-pkgconf libglib2
>  
> -define GDK_PIXBUF_POST_INSTALL_TWEAKS
> +define GDK_PIXBUF_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
>  		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
>  endef
>  
> -GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
> -
>  $(eval $(autotools-package))
>  
>  HOST_GDK_PIXBUF_CONF_OPTS = \
> -- 
> 2.1.0
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
