From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 11:38:16 +0200
Subject: [Buildroot] [PATCH 1/1] libmusicbrainz: new package
In-Reply-To: <1434099170-19778-1-git-send-email-pieter.degendt@gmail.com>
References: <1434099170-19778-1-git-send-email-pieter.degendt@gmail.com>
Message-ID: <20150612113816.6c335b01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter De Gendt,

Please extend the commit log, especially to explain why you're adding a
host variant for the neon package.

On Fri, 12 Jun 2015 10:52:50 +0200, Pieter De Gendt wrote:

> diff --git a/package/libmusicbrainz/libmusicbrainz.mk b/package/libmusicbrainz/libmusicbrainz.mk
> new file mode 100644
> index 0000000..a199f34
> --- /dev/null
> +++ b/package/libmusicbrainz/libmusicbrainz.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libmusicbrainz
> +#
> +################################################################################
> +
> +LIBMUSICBRAINZ_VERSION = release-5.1.0
> +LIBMUSICBRAINZ_SITE = $(call github,metabrainz,libmusicbrainz,$(LIBMUSICBRAINZ_VERSION))
> +LIBMUSICBRAINZ_INSTALL_STAGING = YES

Missing LICENSE + LICENSE_FILES.

> +LIBMUSICBRAINZ_DEPENDENCIES = libxml2 neon host-pkgconf host-libmusicbrainz
> +
> +LIBMUSICBRAINZ_CONF_OPTS = -DIMPORT_EXECUTABLES=$(HOST_LIBMUSICBRAINZ_DIR)/ImportExecutables.cmake

Please add a comment above these lines to explain what is going on, i.e
why we need to build host-libmusicbrainz, and pass this option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
