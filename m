From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 28 Dec 2015 14:24:22 +0100
Subject: [Buildroot] [PATCH 1/1] python-paho-mqtt: add new package
In-Reply-To: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
References: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
Message-ID: <CAGm1_kssftXCr7S1BRoJNLqHgSD7wp1YeCzF0sw0Un5MvvnZdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Davide,

On Mon, Dec 28, 2015 at 1:57 PM, Davide Viti <zinosat@tiscali.it> wrote:
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
>  package/Config.in                              |  1 +
>  package/python-paho-mqtt/Config.in             |  9 +++++++++
>  package/python-paho-mqtt/python-paho-mqtt.hash |  2 ++
>  package/python-paho-mqtt/python-paho-mqtt.mk   | 21 +++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/python-paho-mqtt/Config.in
>  create mode 100644 package/python-paho-mqtt/python-paho-mqtt.hash
>  create mode 100644 package/python-paho-mqtt/python-paho-mqtt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index dd44743..aab1958 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -659,6 +659,7 @@ menu "External python modules"
>         source "package/python-networkmanager/Config.in"
>         source "package/python-nfc/Config.in"
>         source "package/python-numpy/Config.in"
> +       source "package/python-paho-mqtt/Config.in"
>         source "package/python-pam/Config.in"
>         source "package/python-posix-ipc/Config.in"
>         source "package/python-protobuf/Config.in"
> diff --git a/package/python-paho-mqtt/Config.in b/package/python-paho-mqtt/Config.in
> new file mode 100644
> index 0000000..1b20da9
> --- /dev/null
> +++ b/package/python-paho-mqtt/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_PAHO_MQTT
> +       bool "python-paho-mqtt"
> +       help
> +         The Paho Python Client provides a client class with support
> +         for both MQTT v3.1 and v3.1.1 on Python 2.7 or 3.x. It also
> +         provides some helper functions to make publishing one off
> +         messages to an MQTT server very straightforward.
> +
> +         https://pypi.python.org/pypi/paho-mqtt
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
> new file mode 100644
> index 0000000..eb1dfb5
> --- /dev/null
> +++ b/package/python-paho-mqtt/python-paho-mqtt.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e  paho-mqtt-1.1.tar.gz
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk

please also provide oficial md5 from pypi like we do in for example
package/python-pyudev

> new file mode 100644
> index 0000000..f039835
> --- /dev/null
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python-paho-mqtt
> +#
> +################################################################################
> +
> +PYTHON_PAHO_MQTT_VERSION = 1.1
> +PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
> +PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/source/p/paho-mqtt
> +PYTHON_PAHO_MQTT_LICENSE = EPLv1.0 or EDLv1.0
> +PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
> +PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
> +
> +define PYTHON_PAHO_MQTT_INSTALL_TARGET_CMDS
> +       (cd $(@D); \
> +               $(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> +               $(HOST_DIR)/usr/bin/python2 setup.py install \
> +               --root=/)
> +endef

Why do you need this and have you tested this with Python3?

> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
