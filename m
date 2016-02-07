From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Feb 2016 08:42:57 +0100
Subject: [Buildroot] [PATCH v4 11/17] python-pyasn-modules: new package
In-Reply-To: <1454799603-5474-12-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-12-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuFLmNjGFTcXvmsccXvbGj9JZf03N_nf2Dk4N84WcfSPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 6, 2016 at 11:59 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>
> ---
> Changes v3 -> v4
>   - marked dependency to python-pyasn as "# runtime" Config.in (suggested by Y.Yefremov)
>   - removed build-time dependency in python-pyasn-modules.mk (suggested by Y.Yefremov)
>   - changed license (BSD -> BSD-2c) in python-pyasn-modules.mk (suggested by Y.Yefremov)
>
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                      |  1 +
>  package/python-pyasn-modules/Config.in                 | 11 +++++++++++
>  package/python-pyasn-modules/python-pyasn-modules.hash |  3 +++
>  package/python-pyasn-modules/python-pyasn-modules.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-pyasn-modules/Config.in
>  create mode 100644 package/python-pyasn-modules/python-pyasn-modules.hash
>  create mode 100644 package/python-pyasn-modules/python-pyasn-modules.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9d96956..8c079b0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -679,6 +679,7 @@ menu "External python modules"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
>         source "package/python-pyasn/Config.in"
> +       source "package/python-pyasn-modules/Config.in"
>         source "package/python-pycli/Config.in"
>         source "package/python-pycparser/Config.in"
>         source "package/python-pycrypto/Config.in"
> diff --git a/package/python-pyasn-modules/Config.in b/package/python-pyasn-modules/Config.in
> new file mode 100644
> index 0000000..387020d
> --- /dev/null
> +++ b/package/python-pyasn-modules/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_PYASN_MODULES
> +       bool "python-pyasn-modules"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       select BR2_PACKAGE_PYASN # runtime
> +       help
> +         A collection of ASN.1-based protocols modules.
> +
> +         https://pypi.python.org/pypi/pyasn1-modules
> +
> +comment "python-pyasn-modules needs a toolchain w/ C++"
> +       depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/python-pyasn-modules/python-pyasn-modules.hash b/package/python-pyasn-modules/python-pyasn-modules.hash
> new file mode 100644
> index 0000000..6d9a707
> --- /dev/null
> +++ b/package/python-pyasn-modules/python-pyasn-modules.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=178129bc7fbf07215c25230c5f053f81, sha256 locally computed.
> +md5    178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
> +sha256 10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
> diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
> new file mode 100644
> index 0000000..bb32227
> --- /dev/null
> +++ b/package/python-pyasn-modules/python-pyasn-modules.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyasn-modules
> +#
> +################################################################################
> +
> +PYTHON_PYASN_MODULES_VERSION = 0.0.8
> +PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
> +PYTHON_PYASN_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
> +PYTHON_PYASN_MODULES_LICENSE = BSD-2c
> +PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
> +PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
