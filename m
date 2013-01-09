From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 17:02:39 +0100
Subject: [Buildroot] [PATCH 2/2] Adding media-ctl as a package
In-Reply-To: <1357734594-8211-2-git-send-email-kpa_info@yahoo.fr>
References: <1357734594-8211-1-git-send-email-kpa_info@yahoo.fr>
 <1357734594-8211-2-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130109170239.56a4e727@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear kpa_info at yahoo.fr,

On Wed,  9 Jan 2013 13:29:54 +0100, kpa_info at yahoo.fr wrote:
> +config BR2_PACKAGE_MEDIA_CTL
> +	bool "media-ctl"
> +	help
> +	  Media controller control application

One empty newline + upstream URL of the project (even if it's just a
http link to the Git repository). And also the description seems a bit
short, since it does not only contains an application, but also a
library, no?

> diff --git a/package/media-ctl/media-ctl.mk
> b/package/media-ctl/media-ctl.mk new file mode 100644
> index 0000000..3c35278
> --- /dev/null
> +++ b/package/media-ctl/media-ctl.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# media-ctl
> +#
> +#############################################################
> +
> +MEDIA_CTL_VERSION = ac40b79f002a2315f909548614ccd2d408da25b7
> +MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
> +MEDIA_CTL_INSTALL_STAGING = YES
> +MEDIA_CTL_LICENSE = GPLv2

The license is LGPLv2.1+.

> +MEDIA_CTL_LICENSE_FILES = COPYING.LIB
> +
> +MEDIA_CTL_AUTORECONF = YES
> +MEDIA_CTL_AUTORECONF_OPT = --install

Are you sure this AUTORECONF_OPT is needed? If so, then please add a
comment before this line that explains why.

> +MEDIA_CTL_CONF_OPT = --with-kernel-headers=$(STAGING_DIR)/usr/include
> +MEDIA_CTL_DEPENDENCIES = host-pkgconf
> +
> +$(eval $(autotools-package))

Otherwise, looks good, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
