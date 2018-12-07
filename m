From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:07:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: new
 package
In-Reply-To: <1544138568-27563-1-git-send-email-james.hilliard1@gmail.com>
References: <1544138568-27563-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kth6qJ1OfVtU1QDSWrhJ8XxERuX8KFEF7SMi=pm6Tb7Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 12:22 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> sessions for aiohttp.web.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/python-aiohttp-session/Config.in                   |  8 ++++++++
>  package/python-aiohttp-session/python-aiohttp-session.hash |  5 +++++
>  package/python-aiohttp-session/python-aiohttp-session.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiohttp-session/Config.in
>  create mode 100644 package/python-aiohttp-session/python-aiohttp-session.hash
>  create mode 100644 package/python-aiohttp-session/python-aiohttp-session.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c289b3f..ec71e6e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -992,6 +992,7 @@ F:  configs/pine64_sopine_defconfig
>  N:     James Hilliard <james.hilliard1@gmail.com>
>  F:     package/python-aiodns/
>  F:     package/python-aiohttp/
> +F:     package/python-aiohttp-session/
>  F:     package/python-async-timeout/
>  F:     package/python-cchardet/
>  F:     package/python-multidict/
> diff --git a/package/Config.in b/package/Config.in
> index f6252f2..f411d07 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -799,6 +799,7 @@ menu "External python modules"
>         source "package/python-aiocoap/Config.in"
>         source "package/python-aiodns/Config.in"
>         source "package/python-aiohttp/Config.in"
> +       source "package/python-aiohttp-session/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiohttp-session/Config.in b/package/python-aiohttp-session/Config.in
> new file mode 100644
> index 0000000..f0e8df5
> --- /dev/null
> +++ b/package/python-aiohttp-session/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_SESSION
> +       bool "python-aiohttp-session"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
> +       help
> +         sessions for aiohttp.web.

s/sessions/Sessions

Other than that you can add my Reviewed-by: Yegor Yefremov
<yegorslists@googlemail.com> for v2.

Yegor

> +
> +         https://github.com/aio-libs/aiohttp_session/
> diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
> new file mode 100644
> index 0000000..fdccb20
> --- /dev/null
> +++ b/package/python-aiohttp-session/python-aiohttp-session.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
> +md5    a873141ee04ffc9fc948d9ee0ed47a8d  aiohttp-session-2.7.0.tar.gz
> +sha256 18ae740845214086f783574edfee1bac36862332bd11d561e048b079d8f6ad34  aiohttp-session-2.7.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256 2a86817fedf0c52baaa47d7dd975073639dfaaebd37312bd279de54d7f841791  LICENSE
> diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
> new file mode 100644
> index 0000000..36c3180
> --- /dev/null
> +++ b/package/python-aiohttp-session/python-aiohttp-session.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiohttp-session
> +#
> +################################################################################
> +
> +PYTHON_AIOHTTP_SESSION_VERSION = 2.7.0
> +PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
> +PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/b5/5f/3f78fd4de2f9b17ad8cfe6c189bfaee3d0a5d2fe954aedad743edd08c813
> +PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
> +PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
> +PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
