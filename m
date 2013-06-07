From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 11:47:01 +0200
Subject: [Buildroot] [PATCH v9 07/14] gst1-plugins-base: add gstreamer1
 base plugins
In-Reply-To: <1369931437-12445-8-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-8-git-send-email-spenser@gillilanding.com>
Message-ID: <20130607114701.0f249b68@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 30 May 2013 11:30:30 -0500, Spenser Gilliland wrote:

> diff --git a/package/multimedia/gst1-plugins-base/Config.in b/package/multimedia/gst1-plugins-base/Config.in
> new file mode 100644
> index 0000000..2a95846
> --- /dev/null
> +++ b/package/multimedia/gst1-plugins-base/Config.in
> @@ -0,0 +1,106 @@
> +menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
> +	bool "gst1-plugins-base"
> +	depends on BR2_PACKAGE_GSTREAMER1
> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7

I know it's done this way in the existing gst-plugins-base, but I find
it odd that X.org support is enabled automagically, while the other
plugins have sub-options below.

What do others think?

> diff --git a/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
> new file mode 100644
> index 0000000..22676d6
> --- /dev/null
> +++ b/package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
> @@ -0,0 +1,201 @@
> +#############################################################
> +#
> +# gst1-plugins-base
> +#
> +#############################################################

Missing empty new line between header and variables.

Also ensure the headers lines contain 80 '#' characters, as per the new
rule.

> +GST1_PLUGINS_BASE_VERSION = 1.0.7
> +GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
> +GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
> +GST1_PLUGINS_BASE_INSTALL_STAGING = YES

license + license files.

> +
> +# freetype is only used by examples, but if it is not found
> +# and the host has a freetype-config script, then the host
> +# include dirs are added to the search path causing trouble
> +GST1_PLUGINS_BASE_CONF_ENV =
> +		FT2_CONFIG=/bin/false \
> +		ac_cv_header_stdint_t="stdint.h"
> +
> +GST1_PLUGINS_BASE_CONF_OPT = \
> +		--disable-examples \
> +		--disable-oggtest \
> +		--disable-vorbistest \
> +		--disable-freetypetest \
> +		--disable-valgrind \
> +		--disable-debug
> +
> +# Options which require currently unpackaged libraries
> +GST1_PLUGINS_BASE_CONF_OPT += \
> +		--disable-cdparanoia \
> +		--disable-libvisual \
> +		--disable-iso-codes

Only one tab when indenting.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
