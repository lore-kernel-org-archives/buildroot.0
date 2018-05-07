From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 7 May 2018 11:55:04 +0200
Subject: [Buildroot] [PATCH 1/2] python-py: new package
In-Reply-To: <20180505120944.18604-1-asafka7@gmail.com>
References: <20180505120944.18604-1-asafka7@gmail.com>
Message-ID: <CAGm1_ksuGy_dswqob+GSaupGY9Ry6NAv8FeCou4LwEARstFh4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 5, 2018 at 2:09 PM, Asaf Kahlon <asafka7@gmail.com> wrote:
> library with cross-python path, ini-parsing, io, code, log facilities.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/python-py/Config.in      |  7 +++++++
>  package/python-py/python-py.hash |  4 ++++
>  package/python-py/python-py.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-py/Config.in
>  create mode 100644 package/python-py/python-py.hash
>  create mode 100644 package/python-py/python-py.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 24d134cb70..7c0b7f0f28 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -191,6 +191,7 @@ F:  package/stress/
>
>  N:     Asaf Kahlon <asafka7@gmail.com>
>  F:     package/python-jsonmodels/
> +F:     package/python-py/
>  F:     package/python-subprocess32/
>  F:     package/python-yieldfrom/
>  F:     package/zeromq/
> diff --git a/package/Config.in b/package/Config.in
> index fe36d31867..5c3c92d68b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -869,6 +869,7 @@ menu "External python modules"
>         source "package/python-psycopg2/Config.in"
>         source "package/python-ptyprocess/Config.in"
>         source "package/python-pudb/Config.in"
> +       source "package/python-py/Config.in"
>         source "package/python-pyasn/Config.in"
>         source "package/python-pyasn-modules/Config.in"
>         source "package/python-pycli/Config.in"
> diff --git a/package/python-py/Config.in b/package/python-py/Config.in
> new file mode 100644
> index 0000000000..354372f5b4
> --- /dev/null
> +++ b/package/python-py/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PY
> +       bool "python-py"
> +       help
> +         library with cross-python path, ini-parsing, io, code, log
> +         facilities.
> +
> +         http://py.readthedocs.io/
> diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
> new file mode 100644
> index 0000000000..66a96fd4c1
> --- /dev/null
> +++ b/package/python-py/python-py.hash
> @@ -0,0 +1,4 @@
> +# sha256 from https://pypi.org/pypi/py/json
> +sha256 29c9fab495d7528e80ba1e343b958684f4ace687327e6f789a94bf3d1915f881  py-1.5.3.tar.gz
> +# Locally computed sha256 checksums
> +sha256 2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
> diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
> new file mode 100644
> index 0000000000..1e3f2393da
> --- /dev/null
> +++ b/package/python-py/python-py.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-py
> +#
> +################################################################################
> +
> +PYTHON_PY_VERSION = 1.5.3
> +PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
> +PYTHON_PY_SITE = https://files.pythonhosted.org/packages/f7/84/b4c6e84672c4ceb94f727f3da8344037b62cee960d80e999b1cd9b832d83
> +PYTHON_PY_SETUP_TYPE = setuptools
> +PYTHON_PY_LICENSE = MIT
> +PYTHON_PY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.17.0
>
