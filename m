From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Thu, 30 Apr 2020 15:13:04 +0200
Subject: [Buildroot] [PATCH] package/python-packaging: new package
In-Reply-To: <20200430130305.2475879-1-m.niestroj@grinn-global.com>
References: <20200430130305.2475879-1-m.niestroj@grinn-global.com>
Message-ID: <87imhh86cf.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch was not properly rebased on master, so sent fixed v2 already.

Marcin Niestroj <m.niestroj@grinn-global.com> writes:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-packaging/Config.in             |  8 ++++++++
>  package/python-packaging/python-packaging.hash |  7 +++++++
>  package/python-packaging/python-packaging.mk   | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-packaging/Config.in
>  create mode 100644 package/python-packaging/python-packaging.hash
>  create mode 100644 package/python-packaging/python-packaging.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0665c78a07..499285f4d0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1601,6 +1601,7 @@ F:	package/luaossl/
>  F:	package/murata-cyw-fw/
>  F:	package/netdata/
>  F:	package/python-ansicolors/
> +F:	package/python-packaging/
>  F:	package/python-xmodem/
>  F:	package/rs485conf/
>  F:	package/turbolua/
> diff --git a/package/Config.in b/package/Config.in
> index d005a6d8eb..0d450db061 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1041,6 +1041,7 @@ menu "External python modules"
>  	source "package/python-nfc/Config.in"
>  	source "package/python-numpy/Config.in"
>  	source "package/python-oauthlib/Config.in"
> +	source "package/python-packaging/Config.in"
>  	source "package/python-paho-mqtt/Config.in"
>  	source "package/python-pam/Config.in"
>  	source "package/python-paramiko/Config.in"
> diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
> new file mode 100644
> index 0000000000..5a8135cd57
> --- /dev/null
> +++ b/package/python-packaging/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PACKAGING
> +	bool "python-packaging"
> +	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	help
> +	  Core utilities for Python packages.
> +
> +	  https://github.com/pypa/packaging
> diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
> new file mode 100644
> index 0000000000..112bc695f6
> --- /dev/null
> +++ b/package/python-packaging/python-packaging.hash
> @@ -0,0 +1,7 @@
> +# md5, sha256 from https://pypi.org/pypi/packaging/json
> +md5  19e0d1f82a9007b448650ccfeffd0a26  packaging-20.3.tar.gz
> +sha256  3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3  packaging-20.3.tar.gz
> +# Locally computed sha256 checksums
> +sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
> +sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
> +sha256  b70e7e9b742f1cc6f948b34c16aa39ffece94196364bc88ff0d2180f0028fac5  LICENSE.BSD
> diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
> new file mode 100644
> index 0000000000..bd5177e8e5
> --- /dev/null
> +++ b/package/python-packaging/python-packaging.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-packaging
> +#
> +################################################################################
> +
> +PYTHON_PACKAGING_VERSION = 20.3
> +PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
> +PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/65/37/83e3f492eb52d771e2820e88105f605335553fe10422cba9d256faeb1702
> +PYTHON_PACKAGING_SETUP_TYPE = setuptools
> +PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
> +PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
> +
> +$(eval $(python-package))


-- 
Marcin Niestr?j
