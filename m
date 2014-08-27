From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Aug 2014 22:49:42 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
In-Reply-To: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
References: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140827204942.GA21009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-27 22:41 +0200, Bernd Kuhls spake thusly:
> BR2_PACKAGE_XBMC_DBUS is provided by package/xbmc/Config.in
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index bdd634e..0bb6724 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -64,7 +64,7 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
>  	LIBS="-lvcos -lvchostif"
>  endif
>  
> -ifeq ($(BR2_PACKAGE_DBUS),y)
> +ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
>  XBMC_DEPENDENCIES += dbus
>  endif

No, because the user can still select the package DBUS directly and
since XBMC has no option to disable DBUS, we still want DBUS to be built
before XBMC.

But granted, this is not obvious from the variable name.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
