From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 14:06:01 +0200
Subject: [Buildroot] [PATCH] libqmi: new package
In-Reply-To: <51C034FB.3010605@fh-kl.de>
References: <51C034FB.3010605@fh-kl.de>
Message-ID: <20130618140601.18787f92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Ziegler,

On Tue, 18 Jun 2013 12:22:51 +0200, Patrick Ziegler wrote:

> +config BR2_PACKAGE_LIBQMI
> +	bool "libqmi"
> +	select BR2_PACKAGE_LIBGLIB2

You need to propagate the "depends on" that libglib2 has, i.e WCHAR.

> +	help
> +	  libqmi is a glib-based library for talking to WWAN modems and devices
> +	  which speak the Qualcomm MSM Interface (QMI) protocol.

Upstream URL missing.

> +LIBQMI_VERSION = 1.4.0
> +LIBQMI_SITE    = http://cgit.freedesktop.org/libqmi/snapshot/
> +LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.gz

This is the default, so you could remove this line.

> +LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
> +LIBQMI_LICENSE_FILES = COPYING
> +LIBQMI_INSTALL_STAGING = YES
> +LIBQMI_AUTORECONF = YES

It would be good to have a comment that explains why autoreconf is
needed, i.e "The tarball is a Git snapshot, doesn't contain the
genrated configure script and Makefile" or something like this.

> +LIBQMI_DEPENDENCIES += libglib2

You could use a = here.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
