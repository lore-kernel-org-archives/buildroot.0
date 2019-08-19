From: Martin Bark <martin@barkynet.com>
Date: Mon, 19 Aug 2019 22:51:22 +0100
Subject: [Buildroot] [PATCH 1/1] raspberrypi: bump kernel and firmware
 to 20190718 version
In-Reply-To: <20190819204143.21698-1-imrehg@gmail.com>
References: <20190819204143.21698-1-imrehg@gmail.com>
Message-ID: <CAFGQKxfZz7XmGXnh+iBFC3Lk+PDGOBaaOEtq9gRiZSXQRZtJ4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 19 Aug 2019 at 21:41, Gergely Imreh <imrehg@gmail.com> wrote:
>
> It's the latest original version. The defconfig and package/rpi-firmware
> changes are done in a single patch, as they are going together.
>
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>
> ---
>  configs/raspberrypi0_defconfig         | 2 +-
>  configs/raspberrypi0w_defconfig        | 2 +-
>  configs/raspberrypi2_defconfig         | 2 +-
>  configs/raspberrypi3_64_defconfig      | 2 +-
>  configs/raspberrypi3_defconfig         | 2 +-
>  configs/raspberrypi3_qt5we_defconfig   | 2 +-
>  configs/raspberrypi_defconfig          | 2 +-
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index e85e549fa2..bacaf699e0 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"

I think it would be nice if we changed to track the raspberry pi
kernel releases [1].  These are the same kernel versions raspbian
uses.  So instead of a commit hash for the 20190718 release we could
use

BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,raspberrypi-kernel_1.20190718-1)/raspberrypi-kernel_1.20190718-1.tar.gz"

This also saves having to git clone

Thanks

Martin

[1] https://github.com/raspberrypi/linux/releases

>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>
>  # Build the DTBs for A/B from the kernel sources: the zero is the same
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index d723e93923..1a8bf4cad2 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 86d34ef87e..4ba562e462 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 66cf7ed740..aef55969e9 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
>
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index fcd7e2b487..562b1d5cb5 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index 667e980d55..63143cf5f0 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index e6c42a837a..f4e88d9ff3 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,246113692edbef9a438b31ab2dd0172a30ed5eb2)/linux-246113692edbef9a438b31ab2dd0172a30ed5eb2.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 61834f7d42..b08ea05618 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 c82c40cf37fac36160a7f6b9c314506beb942bf113a55d30fa163c56a4f98946 rpi-firmware-bcf40b5c2b94178c7564fb451098d44968e44af5.tar.gz
> +sha256 f266df66ce92e7726e894c0c870f0d8e7257434f102ba77bd60640970b689aa3 rpi-firmware-d36bde339b067bf13b610fd9741d6351c1dafc38.tar.gz
>  sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 717f705f66..acb3cd7635 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_FIRMWARE_VERSION = bcf40b5c2b94178c7564fb451098d44968e44af5
> +RPI_FIRMWARE_VERSION = d36bde339b067bf13b610fd9741d6351c1dafc38
>  RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>  RPI_FIRMWARE_LICENSE = BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> --
> 2.22.1
>
