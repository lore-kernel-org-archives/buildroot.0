From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 09:32:20 +0200
Subject: [Buildroot] svn commit: [26236] trunk/buildroot/package:
	shared-mime-info
In-Reply-To: <20090429072102.E9C2F7646C@busybox.osuosl.org>
	(tpetazzoni@uclibc.org's message of "Wed\,
	29 Apr 2009 07\:21\:02 +0000 \(UTC\)")
References: <20090429072102.E9C2F7646C@busybox.osuosl.org>
Message-ID: <87vdonewzf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "tpetazzoni" == tpetazzoni  <tpetazzoni@uclibc.org> writes:

 tpetazzoni> Author: tpetazzoni
 tpetazzoni> Date: 2009-04-29 07:21:02 +0000 (Wed, 29 Apr 2009)
 tpetazzoni> New Revision: 26236

 tpetazzoni> Log:
 tpetazzoni> Add the shared-mime-info package

Thanks.

 >> From Sven Neumann <s.neumann@raumfeld.com>

Don't forget to close the bugtracker issue. It's also nice to mention
the number in the commit message (E.G. closes #299).
 tpetazzoni> +++ trunk/buildroot/package/shared-mime-info/Config.in	2009-04-29 07:21:02 UTC (rev 26236)
 tpetazzoni> @@ -0,0 +1,10 @@
 tpetazzoni> +config BR2_PACKAGE_SHARED_MIME_INFO
 tpetazzoni> +	bool "shared-mime-info"
 tpetazzoni> +	select BR2_PACKAGE_LIBGLIB2
 tpetazzoni> +        select BR2_PACKAGE_LIBXML2

This should be indented with a <tab>

 tpetazzoni> +	help
 tpetazzoni> +                The shared-mime-info package contains the core
 tpetazzoni> +                database of common types and the update-mime-database
 tpetazzoni> +                command used to extend it.
 tpetazzoni> +
 tpetazzoni> +                http://freedesktop.org/wiki/Software/shared-mime-info

And these with <tab><space><space>
 tpetazzoni> +#############################################################
 tpetazzoni> +#
 tpetazzoni> +# shared-mime-info
 tpetazzoni> +#
 tpetazzoni> +#############################################################
 tpetazzoni> +SHARED_MIME_INFO_VERSION = 0.60
 tpetazzoni> +SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 tpetazzoni> +SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 tpetazzoni> +
 tpetazzoni> +SHARED_MIME_INFO_INSTALL_STAGING = YES
 tpetazzoni> +SHARED_MIME_INFO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install

That's the same as the default value for _INSTALL_STAGING_OPT, so it
can get removed.

-- 
Bye, Peter Korsgaard
