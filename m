From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:44:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] omap-u-boot-utils: add new package
In-Reply-To: <1316444007-10968-1-git-send-email-luca@lucaceresoli.net>
References: <1315934373-16561-1-git-send-email-luca@lucaceresoli.net>
 <1316444007-10968-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20110919224432.705c22ac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Sep 2011 16:53:26 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> +config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
> +	bool "omap-u-boot-utils"
> +	help
> +	  U-Boot Utilities for Texas Instrument's OMAP platforms.
> +	  Say Y if you want these utilities on the development host.
> +
> +	  https://github.com/nmenon/omap-u-boot-utils

I continue to disagree with the fact of adding an host utility in the
Config.in menu, or at least not without a broader discussion about this.

Since we have started to normalize the generation of host packages
(late 2009/early 2010), we decided that host packages should *not*
appear in the menuconfig, but that they rather should only be handled
through make dependencies. If we decide to change this decision, we
need to think about it globally, i.e what we want to do for *all* host
packages and not only particular cases.

I must admit there are other cases for which being able to show host
packages to users would be useful. For example, on AT91 platforms,
there is an host utility called SAM-BA which allows to reflash an AT91
device through the USB device port. This host utility could be
conveniently downloaded, extracted and installed into $(HOST_DIR) by
Buildroot, but we have currently no way of doing this.

Some thing for OpenOCD. Jean-Christophe has recently added support for
it for the target, but being able to build OpenOCD on the host and
install it in $(HOST_DIR) would also be useful for those of us who want
to build ready-to-use development environments with Buildroot.

Anyway, in the mean time, I'm NACKing those patches until a proper
discussion has taken place, resulting in the definition of a solution
that works for all host packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
