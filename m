From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 09:42:47 +0100
Subject: [Buildroot] [PATCH 06/51] package/usbredir: new package
In-Reply-To: <1354146890-27380-7-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-7-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121129094247.03f7c7d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 29 Nov 2012 00:54:05 +0100, Yann E. MORIN wrote:

> +comment "usbredir requires libusb"
> +	depends on !BR2_PACKAGE_LIBUSB

Hum, why a "depends on" and not a "select", like we normally do for
libraries? libusb is not a "big" thing, so I'd say it should be
automatically selected.

> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> new file mode 100644
> index 0000000..9f6c011
> --- /dev/null
> +++ b/package/usbredir/usbredir.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# usbredir
> +#
> +#############################################################
> +
> +USBREDIR_VERSION         = 0.4.3
> +USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
> +USBREDIR_SITE            = http://spice-space.org/download/usbredir
> +USBREDIR_LICENSE         = LGPLv2.1+

Maybe:

USBREDIR_LICENSE         = LGPLv2.1+ (library)

> +USBREDIR_LICENSE_FILES   = COPYING.LIB
> +USBREDIR_INSTALL_STAGING = YES
> +USBREDIR_DEPENDENCIES    = libusb
> +
> +USBREDIR_DEPENDENCIES    += host-pkgconf
> +
> +ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> +
> +USBREDIR_LICENSE         += GPLv2+

USBREDIR_LICENSE         += , GPLv2+ (server)

Or something equivalent, as per the conclusion of the Buildroot
Developer Days.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
