From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Dec 2013 11:05:18 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: add option to enable syslog
 support
In-Reply-To: <1386751772-5704-1-git-send-email-neumann@teufel.de>
References: <1386751772-5704-1-git-send-email-neumann@teufel.de>
Message-ID: <20131211090518.GG1217@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

On Wed, Dec 11, 2013 at 09:49:32AM +0100, Sven Neumann wrote:
> Add an option to enable support for sending debug messages
> to syslog instead of stdout.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 4ae41c1..920f96a 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -116,6 +116,12 @@ endef
>  
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)

Where is this defined?

baruch

> +define WPA_SUPPLICANT_DEBUG_CONFIG
> +	$(SED) 's/\(#\)\(CONFIG_DEBUG_SYSLOG.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> +endef
> +endif
> +
>  define WPA_SUPPLICANT_CONFIGURE_CMDS
>  	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
>  	$(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> @@ -133,6 +139,7 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
>  	$(WPA_SUPPLICANT_LIBNL_CONFIG)
>  	$(WPA_SUPPLICANT_DBUS_CONFIG)
>  	$(WPA_SUPPLICANT_AP_CONFIG)
> +	$(WPA_SUPPLICANT_DEBUG_CONFIG)
>  endef
>  
>  define WPA_SUPPLICANT_BUILD_CMDS
> -- 
> 1.8.3.2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
