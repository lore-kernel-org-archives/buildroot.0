From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 00:04:44 +0200
Subject: [Buildroot] [PATCH 2/2] Add pycli package
In-Reply-To: <1437912738-24116-2-git-send-email-geoffrey.ragot@gmail.com>
References: <1437912738-24116-1-git-send-email-geoffrey.ragot@gmail.com>
 <1437912738-24116-2-git-send-email-geoffrey.ragot@gmail.com>
Message-ID: <20150729000444.0ffdc124@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Geoffrey Ragot,

On Sun, 26 Jul 2015 14:12:18 +0200, Geoffrey Ragot wrote:
> Signed-off-by: Geoffrey Ragot <geoffrey.ragot@gmail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-pycli/Config.in       |  4 ++++
>  package/python-pycli/python-pycli.mk | 15 +++++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/python-pycli/Config.in
>  create mode 100644 package/python-pycli/python-pycli.mk

I've applied this patch, but had to fix a number of different things
before that. See below.

> diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
> new file mode 100644
> index 0000000..a4f157e
> --- /dev/null
> +++ b/package/python-pycli/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_PYTHON_PYCLI
> +	bool "python-pycli"
> +	help
> +	  The cli package is a framework for making simple, correct command line applications in Python.

This line is too long. Text should be wrapped so that it fits in 72
columns.

Also, Config.in help text should have the URL of the project homepage.

> diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
> new file mode 100644
> index 0000000..6857425
> --- /dev/null
> +++ b/package/python-pycli/python-pycli.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pycli
> +#
> +################################################################################
> +
> +PYTHON_PYCLI_VERSION = devel

This is a strange version, which probably indicates they will change
the tarball contents without changing the version. You missed the hash
file, which would allow to check this, so I've added the hash file.

> +PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
> +PYTHON_PYCLI_SITE = https://pypi.python.org/packages/source/p/pyCLI/
> +PYTHON_PYCLI_SETUP_TYPE = distutils

First definition of <pkg>_SETUP_TYPE.

> +PYTHON_PYCLI_LICENSE = Python software foundation license v2
> +PYTHON_PYCLI_LICENSE_FILES = LICENSE

There was no file named LICENSE in the source directory. And the
contents of the source tree was a bit fuzzy in terms of license,
mentioning some code having Apache-2.0, some other MIT, but the main
file indicating an ISC-like license. So I opted for that one as the
license.

> +PYTHON_PYCLI_SETUP_TYPE = setuptools

And second definition of <pkg>_SETUP_TYPE. So I kept only this one.

Also, as I've said, I've added a hash file as well.

See
http://git.buildroot.net/buildroot/commit/?id=1ec19e5e47486d2ba61564b37f1c8b6e62ec6d28
for the final commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
