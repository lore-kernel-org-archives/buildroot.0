From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 19:21:56 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/mpd: bump to version 0.21.7
In-Reply-To: <20190704104321.2598-4-joerg.krause@embedded.rocks>
References: <20190704104321.2598-1-joerg.krause@embedded.rocks>
 <20190704104321.2598-4-joerg.krause@embedded.rocks>
Message-ID: <91452a65-49d5-a479-6cf8-eb9e0eef1897@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/07/2019 12:43, J?rg Krause wrote:
> MPD changed from Autotools to the Meson build system.
> 
> Add config options for the qobuz and tidal plugins and group them together
> with the soundcloud plugin under "Commercial services".
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Is there any reason why you didn't do the bump to 0.21.11 already?

>  ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
>  MPD_DEPENDENCIES += tremor
> -# Help mpd to find tremor in static linking scenarios
> -MPD_CONF_ENV += \
> -	TREMOR_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs vorbisidec`"
> -MPD_CONF_OPTS += --with-tremor=$(STAGING_DIR)/usr

 I guess this is no longer needed because meson properly uses pkg-config. Have
you tested that?

 Regards,
 Arnout

> +MPD_CONF_OPTS += -Dtremor=enabled
> +else
> +MPD_CONF_OPTS += -Dtremor=disabled
>  endif
