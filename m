From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 22:01:47 +0100
Subject: [Buildroot] [PATCH next 1/1] package/wpa_supplicant: need EAP
 when HOTSPOT is enabled.
In-Reply-To: <20210215084023.22070-1-nicolas.cavallari@green-communications.fr>
References: <20210215084023.22070-1-nicolas.cavallari@green-communications.fr>
Message-ID: <14ce8db6-0ab7-2a5b-1348-18b0eea26ad6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/02/2021 09:40, Nicolas Cavallari wrote:
> Make WPA_SUPPLICANT_HOTSPOT depend on WPA_SUPPLICANT_EAP, Otherwise,
> compilation fails with errors like:
> 
> interworking.c:1439:15: error: ?struct wpa_ssid? has no member named ?eap?
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/wpa_supplicant/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 3c986ff4ba..27ad22430a 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -94,6 +94,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
>  
>  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
>  	bool "Enable HS20"
> +	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
>  	help
>  	  Enable Hotspot 2.0 and IEEE 802.11u interworking
>  	  functionality.
> 
