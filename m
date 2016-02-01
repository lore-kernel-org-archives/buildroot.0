From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 15:36:41 +0100
Subject: [Buildroot] [PATCH 16/22] package/python-txaio: new package.
In-Reply-To: <1454335541-14224-17-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-17-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuW1JR-soAJU+V2zREVSAgH_+6eT=NcR4RchTGRe6_PcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                      |  1 +
>  package/python-txaio/Config.in         |  8 ++++++++
>  package/python-txaio/python-txaio.hash |  3 +++
>  package/python-txaio/python-txaio.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-txaio/Config.in
>  create mode 100644 package/python-txaio/python-txaio.hash
>  create mode 100644 package/python-txaio/python-txaio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c581cf8..44a65d1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -720,6 +720,7 @@ menu "External python modules"
>         source "package/python-tornado/Config.in"
>         source "package/python-treq/Config.in"
>         source "package/python-twisted/Config.in"
> +       source "package/python-txaio/Config.in"
>         source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
>         source "package/python-versiontools/Config.in"
> diff --git a/package/python-txaio/Config.in b/package/python-txaio/Config.in
> new file mode 100644
> index 0000000..24892b6
> --- /dev/null
> +++ b/package/python-txaio/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_TXAIO
> +       bool "python-txaio"
> +       depends on BR2_PACKAGE_PYTHON

remove "depends"

select PYTHON_SIX is missing see
https://github.com/crossbario/txaio/blob/master/setup.py#L98

> +       help
> +         Hhh.
> +
> +         https://pypi.python.org/pypi/txaio
> +
> diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
> new file mode 100644
> index 0000000..91d1d1b
> --- /dev/null
> +++ b/package/python-txaio/python-txaio.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    c2a7e6ebfdf8987c3938e40e39a3c5e7  txaio-2.2.1.tar.gz
> +sha256 6eee00c397d8193d15313dfc36da3eac8d64edf0b92fe3b67cd5a735ffc3074b  txaio-2.2.1.tar.gz
> diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
> new file mode 100644
> index 0000000..19d7028
> --- /dev/null
> +++ b/package/python-txaio/python-txaio.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-txaio
> +#
> +################################################################################
> +
> +PYTHON_TXAIO_VERSION = 2.2.1
> +PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
> +PYTHON_TXAIO_SITE = http://pypi.python.org/packages/source/t/txaio
> +PYTHON_TXAIO_LICENSE = BSD
> +#PYTHON_TXAIO_LICENSE_FILES = LICENSE
> +PYTHON_TXAIO_SETUP_TYPE = setuptools
> +#PYTHON_TXAIO_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
