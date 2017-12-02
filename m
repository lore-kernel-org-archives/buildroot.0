From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 2 Dec 2017 17:15:11 +0100
Subject: [Buildroot] [PATCH] pimd: new package
In-Reply-To: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
References: <1512228242-23822-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171202161511.GB2462@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Dec 02, 2017 at 01:24:02PM -0200, Sergio Prado wrote:
> pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon.
> diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
> new file mode 100644
> index 000000000000..cd9427094a61
> --- /dev/null
> +++ b/package/pimd/pimd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# pimd
> +#
> +################################################################################
> +
> +PIMD_VERSION = 2.3.2
> +PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
> +PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_VERSION)
> +
> +PIMD_LICENSE = BSD-3-Clause
> +PIMD_LICENSE_FILES = LICENSE

LICENSE.mrouted Should also be listed in PIMD_LICENSE_FILES.

From LICENSE:
Part of this program has been derived from mrouted.
The mrouted program is covered by the license in the accompanying file
named "LICENSE.mrouted".

> +
> +PIMD_MAKE_OPTS = CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
> +PIMD_CONF_OPTS = --embedded-libc
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Best regards
Marcus Folkesson
