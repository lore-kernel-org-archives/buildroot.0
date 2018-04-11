From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 15:57:36 +0200
Subject: [Buildroot] [PATCH 1/1] adding new package: pixiewps
In-Reply-To: <1523451846-29555-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523451846-29555-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180411155736.397d96ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillaume,

On Wed, 11 Apr 2018 15:04:06 +0200, Guillaume W. Bres wrote:
> Pixie WPS is a generic C package to perform 'pixie dust attack' against WPS pins.
> Easy to cross-compile, tested on RPI1 & RPI3.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Thanks also for this package. I have pretty much the same comments as
the ones for the reaver package: commit title, missing entry in
DEVELOPERS file, missing hash file, unneeded empty new line in
Config.in, lines too long in Config.in help text, and missing upstream
URL in Config.in help text.
> diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
> new file mode 100644
> index 0000000..8235195
> --- /dev/null
> +++ b/package/pixiewps/pixiewps.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# pixiewps 
> +#
> +################################################################################
> +
> +PIXIEWPS_VERSION = 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59 
> +PIXIEWPS_SITE = $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> +PIXIEWPS_LICENSE = GPL-3.0+
> +PIXIEWPS_LICENSE_FILES = LICENSE.md
> +
> +PIXIEWPS_SUBDIR = src

This line is useless, the Makefile is at the top-level.

> +PIXIEWPS_INSTALL_TARGET = YES

This line is useless.

> +
> +$(eval $(generic-package))

I don't see how this can build anything. A generic-package without any
BUILD_CMDS and INSTALL_TARGET_CMDS will do not anything useful. So I
think some fundamental part of the package is missing.

Here as well, please remember to use ./utils/check-package
and ./utils/test-pkg to validate your package. Thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
