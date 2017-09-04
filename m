From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 4 Sep 2017 19:21:34 +0200
Subject: [Buildroot] PATCH python-libusb1: new package
In-Reply-To: <20170904151954.9550-1-jaap@jcz.nl>
References: <20170904151954.9550-1-jaap@jcz.nl>
Message-ID: <CAGm1_ku+ASG+cBqfrdEphqTxQ_vOhDj8p=_dp0TGoFu2NeEjyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jaap,

On Mon, Sep 4, 2017 at 5:19 PM, Jaap Crezee <jaap@jcz.nl> wrote:
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>
> ---
>  package/Config.in                          |  1 +
>  package/python-libusb1/Config.in           | 10 ++++++++++
>  package/python-libusb1/python-libusb1.hash |  2 ++
>  package/python-libusb1/python-libusb1.mk   | 15 +++++++++++++++

DEVELOPERS file entry missing.

>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-libusb1/Config.in
>  create mode 100644 package/python-libusb1/python-libusb1.hash
>  create mode 100644 package/python-libusb1/python-libusb1.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 66ce307018..8992751310 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -772,6 +772,7 @@ menu "External python modules"
>         source "package/python-json-schema-validator/Config.in"
>         source "package/python-keyring/Config.in"
>         source "package/python-libconfig/Config.in"
> +       source "package/python-libusb1/Config.in"
>         source "package/python-lmdb/Config.in"
>         source "package/python-logbook/Config.in"
>         source "package/python-lxml/Config.in"
> diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
> new file mode 100644
> index 0000000000..1d08a8e170
> --- /dev/null
> +++ b/package/python-libusb1/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_LIBUSB1
> +       bool "python-libusb1"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +       select BR2_PACKAGE_LIBUSB
> +       help
> +         Pure-python wrapper for libusb-1.0

Homepage link missing. https://github.com/vpelletier/python-libusb1

> +
> +
> +comment "python-libusb1 needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
> new file mode 100644
> index 0000000000..f39d25234e
> --- /dev/null
> +++ b/package/python-libusb1/python-libusb1.hash
> @@ -0,0 +1,2 @@

Comment about checksum origins missing. See
package/python-tornado/python-tornado.hash for the reference.

> +md5     9c2eb6032deda59f287a443091d38cb4 libusb1-1.6.4.tar.gz
> +sha256  8c930d9c1d037d9c83924c82608aa6a1adcaa01ca0e4a23ee0e8e18d7eee670d  libusb1-1.6.4.tar.gz
> diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
> new file mode 100644
> index 0000000000..0740b954d5
> --- /dev/null
> +++ b/package/python-libusb1/python-libusb1.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-libusb1
> +#
> +################################################################################
> +
> +PYTHON_LIBUSB1_VERSION = 1.6.4
> +PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
> +PYTHON_LIBUSB1_SITE = https://pypi.python.org/packages/ec/5d/4fdac6c53525786fe35cff035c3345452e24e2bee5627893be65d12555cb
> +PYTHON_LIBUSB1_LICENSE = LGPL v2.1+
> +PYTHON_LIBUSB1_LICENSE_FILES = COPYING COPYING.LESSER
> +PYTHON_LIBUSB1_SETUP_TYPE = distutils

Should be setuptools

Yegor

> +PYTHON_LIBUSB1_DEPENDENCIES = libusb
> +
> +$(eval $(python-package))
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
