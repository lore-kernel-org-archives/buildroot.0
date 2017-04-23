From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 11:26:40 +0200
Subject: [Buildroot] [PATCH v5 21/34]
 package/kodi-pvr-mediaportal-tvserver: needs locale support
In-Reply-To: <20170417195433.26672-22-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-22-bernd.kuhls@t-online.de>
Message-ID: <20170423092640.GB7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-mediaportal-tvserver/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
> index 733ca8859..d63ad882e 100644
> --- a/package/kodi-pvr-mediaportal-tvserver/Config.in
> +++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
>  	bool "kodi-pvr-mediaportal-tvserver"
> +	depends on BR2_ENABLE_LOCALE # for included live555

Alternatively, you can build with CFLAGS containing -DLOCALE_NOT_USED

The best and correct fix would be to de-bundle live555, which does not
seem too complex. This should be upstreamed first, fo course.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  MediaPortal TVServer PVR client addon for Kodi
>  
>  	  https://github.com/kodi-pvr/pvr.mediaportal.tvserver
> +
> +comment "kodi-pvr-mediaportal-tvserver needs a toolchain w/ locale"
> +	depends on !BR2_ENABLE_LOCALE
> -- 
> 2.11.0
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
