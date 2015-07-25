From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 00:31:46 +0200
Subject: [Buildroot] [PATCH 06/47] package/kodi: Rework audio encoder
 support
In-Reply-To: <1437597069-6448-7-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725223146.GL1847@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> Make option BR2_PACKAGE_KODI_OPTICALDRIVE invisible, it is only
> needed when an audio encoder addon is enabled.
> 
> Add Kconfig submenu for audio encoders to prepare for addition of
> more binary addons.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 7d4b068..f182fbf 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -247,20 +247,14 @@ config BR2_PACKAGE_KODI_WAVPACK
>  	  Select this if you want to play back WV files.
>  
>  config BR2_PACKAGE_KODI_OPTICALDRIVE
> -	bool "optical drive"
> -	help
> -	  Enable support for optical drives
> -
> -if BR2_PACKAGE_KODI_OPTICALDRIVE
> -
> -comment "Kodi audioencoder addons"
> -
> -source "package/kodi-audioencoder-flac/Config.in"
> -source "package/kodi-audioencoder-lame/Config.in"
> -source "package/kodi-audioencoder-vorbis/Config.in"
> -source "package/kodi-audioencoder-wav/Config.in"
> +	bool

Does that mean that support for optical drives is no longer useful
without an audio encider?

I.e. how is one supposed to read a DVD/BRD/AudioCD ?

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
