From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:00:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: new
 package
In-Reply-To: <1544140170-28500-1-git-send-email-james.hilliard1@gmail.com>
References: <1544140170-28500-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kv0OT1P=QTMCACBtUSOU3FKGZ3q8DpptojGh+n-GnneFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 12:50 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Control remote side information.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-aiohttp-remotes/Config.in                   |  8 ++++++++
>  package/python-aiohttp-remotes/python-aiohttp-remotes.hash |  5 +++++
>  package/python-aiohttp-remotes/python-aiohttp-remotes.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiohttp-remotes/Config.in
>  create mode 100644 package/python-aiohttp-remotes/python-aiohttp-remotes.hash
>  create mode 100644 package/python-aiohttp-remotes/python-aiohttp-remotes.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..811198e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiohttp-remotes/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..caaa7da 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiohttp-remotes/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiohttp-remotes/Config.in b/package/python-aiohttp-remotes/Config.in
> new file mode 100644
> index 0000000..e44696b
> --- /dev/null
> +++ b/package/python-aiohttp-remotes/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_REMOTES
> +       bool "python-aiohttp-remotes"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
> +       help
> +         Control remote side information.
> +
> +         https://github.com/aio-libs/aiohttp-remotes
> diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
> new file mode 100644
> index 0000000..069cded
> --- /dev/null
> +++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
> +md5    70213413433ece4e2110ae90a070d279  aiohttp_remotes-0.1.2.tar.gz
> +sha256 43c3f7e1c5ba27f29fb4dbde5d43b900b5b5fc7e37bf7e35e6eaedabaec4a3fc  aiohttp_remotes-0.1.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256 5240758b8a5c34a46c166294eaae7dc7034ec45c727fce889c9abf7ef5afc158  LICENSE
> diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
> new file mode 100644
> index 0000000..5b38ae9
> --- /dev/null
> +++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiohttp-remotes
> +#
> +################################################################################
> +
> +PYTHON_AIOHTTP_REMOTES_VERSION = 0.1.2
> +PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
> +PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/cd/2f/93e9198a01485f588d12e19c87cd277542dc28d8b31dc8e1c09fa1c75548
> +PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
> +PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
> +PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
