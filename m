From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Feb 2016 08:43:17 +0100
Subject: [Buildroot] [PATCH v4 02/17] python-pycparser: python runtime
	added
In-Reply-To: <1454799603-5474-3-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-3-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ktRPhEm=WmDv+icqAuR1PhLZxmYeyK_CDJiBAxYfS-kDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 6, 2016 at 11:59 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in                            | 1 +
>  package/python-pycparser/Config.in           | 6 ++++++
>  package/python-pycparser/python-pycparser.mk | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 package/python-pycparser/Config.in
>
> diff --git a/package/Config.in b/package/Config.in
> index c2698ea..3b3526c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -679,6 +679,7 @@ menu "External python modules"
>         source "package/python-psutil/Config.in"
>         source "package/python-pyasn/Config.in"
>         source "package/python-pycli/Config.in"
> +       source "package/python-pycparser/Config.in"
>         source "package/python-pycrypto/Config.in"
>         source "package/python-pydal/Config.in"
>         source "package/python-pyftpdlib/Config.in"
> diff --git a/package/python-pycparser/Config.in b/package/python-pycparser/Config.in
> new file mode 100644
> index 0000000..49190c3
> --- /dev/null
> +++ b/package/python-pycparser/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYCPARSER
> +       bool "python-pycparser"
> +       help
> +         C parser in Python
> +
> +         https://github.com/eliben/pycparser
> diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
> index 328bc8a..a32f1aa 100644
> --- a/package/python-pycparser/python-pycparser.mk
> +++ b/package/python-pycparser/python-pycparser.mk
> @@ -11,4 +11,5 @@ PYTHON_PYCPARSER_SETUP_TYPE = setuptools
>  PYTHON_PYCPARSER_LICENSE = BSD-3c
>  PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
>
> +$(eval $(python-package))
>  $(eval $(host-python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
