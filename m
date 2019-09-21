From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 18:03:04 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fixes for hostapd/wpa_supplicant
 packages
In-Reply-To: <20190909202034.27508-1-geomatsi@gmail.com>
References: <20190909202034.27508-1-geomatsi@gmail.com>
Message-ID: <572349ae-2813-7ab1-e91a-d9830b14dcf6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/09/2019 22:20, Sergey Matyukevich wrote:
> Hi Thomas and all,
> 
> New wpa_supplicant v2.9 enables by default in its defconfig several features
> for WPA3 support and AP mode:
> - WPA3: CONFIG_OWE, CONFIG_SAE, CONFIG_DPP
> - AP: CONFIG_AP, CONFIG_P2P, CONFIG_WIFI_DISPLAY
> 
> WPA3 features add openssl to wpa_supplicant dependencies. The first
> two patches add Config.in option for WPA3 support in both hostapd and
> wpa_supplicant. When this option is selected, then openssl is also
> selected and WPA3 features are enabled in hostapd/wpa_s configuration
> files. 
> 
> AP features make sense only for wpa_supplicant drivers supporting AP
> mode. For instance, if only WEXT driver is enabled, then those features
> should be explicitely disabled from hostapd/wpa_s configuration files.
> The 3rd patch explicitely disables AP features in wpa_supplicant
> configuration file unless they are requested by Config.in options.
> 
> These changes are supposed to fix the following two types of issues
> listed in daily build results for 2019-09-06:
> 
> - wpa_supplicant-2.9 build issues
>   -- undefined references to hostapd_is_dfs_required and more
> - defconfig board issues (orangepi and other boards)
>   -- missing openssl headers


 Series applied to master, thanks. Unfortunately, just too late for the weekly
build of the defconfigs...

 Regards,
 Arnout

> 
> Regards,
> Sergey
> 
> Changes v1 -> v2
> 
> - add patch fixing AP mode options for wpa_supplicant
> - update commit messages
> 
> 
> Sergey Matyukevich (3):
>   package/wpa_supplicant: add Config.in option enabling WPA3 support
>   package/hostapd: add Config.in option enabling WPA3 support
>   package/wpa_supplicant: fix AP mode settings
> 
>  package/hostapd/Config.in                |  7 +++++++
>  package/hostapd/hostapd.mk               | 11 +++++++++++
>  package/wpa_supplicant/Config.in         |  7 +++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 18 ++++++++++++++++++
>  4 files changed, 43 insertions(+)
> 
