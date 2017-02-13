From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 15:27:47 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for full image
 socfpga mkpimage support
In-Reply-To: <20170213135934.32014-2-lionel@svkt.org>
References: <20170130103326.14427-2-lionel@svkt.org>
 <20170213135934.32014-1-lionel@svkt.org>
 <20170213135934.32014-2-lionel@svkt.org>
Message-ID: <20170213152747.13a39b36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration!

On Mon, 13 Feb 2017 14:59:34 +0100, Lionel Flandrin wrote:

>  ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
> +UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 0
> +else
> +UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = u-boot-dtb.bin
> +UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 1
> +endif

So when the SPL is used, the header version should always be 0, and
when the full U-Boot is used directly, the header version should always
be 1 ?

I thought 0 was for older SoCs, and 1 for newer SoCs. Or are we sure
that SPL booting will only ever be used on older SoCs, and direct U-Boot
booting will only be used on newer SoCs ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
