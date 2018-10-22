From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Oct 2018 11:23:25 +0200
Subject: [Buildroot] [PATCH v2 1/2] python-serial: update
In-Reply-To: <1540199811-4328-1-git-send-email-james.hilliard1@gmail.com>
References: <1540199811-4328-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAGm1_ksta-juREbGD9yVr_07s5SmLgwyc_Ehib_swXnT9aeeUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 22, 2018 at 11:17 AM <james.hilliard1@gmail.com> wrote:
>
> From: James Hilliard <james.hilliard1@gmail.com>
>
> we no longer need to remove aio.py since asyncio has been moved to python-serial-asyncio
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-serial/python-serial.hash |  8 +++++---
>  package/python-serial/python-serial.mk   | 14 ++------------
>  2 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/package/python-serial/python-serial.hash b/package/python-serial/python-serial.hash
> index f98a8b9..96209a9 100644
> --- a/package/python-serial/python-serial.hash
> +++ b/package/python-serial/python-serial.hash
> @@ -1,3 +1,5 @@
> -# md5 from http://pypi.python.org/pypi?:action=show_md5&digest=e849af7f8b7ec75cbc7a53da67c51a51, sha256 locally computed
> -md5     e849af7f8b7ec75cbc7a53da67c51a51  pyserial-3.1.tar.gz
> -sha256  c8ffdcbd8bfd308842409e558848c32aa3499a1bfe95a591e4210072b9520f1e  pyserial-3.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/pyserial/json
> +md5     ed6183b15519a0ae96675e9c3330c69b  pyserial-3.4.tar.gz
> +sha256  6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627  pyserial-3.4.tar.gz
> +# Locally computed sha256 checksums
> +sha256 a89d951d157e2c199fbbe7ecf8d41bc3bc93de166db524aa6b9b610dbccc832d  LICENSE.txt
> diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
> index ce7ec07..d583ac6 100644
> --- a/package/python-serial/python-serial.mk
> +++ b/package/python-serial/python-serial.mk
> @@ -4,21 +4,11 @@
>  #
>  ################################################################################
>
> -PYTHON_SERIAL_VERSION = 3.1
> +PYTHON_SERIAL_VERSION = 3.4
>  PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
> -PYTHON_SERIAL_SITE = https://pypi.python.org/packages/ce/9c/694ce79a9d4a164e109aeba1a40fba23336f3b7554978553e22a5d41d54d
> +PYTHON_SERIAL_SITE = https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d
>  PYTHON_SERIAL_LICENSE = BSD-3-Clause
>  PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
>  PYTHON_SERIAL_SETUP_TYPE = setuptools
>
> -# aio.py is an experimental module, that is compatible only with
> -# Python 3, so remove it for Python 2 environment or it will
> -# cause compilation errors
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> -define PYTHON_SERIAL_REMOVE_AIO_PY
> -       rm $(@D)/serial/aio.py
> -endef
> -PYTHON_SERIAL_POST_EXTRACT_HOOKS = PYTHON_SERIAL_REMOVE_AIO_PY
> -endif
> -
>  $(eval $(python-package))
> --
> 2.7.4
>
