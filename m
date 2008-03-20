From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 20 Mar 2008 14:40:10 +0100
Subject: [Buildroot] build for ARM926EJ-S fails with
	kernel-patches-2.6.24
References: <16119611.post@talk.nabble.com><00e701c88a6e$4643e730$040514ac@atmel.com>
	<16175986.post@talk.nabble.com>
Message-ID: <00c301c88a95$df7c61d0$e0c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Hi Ulf Samuelsson,
> here is the full .config
> Best Regards
> 
> #
> # Automatically generated make config: don't edit
> # Tue Mar 18 10:10:04 2008
> #
> BR2_HAVE_DOT_CONFIG=y
> BR2_VERSION="0.10.0-svn"
> # BR2_alpha is not set
> BR2_arm=y
> BR2_arm926t=y
> BR2_ARM_TYPE="ARM926T"
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="arm9tdmi"
> 

[snip]

> #
> # Preset Devices
> #
> # BR2_TARGET_ARM is not set
> # BR2_TARGET_ATMEL is not set
> # BR2_TARGET_SHARP is not set
> 
> 


Since you do not have $(BOARD_PATH) defined, something will break.
This is only set, if you select a target.

Suggest you start from scratch by doing 

mv .config .config.original
touch .config
make at91sam9260dfc_defconfig.

then change the stuff as you need.

This will ensure that the 
I noted that you are using an x86 based linux configuration and that will never work.

Best Regards
Ulf Samuelsson
