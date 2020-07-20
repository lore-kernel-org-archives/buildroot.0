From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 22:40:53 +0200
Subject: [Buildroot] [PATCH 1/8] package/edk2-platforms: new package
In-Reply-To: <20200719180727.28202-2-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-2-hi@senzilla.io>
Message-ID: <20200720224053.230ca0b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dick,

For this contribution!

On Sun, 19 Jul 2020 18:08:26 +0000
Dick Olsson <hi@senzilla.io> wrote:

> diff --git a/package/edk2-platforms/Config.in.host b/package/edk2-platforms/Config.in.host
> new file mode 100644
> index 0000000000..d1e2deb1d1
> --- /dev/null
> +++ b/package/edk2-platforms/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_EDK2_PLATFORMS
> +	bool "host edk2-platforms"
> +	help
> +	  EDK II description files for all supported platforms. The main EDK2
> +	  bootloader package will depend on these description files while building
> +	  firmware for certain platforms.
> +
> +	  https://github.com/tianocore/edk2-platforms

Since this is only used as a build dependency for the edk2 package, I
don't think it warrants a visible Config.in.host option, you can just
drop this Config.in.host file.

> diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
> new file mode 100644
> index 0000000000..a6c6e652b4
> --- /dev/null
> +++ b/package/edk2-platforms/edk2-platforms.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 b1ce41b6fb5d1ad5a0877c9cee7751d85aafda3a81cd54898254b07a9a42c5e7  edk2-platforms-608d71ec939692eace78e6b4b2a44ea7b6e75927.tar.gz

Could you add a hash for the license file.

> diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
> new file mode 100644
> index 0000000000..5084dc8e39
> --- /dev/null
> +++ b/package/edk2-platforms/edk2-platforms.mk
> @@ -0,0 +1,6 @@

I know it's pretty silly, but could you add the same comment header we
have in all other packages ?

> +EDK2_PLATFORMS_VERSION = 608d71ec939692eace78e6b4b2a44ea7b6e75927
> +EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
> +EDK2_PLATFORMS_LICENSE = BSD-2-Clause
> +EDK2_PLATFORMS_LICENSE_FILE = License.txt
> +
> +$(eval $(host-generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
