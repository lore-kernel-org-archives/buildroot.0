From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 21:56:33 +0200
Subject: [Buildroot] [PATCH 1/3] wpa-supplicant: add options to enable
 the new DBus interface
In-Reply-To: <1348049503-1469-2-git-send-email-s.neumann@raumfeld.com>
References: <5058EFD8.4010809@mind.be>
 <1348049503-1469-1-git-send-email-s.neumann@raumfeld.com>
 <1348049503-1469-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <505A2371.2000004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 12:11, Sven Neumann wrote:
> Allow to configure the DBus interfaces that the wpa_supplicant
> binary should support (old or new or both). Also allow to
> enable introspection support on the new DBus interface.
>
> Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>
> ---
>   package/wpa_supplicant/Config.in         |   19 ++++++++++++++
>   package/wpa_supplicant/wpa_supplicant.mk |   42 ++++++++++++++++++++++++++----
>   2 files changed, 56 insertions(+), 5 deletions(-)
>
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index d7cefe3..95d9620 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -30,6 +30,25 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
>   	  (optionally, with WPS); this links in parts of hostapd functionality
>   	  into wpa_supplicant.
>
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
> +	bool "Enable support for old DBus control interface"
> +	depends on BR2_PACKAGE_DBUS
> +	help
> +	  Enable support for old DBus control interface
> +	  (fi.epitest.hostap.WPASupplicant).
> +
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
> +	bool "Enable support for new DBus control interface"
> +        depends on BR2_PACKAGE_DBUS

  Still 8 spaces instead of 1 tab.

> +	help
> +	  Enable support for new DBus control interface (fi.w1.wpa_supplicant1).
> +
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
> +	bool "Introspection support"
> +        depends on BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW

  Still 8 spaces instead of 1 tab.


  When I said the whitespace issue was the only thing had to be fixed, I didn't
mean that my other comments could be ignored :-)

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
