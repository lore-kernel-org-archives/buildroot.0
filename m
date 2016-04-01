From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 1 Apr 2016 17:55:06 +0200
Subject: [Buildroot] [V2 1/3] libtommath: new package
In-Reply-To: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
References: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAGm1_kvE88dNrDpOd0-bn3KGu7q6tZStBCemxo4ZDtWVkywGBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 1, 2016 at 5:36 PM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                  |  1 +
>  package/libtommath/Config.in       |  7 +++++++
>  package/libtommath/libtommath.hash |  2 ++
>  package/libtommath/libtommath.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/libtommath/Config.in
>  create mode 100644 package/libtommath/libtommath.hash
>  create mode 100644 package/libtommath/libtommath.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7b23519..84df812 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1233,6 +1233,7 @@ menu "Other"
>         source "package/libsigc/Config.in"
>         source "package/libsigsegv/Config.in"
>         source "package/libtasn1/Config.in"
> +       source "package/libtommath/Config.in"
>         source "package/libtpl/Config.in"
>         source "package/libubox/Config.in"
>         source "package/libuci/Config.in"
> diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
> new file mode 100644
> index 0000000..b2ffc72
> --- /dev/null
> +++ b/package/libtommath/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBTOMMATH
> +       bool "libtommath"
> +       help
> +         LibTomMath is a free open source portable number theoretic
> +         multiple-precision integer library written entirely in C.
> +
> +         http://www.libtom.net
> diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
> new file mode 100644
> index 0000000..fcf2ddc
> --- /dev/null
> +++ b/package/libtommath/libtommath.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  993a7df9ee091fca430cdde3263df57d88ef62af8103903214da49fc51bbb56c  ltm-1.0.tar.xz
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
> +       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
> +endef
> +
> +define LIBTOMMATH_INSTALL_STAGING_CMDS
> +       $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
