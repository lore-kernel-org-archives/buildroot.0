From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:10:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse: new package
In-Reply-To: <1544135085-25683-1-git-send-email-james.hilliard1@gmail.com>
References: <1544135085-25683-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kt-02QGL4YJBrDQy-vFMNS-Sp=OQ3UtxNwzC8AGBVT74Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 6, 2018 at 11:25 PM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Server-sent events  support for aiohttp.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-aiohttp-sse/Config.in               |  8 ++++++++
>  package/python-aiohttp-sse/python-aiohttp-sse.hash |  5 +++++
>  package/python-aiohttp-sse/python-aiohttp-sse.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiohttp-sse/Config.in
>  create mode 100644 package/python-aiohttp-sse/python-aiohttp-sse.hash
>  create mode 100644 package/python-aiohttp-sse/python-aiohttp-sse.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..290fc85 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiohttp-sse/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..6226209 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiohttp-sse/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiohttp-sse/Config.in b/package/python-aiohttp-sse/Config.in
> new file mode 100644
> index 0000000..dc4a025
> --- /dev/null
> +++ b/package/python-aiohttp-sse/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_SSE
> +       bool "python-aiohttp-sse"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
> +       help
> +         Server-sent events  support for aiohttp.

Two spaces between "events" and "support".

Other than that you can add my Reviewed-by: Yegor Yefremov
<yegorslists@googlemail.com> for v2.

Yegor

> +
> +         https://github.com/aio-libs/aiohttp_sse/
> diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
> new file mode 100644
> index 0000000..2f21da4
> --- /dev/null
> +++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
> +md5    d2f394fb75f591045b2c94fc17c8533d  aiohttp-sse-2.0.0.tar.gz
> +sha256 547e1eaa129749f090d02b31956215edbcde74ce99721f5f0ac902a9ccb1202e  aiohttp-sse-2.0.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
> new file mode 100644
> index 0000000..7a7a0d0
> --- /dev/null
> +++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiohttp-sse
> +#
> +################################################################################
> +
> +PYTHON_AIOHTTP_SSE_VERSION = 2.0.0
> +PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
> +PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2b/50/e127729f7df53c32c96b5c71932a7262cad40c83f1e19c218b068c816d51
> +PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
> +PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
> +PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
