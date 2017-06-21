From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 22:23:26 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: new package
In-Reply-To: <20170620152443.17014-1-m.niestroj@grinn-global.com>
References: <20170620152443.17014-1-m.niestroj@grinn-global.com>
Message-ID: <20170621222326.3c64e6bf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 17:24:43 +0200, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/dt-utils/Config.in   |  8 ++++++++
>  package/dt-utils/dt-utils.mk | 15 +++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/dt-utils/Config.in
>  create mode 100644 package/dt-utils/dt-utils.mk

This package doesn't build with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DT_UTILS=y
# BR2_TARGET_ROOTFS_TAR is not set


> diff --git a/package/dt-utils/Config.in b/package/dt-utils/Config.in
> new file mode 100644
> index 000000000..3cf4681d6
> --- /dev/null
> +++ b/package/dt-utils/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DT_UTILS
> +	bool "dt-utils"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	help
> +	  Tools for flattened device-tree dumping and barebox state
> +	  manipulation.
> +
> +	  https://git.pengutronix.de/cgit/tools/dt-utils/

You need to add a Config.in comment here about the udev dependency.
Grep around in the Buildroot tree to see the proper formatting for such
dependencies.

> +DT_UTILS_VERSION = v2017.03.0
> +DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
> +DT_UTILS_SITE_METHOD = git
> +DT_UTILS_LICENSE = GPLv2

Please use SPDX license codes, so GPL-2.0.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
