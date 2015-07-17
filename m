From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jul 2015 09:41:01 +0300
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: Have Hotspot 2.0 depend
 on nl80211
In-Reply-To: <1437051754-24060-2-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20150713112947.7e14fd64@free-electrons.com>
 <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1437051754-24060-2-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20150717064101.GE3147@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

On Thu, Jul 16, 2015 at 03:02:34PM +0200, Nicolas Cavallari wrote:
> Hotspot 2.0 uses ANQP whose implementation needs offchannel/
> remain-on-channel capabilities from the driver, which only exist in the
> nl80211 driver.  Compiling would work, but the feature would not work.

Your sign-off is missing.

>  package/wpa_supplicant/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 1824f95..c163bbc 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -40,6 +40,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
>  
>  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
>  	bool "Enable HS20"
> +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211

Please add the BR2_PACKAGE_LIBNL dependency here as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
