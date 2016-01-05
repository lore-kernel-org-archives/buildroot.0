From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 5 Jan 2016 11:46:11 +0100
Subject: [Buildroot] [PATCH] python-rpi-gpio: new package
In-Reply-To: <1451990446-4757-1-git-send-email-haylocki@yahoo.co.uk>
References: <1451990446-4757-1-git-send-email-haylocki@yahoo.co.uk>
Message-ID: <CAGm1_kt2E1G9ABP3betjAQtADhtvd2AYGuD9+-v+8a8bF_8HFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 5, 2016 at 11:40 AM, Ian Haylock <haylocki@yahoo.co.uk> wrote:
> Signed-off-by: Ian Haylock <haylocki@yahoo.co.uk>
> ---
>  package/Config.in                            |  1 +
>  package/python-rpi-gpio/Config.in            |  9 +++++++++
>  package/python-rpi-gpio/python-rpi-gpio.hash |  3 +++
>  package/python-rpi-gpio/python-rpi-gpio.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100755 package/python-rpi-gpio/Config.in
>  create mode 100755 package/python-rpi-gpio/python-rpi-gpio.hash
>  create mode 100755 package/python-rpi-gpio/python-rpi-gpio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 442021f..a1cf595 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -690,6 +690,7 @@ menu "External python modules"
>         source "package/python-pyyaml/Config.in"
>         source "package/python-pyzmq/Config.in"
>         source "package/python-requests/Config.in"
> +       source "package/python-rpi-gpio/Config.in"
>         source "package/python-rtslib-fb/Config.in"
>         source "package/python-serial/Config.in"
>         source "package/python-setuptools/Config.in"
> diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
> new file mode 100755
> index 0000000..da5b8c2
> --- /dev/null
> +++ b/package/python-rpi-gpio/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_RPI_GPIO
> +        bool "python-rpi-gpio"

You indentation is still wrong. All lines after config should be a single tab.

> +       depends on BR2_arm
> +       depends on BR2_PACKAGE_PYTHON

According to https://sourceforge.net/p/raspberry-gpio-python/code/ci/default/tree/setup.py
this package can be used in both Pyrhon 2 and 3, so just remove
"depends on BR2_PACKAGE_PYTHON".
> +

Remove this empty line.

> +        help

After help you should use one tab and two spaces.

> +          A Python module to control the GPIO on a Raspberry Pi.
> +
> +          http://sourceforge.net/p/raspberry-gpio-python
> \ No newline at end of file
> diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
> new file mode 100755
> index 0000000..46c4e5b
> --- /dev/null
> +++ b/package/python-rpi-gpio/python-rpi-gpio.hash
> @@ -0,0 +1,3 @@
> +# md5sum from http://sourceforge.net/projects/raspberry-gpio-python/files/, sha256 calculated locally
> +md5    254d0443a436eb241367c487274e7197        RPi.GPIO-0.6.1.tar.gz
> +sha256 54e5fb06d9ea1a1389a497fb5a06dfa950c86303b0f4ba89b68c55999d1df064        RPi.GPIO-0.6.1.tar.gz
> \ No newline at end of file
> diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
> new file mode 100755
> index 0000000..aa086dc
> --- /dev/null
> +++ b/package/python-rpi-gpio/python-rpi-gpio.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-rpi-gpio
> +#
> +################################################################################
> +
> +PYTHON_RPI_GPIO_VERSION = 0.6.1
> +PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
> +PYTHON_RPI_GPIO_SITE = http://sourceforge.net/projects/raspberry-gpio-python/files
> +PYTHON_RPI_GPIO_LICENSE = MIT
> +PYTHON_RPI_GPIO_LICENSE_FILES = LICENSE.txt
> +PYTHON_RPI_GPIO_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> \ No newline at end of file
> --
> 2.6.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
