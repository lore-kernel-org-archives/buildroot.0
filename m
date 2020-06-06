From: Christian Stewart <christian@paral.in>
Date: Sat, 6 Jun 2020 16:02:28 -0700
Subject: [Buildroot] [PATCH v2 1/7] configs/guest_*: some new defconfig
In-Reply-To: <20200530124735.1384078-2-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-2-francois.perrad@gadz.org>
Message-ID: <CA+h8R2otU6ZBqn_tsz9kaHrGDf8UBW9D8LS44GK5aS9CO6r2Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,


On Sat, May 30, 2020 at 5:48 AM Francois Perrad <fperrad@gmail.com> wrote:
>  create mode 100644 configs/guest_arm_a7_defconfig
>  create mode 100644 configs/guest_arm_a9_defconfig
>  create mode 100644 configs/guest_x86_64_defconfig
> +++ b/configs/guest_arm_a7_defconfig
> @@ -0,0 +1,16 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="4.15"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +
> +# System
> +BR2_INIT_SYSTEMD=y
> +# BR2_TARGET_GENERIC_GETTY is not set
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_TAR=y

These appear to be basically the default configuration, except TAR is
selected and GETTY is disabled. Is it necessary to add these given
that they don't do much?

Best,
Christian Stewart
