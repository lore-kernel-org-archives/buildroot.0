From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 7 May 2018 12:04:15 +0200
Subject: [Buildroot] [PATCH 1/2] python-cython: new package
In-Reply-To: <20180507030032.22819-1-joseph.kogut@gmail.com>
References: <20180507030032.22819-1-joseph.kogut@gmail.com>
Message-ID: <CAGm1_kt1EtUsjdddM0Rn9y0tb9QR059LQJj9he=B+DqTAdvE0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 7, 2018 at 5:00 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in.host                   |  1 +
>  package/python-cython/Config.in.host     |  7 +++++++
>  package/python-cython/python-cython.hash |  6 ++++++
>  package/python-cython/python-cython.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-cython/Config.in.host
>  create mode 100644 package/python-cython/python-cython.hash
>  create mode 100644 package/python-cython/python-cython.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 24d134cb70..3ddb292894 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -934,6 +934,7 @@ F:  configs/qemu_ppc64le_pseries_defconfig
>
>  N:     Joseph Kogut <joseph.kogut@gmail.com>
>  F:     package/gconf/
> +F:     package/python-cython/
>  F:     package/python-raven/
>  F:     package/python-schedule/
>  F:     package/python-websockets/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index a8a4c1f802..38543e7390 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -43,6 +43,7 @@ menu "Host utilities"
>         source "package/pkgconf/Config.in.host"
>         source "package/pru-software-support/Config.in.host"
>         source "package/pwgen/Config.in.host"
> +       source "package/python-cython/Config.in.host"
>         source "package/python-lxml/Config.in.host"
>         source "package/python-six/Config.in.host"
>         source "package/python-xlrd/Config.in.host"
> diff --git a/package/python-cython/Config.in.host b/package/python-cython/Config.in.host
> new file mode 100644
> index 0000000000..b69e59b718
> --- /dev/null
> +++ b/package/python-cython/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PYTHON_CYTHON
> +       bool "host python-cython"
> +       help
> +         The Cython compiler for writing C extensions for the Python
> +         language.
> +
> +         http://cython.org/
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> new file mode 100644
> index 0000000000..3b918dc704
> --- /dev/null
> +++ b/package/python-cython/python-cython.hash
> @@ -0,0 +1,6 @@
> +# md5 from https://pypi.python.org/pypi/Cython/json, sha256 locally computed
> +md5    6149238287d662bd5d5e572482252493  Cython-0.27.3.tar.gz
> +sha256 6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64  Cython-0.27.3.tar.gz
> +# License files, locally calculated
> +sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
> +sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> new file mode 100644
> index 0000000000..88eab83416
> --- /dev/null
> +++ b/package/python-cython/python-cython.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# cython
> +#
> +################################################################################
> +
> +PYTHON_CYTHON_VERSION = 0.27.3
> +PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
> +PYTHON_CYTHON_SITE = https://pypi.python.org/packages/ee/2a/c4d2cdd19c84c32d978d18e9355d1ba9982a383de87d0fcb5928553d37f4
> +PYTHON_CYTHON_SETUP_TYPE = setuptools
> +PYTHON_CYTHON_LICENSE = Apache-2.0
> +PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
> +
> +$(eval $(host-python-package))
> --
> 2.17.0
>
