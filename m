From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 5 Feb 2016 20:33:35 +0100
Subject: [Buildroot] [PATCH v3 10/17] python-txaio: new package
In-Reply-To: <1454696337-9692-11-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
 <1454696337-9692-11-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ksqFKda9fEWH6mvD78F_b+HhLzUeb+9P=pOPe96WVRKJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 5, 2016 at 7:18 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                      |  1 +
>  package/python-txaio/Config.in         |  7 +++++++
>  package/python-txaio/python-txaio.hash |  3 +++
>  package/python-txaio/python-txaio.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-txaio/Config.in
>  create mode 100644 package/python-txaio/python-txaio.hash
>  create mode 100644 package/python-txaio/python-txaio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index fb285d9..0257350 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -723,6 +723,7 @@ menu "External python modules"
>         source "package/python-tornado/Config.in"
>         source "package/python-treq/Config.in"
>         source "package/python-twisted/Config.in"
> +       source "package/python-txaio/Config.in"
>         source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
>         source "package/python-versiontools/Config.in"
> diff --git a/package/python-txaio/Config.in b/package/python-txaio/Config.in
> new file mode 100644
> index 0000000..9d42382
> --- /dev/null
> +++ b/package/python-txaio/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_TXAIO
> +       bool "python-txaio"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       help
> +         Compatibility API between asyncio/Twisted/Trollius.
> +
> +         https://pypi.python.org/pypi/txaio
> diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
> new file mode 100644
> index 0000000..5d9e6cf
> --- /dev/null
> +++ b/package/python-txaio/python-txaio.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c2a7e6ebfdf8987c3938e40e39a3c5e7, sha256 locally computed
> +md5    c2a7e6ebfdf8987c3938e40e39a3c5e7  txaio-2.2.1.tar.gz
> +sha256 6eee00c397d8193d15313dfc36da3eac8d64edf0b92fe3b67cd5a735ffc3074b  txaio-2.2.1.tar.gz
> diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
> new file mode 100644
> index 0000000..127bc62
> --- /dev/null
> +++ b/package/python-txaio/python-txaio.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-txaio
> +#
> +################################################################################
> +
> +PYTHON_TXAIO_VERSION = 2.2.1
> +PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
> +PYTHON_TXAIO_SITE = http://pypi.python.org/packages/source/t/txaio
> +PYTHON_TXAIO_LICENSE = MIT
> +PYTHON_TXAIO_LICENSE_FILES = LICENSE
> +PYTHON_TXAIO_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
