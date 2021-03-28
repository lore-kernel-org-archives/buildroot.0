From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:20:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: add configure option to
 disable libusb support
In-Reply-To: <20210322191034.3428-1-bernd.kuhls@t-online.de>
References: <20210322191034.3428-1-bernd.kuhls@t-online.de>
Message-ID: <20210328082026.GI24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-03-22 20:10 +0100, Bernd Kuhls spake thusly:
> Make sure libusb support is properly disabled even if the libusb
> package is enabled.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've foudn the title to be confusing, so I've changed it to:
    package/kodi: honour the libusb option even when disabled

I've also slightly expanded the commit log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi/kodi.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index bf5822eb61..6edb0b7fca 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -206,6 +206,8 @@ KODI_CONF_OPTS += -DENABLE_UDEV=OFF
>  ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
>  KODI_CONF_OPTS += -DENABLE_LIBUSB=ON
>  KODI_DEPENDENCIES += libusb-compat
> +else
> +KODI_CONF_OPTS += -DENABLE_LIBUSB=OFF
>  endif
>  endif
>  
> -- 
> 2.29.2
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
