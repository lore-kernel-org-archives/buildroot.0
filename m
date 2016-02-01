From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:08:02 +0100
Subject: [Buildroot] [PATCH 18/22] package/python-pyasn1-modules: new
	package.
In-Reply-To: <1454335541-14224-19-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-19-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ku2fJv6jYdZPK8=fUSnOOQ-UPXMS=QYu78JQfZVXRWh1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                                        |  1 +
>  package/python-pyasn1-modules/Config.in                  |  8 ++++++++
>  package/python-pyasn1-modules/python-pyasn1-modules.hash |  3 +++
>  package/python-pyasn1-modules/python-pyasn1-modules.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-pyasn1-modules/Config.in
>  create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.hash
>  create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 606dacc..5221cfe 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -679,6 +679,7 @@ menu "External python modules"
>         source "package/python-protobuf/Config.in"
>         source "package/python-psutil/Config.in"
>         source "package/python-pyasn/Config.in"
> +       source "package/python-pyasn1-modules/Config.in"
>         source "package/python-pycli/Config.in"
>         source "package/python-pycparser/Config.in"
>         source "package/python-pycrypto/Config.in"
> diff --git a/package/python-pyasn1-modules/Config.in b/package/python-pyasn1-modules/Config.in
> new file mode 100644
> index 0000000..debad96
> --- /dev/null
> +++ b/package/python-pyasn1-modules/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYASN1_MODULES
> +       bool "python-pyasn1-modules"
> +       depends on BR2_PACKAGE_PYTHON

remove depends and add select for pyasn

> +       help
> +         A collection of ASN.1-based protocols modules.
> +
> +         https://pypi.python.org/pypi/pyasn1-modules
> +
> diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
> new file mode 100644
> index 0000000..81690d6
> --- /dev/null
> +++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
> +sha256 10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
> diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
> new file mode 100644
> index 0000000..69da1ea
> --- /dev/null
> +++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pyasn1-modules
> +#
> +################################################################################
> +
> +PYTHON_PYASN1_MODULES_VERSION = 0.0.8
> +PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
> +PYTHON_PYASN1_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
> +PYTHON_PYASN1_MODULES_LICENSE = BSD
> +#PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE
> +PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
> +#PYTHON_PYASN1_MODULES_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
