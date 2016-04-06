From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Apr 2016 07:33:24 +0300
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
Message-ID: <20160406043324.GZ3088@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Justin,

On Tue, Apr 05, 2016 at 08:47:16PM -0600, Justin Berger wrote:
> +################################################################################
> +#
> +# ilixi
> +#
> +################################################################################
> +
> +ILIXI_VERSION = 1.0.0
> +ILIXI_SITE = http://ilixi.org/releases
> +ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)
> +ILIXI_LICENSE_FILES = COPYING.LESSER COPYING
> +ILIXI_INSTALL_STAGING = YES
> +
> +ILIXI_DEPENDENCIES = 	\
> +	libsigc 	\
> +	libxml2 	\
> +	directfb 	\
> +	fontconfig	\
> +
> +ifeq ($(BR2_PACKAGE_SAWMAN),y)
> +	ILIXI_CONF_OPTS += --enable-sawman
> +	ILIXI_DEPENDENCIES += sawman
> +else
> +	ILIXI_CONF_OPTS += --disable-sawman
> +endif
> +
> +ILIXI_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"

Should be CXXFLAGS and TARGET_CXXFLAGS.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
