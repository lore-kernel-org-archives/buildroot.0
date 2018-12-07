From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:09:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: new
 package
In-Reply-To: <1544137122-26766-1-git-send-email-james.hilliard1@gmail.com>
References: <1544137122-26766-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_ktuXHg-SBYJtSz0B+KLE3bbY12y42GY-9YH35E_Wu6ugQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 6, 2018 at 11:58 PM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> jinja2 template renderer for aiohttp.web
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                               |  1 +
>  package/Config.in                                        |  1 +
>  package/python-aiohttp-jinja2/Config.in                  | 10 ++++++++++
>  package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash |  5 +++++
>  package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-aiohttp-jinja2/Config.in
>  create mode 100644 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
>  create mode 100644 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..cc60922 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiohttp-jinja2/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..fe95f08 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiohttp-jinja2/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiohttp-jinja2/Config.in b/package/python-aiohttp-jinja2/Config.in
> new file mode 100644
> index 0000000..4c356fe
> --- /dev/null
> +++ b/package/python-aiohttp-jinja2/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_JINJA2
> +       bool "python-aiohttp-jinja2"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
> +       select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> +       help
> +         jinja2 template renderer for aiohttp.web (http server for

s/jinja2/Jinja2

Other than that you can add my Reviewed-by: Yegor Yefremov
<yegorslists@googlemail.com> for v2.

Yegor

> +         asyncio).
> +
> +         https://github.com/aio-libs/aiohttp_jinja2/
> diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
> new file mode 100644
> index 0000000..390b0e4
> --- /dev/null
> +++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
> +md5    de5e02056d1b48dc2fa4fc0c1a8b0e08  aiohttp-jinja2-1.1.0.tar.gz
> +sha256 aef9b6595f962182ad00c990095fb51d731c280e1d183e2b28cf0bdb5a942d0c  aiohttp-jinja2-1.1.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
> diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
> new file mode 100644
> index 0000000..3b5359a
> --- /dev/null
> +++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiohttp-jinja2
> +#
> +################################################################################
> +
> +PYTHON_AIOHTTP_JINJA2_VERSION = 1.1.0
> +PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
> +PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/76/9d/68fa1e9ec3bafba572772eb385023de54096663bd6e302a24d7344c6a711
> +PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
> +PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
> +PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
