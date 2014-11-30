From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:40:30 +0100
Subject: [Buildroot] [PATCHv3 22/74] xapp_xdm: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-23-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-23-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130154030.GA4124@free.fr>
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
>  package/x11r7/xapp_xdm/xapp_xdm.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
> index 428f473..955dc1c 100644
> --- a/package/x11r7/xapp_xdm/xapp_xdm.mk
> +++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
> @@ -14,11 +14,9 @@ XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libX
>  XAPP_XDM_CONF_OPTS = --with-utmp-file=/var/adm/utmpx \
>  		    --with-wtmp-file=/var/adm/wtmpx
>  
> -define XAPP_XDM_INSTALL_STARTUP_SCRIPT
> +define XAPP_XDM_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
>  		$(TARGET_DIR)/etc/init.d/S99xdm
>  endef
>  
> -XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
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
