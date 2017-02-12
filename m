From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 14:34:32 +0100
Subject: [Buildroot] [PATCHv3] package/ccache: do not force colored
	diagnostics
In-Reply-To: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
References: <1486906227-5682-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170212143432.4aa112f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 14:30:27 +0100, Yann E. MORIN wrote:

> +# Further patch ccache if either the host or target compilers is

compilers -> compiler (I believe, though I'm not an expert in english
grammar)

> +# too old to support colored output diagnostics.
> +ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),yy)
> +define CCACHE_NO_GCC_COLORS
> +	sed -i  '/if (getenv("GCC_COLORS")/,+3d' $(@D)/ccache.c

Using $(SED) not possible here?

> +endef
> +
> +#HOST_CCACHE_POST_PATCH_HOOKS += CCACHE_NO_GCC_COLORS

Line commented? :-)

Other than that, looks good to me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
