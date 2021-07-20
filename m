From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 20 Jul 2021 08:08:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/libgudev: bump to version 236
In-Reply-To: <20210718195712.3287050-2-fontaine.fabrice@gmail.com>
References: <20210718195712.3287050-1-fontaine.fabrice@gmail.com>
 <20210718195712.3287050-2-fontaine.fabrice@gmail.com>
Message-ID: <CAGm1_kvvPG7oLBUL5vZJu4RGiW1fVSLWtZiKMcJT43KPrpKxEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 18, 2021 at 9:58 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Switch to meson-package
> - Update indentation in hash file (two spaces)
>
> https://gitlab.gnome.org/GNOME/libgudev/-/blob/236/NEWS
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/libgudev/libgudev.hash |  6 +++---
>  package/libgudev/libgudev.mk   | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/package/libgudev/libgudev.hash b/package/libgudev/libgudev.hash
> index bee394601e..1040ffb0c0 100644
> --- a/package/libgudev/libgudev.hash
> +++ b/package/libgudev/libgudev.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/233/libgudev-233.sha256sum
> -sha256 587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03  libgudev-233.tar.xz
> +# From http://ftp.gnome.org/pub/GNOME/sources/libgudev/236/libgudev-236.sha256sum
> +sha256  e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524  libgudev-236.tar.xz
>
>  # Hash for license file:
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
> index 9aa64c2c22..eabd446d7b 100644
> --- a/package/libgudev/libgudev.mk
> +++ b/package/libgudev/libgudev.mk
> @@ -4,20 +4,20 @@
>  #
>  ################################################################################
>
> -LIBGUDEV_VERSION = 233
> +LIBGUDEV_VERSION = 236
>  LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
>  LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
>  LIBGUDEV_INSTALL_STAGING = YES
>  LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
>  LIBGUDEV_LICENSE = LGPL-2.1+
>  LIBGUDEV_LICENSE_FILES = COPYING
> -LIBGUDEV_CONF_OPTS = --disable-umockdev
> +LIBGUDEV_CONF_OPTS = -Dtests=disabled -Dvapi=disabled
>
>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> -LIBGUDEV_CONF_OPTS += --enable-introspection
> +LIBGUDEV_CONF_OPTS += -Dintrospection=enabled
>  LIBGUDEV_DEPENDENCIES += gobject-introspection
>  else
> -LIBGUDEV_CONF_OPTS += --disable-introspection
> +LIBGUDEV_CONF_OPTS += -Dintrospection=disabled
>  endif
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
