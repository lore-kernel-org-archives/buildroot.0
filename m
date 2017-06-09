From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Jun 2017 21:39:16 +0200
Subject: [Buildroot] [PATCH v3 09/11]
 package/python-backports-shutil-get-terminal-size: New package
In-Reply-To: <20170602235653.4655-10-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-10-andrew.smirnov@gmail.com>
Message-ID: <CAGm1_kuevZh2qXqdb2uLwOUDz=zJZ2dm7oczWUHnbGG=Ei5zYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Add 'python-backports-shutil-get-terminal-size'[1] package to
> buildroot. Needed by IPython when building against Python2.
>
> [1] https://pypi.python.org/pypi/backports.shutil_get_terminal_size
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  DEVELOPERS                                                  |  1 +
>  package/Config.in                                           |  1 +
>  package/python-backports-shutil-get-terminal-size/Config.in |  9 +++++++++
>  .../python-backports-shutil-get-terminal-size.hash          |  3 +++
>  .../python-backports-shutil-get-terminal-size.mk            | 13 +++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
>  create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
>  create mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4fde5d3..830daa2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -79,6 +79,7 @@ F:    package/python-traitlets/
>  F:     package/python-scandir/
>  F:     package/python-pathlib2/
>  F:     package/python-pickleshare/
> +F:     package/python-backports-shutil-get-terminal-size/

alphabetic order

>
>  N:     Andrew Ruder <andrew.ruder@elecsyscorp.com>
>  F:     package/expect/
> diff --git a/package/Config.in b/package/Config.in
> index f7dbc13..4bfcc36 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -677,6 +677,7 @@ menu "External python modules"
>         source "package/python-autobahn/Config.in"
>         source "package/python-babel/Config.in"
>         source "package/python-backports-abc/Config.in"
> +       source "package/python-backports-shutil-get-terminal-size/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bitstring/Config.in"
>         source "package/python-bottle/Config.in"
> diff --git a/package/python-backports-shutil-get-terminal-size/Config.in b/package/python-backports-shutil-get-terminal-size/Config.in
> new file mode 100644
> index 0000000..24bf3b7
> --- /dev/null
> +++ b/package/python-backports-shutil-get-terminal-size/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
> +       bool "python-backports-shutil-get-terminal-size"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +
> +         A backport of the get_terminal_size function from Python
> +         3.3's shutil.
> +
> +         https://pypi.python.org/pypi/backports.shutil_get_terminal_size
> diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
> new file mode 100644
> index 0000000..d4ab0fd
> --- /dev/null
> +++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
> @@ -0,0 +1,3 @@
> +# MD5 from PyPI, sha256 locally computed

fix comment

> +md5 03267762480bd86b50580dc19dff3c66 backports.shutil_get_terminal_size-1.0.0.tar.gz
> +sha256 713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80 backports.shutil_get_terminal_size-1.0.0.tar.gz
> diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
> new file mode 100644
> index 0000000..63cf363
> --- /dev/null
> +++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-backports-shutil-get-terminal-size
> +#
> +################################################################################
> +
> +PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION = 1.0.0
> +PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SOURCE = backports.shutil_get_terminal_size-$(PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_VERSION).tar.gz
> +PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SITE = https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b
> +PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_SETUP_TYPE = setuptools
> +PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE_LICENSE = MIT

licence file missing

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> +
> +$(eval $(python-package))
> --
> 2.9.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
