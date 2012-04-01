From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 1 Apr 2012 07:53:15 +0300
Subject: [Buildroot] [PATCH] Add fmtools package.
In-Reply-To: <1333231898-20980-1-git-send-email-marek.belisko@open-nandra.com>
References: <1333231898-20980-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20120401045315.GA22835@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marek,

On Sun, Apr 01, 2012 at 12:11:38AM +0200, Marek Belisko wrote:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

[snip]

> new file mode 100644
> index 0000000..c03afbc
> --- /dev/null
> +++ b/package/fmtools/fmtools.mk
> @@ -0,0 +1,19 @@
> +#############################################################
> +#
> +# fmtools
> +#
> +#############################################################
> +
> +FMTOOLS_VERSION = 1.0.2
> +FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
> +
> +define FMTOOLS_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

Just use $(TARGET_CONFIGURE_OPTS) instead of setting CC and LD individually.

> +endef
> +
> +define FMTOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/fm $(TARGET_DIR)/usr/sbin
> +	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin
> +endef
> +
> +$(eval $(call GENTARGETS))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
