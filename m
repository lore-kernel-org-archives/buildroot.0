From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:05:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-security: new
 package
In-Reply-To: <1544139188-28022-1-git-send-email-james.hilliard1@gmail.com>
References: <1544139188-28022-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_ktEWoZq4HLuf2jZVoLFE3JmVwKVb=_QLoX7DpQ3-YYB-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 12:33 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> security for aiohttp.web.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-aiohttp-security/Config.in                  |  8 ++++++++
>  .../python-aiohttp-security/python-aiohttp-security.hash   |  5 +++++
>  package/python-aiohttp-security/python-aiohttp-security.mk | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiohttp-security/Config.in
>  create mode 100644 package/python-aiohttp-security/python-aiohttp-security.hash
>  create mode 100644 package/python-aiohttp-security/python-aiohttp-security.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..b9bb05b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiohttp-security/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..f3c8b56 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiohttp-security/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiohttp-security/Config.in b/package/python-aiohttp-security/Config.in
> new file mode 100644
> index 0000000..6695ce3
> --- /dev/null
> +++ b/package/python-aiohttp-security/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_SECURITY
> +       bool "python-aiohttp-security"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
> +       help
> +         security for aiohttp.web.

s/security/Security

Please resend the whole patches as series, i.e.

git format patch -v2 -7 -o outgoing

add my Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com> and
changes history as described in [1].

[1] http://nightly.buildroot.org/manual.html#submitting-patches

Regards,
Yegor

> +
> +         https://github.com/aio-libs/aiohttp_security/
> diff --git a/package/python-aiohttp-security/python-aiohttp-security.hash b/package/python-aiohttp-security/python-aiohttp-security.hash
> new file mode 100644
> index 0000000..1d2604c
> --- /dev/null
> +++ b/package/python-aiohttp-security/python-aiohttp-security.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiohttp-security/json
> +md5    1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
> +sha256 40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
> diff --git a/package/python-aiohttp-security/python-aiohttp-security.mk b/package/python-aiohttp-security/python-aiohttp-security.mk
> new file mode 100644
> index 0000000..9ab3b16
> --- /dev/null
> +++ b/package/python-aiohttp-security/python-aiohttp-security.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiohttp-security
> +#
> +################################################################################
> +
> +PYTHON_AIOHTTP_SECURITY_VERSION = 0.4.0
> +PYTHON_AIOHTTP_SECURITY_SOURCE = aiohttp-security-$(PYTHON_AIOHTTP_SECURITY_VERSION).tar.gz
> +PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/36/01/d85be376b7c1773b3cb7849cd56dc7d38165664df7de2d3e20af507ef5bb
> +PYTHON_AIOHTTP_SECURITY_SETUP_TYPE = setuptools
> +PYTHON_AIOHTTP_SECURITY_LICENSE = Apache-2.0
> +PYTHON_AIOHTTP_SECURITY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
