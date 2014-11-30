From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:39:38 +0100
Subject: [Buildroot] [PATCHv3 21/74] pango: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-22-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130153938.GZ4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pango/pango.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index 6e340f4..63cfae3 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -61,11 +61,9 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
>  	PANGO_CONF_OPTS += --with-xft
>  endif
>  
> -define PANGO_INSTALL_INITSCRIPT
> +define PANGO_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 755 -D package/pango/S25pango \
>  		$(TARGET_DIR)/etc/init.d/S25pango
>  endef
>  
> -PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
> -
>  $(eval $(autotools-package))
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
