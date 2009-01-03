From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 21:18:58 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <87sko0yv6q.fsf@macbook.be.48ers.dk>
References: <20090103000208.59551769FA@busybox.osuosl.org>
	<87sko0yv6q.fsf@macbook.be.48ers.dk>
Message-ID: <1231013938.8886.138.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 21:46 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-03 00:02:07 +0000 (Sat, 03 Jan 2009)
>  ulf> New Revision: 24653
> 
>  ulf> Log:
>  ulf> Add Memory configration to u-boot (Config.in) and remove comments from 'choice's', Rearrange options for clarity
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/u-boot/Config.in
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/target/u-boot/Config.in
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/target/u-boot/Config.in	2009-01-03 00:00:46 UTC (rev 24652)
>  ulf> +++ trunk/buildroot/target/u-boot/Config.in	2009-01-03 00:02:07 UTC (rev 24653)
>  ulf> @@ -11,6 +11,14 @@
>  ulf>  	  Build "Das U-Boot" Boot Monitor
>  
>  ulf>  if BR2_TARGET_UBOOT
>  ulf> +config BR2_TARGET_UBOOT_BOARDNAME
>  ulf> +	string "board name"
>  ulf> +	depends on BR2_TARGET_UBOOT
>  ulf> +	default "$(BOARD_NAME)"
>  ulf> +	help
>  ulf> +	  One of U-Boot supported boards to be built.
>  ulf> +	  This will be suffixed with _config to meet U-Boot standard naming.
>  ulf> +
>  ulf>  choice
>  ulf>  	prompt "U-Boot Version"
>  ulf>  	default BR2_TARGET_UBOOT_2009_01_RC1
>  ulf> @@ -20,27 +28,18 @@
>  ulf>  config BR2_TARGET_UBOOT_2009_01_RC1
>  ulf>  	bool "u-boot-2009.01-rc1"
>  ulf>  	depends on BR2_TARGET_UBOOT
>  ulf> -	help
>  ulf> -	  Use u-boot from December 2008 (RC1)
>  
>  ulf>  config BR2_TARGET_UBOOT_2008_10
>  ulf>  	bool "u-boot-2008.10"
>  ulf>  	depends on BR2_TARGET_UBOOT
>  ulf> -	help
>  ulf> -	  Use u-boot from October 2008
>  	
>  ulf>  config BR2_TARGET_UBOOT_1_3_4
>  ulf>  	bool "u-boot-1.3.4"
>  ulf>  	depends on BR2_TARGET_UBOOT
>  ulf> -	help
>  ulf> -	  Use u-boot from mid 2008
>  	
>  ulf>  config BR2_TARGET_UBOOT_2009_01
>  ulf>  	bool "u-boot-2009.01"
>  ulf>  	depends on BR2_TARGET_UBOOT
>  ulf> -	help
>  ulf> -	  Use u-boot from January 2009
>  ulf> -	  Release date 2009-01-17
>  
>  ulf>  endchoice
>  
>  ulf> @@ -51,14 +50,6 @@
>  ulf>  	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
>  ulf>  	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
>  
>  ulf> -config BR2_TARGET_UBOOT_BOARDNAME
>  ulf> -	string "board name"
>  ulf> -	depends on BR2_TARGET_UBOOT
>  ulf> -	default "$(BOARD_NAME)"
>  ulf> -	help
>  ulf> -	  One of U-Boot supported boards to be built.
>  ulf> -	  This will be suffixed with _config to meet U-Boot standard naming.
>  ulf> -
>  ulf>  config BR2_TARGET_UBOOT_CUSTOM_PATCH
>  ulf>  	string "custom patch"
>  ulf>  	depends on BR2_TARGET_UBOOT
>  ulf> @@ -74,42 +65,27 @@
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD
>  ulf>  	bool "Boot from dataflashcard"
>  ulf>  	depends on BR2_BOOTSOURCE_DATAFLASHCARD
>  ulf> -	help
>  ulf> -	  
>  
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
>  ulf>  	bool "Boot from dataflash
>  ulf>  	depends on BR2_BOOTSOURCE_DATAFLASH
>  ulf> -	help
>  ulf> -	  
>  
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH
>  ulf>  	bool "Boot from a NAND flash"
>  ulf>  	depends on BR2_BOOTSOURCE_NANDFLASH
>  ulf> -	help
>  ulf> -	  Build u-boot with environment in the NAND flash
>  
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_FLASH
>  ulf>  	bool "Boot from a parallell flash"
>  ulf>  	depends on BR2_BOOTSOURCE_FLASH
>  ulf> -	help
>  ulf> -	  Build u-boot with environment in a flash RAM
>  
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD
>  ulf> -	bool "Boot from a NAND flash"
>  ulf> +	bool "Boot from an SD-Card"
>  ulf>  	depends on BR2_BOOTSOURCE_SDCARD
>  ulf> -	help
>  ulf> -	  Build u-boot with environment on an SD-Card
>  ulf> -	  Not yet supported
>  
>  ulf>  	config BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM
>  ulf> -	bool "Boot from a serial EEPROM"
>  ulf> +	bool "Boot from a serial EEPROM (Not yet supported)"
>  ulf>  	depends on BR2_BOOTSOURCE_EEPROM
>  ulf> -	help
>  ulf> -	  Build u-boot with environment in a serial EEPROM
>  ulf> -	  Not yet supported
> 
> Why then have it as an option?

Because it will be supported.
The way it is done, it will not be visible
until it is supported by someone "selecting" this from a BSP.


> 
>  ulf> +choice
>  ulf> +	prompt "SDRAM Memory size"
>  ulf> +	default BR2_TARGET_UBOOT_SDRAM_SIZE_64M
>  ulf> +	help
>  ulf> +	  Size of the onboard SDRAM
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_256MB
>  ulf> +	bool "256 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_128MB
>  ulf> +	bool "128 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_64MB
>  ulf> +	bool "64 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_32MB
>  ulf> +	bool "32 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_16MB
>  ulf> +	bool "16 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_SDRAM_SIZE_8MB
>  ulf> +	bool "8 MB"
>  ulf> +
>  ulf> +endchoice
> 
> I don't believe in providing buildroot config options for every U-Boot
> option - If the boards are really that different, then just add them
> as seperate platforms in U-Boot.

?Mostly the Buildroot configuration is to setup
the environment of U-Boot rather than configuring
the U-Boot compile itself.

I do not provide, nor do I plan to provide
config options for each and every U-Boot option.
Just the ones that are needed to allow
easy downloading of the kernel to flash
and allows an easy mechanism to boot the kernel.

This means making sure that the kernel and rootfs
are stored separately and do not overlap.
Computing automatically where the kernel and rootfs
should be stored, and generating scripts
which will store them in the correct location.

It means checking that the kernel and rootfs actually
can fit into the flash at hand etc.

With the right configuration items, you can avoid
several problems you otherwise would run into

You cannot add a couple of hundred boards to support each
and every possible configuration and since U-Boot
does not have a configuration system, it is natural
to let Buildroot configure it.

Some of the stuff goes into the u-boot config.h, but
again it is for the environment.
They are mainly used by the "factory" default command
which is available as a patch.
That command will set environment variables to the
value supplied by buildroot.

> 
> How are you handling the CFG -> CONFIG -> CONFIG_SYS renaming U-boot
> has recently been doing?

U-Boot compiles OK for the boards I have tested.
Anything specific in mind?

> 
>  ulf> +	prompt "Kernel Size"
>  ulf> +	default BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
>  ulf> +	bool "Kernel size is less than 1.25 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
>  ulf> +	bool "Kernel size is less than 1.50 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
>  ulf> +	bool "Kernel size is less than 1.75 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
>  ulf> +	bool "Kernel size is less than 2.00 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
>  ulf> +	bool "Kernel size is less than 2.25 MB"
>  ulf> +
>  ulf> +config BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
>  ulf> +	bool "Kernel size is less than 2.50 MB"
>  ulf> +
> 

That allows easy solving a significant problem with U-Boot.
If the kernel overlaps the root fs, then you are
in trouble and it can take some time to figure out
what is going on.
Happened several times for people I know of-

Computers are useful for checking.
Why do you want to do this check manually?
Really- If you do not care, you do not have to use it.



> And again .. Please get rid of all of those.
> 
> Please clean up.
> 
