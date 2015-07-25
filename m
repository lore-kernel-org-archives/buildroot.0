From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:09:42 +0200
Subject: [Buildroot] [PATCH 12/47] package/kodi-pvr-addons: Prepare to
 split into addon-specific packages
In-Reply-To: <1437597069-6448-13-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-13-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725170942.GP3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> The PVR addons formerly being part of the xbmc-pvr-addons package were
> split into seperate packages being hosted on https://github.com/kodi-pvr
> 
> This patch removes the old PVR addon package to prepare for the new
> PVR addon packages being added as subsequent patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index f182fbf..13638df 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -249,6 +249,10 @@ config BR2_PACKAGE_KODI_WAVPACK
>  config BR2_PACKAGE_KODI_OPTICALDRIVE
>  	bool
>  
> +menu "PVR addons"
> +	source "package/kodi-addon-xvdr/Config.in"
> +endmenu
> +
>  menu "Audio encoder addons"
>  	source "package/kodi-audioencoder-flac/Config.in"
>  	source "package/kodi-audioencoder-lame/Config.in"
> @@ -256,9 +260,4 @@ menu "Audio encoder addons"
>  	source "package/kodi-audioencoder-wav/Config.in"
>  endmenu
>  
> -comment "Kodi PVR addons"
> -
> -source "package/kodi-addon-xvdr/Config.in"
> -source "package/kodi-pvr-addons/Config.in"

Why did you move the PVR addons before the Audio addons? Please keep the
list alphabetically sorted.

Regards,
Yann E. MORIN.

>  endif # BR2_PACKAGE_KODI
> -- 
> 1.7.10.4
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
