From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Jun 2017 21:29:25 +0200
Subject: [Buildroot] [PATCH v3 08/11] package/python-pickleshare: New
	package
In-Reply-To: <20170602235653.4655-9-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-9-andrew.smirnov@gmail.com>
Message-ID: <CAGm1_kvbJxr7nZ53rnMh1U9o6pMOSm+1_+yZiS1=SSCY1dYkaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Add 'pickleshare'[1] package to buildroot. Needed by IPython.
>
> [1] https://pypi.python.org/pypi/pickleshare
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-pickleshare/Config.in               |  7 +++++++
>  package/python-pickleshare/python-pickleshare.hash |  3 +++
>  package/python-pickleshare/python-pickleshare.mk   | 15 +++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-pickleshare/Config.in
>  create mode 100644 package/python-pickleshare/python-pickleshare.hash
>  create mode 100644 package/python-pickleshare/python-pickleshare.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 45cbcfa..4fde5d3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -78,6 +78,7 @@ F:    package/python-ipython-genutils/
>  F:     package/python-traitlets/
>  F:     package/python-scandir/
>  F:     package/python-pathlib2/
> +F:     package/python-pickleshare/

alphabetical order regarding scandir etc.
>
>  N:     Andrew Ruder <andrew.ruder@elecsyscorp.com>
>  F:     package/expect/
> diff --git a/package/Config.in b/package/Config.in
> index 862c471..f7dbc13 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -772,6 +772,7 @@ menu "External python modules"
>         source "package/python-pathlib2/Config.in"
>         source "package/python-pathvalidate/Config.in"
>         source "package/python-pexpect/Config.in"
> +       source "package/python-pickleshare/Config.in"
>         source "package/python-pillow/Config.in"
>         source "package/python-posix-ipc/Config.in"
>         source "package/python-prompt-toolkit/Config.in"
> diff --git a/package/python-pickleshare/Config.in b/package/python-pickleshare/Config.in
> new file mode 100644
> index 0000000..ec88129
> --- /dev/null
> +++ b/package/python-pickleshare/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PICKLESHARE
> +       bool "python-pickleshare"
> +       select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON

# runtime tag

> +       help
> +         Tiny 'shelve'-like database with concurrency support
> +
> +         https://pypi.python.org/pypi/pickleshare
> diff --git a/package/python-pickleshare/python-pickleshare.hash b/package/python-pickleshare/python-pickleshare.hash
> new file mode 100644
> index 0000000..02a0176
> --- /dev/null
> +++ b/package/python-pickleshare/python-pickleshare.hash
> @@ -0,0 +1,3 @@
> +# MD5 from PyPI, sha256 locally computed

fix comment as pointed in other patches

> +md5 6a9e5dd8dfc023031f6b7b3f824cab12 pickleshare-0.7.4.tar.gz
> +sha256 84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b pickleshare-0.7.4.tar.gz
> diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
> new file mode 100644
> index 0000000..a07e76a
> --- /dev/null
> +++ b/package/python-pickleshare/python-pickleshare.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pickleshare
> +#
> +################################################################################
> +
> +https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz#md5=6a9e5dd8dfc023031f6b7b3f824cab12
> +
> +PYTHON_PICKLESHARE_VERSION = 0.7.4
> +PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
> +PYTHON_PICKLESHARE_SITE = https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525
> +PYTHON_PICKLESHARE_LICENSE = MIT

missing licence file

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> +PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.9.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
