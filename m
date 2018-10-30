From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 30 Oct 2018 21:38:21 +0100
Subject: [Buildroot] [PATCH 1/1] python-scapy: new package
In-Reply-To: <20181026055731.2865-1-asafka7@gmail.com>
References: <20181026055731.2865-1-asafka7@gmail.com>
Message-ID: <CAGm1_ku5HJCF3w6E4O=8J9jMSdDKwZcCMfbX5iTgzz=E23Rd6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 26, 2018 at 7:57 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Interactive packet manipulation tool.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                      |  1 +
>  package/python-scapy/Config.in         |  8 ++++++++
>  package/python-scapy/python-scapy.hash |  5 +++++
>  package/python-scapy/python-scapy.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-scapy/Config.in
>  create mode 100644 package/python-scapy/python-scapy.hash
>  create mode 100644 package/python-scapy/python-scapy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 710cde6691..93f4ba63c7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1001,6 +1001,7 @@ menu "External python modules"
>         source "package/python-rpi-gpio/Config.in"
>         source "package/python-rtslib-fb/Config.in"
>         source "package/python-scandir/Config.in"
> +       source "package/python-scapy/Config.in"
>         source "package/python-scapy3k/Config.in"
>         source "package/python-schedule/Config.in"
>         source "package/python-sdnotify/Config.in"
> diff --git a/package/python-scapy/Config.in b/package/python-scapy/Config.in
> new file mode 100644
> index 0000000000..6575a33af3
> --- /dev/null
> +++ b/package/python-scapy/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_SCAPY
> +       bool "python-scapy"
> +       select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
> +       help
> +         Scapy: interactive packet manipulation tool.
> +
> +         http://www.secdev.org/projects/scapy
> diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
> new file mode 100644
> index 0000000000..4d8001b752
> --- /dev/null
> +++ b/package/python-scapy/python-scapy.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/scapy/json
> +md5    d7d3c4294f5a718e234775d38dbeb7ec  scapy-2.4.0.tar.gz
> +sha256 452f714f5c2eac6fd0a6146b1dbddfc24dd5f4103f3ed76227995a488cfb2b73  scapy-2.4.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 7a49a7fdaf7b648e451dd01e4875cf4dbfa556c6359c6b97feed5047540ea989  PKG-INFO
> diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
> new file mode 100644
> index 0000000000..c44b2cb2e5
> --- /dev/null
> +++ b/package/python-scapy/python-scapy.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-scapy
> +#
> +################################################################################
> +
> +PYTHON_SCAPY_VERSION = 2.4.0
> +PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
> +PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/68/01/b9943984447e7ea6f8948e90c1729b78161c2bb3eef908430638ec3f7296
> +PYTHON_SCAPY_LICENSE = GPL-2.0
> +PYTHON_SCAPY_LICENSE_FILES = PKG-INFO
> +PYTHON_SCAPY_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
