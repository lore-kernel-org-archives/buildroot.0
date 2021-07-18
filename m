From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:16:39 +0200
Subject: [Buildroot] [PATCH v2 4/4] configs/beaglev: switch to upstream
 opensbi generic platform
In-Reply-To: <20210616050341.510702-5-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
 <20210616050341.510702-5-drew@beagleboard.org>
Message-ID: <20210718221639.0e3fd4d0@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 15 Jun 2021 22:03:45 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> +# upstream opensbi master branch
> +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,79f9b4220ffa7f74356054be25d450d7958bf16c)/opensbi-79f9b4220ffa7f74356054be25d450d7958bf16c.tar.gz"
> +BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG is not set
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
> +BR2_TARGET_OPENSBI_FW_FDT_PATH=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>  # HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64ead5b83959da8eb87b6963843addf5942e6ed4)/uboot-64ead5b83959da8eb87b6963843addf5942e6ed4.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
> +BR2_TARGET_UBOOT_FORMAT_DTB=y

This was no longer needed in the defconfig, as it is now implied by
BR2_TARGET_OPENSBI_FW_FDT_PATH=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
