From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 11:14:31 -0800
Subject: [Buildroot] [PATCH v5] neard: new package
In-Reply-To: <1354732747-5843-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 5 Dec 2012 18:39:07 +0000")
References: <1354732747-5843-1-git-send-email-spdawson@gmail.com>
Message-ID: <877gow9uqw.fsf@dell.be.48ers.dk>
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
 spdawson>  v4: No changes; patch series version bumped
 spdawson>  v3: Incorporated improvements suggested by Baruch Siach,
 spdawson>      add Arnout Vandecappelle's acks
 spdawson>  v2: Incorporated improvements suggested by Thomas Petazzoni

 spdawson> +config BR2_PACKAGE_NEARD
 spdawson> +	bool "neard"
 spdawson> +	select BR2_PACKAGE_DBUS
 spdawson> +	select BR2_PACKAGE_LIBGLIB2
 spdawson> +	select BR2_PACKAGE_LIBNL

You forgot to add the dependencies for the toolchain options needed by
dbus/libglib2/libnl.

Committed with that fixed, thanks.

 spdawson> +++ b/package/neard/neard.mk
 spdawson> @@ -0,0 +1,14 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# neard
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +NEARD_VERSION = 0.8
 spdawson> +NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 spdawson> +NEARD_LICENSE = GPLv2
 spdawson> +NEARD_LICENSE_FILES = COPYING
 spdawson> +
 spdawson> +NEARD_DEPENDENCIES = dbus libglib2 libnl

I know these will indirectly pull in host-pkgconf, but I think it makes
sense to add it here as well as configure.ac explicitly checks for it.

-- 
Bye, Peter Korsgaard
