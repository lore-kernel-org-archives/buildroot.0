From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 10:23:04 +0100
Subject: [Buildroot] [PATCH] package/scrub: new package
In-Reply-To: <1453068293-16263-1-git-send-email-s.martin49@gmail.com>
References: <1453068293-16263-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160118102304.1ccbc389@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Sun, 17 Jan 2016 23:04:53 +0100, Samuel Martin wrote:

> diff --git a/package/scrub/scrub.mk b/package/scrub/scrub.mk
> new file mode 100644
> index 0000000..92837a1
> --- /dev/null
> +++ b/package/scrub/scrub.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# scrub
> +#
> +################################################################################
> +
> +SCRUB_VERSION = 2.6.1
> +SCRUB_SITE = $(call github,chaos,scrub,$(SCRUB_VERSION))
> +SCRUB_LICENSE = GPLv2+
> +SCRUB_LICENSE_FILES = COPYING
> +
> +# tarball of the git repo, but autoreconf does not work as expected, so:

"tarball of the git repo" is unclear, you should rather say: "Fetching
from the git repo, no configure/Makefile generated".

Also, how is it broken?

> +define SCRUB_AUTOCONF_HOOK
> +	( cd $(@D) && PATH=$(BR_PATH) $(@D)/autogen.sh )
> +endef
> +SCRUB_PRE_CONFIGURE_HOOKS += SCRUB_AUTOCONF_HOOK

This is broken if you don't depend on host-automake, host-libtool,
host-autoconf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
