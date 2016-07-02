From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 13:15:25 +0200
Subject: [Buildroot] [PATCH] package/wpa_supplicant: Add optional
 autoscan support
In-Reply-To: <1467449764-4157-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467449764-4157-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702111525.GM22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, all,

On 2016-07-02 10:56 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

As seen IRL, it would have been a nice addition to explain that it does
not conflict with the recently added bgscan.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wpa_supplicant/Config.in         | 5 +++++
>  package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index f4c4167..1920774 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -38,6 +38,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
>  	  making it bigger but dispensing the need for a separate hostapd
>  	  binary in some applications hence being smaller overall.
>  
> +config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
> +	bool "Enable autoscan"
> +	help
> +	  Enable support for the autoscan feature (allow periodic scan)
> +
>  config BR2_PACKAGE_WPA_SUPPLICANT_EAP
>  	bool "Enable EAP"
>  	help
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 21bbd3e..d1d59f7 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -68,6 +68,12 @@ WPA_SUPPLICANT_CONFIG_ENABLE += \
>  	CONFIG_P2P
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
> +WPA_SUPPLICANT_CONFIG_ENABLE += \
> +	CONFIG_AUTOSCAN_EXPONENTIAL \
> +	CONFIG_AUTOSCAN_PERIODIC
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
>  WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
>  endif
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
