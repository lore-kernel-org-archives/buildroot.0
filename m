From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 9 May 2017 12:32:04 +0300
Subject: [Buildroot] [PATCH v4 1/2] rhash: new package
In-Reply-To: <20170509092817.61068-1-Vincent.Riera@imgtec.com>
References: <20170509092817.61068-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509093204.lkmflcffn7nrbvq3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Tue, May 09, 2017 at 10:28:16AM +0100, Vicente Olivert Riera wrote:
> +ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
> +# We also install the rhash console utility to the staging directory
> +# since we want it to be a superset of the target directory.

And why is that?

> +define RHASH_INSTALL_STAGING_RHASH_BIN
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(STAGING_DIR)" $(RHASH_MAKE_OPTS) install-shared
> +endef
> +RHASH_POST_INSTALL_STAGING_HOOKS += RHASH_INSTALL_STAGING_RHASH_BIN
> +define RHASH_INSTALL_TARGET_RHASH_BIN
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
> +endef
> +RHASH_POST_INSTALL_TARGET_HOOKS += RHASH_INSTALL_TARGET_RHASH_BIN
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
