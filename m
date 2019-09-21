From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 16:06:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/connman: fix legacy
 wpa_supplicant dbus select
In-Reply-To: <20190920150508.9731-1-sandwichdoge@gmail.com>
References: <20190920150508.9731-1-sandwichdoge@gmail.com>
Message-ID: <b7543fc5-9859-c4f4-c570-785b73ce632a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thuan,

 Good catch!


On 20/09/2019 17:05, Thuan Ho wrote:
> From: sandwichdoge <sandwichdoge@gmail.com>
> 
> Remove '_NEW' from 'select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW' in Config.in.
> 
> Wpa_supplicant dbus support option has been renamed from 'BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW' to
> 'BR2_PACKAGE_WPA_SUPPLICANT_DBUS' in v2.9 bump (f2ffdbee2aca0ca2bde469475c180d60cb934beb).
> While Connman package, which depends on wpa_supplicant, has not been updated.

 Please wrap the commit message at 72 columns.

> 
> This patch will fix legacy build error.
> 
> Signed-off-by: sandwichdoge <sandwichdoge@gmail.com>
> Signed-off-by: Thuan Ho <sandwichdoge@gmail.com>

 One Sob is sufficient :-) I've updated the author line to Thuan Ho instead of
sandwichdoge and applied to master, thanks!

 Regards,
 Arnout

> ---
>  package/connman/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/connman/Config.in b/package/connman/Config.in
> index 5177c939a4..30eae23c96 100644
> --- a/package/connman/Config.in
> +++ b/package/connman/Config.in
> @@ -25,7 +25,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
>  config BR2_PACKAGE_CONNMAN_WIFI
>  	bool "enable WiFi support"
>  	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
> -	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW # runtime
> +	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
>  	help
>  	  Enable WiFi support (scan and static/dhcp interface
>  	  setup). ConnMan detects the start of wpa_supplicant
> 
