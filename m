From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:00:44 +0100
Subject: [Buildroot] [PATCH 2/2] new package libhid
In-Reply-To: <A17BA6C9FDFD463A81926C4778154B14@apexjs>
References: <A17BA6C9FDFD463A81926C4778154B14@apexjs>
Message-ID: <20110124170044.732194de@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sagaert,

On Sat, 22 Jan 2011 20:17:34 +0100
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> The included patch prevents from linking to libusb on the host.

The patch below does not seem to match this description.

Moreover, your patch has been word-wrapped by your e-mail client.
Could you use git send-email instead ?

Your patch 1/2 (which adds the source package/libhid/Config.in line)
should be part of this patch (i.e a single patch for adding the
package).

>  diff -rupN buildroot-master/package/libhid/Config.in
> buildroot/package/libhid/Config.in
> --- buildroot-master/package/libhid/Config.in	1970-01-01
> 01:00:00.000000000 +0100
> +++ buildroot/package/libhid/Config.in	2011-01-29 19:30:49.000000000 +0100
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBHID
> +	bool "libhid"
> +	depends on BR2_PACKAGE_LIBUSB

This should be a "select" statement, as we do for all
library dependencies.

> diff -rupN buildroot-master/package/libhid/Config.in~
> buildroot/package/libhid/Config.in~
> --- buildroot-master/package/libhid/Config.in~	1970-01-01
> 01:00:00.000000000 +0100
> +++ buildroot/package/libhid/Config.in~	2011-01-29 19:27:59.000000000 +0100

Could you use Git to generate your patches in order to not have those
backup files in the patch ?

> diff -rupN buildroot-master/package/libhid/libhid.mk
> buildroot/package/libhid/libhid.mk
> --- buildroot-master/package/libhid/libhid.mk	1970-01-01
> 01:00:00.000000000 +0100
> +++ buildroot/package/libhid/libhid.mk	2011-01-30 00:10:11.000000000 +0100
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# libhid
> +#
> +#############################################################
> +LIBHID_VERSION = 0.2.16
> +LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
> +LIBHID_SITE = http://alioth.debian.org/frs/download.php/1958
> +LIBHID_DEPENDENCIES = libusb-compat libusb
> +LIBHID_INSTALL_STAGING = YES
> +LIBHID_INSTALL_TARGET = YES
> +LIBHID_CONF_OPT = --disable-swig  --without-doxygen
> --disable-package-config
> +
> +
> +$(eval $(call AUTOTARGETS,package,libhid))

This .mk file looks good, but I haven't tested it yet.

Could you fix those comments and resend ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
