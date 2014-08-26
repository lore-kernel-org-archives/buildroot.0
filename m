From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Aug 2014 23:38:14 +0300
Subject: [Buildroot] [PATCH 1/2] libphidget: new package for controlling
 Phidgets USB devices
In-Reply-To: <1409084887-30450-1-git-send-email-yba@tkos.co.il>
References: <1409084887-30450-1-git-send-email-yba@tkos.co.il>
Message-ID: <20140826203814.GB29733@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Tue, Aug 26, 2014 at 11:28:06PM +0300, Jonathan Ben-Avraham wrote:
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---

[snip]

> diff --git a/package/libphidget/libphidget.mk 
> b/package/libphidget/libphidget.mk
> new file mode 100644
> index 0000000..55547d5
> --- /dev/null
> +++ b/package/libphidget/libphidget.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libphidget
> +#
> +################################################################################
> +
> +LIBPHIDGET_VERSION = 2.1.8.20140319
> +LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
> +LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries/
> +LIBPHIDGET_DEPENDENCIES = libusb
> +LIBPHIDGET_CONF_OPT = --disable-ldconfig
> +LIBPHIDGET_INSTALL_STAGING = YES
> +LIBPHIDGET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
> +LIBPHIDGET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

These two are the default.

baruch

> +LIBPHIDGET_LICENSE = LGPLv3
> +LIBPHIDGET_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
