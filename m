From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 23:32:56 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: install systemd service
 files
In-Reply-To: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
References: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150309233256.0b0e0550@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Mon,  9 Mar 2015 12:03:31 -0400, Mike Williams wrote:

> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 682cb4c..242bea5 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -164,4 +164,15 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>  	$(WPA_SUPPLICANT_INSTALL_DBUS)
>  endef
>  
> +define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant at .service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
> +endef

Could you please add the symlinks needed to make sure that these
services are started at boot by default?

I know this is not your opinion, but starting services by default is
what we do in basically all packages in Buildroot today, and therefore
something we should continue doing for consistency (and also because
we believe that's a sane default).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
