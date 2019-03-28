From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:08:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] Add LicheePi Zero support
In-Reply-To: <1551825426-8743-1-git-send-email-michel.stempin@wanadoo.fr>
References: <866e1f31-97ad-0df3-42e7-521a4a2ad60e@wanadoo.fr>
 <1551825426-8743-1-git-send-email-michel.stempin@wanadoo.fr>
Message-ID: <20190328180849.5e7dc7eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michel,

Thanks for this new iteration. I have applied it, with some changes (see below).

On Tue,  5 Mar 2019 23:37:06 +0100
Michel Stempin <michel.stempin@wanadoo.fr> wrote:

>  board/licheepi/boot.cmd         |  4 +++
>  board/licheepi/genimage.cfg     | 35 +++++++++++++++++++
>  board/licheepi/readme.txt       | 66 ++++++++++++++++++++++++++++++++++++
>  configs/licheepi_zero_defconfig | 74 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 179 insertions(+)

The entry in the DEVELOPERS file was missing, so I added it.

> +Intro
> +=====
> +
> +This directory contains a buildroot configuration for building a
> +LicheePi Zero.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot
> +-------------------
> +
> +There is only one LicheePi Zero defconfig files in Buildroot:

This sentence was not really useful, there is typically only one
defconfig for a given board in Buildroot, so I dropped it.

> diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
> new file mode 100644
> index 0000000..6b1dc5a
> --- /dev/null
> +++ b/configs/licheepi_zero_defconfig
> @@ -0,0 +1,74 @@
> +# Target options
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Toolchain
> +# Use 4.14.x headers and C++ support
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

There was no need for C++ support, so I dropped it.

> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
> +BR2_TARGET_GENERIC_ROOT_PASSWD="licheepi"

The defconfigs we have don't typically customize the root password, so
I dropped this.

> +#?Hardware handling
> +# Firmare
> +# Linux-firmware
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +# Wifi firmware
> +# Realtek 87xx for rtl8723bs support
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
> +
> +# Dhcpcd package DHCP client for Wi-Fi
> +BR2_PACKAGE_DHCPCD=y

Busybox already has a built-in DHCP client, which we use in other
defconfigs.

Beyond that, I simplified a bit the defconfig by removing some comments
that were really redundant as they were repeating exactly what the
options were doing.

Thanks for your contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
