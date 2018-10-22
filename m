From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Oct 2018 10:53:17 +0200
Subject: [Buildroot] [PATCH 2/2] python-serial-asyncio: new package
In-Reply-To: <1540118389-16862-2-git-send-email-james.hilliard1@gmail.com>
References: <1540118389-16862-1-git-send-email-james.hilliard1@gmail.com>
 <1540118389-16862-2-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_kshHzQkSX4j-oNNgP2wz-HKjgbzRPORtb_ot2UJFOx--g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 21, 2018 at 12:40 PM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> asyncio extension package for pyserial
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                        |  1 +
>  package/python-serial-asyncio/Config.in                  |  8 ++++++++
>  package/python-serial-asyncio/python-serial-asyncio.hash |  5 +++++
>  package/python-serial-asyncio/python-serial-asyncio.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-serial-asyncio/Config.in
>  create mode 100644 package/python-serial-asyncio/python-serial-asyncio.hash
>  create mode 100644 package/python-serial-asyncio/python-serial-asyncio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 177861e..f4cc928 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1008,6 +1008,7 @@ menu "External python modules"
>         source "package/python-see/Config.in"
>         source "package/python-semver/Config.in"
>         source "package/python-serial/Config.in"
> +       source "package/python-serial-asyncio/Config.in"
>         source "package/python-service-identity/Config.in"
>         source "package/python-setproctitle/Config.in"
>         source "package/python-setuptools/Config.in"
> diff --git a/package/python-serial-asyncio/Config.in b/package/python-serial-asyncio/Config.in
> new file mode 100644
> index 0000000..ea55370
> --- /dev/null
> +++ b/package/python-serial-asyncio/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_SERIAL_ASYNCIO
> +       bool "python-serial-asyncio"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_SERIAL
> +       help
> +         asyncio extension package for pyserial

The full stop is missing at the end of the sentence.

Yegor

> +
> +         https://github.com/pyserial/pyserial-asyncio
> diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
> new file mode 100644
> index 0000000..268c7d8
> --- /dev/null
> +++ b/package/python-serial-asyncio/python-serial-asyncio.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
> +md5     67244fdc11cc31cf0ebf675c271c71d8  pyserial-asyncio-0.4.tar.gz
> +sha256  c40677a8874d8c24d4423a97498746de776f6dbcd0efbb8fa43dcf011a589aee  pyserial-asyncio-0.4.tar.gz
> +# Locally computed sha256 checksums
> +sha256 f8ded3a7460d3b2850b0cf673e986c70e9d997fd0732d8ab3f3c84f1f191087d  LICENSE.txt
> diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
> new file mode 100644
> index 0000000..39c3476
> --- /dev/null
> +++ b/package/python-serial-asyncio/python-serial-asyncio.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-serial-asyncio
> +#
> +################################################################################
> +
> +PYTHON_SERIAL_ASYNCIO_VERSION = 0.4
> +PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
> +PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/41/3f/e26f71269cbc0890a527a736d9afc5c0d5838a2c188be680558d635b7dc2
> +PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
> +PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
> +PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.7.4
>
