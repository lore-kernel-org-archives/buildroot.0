From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 12 Nov 2018 08:59:56 +0100
Subject: [Buildroot] [PATCH 2/2] python-aiodns: new package
In-Reply-To: <1541980940-30821-2-git-send-email-james.hilliard1@gmail.com>
References: <1541980940-30821-1-git-send-email-james.hilliard1@gmail.com>
 <1541980940-30821-2-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kt4+T=CzSMYL9xjXbgCChsDDeOXwQSuKpLw1ZNXotTE0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 12, 2018 at 1:02 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Simple DNS resolver for asyncio.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-aiodns/Config.in          |  8 ++++++++
>  package/python-aiodns/python-aiodns.hash |  5 +++++
>  package/python-aiodns/python-aiodns.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiodns/Config.in
>  create mode 100644 package/python-aiodns/python-aiodns.hash
>  create mode 100644 package/python-aiodns/python-aiodns.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 88dcbc1..5350531 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -984,6 +984,7 @@ F:  configs/pine64_defconfig
>  F:     configs/pine64_sopine_defconfig
>
>  N:     James Hilliard <james.hilliard1@gmail.com>
> +F:     package/python-aiodns/
>  F:     package/python-async-timeout/
>  F:     package/python-multidict/
>  F:     package/python-pycares/
> diff --git a/package/Config.in b/package/Config.in
> index 4d7ed65..e1c87ae 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -794,6 +794,7 @@ endif
>  if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  menu "External python modules"
>         source "package/python-aiocoap/Config.in"
> +       source "package/python-aiodns/Config.in"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
>         source "package/python-arrow/Config.in"
> diff --git a/package/python-aiodns/Config.in b/package/python-aiodns/Config.in
> new file mode 100644
> index 0000000..ccc87fa
> --- /dev/null
> +++ b/package/python-aiodns/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AIODNS
> +       bool "python-aiodns"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_PYCARES

# runtime tag is missing

Other than that you can add my Reviewed-by: Yegor Yefremov
<yegorslists@googlemail.com> to v2.

Yegor

> +       help
> +         Simple DNS resolver for asyncio.
> +
> +         http://github.com/saghul/aiodns
> diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
> new file mode 100644
> index 0000000..b66693f
> --- /dev/null
> +++ b/package/python-aiodns/python-aiodns.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiodns/json
> +md5    80e0419b49bb4c540b4857ec142219b8  aiodns-1.1.1.tar.gz
> +sha256 d8677adc679ce8d0ef706c14d9c3d2f27a0e0cc11d59730cdbaf218ad52dd9ea  aiodns-1.1.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256 eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
> diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
> new file mode 100644
> index 0000000..94f719d
> --- /dev/null
> +++ b/package/python-aiodns/python-aiodns.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiodns
> +#
> +################################################################################
> +
> +PYTHON_AIODNS_VERSION = 1.1.1
> +PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
> +PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/3b/45/dcee156eabca900af3a1bab8acb9531636b13db4b677d44ba468a43969e0
> +PYTHON_AIODNS_SETUP_TYPE = setuptools
> +PYTHON_AIODNS_LICENSE = MIT
> +PYTHON_AIODNS_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
