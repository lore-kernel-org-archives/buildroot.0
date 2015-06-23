From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 23 Jun 2015 13:14:14 +0200
Subject: [Buildroot] [PATCH v3] package/i2c-tools: bump to version 3.1.2
In-Reply-To: <1434990126-2630-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1434990126-2630-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CA+TH9Vku_s4T=M0xw=Txcqw0f1SFG4N9LcAnJxG6DJe1xUP7ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-06-22 18:22 GMT+02:00 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> This patch bumps version to 3.1.2 and adds support for the recently
> introduced python3 support for py-smbus.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes:
>  * v1->v2: changed ifeq construct to a more appropriate one.
>  * v2->v3: updated I2C_TOOLS_SOURCE to a more reliable ulr.

Marked this patch as rejected, cause official i2c tools page is up again.
Please use version 2.

>
>  package/i2c-tools/i2c-tools.hash |  2 +-
>  package/i2c-tools/i2c-tools.mk   | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
> index a6c376f..c12ffe8 100644
> --- a/package/i2c-tools/i2c-tools.hash
> +++ b/package/i2c-tools/i2c-tools.hash
> @@ -1,2 +1,2 @@
>  # locally computed hash
> -sha256 14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700  i2c-tools-3.1.1.tar.bz2
> +sha256 db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441  i2c-tools-3.1.2.tar.bz2
> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
> index 6c156ca..762169a 100644
> --- a/package/i2c-tools/i2c-tools.mk
> +++ b/package/i2c-tools/i2c-tools.mk
> @@ -4,16 +4,23 @@
>  #
>  ################################################################################
>
> -I2C_TOOLS_VERSION = 3.1.1
> +I2C_TOOLS_VERSION = 3.1.2
>  I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
> -I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
> +I2C_TOOLS_SITE = http://jdelvare.nerim.net/mirror/i2c-tools/
>  I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
>  I2C_TOOLS_LICENSE_FILES = COPYING
>
> -# Build/install steps mirror the distutil python package type in the python package
> -# infrastructure
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  I2C_TOOLS_DEPENDENCIES += python
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +I2C_TOOLS_DEPENDENCIES += python3
> +endif
> +
> +# Build/install steps mirror the distutil python package type in the python package
> +# infrastructure
> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
>  # BASE_ENV taken from PKG_PYTHON_DISTUTILS_ENV in package/pkg-python.mk
>  I2C_TOOLS_PYTHON_BASE_ENV = \
>         $(PKG_PYTHON_DISTUTILS_ENV) \
> --
> 1.9.1
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
