From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:57:23 +0200
Subject: [Buildroot] [V2 1/3] libtommath: new package
In-Reply-To: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
References: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160402165723.18b71db3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 17:36:11 +0200, Francois Perrad wrote:

> diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
> new file mode 100644
> index 0000000..a377df1
> --- /dev/null
> +++ b/package/libtommath/libtommath.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# libtommath
> +#
> +################################################################################
> +
> +LIBTOMMATH_VERSION = 1.0
> +LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
> +LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
> +LIBTOMMATH_LICENSE = WTFPL
> +LIBTOMMATH_LICENSE_FILES = LICENSE
> +LIBTOMMATH_INSTALL_STAGING = YES
> +
> +define LIBTOMMATH_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
> +endef
> +
> +define LIBTOMMATH_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
> +endef
> +
> +$(eval $(generic-package))

I guess if there is no INSTALL_TARGET_CMDS, it's because this library
only installs a static variant, right? If that's the case, then doing
LIBTOMMATH_INSTALL_TARGET = NO is a good idea, with a comment above it
that explains why.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
