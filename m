From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 06:15:35 +0200
Subject: [Buildroot] [PATCH 1/1] bc: new package
In-Reply-To: <1379477549-5783-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1379477549-5783-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20130918061535.55f573af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Tue, 17 Sep 2013 23:12:29 -0500, Matt Weber wrote:

> diff --git a/package/bc/bc.mk b/package/bc/bc.mk
> new file mode 100644
> index 0000000..ad13021
> --- /dev/null
> +++ b/package/bc/bc.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# bc
> +#
> +################################################################################

There should be one empty line between the header and the first
variable.

> +BC_VERSION = 1.06
> +BC_SITE = http://ftp.gnu.org/pub/gnu/bc/

This should use $(BR2_GNU_MIRROR).

> +BC_SOURCE = bc-$(BC_VERSION).tar.gz

And this line is not needed, as this is the default value.

> +BC_LICENSE = GPLv2+ LGPLv2.1+
> +BC_LICENSE_FILES = COPYING COPYING.LIB
> +BC_INSTALL_STAGING = NO

This last line is not needed, as this is the default.

> +
> +# Build after busybox so target ends up with bc's "dc" version
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +BC_DEPENDENCIES += busybox
> +endif
> +
> +$(eval $(autotools-package))

Other than that, seems good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
