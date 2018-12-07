From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 08:55:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: new package
In-Reply-To: <1544141284-28960-1-git-send-email-james.hilliard1@gmail.com>
References: <1544141284-28960-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kuvjkD-UihTfiX9W0O_arAkem+AB3aKST-uDEkBZsYkMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 1:08 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Read write lock for asyncio.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-aiorwlock/Config.in             |  7 +++++++
>  package/python-aiorwlock/python-aiorwlock.hash |  5 +++++
>  package/python-aiorwlock/python-aiorwlock.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-aiorwlock/Config.in
>  create mode 100644 package/python-aiorwlock/python-aiorwlock.hash
>  create mode 100644 package/python-aiorwlock/python-aiorwlock.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..9248c79 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiorwlock/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..4acc4ba 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiorwlock/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiorwlock/Config.in b/package/python-aiorwlock/Config.in
> new file mode 100644
> index 0000000..afdc27d
> --- /dev/null
> +++ b/package/python-aiorwlock/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_AIORWLOCK
> +       bool "python-aiorwlock"
> +       depends on BR2_PACKAGE_PYTHON3
> +       help
> +         Read write lock for asyncio.
> +
> +         https://github.com/aio-libs/aiorwlock
> diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
> new file mode 100644
> index 0000000..51d1a29
> --- /dev/null
> +++ b/package/python-aiorwlock/python-aiorwlock.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiorwlock/json
> +md5    ee741761e4c9b1612e9dccf7f8bccdd0  aiorwlock-0.5.0.tar.gz
> +sha256 3cd892576d024934d72c3dd098033f276ace3495e71a1197daa8d21409a52174  aiorwlock-0.5.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 56fb2baf14d84c59c15abbfbb1fdf30a724017e2ce97894a8236764513d10397  LICENSE
> diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
> new file mode 100644
> index 0000000..ca6aa25
> --- /dev/null
> +++ b/package/python-aiorwlock/python-aiorwlock.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiorwlock
> +#
> +################################################################################
> +
> +PYTHON_AIORWLOCK_VERSION = 0.5.0
> +PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
> +PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/0c/20/d30f332e6ecb2be467ab5603e277b26e3a8eb2a72f75bf8d309bdd4c0c82
> +PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
> +PYTHON_AIORWLOCK_LICENSE = Apache-2.0
> +PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
