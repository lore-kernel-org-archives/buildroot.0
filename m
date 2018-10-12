From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 12 Oct 2018 14:48:53 +0200
Subject: [Buildroot] [PATCH 1/1] python-py: new package
In-Reply-To: <20181012123441.5406-1-asafka7@gmail.com>
References: <20181012123441.5406-1-asafka7@gmail.com>
Message-ID: <CAGm1_kvnqza96K1VVoagHwxr+5ySyk93ZRKBo2qOsth44f4k+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 12, 2018 at 2:34 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> library with cross-python path, ini-parsing, io, code, log
> facilities.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/python-py/Config.in      |  7 +++++++
>  package/python-py/python-py.hash |  5 +++++
>  package/python-py/python-py.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-py/Config.in
>  create mode 100644 package/python-py/python-py.hash
>  create mode 100644 package/python-py/python-py.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 990621fb11..341bf7de3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -217,6 +217,7 @@ F:  package/python-paramiko/
>  F:     package/python-passlib/
>  F:     package/python-ply/
>  F:     package/python-priority/
> +F:     package/python-py/
>  F:     package/python-pyasn1/
>  F:     package/python-pyasn1-modules/
>  F:     package/python-pycryptodomex/
> diff --git a/package/Config.in b/package/Config.in
> index 8d995f82e6..fd86e37a52 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -943,6 +943,7 @@ menu "External python modules"
>         source "package/python-psycopg2/Config.in"
>         source "package/python-ptyprocess/Config.in"
>         source "package/python-pudb/Config.in"
> +       source "package/python-py/Config.in"
>         source "package/python-pyasn/Config.in"
>         source "package/python-pyasn-modules/Config.in"
>         source "package/python-pyasn1/Config.in"
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

Use capital 'L' :-)

Other than that, I'm OK with the patch. You can add my:

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

> +         facilities.
> +
> +         http://py.readthedocs.io/
> diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
> new file mode 100644
> index 0000000000..67926527cd
> --- /dev/null
> +++ b/package/python-py/python-py.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/py/json
> +md5    e53ac12db4286737837ef3ccb4158301  py-1.7.0.tar.gz
> +sha256 bf92637198836372b520efcba9e020c330123be8ce527e535d185ed4b6f45694  py-1.7.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
> diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
> new file mode 100644
> index 0000000000..e9c4d0a3b5
> --- /dev/null
> +++ b/package/python-py/python-py.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-py
> +#
> +################################################################################
> +
> +PYTHON_PY_VERSION = 1.7.0
> +PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
> +PYTHON_PY_SITE = https://files.pythonhosted.org/packages/c7/fa/eb6dd513d9eb13436e110aaeef9a1703437a8efa466ce6bb2ff1d9217ac7
> +PYTHON_PY_SETUP_TYPE = setuptools
> +PYTHON_PY_LICENSE = MIT
> +PYTHON_PY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
