From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 21:56:19 +0100
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <1358374472-11291-1-git-send-email-gilles.talis@gmail.com>
 (gilles talis's message of "Wed, 16 Jan 2013 14:14:32 -0800")
References: <1358374472-11291-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <871udfd158.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gilles" == gilles talis <gilles.talis@gmail.com> writes:

 gilles> From: Gilles Talis <gilles.talis@gmail.com>
 gilles> WebP is a new image format that provides lossless
 gilles> and lossy compression for images on the web

 gilles> +#####################################################################
 gilles> +#
 gilles> +# webp
 gilles> +#
 gilles> +#####################################################################
 gilles> +
 gilles> +WEBP_VERSION = 0.2.1
 gilles> +WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 gilles> +WEBP_SITE = https://webp.googlecode.com/files
 gilles> +WEBP_LICENSE = BSD-3c
 gilles> +WEBP_LICENSE_FILES = COPYING
 gilles> +WEBP_INSTALL_STAGING = YES
 gilles> +
 gilles> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
 gilles> +WEBP_DEPENDENCIES += libpng
 gilles> +WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 gilles> +endif

So what happens when you don't have libpng enabled but do have
libpng-config on the host? Is there no explicit configure options to
turn off png support (alternatively, point LIBPNG_CONFIG to /bin/false
or similar).

 gilles> +
 gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 gilles> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)

Same here. You don't depend on host-pkgconf, so it presumably doesn't
use that to figure out availability of jpeg/tiff.

-- 
Bye, Peter Korsgaard
