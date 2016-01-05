From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jan 2016 17:16:31 +0100
Subject: [Buildroot] [PATCH] python-rpi-gpio: new package
In-Reply-To: <1452008648-10885-1-git-send-email-haylocki@yahoo.co.uk>
References: <1452008648-10885-1-git-send-email-haylocki@yahoo.co.uk>
Message-ID: <20160105171631.7c65a813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ian,

Thanks for your patch!

On Tue,  5 Jan 2016 15:44:08 +0000, Ian Haylock wrote:

> diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
> new file mode 100755
> index 0000000..908ab45
> --- /dev/null
> +++ b/package/python-rpi-gpio/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_RPI_GPIO
> +	bool "python-rpi-gpio"
> +	depends on BR2_arm
> +	  help

Indentation of "help" should be one tab, like "bool" and "depends on".

> +	  A Python module to control the GPIO on a Raspberry Pi.
> +
> +	  http://sourceforge.net/p/raspberry-gpio-python
> \ No newline at end of file

You should end the file with a newline.

> diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
> new file mode 100755
> index 0000000..46c4e5b
> --- /dev/null
> +++ b/package/python-rpi-gpio/python-rpi-gpio.hash
> @@ -0,0 +1,3 @@
> +# md5sum from http://sourceforge.net/projects/raspberry-gpio-python/files/, sha256 calculated locally
> +md5	254d0443a436eb241367c487274e7197	RPi.GPIO-0.6.1.tar.gz
> +sha256	54e5fb06d9ea1a1389a497fb5a06dfa950c86303b0f4ba89b68c55999d1df064	RPi.GPIO-0.6.1.tar.gz
> \ No newline at end of file

Ditto.

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

Ditto.

Other than that, looks good to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
