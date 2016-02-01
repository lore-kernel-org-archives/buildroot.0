From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:11:26 +0100
Subject: [Buildroot] [PATCH 03/22] package/python-cbor: new package.
In-Reply-To: <1454335541-14224-4-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-4-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kudL9wO7vx9++3ybQ3ZTGqfjQaXDpTR+fQxQSYRrUPe0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                    |  1 +
>  package/python-cbor/Config.in        |  8 ++++++++
>  package/python-cbor/python-cbor.hash |  3 +++
>  package/python-cbor/python-cbor.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-cbor/Config.in
>  create mode 100644 package/python-cbor/python-cbor.hash
>  create mode 100644 package/python-cbor/python-cbor.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 53734fd..2a2100a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -621,6 +621,7 @@ menu "External python modules"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bottle/Config.in"
>         source "package/python-can/Config.in"
> +       source "package/python-cbor/Config.in"
>         source "package/python-certifi/Config.in"
>         source "package/python-cffi/Config.in"
>         source "package/python-characteristic/Config.in"
> diff --git a/package/python-cbor/Config.in b/package/python-cbor/Config.in
> new file mode 100644
> index 0000000..0de84e0
> --- /dev/null
> +++ b/package/python-cbor/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_CBOR
> +       bool "python-cbor"
> +       depends on BR2_PACKAGE_PYTHON

remove depends

> +       help
> +         RFC 7049 - Concise Binary Object Representation.
> +
> +         https://pypi.python.org/pypi/cbor
> +
> diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
> new file mode 100644
> index 0000000..f456271
> --- /dev/null
> +++ b/package/python-cbor/python-cbor.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    a8b01920c4139de6256735c4cae75c74  cbor-0.1.24.tar.gz
> +sha256 d89bad00785de4b673c5ab5a1464577ec5bda656d1b73900c43e855a51a927cb  cbor-0.1.24.tar.gz
> diff --git a/package/python-cbor/python-cbor.mk b/package/python-cbor/python-cbor.mk
> new file mode 100644
> index 0000000..33a9f01
> --- /dev/null
> +++ b/package/python-cbor/python-cbor.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-cbor
> +#
> +################################################################################
> +
> +PYTHON_CBOR_VERSION = 0.1.24
> +PYTHON_CBOR_SOURCE = cbor-$(PYTHON_CBOR_VERSION).tar.gz
> +PYTHON_CBOR_SITE = http://pypi.python.org/packages/source/c/cbor
> +PYTHON_CBOR_LICENSE = Apache
> +#PYTHON_CBOR_LICENSE_FILES = LICENSE
> +PYTHON_CBOR_SETUP_TYPE = setuptools
> +#PYTHON_CBOR_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
