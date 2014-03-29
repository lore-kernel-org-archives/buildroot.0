From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 11:35:38 +0100
Subject: [Buildroot] [PATCH] libndp: new package
In-Reply-To: <1395053827-1966-1-git-send-email-yegorslists@googlemail.com>
References: <1395053827-1966-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140329113538.3ae1d4ed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Mon, 17 Mar 2014 11:57:07 +0100, yegorslists at googlemail.com wrote:
> index 0000000..516ac05
> --- /dev/null
> +++ b/package/libndp/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBNDP
> +	bool "libndp"
> +	depends on BR2_INET_IPV6
> +	help
> +	  This package contains a library which provides a wrapper
> +	  for IPv6 Neighbor Discovery Protocol. It also provides a tool
> +	  named ndptool for sending and receiving NDP messages.
> +

Missing upstream URL.

> +comment "libndp needs a toolchain w/ IPv6"
> +	depends on !BR2_INET_IPV6
> diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
> new file mode 100644
> index 0000000..af58c6e
> --- /dev/null
> +++ b/package/libndp/libndp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libndp
> +#
> +################################################################################
> +
> +LIBNDP_VERSION = v1.2
> +LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
> +LIBNDP_LICENSE = LGPLv2.1

The license is really LGPLv2.1+.

And also the package was building with uClibc, there was a missing
#include <stdargh.h> (try building libndp with
http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full.config
after removing the patch).

I've fixed those problems and committed. Can you send the stdarg.h
patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
