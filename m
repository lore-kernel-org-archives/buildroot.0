From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:05:39 +0200
Subject: [Buildroot] [PATCH 4/4 v8] package/linux-backports: switch to
 using the kernel-module infra
In-Reply-To: <200f17ef13ac12610b33139a1b1f8820fc0c85bd.1437576751.git.yann.morin.1998@free.fr>
References: <cover.1437576751.git.yann.morin.1998@free.fr>
 <200f17ef13ac12610b33139a1b1f8820fc0c85bd.1437576751.git.yann.morin.1998@free.fr>
Message-ID: <20150722170539.580d5638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 22 Jul 2015 16:58:55 +0200, Yann E. MORIN wrote:

> +LINUX_BACKPORTS_MAKE_OPTS = \
> +	BACKPORT_DIR=$(@D) \
> +	KLIB_BUILD=$(LINUX_DIR) \
> +	KLIB=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \
> +	`sed -r -e '/^\#/d;' $(@D)/.config`

For sure this last line needs a comment.

> +LINUX_BACKPORTS_MODULE_MAKE_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)

What is this useful for?

> +define LINUX_BACKPORTS_AUTOCONF
> +	$(MAKE) -C $(@D) $(LINUX_BACKPORTS_MAKE_OPTS) backport-include/backport/autoconf.h
> +endef
> +LINUX_BACKPORTS_POST_CONFIGURE_HOOKS += LINUX_BACKPORTS_AUTOCONF

Also a comment above this would be good to have.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
