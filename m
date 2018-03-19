From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 19 Mar 2018 11:08:23 -0500
Subject: [Buildroot] [PATCH v1 2/3] python-networkx: Update to add
 networkx package
In-Reply-To: <1521472992-42812-2-git-send-email-jared.bents@rockwellcollins.com>
References: <1521472992-42812-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521472992-42812-2-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <CANQCQpb1WMjYV4NRDKxzcaaRNDUULsCEAwZa3VHwhv7kr2uWvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jared,

On Mon, Mar 19, 2018 at 10:23 AM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
> Update to add python-networkx package to buildroot. While 2.1
> is the latest version, the current version of setools does not
> work with versions past 1.11.

Unsure about this dependency being enforced long term....  Suggest
adding this as a comment above the PYTHON_NETWORKX_VERSION in the .mk?

>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-networkx/Config.in            | 10 ++++++++++
>  package/python-networkx/python-networkx.hash |  4 ++++
>  package/python-networkx/python-networkx.mk   | 17 +++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/python-networkx/Config.in
>  create mode 100644 package/python-networkx/python-networkx.hash
>  create mode 100644 package/python-networkx/python-networkx.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9a6b199..d0655d3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -825,6 +825,7 @@ menu "External python modules"
>         source "package/python-netaddr/Config.in"
>         source "package/python-netifaces/Config.in"
>         source "package/python-networkmanager/Config.in"
> +       source "package/python-networkx/Config.in"
>         source "package/python-nfc/Config.in"
>         source "package/python-numpy/Config.in"
>         source "package/python-oauthlib/Config.in"
> diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
> new file mode 100644
> index 0000000..45c83ab
> --- /dev/null
> +++ b/package/python-networkx/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_NETWORKX
> +       bool "python-networkx"
> +       select BR2_PACKAGE_PYTHON_DECORATOR
> +       select BR2_PACKAGE_PYTHON_SETUPTOOLS
> +       help
> +         A Python package for the creation, manipulation,
> +         and study of the structure, dynamics, and
> +         functions of complex networks.
> +
> +         https://pypi.python.org/pypi/networkx
> diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
> new file mode 100644
> index 0000000..92383e7
> --- /dev/null
> +++ b/package/python-networkx/python-networkx.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/networks/json, sha256 locally computed
> +md5 6ef584a879e9163013e9a762e1cf7cd1 networkx-1.11.tar.gz
> +sha256 0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8 networkx-1.11.tar.gz
> +sha256 f4c13bf0e83bef45116ebda6c360066df6fd99610efaea9790b998c5441b0c0d LICENSE.txt
> diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
> new file mode 100644
> index 0000000..ec4abc9
> --- /dev/null
> +++ b/package/python-networkx/python-networkx.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-networkx
> +#
> +################################################################################
> +
> +PYTHON_NETWORKX_VERSION = 1.11
> +PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
> +PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
> +PYTHON_NETWORKX_DEPENDENCIES = python-decorator
> +PYTHON_NETWORKX_LICENSE = BSD-3-Clause
> +PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
> +PYTHON_NETWORKX_SETUP_TYPE = setuptools
> +HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Did you run the utils/check-package script against these new packages?

Matt
