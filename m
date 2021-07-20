From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jul 2021 08:07:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgudev: add
 gobject-introspection optional dependency
In-Reply-To: <20210718195712.3287050-1-fontaine.fabrice@gmail.com>
References: <20210718195712.3287050-1-fontaine.fabrice@gmail.com>
Message-ID: <CAGm1_ksnur2uU=nM0vCcGg+HdCXJKqzCq28RPgYj3EfqX-5cXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 18, 2021 at 9:58 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> gobject-introspection is an optional dependency (which is enabled by
> default) since at least version 219 and
> https://gitlab.gnome.org/GNOME/libgudev/-/commit/43a593b5b4097b887e49eaacafbc1337bd709718
>
> Fixes:
>  - http://autobuild.buildroot.org/results/3bedc9fa3b14939825fb9cdebc6977057c3f6118
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/libgudev/libgudev.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
> index 63d592f9ac..9aa64c2c22 100644
> --- a/package/libgudev/libgudev.mk
> +++ b/package/libgudev/libgudev.mk
> @@ -13,4 +13,11 @@ LIBGUDEV_LICENSE = LGPL-2.1+
>  LIBGUDEV_LICENSE_FILES = COPYING
>  LIBGUDEV_CONF_OPTS = --disable-umockdev
>
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBGUDEV_CONF_OPTS += --enable-introspection
> +LIBGUDEV_DEPENDENCIES += gobject-introspection
> +else
> +LIBGUDEV_CONF_OPTS += --disable-introspection
> +endif
> +
>  $(eval $(autotools-package))
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
