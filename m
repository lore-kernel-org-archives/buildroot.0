From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 2 Feb 2016 10:26:57 +0100
Subject: [Buildroot] [PATCH 09/19] python-pygments: new package
In-Reply-To: <1454373899-22481-10-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
 <1454373899-22481-10-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kt4osF=fYKM128fCnvv+dVw6xCntGQqFmAYa6MUFpgBKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 2, 2016 at 1:44 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                            |  1 +
>  package/python-pygments/Config.in            |  7 +++++++
>  package/python-pygments/python-pygments.hash |  3 +++
>  package/python-pygments/python-pygments.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-pygments/Config.in
>  create mode 100644 package/python-pygments/python-pygments.hash
>  create mode 100644 package/python-pygments/python-pygments.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 623333a..6b84875 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -685,6 +685,7 @@ menu "External python modules"
>         source "package/python-pydal/Config.in"
>         source "package/python-pyftpdlib/Config.in"
>         source "package/python-pygame/Config.in"
> +       source "package/python-pygments/Config.in"
>         source "package/python-pyinotify/Config.in"
>         source "package/python-pyopenssl/Config.in"
>         source "package/python-pyparsing/Config.in"
> diff --git a/package/python-pygments/Config.in b/package/python-pygments/Config.in
> new file mode 100644
> index 0000000..d0e3f00
> --- /dev/null
> +++ b/package/python-pygments/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYGMENTS
> +       bool "python-pygments"
> +       help
> +         Pygments is a syntax highlighting package written in Python.
> +
> +         https://pypi.python.org/pypi/Pygments
> +
> diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
> new file mode 100644
> index 0000000..bb954dd
> --- /dev/null
> +++ b/package/python-pygments/python-pygments.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=84533d22f72de894f6d3907c3ca9eddf, sha256 locally computed.
> +md5    84533d22f72de894f6d3907c3ca9eddf  Pygments-2.1.tar.gz
> +sha256 13a0ef5fafd7b16cf995bc28fe7aab0780dab1b2fda0fc89e033709af8b8a47b  Pygments-2.1.tar.gz
> diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
> new file mode 100644
> index 0000000..d087cef
> --- /dev/null
> +++ b/package/python-pygments/python-pygments.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pygments
> +#
> +################################################################################
> +
> +PYTHON_PYGMENTS_VERSION = 2.1
> +PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
> +PYTHON_PYGMENTS_SITE = http://pypi.python.org/packages/source/P/Pygments
> +PYTHON_PYGMENTS_LICENSE = BSD
> +PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
> +PYTHON_PYGMENTS_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
