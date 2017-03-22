From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 18:49:19 +0000
Subject: [Buildroot] [PATCH 1/2] libmediaart: new package
In-Reply-To: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1487714668-73512-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <90B0A5D74F9D1542B45328A4E51B57F0DB37C29F@PUMAIL01.pu.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> Library tasked with managing, extracting and handling media art caches
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> package/Config.in                    |  1 +
> package/libmediaart/Config.in        | 42 ++++++++++++++++++++++++++++++++++++
> package/libmediaart/libmediaart.hash |  2 ++
> package/libmediaart/libmediaart.mk   | 40 ++++++++++++++++++++++++++++++++++
> 4 files changed, 85 insertions(+)
> create mode 100644 package/libmediaart/Config.in
> create mode 100644 package/libmediaart/libmediaart.hash
> create mode 100644 package/libmediaart/libmediaart.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 81bf3f4..57494e7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1017,6 +1017,7 @@ menu "Graphics"
>        source "package/libglu/Config.in"
>        source "package/libgtk2/Config.in"
>        source "package/libgtk3/Config.in"
> +     source "package/libmediaart/Config.in"
>        source "package/libmng/Config.in"
>        source "package/libpng/Config.in"
>        source "package/libqrencode/Config.in"

[...]

> diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
> new file mode 100644
> index 0000000..06ab96a
> --- /dev/null
> +++ b/package/libmediaart/libmediaart.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# libmediaart
> +#
> +################################################################################
> +
> +LIBMEDIAART_VERSION_MAJOR = 1.9
> +LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).0

Recently 1.9.1 is released.

> +LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
> +LIBMEDIAART_SITE = \
> +       http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
> +LIBMEDIAART_LICENSE = LGPLv2+

License string should be LGPLv2.1+ since all source files have LGPLv2.1+ license text in comments
and COPYING file also refers to LGPLv2.1.

> +LIBMEDIAART_LICENSE_FILES = COPYING
> +LIBMEDIAART_INSTALL_STAGING = YES
> +LIBMEDIAART_DEPENDENCIES = libglib2
> +LIBMEDIAART_CONF_OPTS = --disable-unit-tests

Thanks,
Rahul
