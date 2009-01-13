From: Matt Wood <mattwood2000@gmx.net>
Date: Tue, 13 Jan 2009 18:00:46 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atmel/at91bootstrap
In-Reply-To: <20090111214416.5A26C76736@busybox.osuosl.org>
References: <20090111214416.5A26C76736@busybox.osuosl.org>
Message-ID: <20090113170046.4820@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulf, I tried to compile at91bootstrap for NAND flash boot and I get the following error below...looks like it is not swithcing the default configuration to NAND flash.  If I try to build manually using "MEMORY=nandflash make at91sam9263ek_defconfig" it just copies the default config file and builds for dataflash.  Any ideas?

Thanks, Matt.

bzcat /usr/local/install/downloads/at91bootstrap-2.10.tar.bz2 | tar -C /usr/arm/buildroot/project_build_arm/at91sam9263ek   -xf -
toolchain/patch-kernel.sh /usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10 target/device/Atmel/at91bootstrap/ at91bootstrap-2.10\*.patch
touch /usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10/.unpacked
/usr/bin/make -j3 \
                MEMORY=nandflash \
                CROSS_COMPILE=/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- \
                -C /usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10 \
                at91sam9263ek_defconfig
make[1]: Entering directory `/usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10'
echo ./board/at91sam9263ek/at91sam9263ek_defconfig
./board/at91sam9263ek/at91sam9263ek_defconfig
cp ./board/at91sam9263ek/at91sam9263ek_defconfig .config
make[1]: Leaving directory `/usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10'
touch /usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10/.configured
/usr/bin/make -j3 \
                MEMORY=nandflash \
                CROSS_COMPILE=/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc- \
                AT91_CUSTOM_FLAGS=" -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000" \
                -C /usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10
make[1]: Entering directory `/usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10'
mkdir -p build/at91sam9263ek/
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  -g -Os -Wall -Dat91sam9263ek -Iboard/at91sam9263ek -Iinclude -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ         -DJUMP_ADDR=0x23F00000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000  -c -o build/at91sam9263ek/crt0_gnu.o crt0_gnu.S
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall -Dat91sam9263ek -Iboard/at91sam9263ek -Iinclude -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ        -DJUMP_ADDR=0x23F00000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000  -c -o build/at91sam9263ek/_udivsi3.o libc/_udivsi3.S
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall -Dat91sam9263ek -Iboard/at91sam9263ek -Iinclude -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ        -DJUMP_ADDR=0x23F00000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000  -c -o build/at91sam9263ek/_umodsi3.o libc/_umodsi3.S
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -g -Os -Wall      -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/main.o main.c
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -g -Os -Wall      -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/at91sam9263ek.o board/at91sam9263ek/at91sam9263ek.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/string.o      libc/string.c
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/div0.o        libc/div0.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/udiv.o        libc/udiv.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/debug.o driver//debug.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/gpio.o driver//gpio.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/pmc.o driver//pmc.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/sdramc.o driver//sdramc.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
/usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc   -g -Os -Wall    -Iboard/at91sam9263ek -Iinclude -DAT91BOOTSTRAP_VERSION=\"2.10\" -DAT91SAM9263 -Dat91sam9263ek -DMACH_TYPE=0x4B2 -DTOP_OF_MEMORY=0x314000 -DCRYSTAL_16_36766MHZ    -DJUMP_ADDR=0x23F00000 -DIMG_ADDRESS=0x00008400        -DIMG_SIZE=0x00040000 -DJUMP_ADDR=0x23F00000 -DIMG_SIZE=0x32000 -DCONFIG_DATAFLASH -DCONFIG_SDRAM -DCONFIG_DEBUG -DCONFIG_HW_INIT -c -o build/at91sam9263ek/dataflash.o driver//dataflash.c
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
driver//dataflash.c: In function 'burn_df':
driver//dataflash.c:509: error: 'AT91C_SPI_CLK' undeclared (first use in this function)
driver//dataflash.c:509: error: (Each undeclared identifier is reported only once
driver//dataflash.c:509: error: for each function it appears in.)
driver//dataflash.c: In function 'load_df':
driver//dataflash.c:531: error: 'AT91C_SPI_CLK' undeclared (first use in this function)
make[1]: *** [build/at91sam9263ek/dataflash.o] Error 1
make[1]: *** Waiting for unfinished jobs....
<command-line>: warning: "IMG_SIZE" redefined
<command-line>: warning: this is the location of the previous definition
main.c: In function 'main':
main.c:195: error: 'AT91C_SPI_PCS_DATAFLASH' undeclared (first use in this function)
main.c:195: error: (Each undeclared identifier is reported only once
main.c:195: error: for each function it appears in.)
make[1]: *** [build/at91sam9263ek/main.o] Error 1
make[1]: Leaving directory `/usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10'
make: *** [/usr/arm/buildroot/project_build_arm/at91sam9263ek/at91bootstrap-2.10/binaries/at91sam9263ek-nandflashboot-2.10.bin] Error 2
-------- Original-Nachricht --------
> Datum: Sun, 11 Jan 2009 21:44:16 +0000 (UTC)
> Von: ulf at uclibc.org
> An: buildroot at uclibc.org
> Betreff: [Buildroot] svn commit:	trunk/buildroot/target/device/Atmel/at91bootstrap

> Author: ulf
> Date: 2009-01-11 21:44:14 +0000 (Sun, 11 Jan 2009)
> New Revision: 24772
> 
> Log:
> Update at91bootstrap to 2.10
> 
> Modified:
>    trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
> 
> 
> Changeset:
> Modified:
> trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
> ===================================================================
> ---
> trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-11 21:42:07 UTC (rev 24771)
> +++
> trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-11 21:44:14 UTC (rev 24772)
> @@ -3,9 +3,10 @@
>  # at91bootstrap
>  #
>  #############################################################
> -AT91BOOTSTRAP_VERSION:=2.9
> +#AT91BOOTSTRAP_VERSION:=2.3
> +#AT91BOOTSTRAP_PATCH_LEVEL:=.4
> +AT91BOOTSTRAP_VERSION:=2.10
>  AT91BOOTSTRAP_PATCH_LEVEL:=
> -
> 
> AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
>  AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
>  ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
> @@ -57,6 +58,8 @@
>  		$(AT91BOOTSTRAP_BOARD)_defconfig
>  	touch $(AT91BOOTSTRAP_DIR)/.configured
>  
> +#		$(BOARD_NAME)_defconfig
> +
>  $(AT91BOOTSTRAP_TARGET): $(AT91BOOTSTRAP_DIR)/.configured
>  	$(MAKE) \
>  		MEMORY=$(AT91BOOTSTRAP_MEMORY) \
> @@ -64,13 +67,18 @@
>  		AT91_CUSTOM_FLAGS="$(AT91_CUSTOM_FLAGS)" \
>  		-C $(AT91BOOTSTRAP_DIR)
>  
> -$(AT91BOOTSTRAP_DIR)/.installed: $(AT91BOOTSTRAP_TARGET)
> +$(AT91BOOTSTRAP_DIR)/.installed:: $(AT91BOOTSTRAP_TARGET)
>  	mkdir -p $(BINARIES_DIR)
> +ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
> +	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
> +	cp $(AT91BOOTSTRAP_TARGET)
> $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
> +else
>  	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
> -	     CROSS_COMPILE=$(TARGET_CROSS) \
> -	     -C $(AT91BOOTSTRAP_DIR) boot
> +		CROSS_COMPILE=$(TARGET_CROSS) \
> +		-C $(AT91BOOTSTRAP_DIR) boot
>  	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install
>  	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install
> +endif
>  	touch $@
>  
>  #	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
> @@ -100,3 +108,7 @@
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
>  TARGETS+=at91bootstrap
>  endif
> +
> +at91bootstrap-status:
> +	@echo AT91BOOTSTRAP_BOARD=$(AT91BOOTSTRAP_BOARD)
> +
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Psssst! Schon vom neuen GMX MultiMessenger geh?rt? Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
