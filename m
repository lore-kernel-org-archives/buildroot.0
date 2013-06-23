From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jun 2013 16:42:35 +0200
Subject: [Buildroot] [PATCH] package/libdvbsi: new package
In-Reply-To: <1371998097-27155-1-git-send-email-c.schoenert@gmail.com>
References: <1371998097-27155-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130623164235.01e695fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 23 Jun 2013 16:34:56 +0200, Carsten Schoenert wrote:

> --- /dev/null
> +++ b/package/libdvbsi/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBDVBSI
> +	bool "libdvbsi"
> +	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS

We generally put these dependencies each on a separate line, for some
reason.

> +	help
> +	  C++ parsing library for Service Information (SI) in DVB systems.
> +	  With libdvbsi++ you can convert raw DVB service information to
> +	  a set of C++ objects, removing the need to parse data manually.
> +
> +	  http://www.saftware.de/

Missing comment when the package cannot be selected due to the absence
of the toolchain dependencies.


> +LIBDVBSI_VERSION = 0.3.6
> +LIBDVBSI_SOURCE = libdvbsi++-$(LIBDVBSI_VERSION).tar.bz2
> +LIBDVBSI_SITE = http://www.saftware.de/
> +LIBDVBSI_INSTALL_STAGING = YES
> +LIBDVBSI_LICENSE = LGPLv2.1
> +LIBDVBSI_LICENSE_FILE = COPYING
> +
> +# sometimes no Makefile is in the archive
> +LIBDVBSI_AUTORECONF=YES
> +
> +$(eval $(autotools-package))

Otherwise, looks good.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
