From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 12 Nov 2017 23:18:33 +0100
Subject: [Buildroot] [PATCH/next v2 1/3] package/python-oauthlib: new
 package
In-Reply-To: <20171112104523.16791-1-bernd.kuhls@t-online.de>
References: <20171112104523.16791-1-bernd.kuhls@t-online.de>
Message-ID: <CAGm1_ktB9KXuiOihAW0tabw2obzLMqoEsZJ5ndMi_z42TRAKDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 12, 2017 at 11:45 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Needed for python-mwclient version bump to 0.8.6.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
> v2: fixed license (Yegor)
>
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-oauthlib/Config.in            |  7 +++++++
>  package/python-oauthlib/python-oauthlib.hash |  4 ++++
>  package/python-oauthlib/python-oauthlib.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-oauthlib/Config.in
>  create mode 100644 package/python-oauthlib/python-oauthlib.hash
>  create mode 100644 package/python-oauthlib/python-oauthlib.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d89e72827f..db9ff974b1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -322,6 +322,7 @@ F:  package/python-mwclient/
>  F:     package/python-mwscrape/
>  F:     package/python-mwscrape2slob/
>  F:     package/python-mako/
> +F:     package/python-oauthlib/
>  F:     package/python-pyicu/
>  F:     package/python-pylru/
>  F:     package/python-slob/
> diff --git a/package/Config.in b/package/Config.in
> index 73d53c6074..8ac25eff78 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -815,6 +815,7 @@ menu "External python modules"
>         source "package/python-networkmanager/Config.in"
>         source "package/python-nfc/Config.in"
>         source "package/python-numpy/Config.in"
> +       source "package/python-oauthlib/Config.in"
>         source "package/python-paho-mqtt/Config.in"
>         source "package/python-pam/Config.in"
>         source "package/python-paramiko/Config.in"
> diff --git a/package/python-oauthlib/Config.in b/package/python-oauthlib/Config.in
> new file mode 100644
> index 0000000000..982272cff4
> --- /dev/null
> +++ b/package/python-oauthlib/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_OAUTHLIB
> +       bool "python-oauthlib"
> +       help
> +         A generic, spec-compliant, thorough implementation of the OAuth
> +         request-signing logic.
> +
> +         https://github.com/idan/oauthlib
> diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
> new file mode 100644
> index 0000000000..f8e1324244
> --- /dev/null
> +++ b/package/python-oauthlib/python-oauthlib.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/oauthlib/json, sha256 locally computed
> +md5    277a9a966cc8c72e492b4eeb41332445  oauthlib-2.0.6.tar.gz
> +sha256 ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1  oauthlib-2.0.6.tar.gz
> +sha256 9e1ae8725f5815738dadb6cbb09f450453d94e07c7b5efaee864f546a6209a95  LICENSE
> diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
> new file mode 100644
> index 0000000000..ab39800247
> --- /dev/null
> +++ b/package/python-oauthlib/python-oauthlib.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-oauthlib
> +#
> +################################################################################
> +
> +PYTHON_OAUTHLIB_VERSION = 2.0.6
> +PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
> +PYTHON_OAUTHLIB_SITE = https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754
> +PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
> +PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
> +PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
>
