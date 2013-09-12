From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Sep 2013 22:30:09 +0200
Subject: [Buildroot] [PATCH] libsoc: add new package
In-Reply-To: <1378969536-3711-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Thu, 12 Sep 2013 09:05:36
 +0200")
References: <1378969536-3711-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <871u4trdf2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed with some fixes (see below) - Thanks.

 yegorslists> diff --git a/package/Config.in b/package/Config.in
 yegorslists> index a94cb62..45d81df 100644
 yegorslists> --- a/package/Config.in
 yegorslists> +++ b/package/Config.in
 yegorslists> @@ -518,6 +518,7 @@ source "package/libnfc/Config.in"
 yegorslists>  source "package/libnfc-llcp/Config.in"
 yegorslists>  source "package/libqmi/Config.in"
 yegorslists>  source "package/libserial/Config.in"
 yegorslists> +source "package/libsoc/Config.in"
 yegorslists>  source "package/libusb/Config.in"
 yegorslists>  source "package/libusb-compat/Config.in"
 yegorslists>  source "package/libv4l/Config.in"
 yegorslists> diff --git a/package/libsoc/Config.in b/package/libsoc/Config.in
 yegorslists> new file mode 100644
 yegorslists> index 0000000..911ba7a
 yegorslists> --- /dev/null
 yegorslists> +++ b/package/libsoc/Config.in
 yegorslists> @@ -0,0 +1,7 @@
 yegorslists> +config BR2_PACKAGE_LIBSOC
 yegorslists> +	bool "libsoc"
 yegorslists> +	depends on BR2_USE_MMU # fork()

It's only the test program that uses fork(), and it doesn't get built by
default so we can drop this dependency.

 yegorslists> +	help
 yegorslists> +	  libsoc: C library for interfacing with common SoC peripherals through generic kernel interfaces

Please wrap help text after ~70 chars so they fit in a normal 80col
menuconfig.

 yegorslists> +
 yegorslists> +	  https://github.com/jackmitch/libsoc
 yegorslists> diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
 yegorslists> new file mode 100644
 yegorslists> index 0000000..1d751cd
 yegorslists> --- /dev/null
 yegorslists> +++ b/package/libsoc/libsoc.mk
 yegorslists> @@ -0,0 +1,12 @@
 yegorslists> +#############################################################
 yegorslists> +#
 yegorslists> +# libsoc
 yegorslists> +#
 yegorslists> +#############################################################

The ##### lines should be 80 chars wide and an empty line before the
LIBSOC_ variables.

 yegorslists> +LIBSOC_VERSION = 356760dcb93b22d6c67c5232cde2ade8c968c932
 yegorslists> +LIBSOC_SITE = http://github.com/jackmitch/libsoc/tarball/$(LIBSOC_VERSION)

Please remember _LICENSE / _LICENSE_FILES tags for new packages
(LGPLv2.1 in this case).

 yegorslists> +LIBSOC_AUTORECONF = YES
 yegorslists> +LIBSOC_INSTALL_STAGING = YES
 yegorslists> +
 yegorslists> +$(eval $(autotools-package))
 yegorslists> +

No empty lines after autotools-package, thanks.

-- 
Bye, Peter Korsgaard
