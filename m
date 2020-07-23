From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 09:54:21 +0200
Subject: [Buildroot] [PATCH 02/12] package/libbytesize: new package
In-Reply-To: <20200723010810.3237608-3-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-3-aduskett@gmail.com>
Message-ID: <20200723095421.7fca4153@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

In Cc, I'm adding Vadim as there are some gettext-tiny questions below.

On Wed, 22 Jul 2020 18:08:00 -0700
aduskett at gmail.com wrote:

> Libbytesize is a tiny library providing a C "class" for working with
> arbitrary big sizes in bytes.

"tiny library", which needs gmp, mpfr and pcre2 :-)

> +LIBBYTESIZE_VERSION = 2.3
> +LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
> +LIBBYTESIZE_LICENSE = LGPL-2.1+
> +LIBBYTESIZE_LICENSE_FILES = LICENSE
> +LIBBYTESIZE_INSTALL_STAGING = YES
> +
> +# gettext-gnu is needed for msgcat which gettext-tiny does not provide,

Meh, this is not great :-/

I had a quick look, and there is interestingly an issue on the
gettext-tiny tracker:

  https://github.com/sabotage-linux/gettext-tiny/issues/34

and it precisely says that msgcat and msgfilter are missing to build
libbytesize. It says msgcat is in fact not used/needed by libbytesize,
and the msgfilter tool is only used for the Serbian translation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
