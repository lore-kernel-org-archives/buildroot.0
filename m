From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 11:24:45 -0800
Subject: [Buildroot] [PATCH v5] neardal: new package
In-Reply-To: <1354732823-5974-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 5 Dec 2012 18:40:23 +0000")
References: <1354732823-5974-1-git-send-email-spdawson@gmail.com>
Message-ID: <8738zk9u9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  v5: Resend
 spdawson>  v4: Incorporate Arnout Vandecappelle's suggested improvements
 spdawson>  v3: Remove spurious dependency on neard, add Arnout Vandecappelle's acks

You didn't actually add Arnouts ack, so I added that myself.

 spdawson> +config BR2_PACKAGE_NEARDAL
 spdawson> +	bool "neardal"
 spdawson> +	depends on BR2_USE_WCHAR # glib2
 spdawson> +	select BR2_PACKAGE_DBUS
 spdawson> +	select BR2_PACKAGE_DBUS_GLIB

dbus needs threads and mmu as well.

 spdawson> +	help
 spdawson> +	  Provides a simple C API to exchange data with the neard NFC manager daemon.

Please wrap help text to fit within the ~70-col menuconfig window.

 spdawson> +
 spdawson> +	  https://github.com/connectivity/neardal
 spdawson> +
 spdawson> +comment "neardal requires a toolchain with WCHAR support"
 spdawson> +	depends on !BR2_USE_WCHAR
 spdawson> diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
 spdawson> new file mode 100644
 spdawson> index 0000000..f898df5
 spdawson> --- /dev/null
 spdawson> +++ b/package/neardal/neardal.mk
 spdawson> @@ -0,0 +1,16 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# neardal
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +NEARDAL_VERSION = 0.7
 spdawson> +NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
 spdawson> +NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
 spdawson> +NEARDAL_INSTALL_STAGING = YES
 spdawson> +NEARDAL_LICENSE = GPLv2
 spdawson> +NEARDAL_LICENSE_FILES = COPYING
 spdawson> +
 spdawson> +NEARDAL_DEPENDENCIES = dbus-glib

Same comments as for neard. I've added dbus and host-pkgconf.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
