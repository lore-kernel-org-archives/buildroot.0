From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:22:55 +0200
Subject: [Buildroot] [PATCH v2] board: add orangepi-plus support
In-Reply-To: <1498871840-2244-1-git-send-email-chakra@openedev.com>
References: <1498871840-2244-1-git-send-email-chakra@openedev.com>
Message-ID: <20170701172255.663aa96d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 06:47:20 +0530, Chakra Divi wrote:

> +This default configuration will allow you to start experimenting with the
> +buildroot environment for the OrangePi Plus/Plus2. With the current configuration
> +it will bring-up the board, and allow access through the serial console.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot:
> +
> +    $ make orangepi_plus_defconfig 

There was a trailing whitespace here.

> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-plus/genimage.cfg"
> +
> +# Additional tools
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

Since you use BR2_TARGET_UBOOT_BOOT_SCRIPT,
BR2_PACKAGE_HOST_UBOOT_TOOLS=y is no longer needed, so I dropped it.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
