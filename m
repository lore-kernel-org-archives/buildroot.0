From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Sep 2010 00:00:33 +0100
Subject: [Buildroot] [PATCH] Add pcs-lite package to buildroot.
In-Reply-To: <AANLkTinyYg2p72sarSbRWfxXqZVg_WpvvfQMVdk8ryMw@mail.gmail.com>
References: <AANLkTinyYg2p72sarSbRWfxXqZVg_WpvvfQMVdk8ryMw@mail.gmail.com>
Message-ID: <20100923000033.05e9e9e5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

On Wed, 22 Sep 2010 09:53:50 +0200
Belisko Marek <marek.belisko@gmail.com> wrote:

> +source "package/pcs-lite/Config.in"
> +#source "package/pcsc-tools/Config.in"

Keep this commented line for the patch on pcsc-tools.

> +#############################################################
> +#
> +# pcs-lite
> +#
> +#############################################################
> +PCS_LITE_VERSION = 1.6.4
> +PCS_LITE_SOURCE = pcs-lite-$(PCS_LITE_VERSION).tar.bz2
> +PCS_LITE_SITE = https://alioth.debian.org/frs/download.php/3337
> +PCS_LITE_AUTORECONF = NO

Not needed (that's the default).

> +PCS_LITE_INSTALL_STAGING = NO

Not needed (that's the default).

> +PCS_LITE_INSTALL_TARGET = YES

Not needed (that's the default).

> +PCS_LITE_CONF_OPT = --disable-libhal
> +
> +PCS_LITE_DEPENDENCIES = uclibc libusb

The dependency on 'uclibc' should be removed. Buildroot already knows
that the toolchain should be built prior to any user package.

If you depend on libusb, then your package should "select
BR2_PACKAGE_LIBUSB" in its Config.in file.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
