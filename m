From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Dec 2015 13:33:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: new package
In-Reply-To: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213113342.GF2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Dec 13, 2015 at 11:58:16AM +0100, Bernd Kuhls wrote:
> +define LIBHDHOMERUN_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
> +		$(STAGING_DIR)/usr/lib/libhdhomerun.so
> +	$(INSTALL) -D -m 0644 $(@D)/*.h \
> +		$(STAGING_DIR)/usr/include/
> +endef
> +
> +define LIBHDHOMERUN_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/hdhomerun_config \
> +		$(TARGET_DIR)/usr/bin/hdhomerun_config

Are you sure this is not for staging?

> +	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
> +		$(TARGET_DIR)/usr/lib/libhdhomerun.so
> +endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
