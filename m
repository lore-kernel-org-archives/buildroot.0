From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Feb 2020 12:50:13 +0100
Subject: [Buildroot] [PATCH 2/4] package/python-botocore: new package.
In-Reply-To: <20200207114350.31365-3-raphael.melotte@essensium.com>
References: <20200207114350.31365-1-raphael.melotte@essensium.com>
 <20200207114350.31365-3-raphael.melotte@essensium.com>
Message-ID: <CAGm1_kv827Jp3x_QO95APckJ=9E++nkdzmH6N_=NMy7pSt3MYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 7, 2020 at 12:44 PM Rapha?l M?lotte
<raphael.melotte@essensium.com> wrote:
>
> Low-level, data-driven core of boto 3.
>
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-botocore/Config.in            | 10 ++++++++++
>  package/python-botocore/python-botocore.hash |  5 +++++
>  package/python-botocore/python-botocore.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-botocore/Config.in
>  create mode 100644 package/python-botocore/python-botocore.hash
>  create mode 100644 package/python-botocore/python-botocore.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ea44b0709a..5aa26a88af 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2077,6 +2077,7 @@ F:        package/uhttpd/
>  F:     package/ustream-ssl/
>
>  N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
> +F:  package/python-botocore/
>  F:  package/python-jmespath/
>
>  N:     Refik Tuzakli <tuzakli.refik@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index 920de84a7e..9279ad20c9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -877,6 +877,7 @@ menu "External python modules"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bitstring/Config.in"
>         source "package/python-bluezero/Config.in"
> +       source "package/python-botocore/Config.in"
>         source "package/python-bottle/Config.in"
>         source "package/python-brotli/Config.in"
>         source "package/python-bunch/Config.in"
> diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
> new file mode 100644
> index 0000000000..a552900b6c
> --- /dev/null
> +++ b/package/python-botocore/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_BOTOCORE
> +       bool "python-botocore"
> +       select BR2_PACKAGE_PYTHON_JMESPATH # runtime
> +       select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
> +       select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
> +       select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
> +       help
> +         Low-level, data-driven core of boto 3.
> +
> +         https://github.com/boto/botocore
> diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
> new file mode 100644
> index 0000000000..199c4cdff1
> --- /dev/null
> +++ b/package/python-botocore/python-botocore.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/botocore/json
> +md5    a75ae28d58d64dbf689d18ac3424342a  botocore-1.12.210.tar.gz
> +sha256 7983b7624b3f71648a7101fbcb437e3d599b4f79b754e89220e574482a2f8298  botocore-1.12.210.tar.gz
> +# Locally computed sha256 checksums
> +sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
> diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
> new file mode 100644
> index 0000000000..378bd93768
> --- /dev/null
> +++ b/package/python-botocore/python-botocore.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-botocore
> +#
> +################################################################################
> +
> +PYTHON_BOTOCORE_VERSION = 1.12.210
> +PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
> +PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/39/78/068e7cf5bb9901f34eacbf449cdfbdf32e470333930cbcda890cfc9fb820
> +PYTHON_BOTOCORE_SETUP_TYPE = setuptools
> +PYTHON_BOTOCORE_LICENSE = Apache-2.0
> +PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.23.0
>
