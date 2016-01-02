From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 22:18:41 +0100
Subject: [Buildroot] [PATCH 2/2] New package RPi-GPIO
In-Reply-To: <1451735982-5703-2-git-send-email-haylocki@yahoo.co.uk>
References: <1451735982-5703-1-git-send-email-haylocki@yahoo.co.uk>
 <1451735982-5703-2-git-send-email-haylocki@yahoo.co.uk>
Message-ID: <56883EB1.5070607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ian,

 In addition to Yegor's comments, a few more things below.

On 02-01-16 12:59, Ian Haylock wrote:
> Signed-off-by: Ian Haylock <haylocki@yahoo.co.uk>
> ---
>  package/python-rpi-gpio/Config.in            |  9 +++++++++
>  package/python-rpi-gpio/python-rpi-gpio.hash |  4 ++++
>  package/python-rpi-gpio/python-rpi-gpio.mk   | 14 ++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100755 package/python-rpi-gpio/Config.in
>  create mode 100755 package/python-rpi-gpio/python-rpi-gpio.hash
>  create mode 100755 package/python-rpi-gpio/python-rpi-gpio.mk

 These files should not be executable.

> 
> diff --git a/package/python-rpi-gpio/Config.in b/package/python-rpi-gpio/Config.in
> new file mode 100755
> index 0000000..da5b8c2
> --- /dev/null
> +++ b/package/python-rpi-gpio/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_RPI_GPIO
> +        bool "python-rpi-gpio"

 Indentation should be a single tab.

> +	depends on BR2_arm
> +	depends on BR2_PACKAGE_PYTHON
> +
> +        help

 Here as well.

> +          A Python module to control the GPIO on a Raspberry Pi.

 And here one tab followed by two spaces.

> +
> +          http://sourceforge.net/p/raspberry-gpio-python
> \ No newline at end of file

 There should be a newline at the end of the file (not an empty line, but the
last character should be \n).

> diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
> new file mode 100755
> index 0000000..b234396
> --- /dev/null
> +++ b/package/python-rpi-gpio/python-rpi-gpio.hash
> @@ -0,0 +1,4 @@
> +md5	a98d0b33e16fce3f303136e963b187ec	RPi.GPIO-0.5.11.tar.gz
> +
> +
> +

 There shouldn't be any empty lines here.

> diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
> new file mode 100755
> index 0000000..efad0f3
> --- /dev/null
> +++ b/package/python-rpi-gpio/python-rpi-gpio.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-rpi-gpio
> +#
> +################################################################################
> +
> +PYTHON_RPI_GPIO_VERSION = 0.5.11
> +PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
> +PYTHON_RPI_GPIO_SITE = http://sourceforge.net/projects/raspberry-gpio-python/files
> +PYTHON_RPI_GPIO_LICENSE = MIT
> +PYTHON_RPI_GPIO_LICENSE_FILES = LICENSE.txt
> +PYTHON_RPI_GPIO_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> \ No newline at end of file

 There should be a newline here as well.


 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
