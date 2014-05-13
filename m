From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 May 2014 07:30:10 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: detect readline support
 in wpa_cli
In-Reply-To: <1399911369-3165-1-git-send-email-oscar.hellstrom@vinnter.se>
References: <1399911369-3165-1-git-send-email-oscar.hellstrom@vinnter.se>
Message-ID: <5371ADE2.8010807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/14 18:16, Oscar Hellstr?m wrote:
> Signed-off-by: Oscar Hellstr?m <oscar.hellstrom@vinnter.se>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 9fcda2e..9321f08 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -105,6 +105,11 @@ define WPA_SUPPLICANT_DEBUG_CONFIG
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +	WPA_SUPPLICANT_DEPENDENCIES += readline
> +	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE

 In package .mk file, we don't indent within if... constructs; we only use
indentation for commands and for continuation lines. I admit that that coding
style is objectionable, but it is what it is.

 Regards,
 Arnout

> +endif
> +
>  define WPA_SUPPLICANT_CONFIGURE_CMDS
>  	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
>  	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
