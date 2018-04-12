From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Apr 2018 17:42:08 +0300
Subject: [Buildroot] [PATCH 1/1] pixiewps: new package
In-Reply-To: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180412144208.zmxmtfwpat5s6n5h@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

On Thu, Apr 12, 2018 at 03:18:51PM +0200, Guillaume W. Bres wrote: 
> diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
> new file mode 100644
> index 0000000..746fa71
> --- /dev/null
> +++ b/package/pixiewps/pixiewps.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# pixiewps
> +#
> +################################################################################
> +
> +PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
> +PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> +PIXIEWPS_LICENSE = GPL-2.0+
> +PIXIEWPS_LICENSE_FILES = LICENSE.md
> +
> +define PIXIEWPS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
> +endef
> +
> +define PIXIEWPS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) \
> +		prefix=/usr -C $(@D)/$(PIXIEWPS_SUBDIR) install

Where is PIXIEWPS_SUBDIR defined?

> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
