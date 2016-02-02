From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 14:48:41 +0100
Subject: [Buildroot] [PATCH 03/19] python-cbor: new package
In-Reply-To: <1454373899-22481-4-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-4-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ku2QYmxO4JMppmZi68B9Si+vJHXwF9n0PW+uyng8OC54Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                    |  1 +
>  package/python-cbor/Config.in        |  7 +++++++
>  package/python-cbor/python-cbor.hash |  3 +++
>  package/python-cbor/python-cbor.mk   | 13 +++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 package/python-cbor/Config.in
>  create mode 100644 package/python-cbor/python-cbor.hash
>  create mode 100644 package/python-cbor/python-cbor.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 21348d8..52be929 100644
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
> index 0000000..2d0962d
> --- /dev/null
> +++ b/package/python-cbor/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_CBOR
> +       bool "python-cbor"
> +       help
> +         RFC 7049 - Concise Binary Object Representation.
> +
> +         https://pypi.python.org/pypi/cbor
> +
> diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
> new file mode 100644
> index 0000000..6714348
> --- /dev/null
> +++ b/package/python-cbor/python-cbor.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=711ee5ecc896595c1e95c1c48356606c, sha256 locally computed.
> +md5    711ee5ecc896595c1e95c1c48356606c  cbor-0.1.25.tar.gz
> +sha256 e342d425dde88bb93b741e34e3ba092492ba1f6fca94ce356054fb7daa420746  cbor-0.1.25.tar.gz
> diff --git a/package/python-cbor/python-cbor.mk b/package/python-cbor/python-cbor.mk
> new file mode 100644
> index 0000000..4c3ce9d
> --- /dev/null
> +++ b/package/python-cbor/python-cbor.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-cbor
> +#
> +################################################################################
> +
> +PYTHON_CBOR_VERSION = 0.1.25
> +PYTHON_CBOR_SOURCE = cbor-$(PYTHON_CBOR_VERSION).tar.gz
> +PYTHON_CBOR_SITE = http://pypi.python.org/packages/source/c/cbor
> +PYTHON_CBOR_LICENSE = Apache
> +PYTHON_CBOR_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
