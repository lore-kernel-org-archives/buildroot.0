From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:26:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20171215153830.4864-1-casantos@datacom.ind.br>
References: <20171215153830.4864-1-casantos@datacom.ind.br>
Message-ID: <20180402112650.1e7a17a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 13:38:29 -0200, Carlos Santos wrote:

> +# This package is really annoying since the archive name doesn't contain the
> +# version. Use a small trick to save it with a better name.
> +define IQVLINUX_DOWNLOAD
> +	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
> +		-o $(DL_DIR)/$(IQVLINUX_SOURCE) \
> +		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +		-- \
> +		$(IQVLINUX_SITE)/iqvlinux.tar.gz
> +endef
> +
> +IQVLINUX_PRE_DOWNLOAD_HOOKS = IQVLINUX_DOWNLOAD

So instead of this, I've added an iqvlinux-1.2.0.3.tar.gz tarball on
sources.buildroot.net, and just kept iqvlinux download first from
SourceForge (which fails with a 404), and then fall back to
sources.buildroot.net.

Accessing directly the download helper is not a good idea. The download
helpers are internal, and they are being changed by Maxime/Yann patch
series introducing Git caching, so we really don't want packages to
mess up with the download internals.

It would be good if you could reply on the bug report upstream, explain
why and how you use iqvlinux, and convince them to fix their tarball
name.

I've applied both patches to master, after doing the change explained
above. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
