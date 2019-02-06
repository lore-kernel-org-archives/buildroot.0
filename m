From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 09:40:42 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add new version
In-Reply-To: <20190205221414.23720-1-michal.lyszczek@bofc.pl>
References: <20190205221414.23720-1-michal.lyszczek@bofc.pl>
Message-ID: <20190206094042.101347d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 23:14:14 +0100
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
> +	bool "Latest (v2.0)"
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_2_0
> +	bool "v2.0"
> +
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_1_4
>  	bool "v1.4"

This is not really what I suggested, but maybe I wasn't clear. I
suggested to do a similar thing to what we have for U-Boot:

 - One option to select the latest stable

 - One option to select an arbitrary stable version

See boot/uboot/Config.in:

choice
        prompt "U-Boot Version"
        help
          Select the specific U-Boot version you want to use

config BR2_TARGET_UBOOT_LATEST_VERSION
        bool "2018.09"

config BR2_TARGET_UBOOT_CUSTOM_VERSION
        bool "Custom version"
        help
          This option allows to use a specific official versions

config BR2_TARGET_UBOOT_CUSTOM_TARBALL
        bool "Custom tarball"

config BR2_TARGET_UBOOT_CUSTOM_GIT
        bool "Custom Git repository"

config BR2_TARGET_UBOOT_CUSTOM_HG
        bool "Custom Mercurial repository"

config BR2_TARGET_UBOOT_CUSTOM_SVN
        bool "Custom Subversion repository"

endchoice

Also, if you're bumping the default ATF version from 1.4 to 2.0, it
should be a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
