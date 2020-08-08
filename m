From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 00:15:50 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/python3-pycryptodomex: new
 package
In-Reply-To: <20200722071030.16128-3-hi@senzilla.io>
References: <20200722071030.16128-3-hi@senzilla.io>
Message-ID: <20200809001550.001cccd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jul 2020 07:11:26 +0000
Dick Olsson <hi@senzilla.io> wrote:

> diff --git a/package/python3-pycryptodomex/Config.in b/package/python3-pycryptodomex/Config.in
> new file mode 100644
> index 0000000000..4f16333125
> --- /dev/null
> +++ b/package/python3-pycryptodomex/Config.in

This file was not needed, it was not even referenced from anywhere.
python3-pycryptodomex should be a host only package anyway.
> diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.hash b/package/python3-pycryptodomex/python3-pycryptodomex.hash
> new file mode 100644
> index 0000000000..dc428fe5f8
> --- /dev/null
> +++ b/package/python3-pycryptodomex/python3-pycryptodomex.hash

This file should have been a symlink to
package/python-cryptodomex/python-cryptodomex.hash, this is how we
handle this with other Python modules that have two variants.

> diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> new file mode 100644
> index 0000000000..fd6b04e85b
> --- /dev/null
> +++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python3-pycryptodomex
> +#
> +################################################################################
> +
> +# Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
> +PYTHON3_PYCRYPTODOMEX_VERSION = 3.9.8
> +PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
> +PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
> +PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
> +PYTHON3_PYCRYPTODOMEX_LICENSE = \
> +	BSD-2-Clause, \
> +	Public Domain (pycrypto original code), \
> +	OCB patent license (OCB mode)
> +PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
> +HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
> +HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
> +
> +$(eval $(python-package))

This line was not needed: we only need a host package.

> +$(eval $(host-python-package))

I fixed the above issues and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
