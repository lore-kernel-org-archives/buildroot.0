From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 6 Nov 2019 13:35:23 -0500
Subject: [Buildroot] [PATCH 1/3] package/python-pyserial: new package
In-Reply-To: <20191106183023.531278-1-b.bilas@grinn-global.com>
References: <20191106183023.531278-1-b.bilas@grinn-global.com>
Message-ID: <CADvTj4o9BF_VECeok-c3sof1oJ9DuhcqLXMu6BSnpVRiKjFqyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a duplicate of
https://github.com/buildroot/buildroot/blob/master/package/python-serial/python-serial.mk

On Wed, Nov 6, 2019 at 1:30 PM Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-pyserial/Config.in            |  6 ++++++
>  package/python-pyserial/python-pyserial.hash |  5 +++++
>  package/python-pyserial/python-pyserial.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-pyserial/Config.in
>  create mode 100644 package/python-pyserial/python-pyserial.hash
>  create mode 100644 package/python-pyserial/python-pyserial.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 33273ce6c8..cdc16c8b52 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -258,6 +258,7 @@ F:  package/orbit/
>  N:     Bartosz Bilas <b.bilas@grinn-global.com>
>  F:     package/qt5/qt5scxml/
>  F:     package/qt5/qt5webview/
> +F:     package/python-pyserial
>
>  N:     Bartosz Golaszewski <brgl@bgdev.pl>
>  F:     package/autoconf-archive/
> diff --git a/package/Config.in b/package/Config.in
> index f72c77b416..ae7dc89df7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1040,6 +1040,7 @@ menu "External python modules"
>         source "package/python-pyro/Config.in"
>         source "package/python-pyroute2/Config.in"
>         source "package/python-pysendfile/Config.in"
> +       source "package/python-pyserial/Config.in"
>         source "package/python-pysmb/Config.in"
>         source "package/python-pysmi/Config.in"
>         source "package/python-pysnmp/Config.in"
> diff --git a/package/python-pyserial/Config.in b/package/python-pyserial/Config.in
> new file mode 100644
> index 0000000000..1a55346b45
> --- /dev/null
> +++ b/package/python-pyserial/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYSERIAL
> +       bool "python-pyserial"
> +       help
> +         Python Serial Port Extension.
> +
> +         https://github.com/pyserial/pyserial
> diff --git a/package/python-pyserial/python-pyserial.hash b/package/python-pyserial/python-pyserial.hash
> new file mode 100644
> index 0000000000..aea4994296
> --- /dev/null
> +++ b/package/python-pyserial/python-pyserial.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pyserial/json
> +md5    ed6183b15519a0ae96675e9c3330c69b  pyserial-3.4.tar.gz
> +sha256 6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627  pyserial-3.4.tar.gz
> +# Locally computed sha256 checksums
> +sha256 a89d951d157e2c199fbbe7ecf8d41bc3bc93de166db524aa6b9b610dbccc832d  LICENSE.txt
> diff --git a/package/python-pyserial/python-pyserial.mk b/package/python-pyserial/python-pyserial.mk
> new file mode 100644
> index 0000000000..b1ad969f09
> --- /dev/null
> +++ b/package/python-pyserial/python-pyserial.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pyserial
> +#
> +################################################################################
> +
> +PYTHON_PYSERIAL_VERSION = 3.4
> +PYTHON_PYSERIAL_SOURCE = pyserial-$(PYTHON_PYSERIAL_VERSION).tar.gz
> +PYTHON_PYSERIAL_SITE = https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d
> +PYTHON_PYSERIAL_SETUP_TYPE = setuptools
> +PYTHON_PYSERIAL_LICENSE = FIXME: please specify the exact BSD version
> +PYTHON_PYSERIAL_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.24.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
