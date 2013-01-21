From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 21 Jan 2013 15:45:39 -0800
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <871udfd158.fsf@dell.be.48ers.dk>
References: <1358374472-11291-1-git-send-email-gilles.talis@gmail.com>
 <871udfd158.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2wHrHVgTQYxjwRE4dY7OmjCR6iM_c2mZYFky-J1GUZLdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,


On Jan 20, 2013 12:56 PM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
>
> >>>>> "gilles" == gilles talis <gilles.talis@gmail.com> writes:
>
>  gilles> From: Gilles Talis <gilles.talis@gmail.com>
>  gilles> WebP is a new image format that provides lossless
>  gilles> and lossy compression for images on the web
>
>  gilles>
+#####################################################################
>  gilles> +#
>  gilles> +# webp
>  gilles> +#
>  gilles>
+#####################################################################
>  gilles> +
>  gilles> +WEBP_VERSION = 0.2.1
>  gilles> +WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
>  gilles> +WEBP_SITE = https://webp.googlecode.com/files
>  gilles> +WEBP_LICENSE = BSD-3c
>  gilles> +WEBP_LICENSE_FILES = COPYING
>  gilles> +WEBP_INSTALL_STAGING = YES
>  gilles> +
>  gilles> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  gilles> +WEBP_DEPENDENCIES += libpng
>  gilles> +WEBP_CONF_ENV +=
ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
>  gilles> +endif
>
> So what happens when you don't have libpng enabled but do have
> libpng-config on the host? Is there no explicit configure options to
> turn off png support (alternatively, point LIBPNG_CONFIG to /bin/false
> or similar).

There's no way to disable any of the options mentioned in that patch (PNG,
JPEG, TIFF).

in my setup, the "configure" step returns cross-compilation errors, thus
removes PNG from the available options.

I hesitated quite a bit before embedding LIBPNG_CONFIG within
BR2_PACKAGE_LIBPNG flag. My first intention was to force this config to
always point to the staging dir. Is that what you are suggesting?

>
>  gilles> +
>  gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
>  gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
>
> Same here. You don't depend on host-pkgconf, so it presumably doesn't
> use that to figure out availability of jpeg/tiff.

Same here. I can force the paths to JPEG and TIFF include and lib to always
point to staging dir. Was my first intention, but it seemed to work out
fine without doing that. Do you think it would be preferrable to force
these paths?


thanks
Gilles.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130121/8ce93d4d/attachment.html>
