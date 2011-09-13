From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2011 19:44:46 +0200
Subject: [Buildroot] [PATCH 1/2] omap-u-boot-utils: add new package
In-Reply-To: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20110913194446.0ebab8c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Sep 2011 19:19:32 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> +++ b/boot/omap-u-boot-utils/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
> +	bool "omap-u-boot-utils"
> +	help
> +	  U-Boot Utilities for Texas Instrument's OMAP platforms.
> +	  Say Y if you want these utilities on the development host.
> +
> +	  https://github.com/nmenon/omap-u-boot-utils

This is a pure host package, so it shouldn't be present in any
Config.in file. See package/fakeroot as an example.

And even if it also was a target package, the Config.in should be in
the package directory, not in boot/.

> +OMAP_U_BOOT_UTILS_VERSION = d086cb5c0
> +OMAP_U_BOOT_UTILS_SOURCE = omap-u-boot-utils-$(OMAP_U_BOOT_UTILS_VERSION).tar.gz

xxx_SOURCE is useless with the git download method.

> +OMAP_U_BOOT_UTILS_TARGETS = gpsign pserial tagger ucmd ukermit

Used only once, just hardcode.

Otherwise looks good!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
