From: Matt Wood <mattwood2000@gmx.net>
Date: Mon, 29 Dec 2008 21:21:15 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6
In-Reply-To: <874p0n3t16.fsf@macbook.be.48ers.dk>
References: <20081229151333.0AEBB76C21@busybox.osuosl.org>
	<874p0n3t16.fsf@macbook.be.48ers.dk>
Message-ID: <20081229202115.230090@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just did an snv update and this patch is failing:

toolchain/patch-kernel.sh /usr/arm/buildroot/project_build_arm/at91sam9263ek/linux-2.6.27.10 toolchain/kernel-headers \
                linux-2.6.27.10-\*.patch{,.gz,.bz2}
touch /usr/arm/buildroot/project_build_arm/at91sam9263ek/linux-2.6.27.10/.patched
if [ -d target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6 ] ; then \
        toolchain/patch-kernel.sh /usr/arm/buildroot/project_build_arm/at91sam9263ek/linux-2.6.27.10 target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6 \
                linux-\*.patch{,.gz,.bz2} ; \
        fi

Applying linux-2.6.28-rc6-at91-wm8731.patch using plaintext:
patching file sound/soc/at91/at91sam9g20ek_wm8731.c
patching file sound/soc/at91/Kconfig
patching file sound/soc/at91/Makefile

Applying linux-2.6.28-rc6-at91.patch.gz using gzip:
patching file arch/arm/configs/csb637_defconfig
patching file arch/arm/configs/csb737_defconfig
patching file arch/arm/configs/homematic_defconfig
patching file arch/arm/configs/kb9202_defconfig
patching file arch/arm/configs/ks8695_defconfig
patching file arch/arm/configs/neocore926_defconfig
patching file arch/arm/configs/totemnova_defconfig
patching file arch/arm/configs/tt9200_defconfig
patching file arch/arm/mach-at91/at91cap9.c
patching file arch/arm/mach-at91/at91cap9_devices.c
Hunk #7 succeeded at 807 (offset -54 lines).
patching file arch/arm/mach-at91/at91rm9200_devices.c
patching file arch/arm/mach-at91/at91rm9200_time.c
patching file arch/arm/mach-at91/at91sam9260_devices.c
patching file arch/arm/mach-at91/at91sam9261_devices.c
patching file arch/arm/mach-at91/at91sam9263_devices.c
patching file arch/arm/mach-at91/at91sam9rl_devices.c
Hunk #2 succeeded at 528 (offset -45 lines).
Hunk #3 succeeded at 557 (offset -45 lines).
patching file arch/arm/mach-at91/board-cam60.c
patching file arch/arm/mach-at91/board-cap9adk.c
patching file arch/arm/mach-at91/board-chub.c
patching file arch/arm/mach-at91/board-csb337.c
patching file arch/arm/mach-at91/board-csb637.c
patching file arch/arm/mach-at91/board-csb737.c
patching file arch/arm/mach-at91/board-dk.c
patching file arch/arm/mach-at91/board-eb9200.c
patching file arch/arm/mach-at91/board-ek.c
patching file arch/arm/mach-at91/board-homematic.c
patching file arch/arm/mach-at91/board-kb9202.c
patching file arch/arm/mach-at91/board-neocore926.c
patching file arch/arm/mach-at91/board-qil-a9260.c
Hunk #1 succeeded at 41 with fuzz 1.
patching file arch/arm/mach-at91/board-sam9260ek.c
Hunk #1 succeeded at 39 with fuzz 1 (offset -3 lines).
Hunk #2 succeeded at 87 (offset -3 lines).
Hunk #3 succeeded at 205 (offset -3 lines).
Hunk #4 succeeded at 250 with fuzz 2 (offset -20 lines).
Hunk #5 FAILED at 329.
Hunk #6 FAILED at 345.
2 out of 6 hunks FAILED -- saving rejects to file arch/arm/mach-at91/board-sam9260ek.c.rej
patching file arch/arm/mach-at91/board-sam9261ek.c
Hunk #11 succeeded at 571 (offset -4 lines).
Hunk #12 succeeded at 594 (offset -4 lines).
patching file arch/arm/mach-at91/board-sam9263ek.c
Hunk #1 succeeded at 44 (offset -2 lines).
Hunk #2 succeeded at 138 (offset -2 lines).
Hunk #3 succeeded at 203 with fuzz 1 (offset -2 lines).
Hunk #4 succeeded at 293 with fuzz 2 (offset 37 lines).
Hunk #5 succeeded at 393 with fuzz 2 (offset -27 lines).
Hunk #6 FAILED at 405.
1 out of 6 hunks FAILED -- saving rejects to file arch/arm/mach-at91/board-sam9263ek.c.rej
patching file arch/arm/mach-at91/board-sam9g20ek.c
patching file arch/arm/mach-at91/board-sam9-l9260.c
patching file arch/arm/mach-at91/board-sam9rlek.c
Hunk #1 succeeded at 29 with fuzz 1.
Hunk #4 FAILED at 224.
1 out of 4 hunks FAILED -- saving rejects to file arch/arm/mach-at91/board-sam9rlek.c.rej
patching file arch/arm/mach-at91/board-tms.c
patching file arch/arm/mach-at91/board-totemnova.c
patching file arch/arm/mach-at91/board-tt9200.c
patching file arch/arm/mach-at91/board-usb-a9260.c
Hunk #1 succeeded at 41 with fuzz 1.
patching file arch/arm/mach-at91/board-usb-a9263.c
Hunk #1 succeeded at 40 with fuzz 1.
patching file arch/arm/mach-at91/clock.c
Hunk #1 succeeded at 30 (offset 1 line).
Hunk #2 succeeded at 275 (offset 1 line).
Hunk #3 succeeded at 658 (offset 1 line).
patching file arch/arm/mach-at91/generic.h
patching file arch/arm/mach-at91/gpio.c
patching file arch/arm/mach-at91/ics1523.c
patching file arch/arm/mach-at91/include/mach/at91cap9.h
patching file arch/arm/mach-at91/include/mach/at91_pmc.h
patching file arch/arm/mach-at91/include/mach/cpu.h
patching file arch/arm/mach-at91/include/mach/ics1523.h
patching file arch/arm/mach-at91/include/mach/spi.h
patching file arch/arm/mach-at91/Kconfig
Hunk #5 succeeded at 251 (offset -9 lines).
Hunk #6 succeeded at 338 (offset -9 lines).
Hunk #7 succeeded at 360 with fuzz 1 (offset -22 lines).
patching file arch/arm/mach-at91/Makefile
Hunk #3 succeeded at 50 (offset -1 lines).
Hunk #4 succeeded at 68 (offset -1 lines).
patching file arch/arm/mach-at91/pm.c
patching file arch/arm/mach-at91/sam9_smc.c
patching file arch/arm/mach-at91/sam9_smc.h
patching file drivers/char/at91_spi.c
patching file drivers/char/at91_spidev.c
patching file drivers/char/Kconfig
Hunk #1 succeeded at 1104 (offset 31 lines).
patching file drivers/char/Makefile
Hunk #1 succeeded at 97 (offset 2 lines).
patching file drivers/i2c/busses/i2c-at91.c
patching file drivers/i2c/busses/Kconfig
Hunk #1 succeeded at 271 (offset -3 lines).
patching file drivers/input/touchscreen/Kconfig
Hunk #1 succeeded at 208 (offset -4 lines).
patching file drivers/input/touchscreen/Makefile
patching file drivers/misc/Kconfig
Hunk #1 FAILED at 145.
Hunk #2 FAILED at 431.
2 out of 2 hunks FAILED -- saving rejects to file drivers/misc/Kconfig.rej
patching file drivers/mtd/devices/at91_dataflash.c
patching file drivers/mtd/devices/Kconfig
Hunk #1 succeeded at 276 (offset -21 lines).
patching file drivers/mtd/devices/Makefile
patching file drivers/mtd/nand/atmel_nand.c
Hunk #3 succeeded at 229 (offset 42 lines).
Hunk #4 succeeded at 406 (offset 42 lines).
Hunk #5 FAILED at 480.
Hunk #6 succeeded at 560 (offset 46 lines).
Hunk #7 succeeded at 606 (offset 46 lines).
1 out of 7 hunks FAILED -- saving rejects to file drivers/mtd/nand/atmel_nand.c.rej
patching file drivers/mtd/nand/Kconfig
Hunk #1 succeeded at 296 (offset 7 lines).
Hunk #2 succeeded at 329 (offset 7 lines).
patching file drivers/net/arm/at91_ether.c
Hunk #9 FAILED at 1087.
Hunk #10 succeeded at 1109 (offset -1 lines).
Hunk #11 succeeded at 1156 (offset -1 lines).
Hunk #12 FAILED at 1177.
2 out of 12 hunks FAILED -- saving rejects to file drivers/net/arm/at91_ether.c.rej
patching file drivers/net/arm/at91_ether.h
patching file drivers/net/arm/Kconfig
patching file drivers/net/arm/ks8695_ether.c
patching file drivers/net/arm/ks8695_ether.h
patching file drivers/net/arm/Makefile
patching file drivers/pcmcia/at91_cf.c
patching file drivers/pcmcia/Kconfig
Hunk #1 succeeded at 273 (offset 3 lines).
patching file drivers/rtc/rtc-at91rm9200.c
Hunk #1 succeeded at 299 (offset 2 lines).
patching file drivers/rtc/rtc-at91sam9.c
patching file drivers/spi/Kconfig
patching file drivers/spi/Makefile
patching file drivers/spi/spi_at91_bitbang.c
patching file drivers/usb/gadget/at91_udc.c
patching file drivers/usb/host/ohci-at91.c
patching file drivers/watchdog/at91sam9_wdt.c.rej
patching file drivers/video/backlight/kb920x_bl.c
patching file drivers/video/backlight/Kconfig
Hunk #1 succeeded at 149 (offset -27 lines).
patching file drivers/video/backlight/Makefile
Hunk #1 FAILED at 20.
1 out of 1 hunk FAILED -- saving rejects to file drivers/video/backlight/Makefile.rej
patching file drivers/video/Kconfig
Hunk #1 succeeded at 918 (offset -2 lines).
patching file drivers/video/Makefile
patching file drivers/video/s1d15605fb.c
patching file include/linux/clk.h
Hunk #1 succeeded at 121 (offset -4 lines).
patching file sound/spi/at73c213.c
Patch failed!  Please fix linux-2.6.28-rc6-at91.patch.gz!
make: *** [/usr/arm/buildroot/project_build_arm/at91sam9263ek/linux-2.6.27.10/.patched.arch] Error 1


-------- Original-Nachricht --------
> Datum: Mon, 29 Dec 2008 16:22:45 +0100
> Von: Peter Korsgaard <jacmet@uclibc.org>
> An: buildroot at uclibc.org
> Betreff: Re: [Buildroot] svn commit:	trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6

> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-12-29 15:13:32 +0000 (Mon, 29 Dec 2008)
>  ulf> New Revision: 24603
> 
>  ulf> Log:
>  ulf> Use correct filename for patch
> 
>  ulf> Added:
>  ulf>   
> trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6/linux-2.6.28-rc6-at91-wm8731.patch
>  ulf>   
> trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6/linux-2.6.28-rc6-at91.patch.gz
> 
> Why are you adding -rc6 patches when 2.6.28 is out?
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Sensationsangebot verl?ngert: GMX FreeDSL - Telefonanschluss + DSL 
f?r nur 16,37 Euro/mtl.!* http://dsl.gmx.de/?ac=OM.AD.PD003K1308T4569a
