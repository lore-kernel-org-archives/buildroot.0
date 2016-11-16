From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 00:04:55 +0100
Subject: [Buildroot] [PATCH 03/10] docs/manual: document the waf-package
 infra
In-Reply-To: <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <e41ab5eee8961c89c1fe9c4566383844e36b24f9.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161117000456.04b7e672@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:14 +0100, Yann E. MORIN wrote:

> +------------------------
> +01: ################################################################################
> +02: #
> +03: # libfoo
> +04: #
> +05: ################################################################################
> +06:
> +07: LIBFOO_VERSION = 1.0
> +08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
> +09: LIBFOO_SITE = http://www.foosoftware.org/download
> +10: LIBFOO_CONF_OPTS = --eanble-bar --disable-baz

eanble -> enable

> +On line 7, we declare the version of the package.
> +
> +On line 8 and 9, we declare the name of the tarball (xz-ed tarball
> +recommended) and the location of the tarball on the Web. Buildroot
> +will automatically download the tarball from this location.
> +
> +On line 10, we tell Buildroot what options to enable for libfoo.
> +
> +On line 11, we tell Buildroot the depednencies of libfoo.
> +
> +Finally, on line line 13, we invoke the +waf-package+
> +macro that generates all the Makefile rules that actually allows the
> +package to be built.

To be honest, I'm wondering if we shouldn't refactor the manual. This
blurb is duplicated for every package infrastructure, without adding
much value.

But clearly that's a separate matter, and your patch is good as-is.

> +* +LIBFOO_BUNDLED_WAF+ can be set to +YES+ or +NO+ to tell Buildroot to
> +  use the bundled +waf+ executable. If set to +YES+, the default, then

YES is in fact not the default :-)

> +  Buildroot will use the waf executable in the package source tree; if
> +  set to +NO+, then Buidlroot will download and install waf as a

Buildroot.

> +  host-tool.

host tool (i.e no dash in between).

No need to resend for these issues, I can fixup when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
