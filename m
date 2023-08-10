Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E59C04E69
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 17:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF34341DB1;
	Thu, 10 Aug 2023 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF34341DB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iZNOoS4Bh0W; Thu, 10 Aug 2023 17:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBE541881;
	Thu, 10 Aug 2023 17:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBE541881
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8A581BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DED060ACF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DED060ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfdR5UCoahLZ for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 17:45:16 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC5E260AB1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 17:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC5E260AB1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9c21:609:a9c4:c6b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D2CD178035D;
 Thu, 10 Aug 2023 19:45:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Aug 2023 19:45:09 +0200
Date: Thu, 10 Aug 2023 19:45:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230810174509.GG421096@scaer>
References: <20230809214806.2077591-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809214806.2077591-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691689513;
 bh=U2TQo6Pt014wRNbUXuwaIppnQYeC5H5zPBtpIhlFL6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4923JhmtznDyCxFDcpjRa7j9j6YdgRl/3YarKYB8YDUpv3lrdfIySjoLqL96cjkY
 INyAosEi1NND8/UwR39Cg0TGFKaC9MCjlrpssXQwLFnMcFWoU4XMJTu98VhpGIzPwr
 b++oTBhdF/MXmfQQ+74U6tQElXWNntnru9malt4c0a1d9zIW2mFavEfWauCmGVg5oj
 AJdN7UAgTUnGW319+EVXalwM/MhBj2vDWYH2ciZ0Hb+yDcqQWYbjjBS19TJoJX6gHu
 XaVWtXKpYCGc+rj0/U9bnH9ZMry5+uJpmsdGQubkjIPAkAlYlrXIh+ct1olIGL5fku
 pc6v6eXAEORsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q4923Jhm
Subject: Re: [Buildroot] [PATCH] boot/lpc32xxcdl: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-09 23:48 +0200, Thomas Petazzoni spake thusly:
> This package has dubious licensing conditions (not even documented in
> the .mk file), and is a bootloader for very old platforms. The
> defconfigs making use of it have been removed in Buildroot in 2014, in
> commit c6a410964bee6b4c57801c363384778f6908e6a2 ("configs: remove
> lpc32xx defconfigs"), so let's get rid of the package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

There was still a reference to lpc32xxcdl in the test suite for
check-symbol, so I dropped it there too.

I forgot to fix genrandconfig, though... I'll push a followup commit...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |   4 -
>  Config.in.legacy                              |   6 +
>  boot/Config.in                                |   1 -
>  boot/lpc32xxcdl/0001-compiler_name.patch      |  52 -
>  .../0002-delete_redundant_files.patch         | 969 ------------------
>  boot/lpc32xxcdl/0003-libnosys_gnu.patch       | 188 ----
>  boot/lpc32xxcdl/0004-slashes.patch            | 521 ----------
>  boot/lpc32xxcdl/Config.in                     |  10 -
>  boot/lpc32xxcdl/lpc32xxcdl.hash               |   2 -
>  boot/lpc32xxcdl/lpc32xxcdl.mk                 |  71 --
>  10 files changed, 6 insertions(+), 1818 deletions(-)
>  delete mode 100644 boot/lpc32xxcdl/0001-compiler_name.patch
>  delete mode 100644 boot/lpc32xxcdl/0002-delete_redundant_files.patch
>  delete mode 100644 boot/lpc32xxcdl/0003-libnosys_gnu.patch
>  delete mode 100644 boot/lpc32xxcdl/0004-slashes.patch
>  delete mode 100644 boot/lpc32xxcdl/Config.in
>  delete mode 100644 boot/lpc32xxcdl/lpc32xxcdl.hash
>  delete mode 100644 boot/lpc32xxcdl/lpc32xxcdl.mk
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0954f22b4b..627b0cc92b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -108,10 +108,6 @@ boot/at91dataflashboot/0001-do-not-install.patch Upstream
>  boot/at91dataflashboot/0002-eabi-fixes.patch Upstream
>  boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch Upstream
>  boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch Upstream
> -boot/lpc32xxcdl/0001-compiler_name.patch Upstream
> -boot/lpc32xxcdl/0002-delete_redundant_files.patch Upstream
> -boot/lpc32xxcdl/0003-libnosys_gnu.patch Upstream
> -boot/lpc32xxcdl/0004-slashes.patch Upstream
>  boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch Upstream
>  boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch Upstream
>  boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d32ff09216..d6f0eeeee8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2023.08"
>  
> +config BR2_TARGET_LPC32XXCDL
> +	bool "lpc32xxcdl has been removed"
> +	select BR2_LEGACY
> +	help
> +	  lpc32xxcdl has been removed, due to licensing concerns.
> +
>  config BR2_BINUTILS_VERSION_2_38_X
>  	bool "binutils 2.38.x has been removed"
>  	select BR2_LEGACY
> diff --git a/boot/Config.in b/boot/Config.in
> index 58366e035e..9d7f5c4cb9 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -12,7 +12,6 @@ source "boot/binaries-marvell/Config.in"
>  source "boot/boot-wrapper-aarch64/Config.in"
>  source "boot/edk2/Config.in"
>  source "boot/grub2/Config.in"
> -source "boot/lpc32xxcdl/Config.in"
>  source "boot/mv-ddr-marvell/Config.in"
>  source "boot/mxs-bootlets/Config.in"
>  source "boot/optee-os/Config.in"
> diff --git a/boot/lpc32xxcdl/0001-compiler_name.patch b/boot/lpc32xxcdl/0001-compiler_name.patch
> deleted file mode 100644
> index 6aecbdeba6..0000000000
> --- a/boot/lpc32xxcdl/0001-compiler_name.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -Use CROSS_COMPILE as compiler name and stop using libc
> -
> -Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
> ----
> - makerule/lpc32xx/make.lpc32xx.gnu |   22 +++++++++++-----------
> - 1 files changed, 11 insertions(+), 11 deletions(-)
> -
> -diff --git a/makerule/lpc32xx/make.lpc32xx.gnu b/makerule/lpc32xx/make.lpc32xx.gnu
> -index 1014c28..3277d99 100644
> ---- a/makerule/lpc32xx/make.lpc32xx.gnu
> -+++ b/makerule/lpc32xx/make.lpc32xx.gnu
> -@@ -27,19 +27,19 @@ CFLAGS   += -mno-sched-prolog -fno-hosted -mno-thumb-interwork -ffunction-sectio
> - CFLAGS   += -I$(CSP_INC_DIR) -I$(BSP_INC_DIR) -I$(GEN_INC_DIR)
> - AFLAGS   = -mcpu=arm926ej-s
> - AFLAGS   += -I$(CSP_INC_DIR) -I$(BSP_INC_DIR) -I$(GEN_INC_DIR)
> --CC       = arm-none-eabi-gcc
> --AS       = arm-none-eabi-as
> --AR       = arm-none-eabi-ar -r
> --LD       = arm-none-eabi-gcc
> --NM       = arm-none-eabi-nm
> --OBJDUMP  = arm-none-eabi-objdump
> --OBJCOPY  = arm-none-eabi-objcopy
> --READELF  = arm-none-eabi-readelf
> -+CC       = $(CROSS_COMPILE)gcc
> -+AS       = $(CROSS_COMPILE)as
> -+AR       = $(CROSS_COMPILE)ar -r
> -+LD       = $(CROSS_COMPILE)gcc
> -+NM       = $(CROSS_COMPILE)nm
> -+OBJDUMP  = $(CROSS_COMPILE)objdump
> -+OBJCOPY  = $(CROSS_COMPILE)objcopy
> -+READELF  = $(CROSS_COMPILE)readelf
> - LDFLAGS  += -Wl,--gc-sections
> - 
> - LK       =  -static
> - LK       += -Wl,--start-group $(TARGET_CSP_LIB) $(TARGET_BSP_LIB) $(TARGET_GEN_LIB)
> --LK       +=  -lgcc -lc -lg -lm -lstdc++ -lsupc++ 
> -+LK       +=  -nostdlib -lgcc #-lc -lg -lm -lstdc++ -lsupc++ 
> - LK       += -Wl,--end-group
> - MAP      = -Xlinker -Map -Xlinker
> - LDESC    = -Xlinker -T  
> -@@ -47,6 +47,6 @@ ENTRY    = -e
> - BIN      = -bin
> - EXT      = .elf
> - LEXT     = 
> --ELFTOREC =arm-none-eabi-objcopy -O srec --strip-all --verbose
> --ELFTOBIN =arm-none-eabi-objcopy -I elf32-littlearm -O binary --strip-all --verbose
> -+ELFTOREC = $(OBJCOPY) -O srec --strip-all --verbose
> -+ELFTOBIN = $(OBJCOPY) -I elf32-littlearm -O binary --strip-all --verbose
> - REC      =.srec
> --- 
> -1.7.7.3
> -
> diff --git a/boot/lpc32xxcdl/0002-delete_redundant_files.patch b/boot/lpc32xxcdl/0002-delete_redundant_files.patch
> deleted file mode 100644
> index 39966f01e9..0000000000
> --- a/boot/lpc32xxcdl/0002-delete_redundant_files.patch
> +++ /dev/null
> @@ -1,969 +0,0 @@
> -Remove duplicated files to stop the linker from complaining about duplicate
> -symbols
> -
> -Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
> ----
> ---- a/csps/lpc32xx/bsps/fdi3250/startup/examples/s1l/sysapi_timer.c	2011-10-05 19:10:37.000000000 +0200
> -+++ /dev/null	2012-01-01 16:39:47.918907000 +0100
> -@@ -1,212 +0,0 @@
> --/***********************************************************************
> -- * $Id:: sysapi_timer.c 3394 2010-05-06 17:56:27Z usb10132             $
> -- *
> -- * Project: Time support functions
> -- *
> -- * Description:
> -- *     Implements the following functions required for the S1L API
> -- *         time_init
> -- *         time_reset
> -- *         time_start
> -- *         time_stop
> -- *         time_get
> -- *         time_get_rate
> -- *
> -- ***********************************************************************
> -- * Software that is described herein is for illustrative purposes only  
> -- * which provides customers with programming information regarding the  
> -- * products. This software is supplied "AS IS" without any warranties.  
> -- * NXP Semiconductors assumes no responsibility or liability for the 
> -- * use of the software, conveys no license or title under any patent, 
> -- * copyright, or mask work right to the product. NXP Semiconductors 
> -- * reserves the right to make changes in the software without 
> -- * notification. NXP Semiconductors also make no representation or 
> -- * warranty that such application will be suitable for the specified 
> -- * use without further testing or modification. 
> -- **********************************************************************/
> --
> --#include "s1l_sys_inf.h"
> --#include "lpc32xx_intc_driver.h"
> --#include "lpc32xx_timer_driver.h"
> --
> --static UNS_64 base_rate;
> --static INT_32 tdev = 0;
> --
> --/***********************************************************************
> -- *
> -- * Function: time_init
> -- *
> -- * Purpose: Initializes time system
> -- *
> -- * Processing: Initializes the system timer.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: 0 if the init failed, otherwise non-zero
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --INT_32 time_init(void)
> --{
> --	TMR_PSCALE_SETUP_T pscale;
> --
> --	/* Open timer driver */
> --	if (tdev == 0)
> --	{
> --		tdev = timer_open((void *) TIMER_CNTR0, 0);
> --		if (tdev != 0)
> --		{
> --			/* Use a prescale count to 100000 */
> --			pscale.ps_tick_val = 100000;
> --			pscale.ps_us_val = 0; /* Not needed when ps_tick_val != 0 */
> --			timer_ioctl(tdev, TMR_SETUP_PSCALE, (INT_32) &pscale);
> --
> --			/* Get timer clock rate */
> --			base_rate = (UNS_64) timer_ioctl(tdev, TMR_GET_STATUS,
> --				TMR_GET_CLOCK);
> --		}
> --	}
> --
> --	return tdev;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: time_reset
> -- *
> -- * Purpose: Resets system timer
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: Nothing
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --void time_reset(void)
> --{
> --	if (tdev != 0)
> --	{
> --		timer_ioctl(tdev, TMR_RESET, 1);
> --	}
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: time_start
> -- *
> -- * Purpose: Starts system timer
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: Nothing
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --void time_start(void)
> --{
> --	if (tdev != 0)
> --	{
> --		timer_ioctl(tdev, TMR_ENABLE, 1);
> --	}
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: time_stop
> -- *
> -- * Purpose: Stops system timer
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: Nothing
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --void time_stop(void)
> --{
> --	if (tdev != 0)
> --	{
> --		timer_ioctl(tdev, TMR_ENABLE, 0);
> --	}
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: time_get
> -- *
> -- * Purpose: Returns current system time value
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: The number of ticks of the timer counter
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --UNS_64 time_get(void)
> --{
> --	TMR_COUNTS_T tcounts;
> --	UNS_64 ticks = 0;
> --
> --	if (tdev != 0)
> --	{
> --		timer_ioctl(tdev, TMR_GET_COUNTS, (INT_32) &tcounts);
> --
> --		/* Compute number of timer ticks */
> --		ticks = (UNS_64) tcounts.count_val * 100000;
> --		ticks = ticks + (UNS_64) tcounts.ps_count_val;
> --	}
> --
> --	return ticks;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: time_get_rate
> -- *
> -- * Purpose:
> -- *     Returns base tick rate (ticks per second) of the time counter
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: The timer tick rate (in ticks per second)
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --UNS_64 time_get_rate(void)
> --{
> --	return base_rate;
> --}
> --
> ---- a/csps/lpc32xx/bsps/fdi3250/startup/examples/s1l/sys_mmu_cmd_group.c	2011-10-05 19:10:37.000000000 +0200
> -+++ /dev/null	2012-01-01 16:39:47.918907000 +0100
> -@@ -1,746 +0,0 @@
> --/***********************************************************************
> -- * $Id:: sys_mmu_cmd_group.c 3430 2010-05-07 17:39:08Z usb10132        $
> -- *
> -- * Project: Command processor for peek, poke, dump, and fill
> -- *
> -- * Description:
> -- *     Processes commands from the command prompt
> -- *
> -- ***********************************************************************
> -- * Software that is described herein is for illustrative purposes only  
> -- * which provides customers with programming information regarding the  
> -- * products. This software is supplied "AS IS" without any warranties.  
> -- * NXP Semiconductors assumes no responsibility or liability for the 
> -- * use of the software, conveys no license or title under any patent, 
> -- * copyright, or mask work right to the product. NXP Semiconductors 
> -- * reserves the right to make changes in the software without 
> -- * notification. NXP Semiconductors also make no representation or 
> -- * warranty that such application will be suitable for the specified 
> -- * use without further testing or modification. 
> -- **********************************************************************/
> --
> --#include "lpc_arm922t_cp15_driver.h"
> --#include "lpc_string.h"
> --#include "startup.h"
> --#include "s1l_cmds.h"
> --#include "s1l_sys_inf.h"
> --
> --/* dcache command */
> --BOOL_32 cmd_dcache(void);
> --static UNS_32 cmd_dcache_plist[] =
> --{
> --	(PARSE_TYPE_STR), /* The "dcache" command */
> --	(PARSE_TYPE_DEC | PARSE_TYPE_END)
> --};
> --static CMD_ROUTE_T core_dcache_cmd =
> --{
> --	(UNS_8 *) "dcache",
> --	cmd_dcache,
> --	(UNS_8 *) "Enables, disables, or flushes data cache",
> --	(UNS_8 *) "dcache [0(disable), 1(enable), 2(flush)]",
> --	cmd_dcache_plist,
> --	NULL
> --};
> --
> --/* icache command */
> --BOOL_32 cmd_icache(void);
> --static UNS_32 cmd_icache_plist[] =
> --{
> --	(PARSE_TYPE_STR), /* The "icache" command */
> --	(PARSE_TYPE_DEC | PARSE_TYPE_END)
> --};
> --static CMD_ROUTE_T core_icache_cmd =
> --{
> --	(UNS_8 *) "icache",
> --	cmd_icache,
> --	(UNS_8 *) "Enables or disables instruction cache",
> --	(UNS_8 *) "icache [0(disable), 1(enable)]",
> --	cmd_icache_plist,
> --	NULL
> --};
> --
> --/* inval command */
> --BOOL_32 cmd_inval(void);
> --static UNS_32 cmd_inval_plist[] =
> --{
> --	(PARSE_TYPE_STR | PARSE_TYPE_END) /* The "inval" command */
> --};
> --static CMD_ROUTE_T core_inval_cmd =
> --{
> --	(UNS_8 *) "inval",
> --	cmd_inval,
> --	(UNS_8 *) "Flushes data cache and invalidates instruction cache",
> --	(UNS_8 *) "inval",
> --	cmd_inval_plist,
> --	NULL
> --};
> --
> --/* mmuenab command */
> --BOOL_32 cmd_mmuenab(void);
> --static UNS_32 cmd_mmuenab_plist[] =
> --{
> --	(PARSE_TYPE_STR), /* The "mmuenab" command */
> --	(PARSE_TYPE_DEC | PARSE_TYPE_END)
> --};
> --static CMD_ROUTE_T core_mmuenab_cmd =
> --{
> --	(UNS_8 *) "mmuenab",
> --	cmd_mmuenab,
> --	(UNS_8 *) "Enables or disables the MMU",
> --	(UNS_8 *) "mmuenab [0(disable), 1(enable)]",
> --	cmd_mmuenab_plist,
> --	NULL
> --};
> --
> --/* map command */
> --BOOL_32 cmd_map(void);
> --static UNS_32 cmd_map_plist[] =
> --{
> --	(PARSE_TYPE_STR), /* The "map" command */
> --	(PARSE_TYPE_HEX),
> --	(PARSE_TYPE_HEX),
> --	(PARSE_TYPE_DEC),
> --	(PARSE_TYPE_DEC | PARSE_TYPE_END),
> --};
> --static CMD_ROUTE_T core_map_cmd =
> --{
> --	(UNS_8 *) "map",
> --	cmd_map,
> --	(UNS_8 *) "Maps a range of physical address sections to virtual addresses",
> --	(UNS_8 *) "map [virt hex addr][phy hex addr][sections][0(uncached), 1(cached), 2(unmap)]",
> --	cmd_map_plist,
> --	NULL
> --};
> --
> --/* mmuinfo command */
> --static BOOL_32 cmd_mmuinfo(void);
> --static UNS_32 cmd_mmuinfo_plist[] =
> --{
> --	(PARSE_TYPE_STR | PARSE_TYPE_END) /* The "mmuinfo" command */
> --};
> --static CMD_ROUTE_T core_mmuinfo_cmd =
> --{
> --	(UNS_8 *) "mmuinfo",
> --	cmd_mmuinfo,
> --	(UNS_8 *) "Dumps page table and MMU info",
> --	(UNS_8 *) "mmuinfo",
> --	cmd_mmuinfo_plist,
> --	NULL
> --};
> --
> --/* MMU group */
> --static GROUP_LIST_T mmu_group =
> --{
> --	(UNS_8 *) "mmu", /* mmu group */
> --	(UNS_8 *) "MMU command group",
> --	NULL,
> --	NULL
> --};
> --
> --static UNS_8 enabled_msg [] =" enabled";
> --static UNS_8 disabled_msg [] =" disabled";
> --static UNS_8 dcache_msg[] = "Data cache";
> --static UNS_8 icache_msg[] = "Instruction cache";
> --static UNS_8 pagetab_msg[] = "Page table at address: ";
> --static UNS_8 slist_msg[] = "Type        Virt       Phy        fl Size";
> --static UNS_8 mmu_msg [] ="MMU";
> --static UNS_8 cpage_msg[] = "Coarse page:";
> --static UNS_8 fpage_msg[] = "Fine page  :";
> --static UNS_8 sect_msg[] =  "Section    :";
> --static UNS_8 mbytes_msg[] = "M";
> --static UNS_8 map1_err_msg[] =
> --	"Error : section addresses must be aligned on a 32-bit boundary";
> --static UNS_8 map2_err_msg[] =
> --	"Error : Number of sections exceeds address range of device";
> --static UNS_8 phya_msg[] = "Virtual address ";
> --static UNS_8 mapped_msg[] = " mapped to physical address ";
> --static UNS_8 unmapped_msg[] = " unmapped from physical address ";
> --static UNS_8 cached_msg[] = " (cached)";
> --static UNS_8 inval_msg[] = " invalidated";
> --static UNS_8 caches_msg [] ="Caches";
> --static UNS_8 flushed_msg[] = " flushed";
> --
> --/***********************************************************************
> -- *
> -- * Function: show_section
> -- *
> -- * Purpose: Display section information
> -- *
> -- * Processing:
> -- *     See function.
> -- *
> -- * Parameters:
> -- *     mmu_reg   : MMU settings for this section
> -- *     virt_addr : Starting virtual address for this section
> -- *     segs      : Number of 1M segments for this section
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: Nothing
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --static void show_section(UNS_32 mmu_reg,
> --						 UNS_32 virt_addr,
> --						 UNS_32 segs) 
> --{
> --	UNS_8 straddr [16];
> --	UNS_32 mmu_phy;
> --
> --	if ((mmu_reg & ARM922T_L1D_TYPE_PG_SN_MASK) !=
> --		ARM922T_L1D_TYPE_FAULT) 
> --	{
> --		if ((mmu_reg & ARM922T_L1D_TYPE_PG_SN_MASK) ==
> --			ARM922T_L1D_TYPE_CPAGE) 
> --		{
> --			term_dat_out(cpage_msg);
> --		}
> --		else if ((mmu_reg & ARM922T_L1D_TYPE_PG_SN_MASK) ==
> --			ARM922T_L1D_TYPE_FPAGE) 
> --		{
> --			term_dat_out(fpage_msg);
> --		}
> --		else
> --		{
> --			term_dat_out(sect_msg);
> --		}
> --
> --		/* Compute virtual address */
> --		str_makehex(straddr, virt_addr, 8);
> --		term_dat_out(straddr);
> --		term_dat_out((UNS_8 *) " ");
> --
> --		/* Compute mapped physical address */
> --		if ((mmu_reg & ARM922T_L1D_TYPE_PG_SN_MASK) ==
> --		ARM922T_L1D_TYPE_SECTION) 
> --		{
> --			mmu_phy = mmu_reg & 0xFFF00000;
> --		}
> --		else 
> --		{
> --			/* Don't compute addresses for non-sections */
> --			mmu_phy = 0;
> --		}
> --		str_makehex(straddr, mmu_phy, 8);
> --		term_dat_out(straddr);
> --		term_dat_out((UNS_8 *) " ");
> --
> --		/* MMU flags */
> --		if ((mmu_reg & ARM922T_L1D_BUFFERABLE) != 0) 
> --		{
> --			term_dat_out((UNS_8 *) "b");
> --		}
> --		else 
> --		{
> --			term_dat_out((UNS_8 *) " ");
> --		}
> --		if ((mmu_reg & ARM922T_L1D_CACHEABLE) != 0) 
> --		{
> --			term_dat_out((UNS_8 *) "c");
> --		}
> --		else 
> --		{
> --			term_dat_out((UNS_8 *) " ");
> --		}
> --		term_dat_out((UNS_8 *) " ");
> --
> --		/* Displays used megabytes */
> --		str_makedec(straddr, segs);
> --		term_dat_out(straddr);
> --		term_dat_out_crlf(mbytes_msg);
> --	}
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: mmu_dumpinfo
> -- *
> -- * Purpose: Display MMU info
> -- *
> -- * Processing:
> -- *     Display the MMU information, including enable status, cache
> -- *     status, and page table.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --static BOOL_32 mmu_dumpinfo(void) 
> --{
> --	UNS_32 segsz, last_mmu_reg, mmu_vrt, mmu_reg, mmu_vrtsav = 0, *pt;
> --	UNS_32 mlast_mmu_reg, mmmu_reg;
> --	int idx;
> --	UNS_8 hexaddr [16];
> --
> --	term_dat_out(mmu_msg);
> --	if (cp15_mmu_enabled() == FALSE) 
> --	{
> --		term_dat_out_crlf(disabled_msg);
> --	}
> --	else 
> --	{
> --		term_dat_out_crlf(enabled_msg);
> --
> --	    /* Get MMU control register word */
> --  		mmu_reg = cp15_get_mmu_control_reg();
> --
> --		/* Instruction cache status */
> --		term_dat_out(icache_msg);
> --		if ((mmu_reg & ARM922T_MMU_CONTROL_I) == 0) 
> --		{
> --			term_dat_out_crlf(disabled_msg);
> --		}
> --		else 
> --		{
> --			term_dat_out_crlf(enabled_msg);
> --		}
> --
> --		/* Data cache status */
> --		term_dat_out(dcache_msg);
> --		if ((mmu_reg & ARM922T_MMU_CONTROL_C) == 0) 
> --		{
> --			term_dat_out_crlf(disabled_msg);
> --		}
> --		else 
> --		{
> --			term_dat_out_crlf(enabled_msg);
> --		}
> --
> --		term_dat_out(pagetab_msg);
> --		mmu_reg = (UNS_32) cp15_get_ttb();
> --		str_makehex(hexaddr, mmu_reg, 8);
> --		term_dat_out_crlf(hexaddr);
> --		term_dat_out_crlf(slist_msg);
> --
> --		/* Process MMU table - assume that the physical and
> --		   virtual locations of table are the same */
> --		pt = (UNS_32 *) mmu_reg;
> --		mmu_vrt = 0x0;
> --		segsz = 0xFFFFFFFF;
> --		last_mmu_reg = mlast_mmu_reg = 0xFFFFFFFF;
> --		for (idx = 0; idx < 4096; idx++) 
> --		{
> --			mmu_reg = *pt;
> --			mmmu_reg = (mmu_reg & (ARM922T_L1D_TYPE_PG_SN_MASK |
> --				ARM922T_L1D_BUFFERABLE | ARM922T_L1D_CACHEABLE));
> --			segsz = segsz + 1;
> --
> --			if ((last_mmu_reg != 0xFFFFFFFF) &&
> --				(mlast_mmu_reg != mmmu_reg))
> --			{
> --				show_section(last_mmu_reg, mmu_vrtsav, segsz);
> --				segsz = 0;
> --			}
> --
> --			if (mlast_mmu_reg != mmmu_reg) 
> --			{
> --				mmu_vrtsav = mmu_vrt;
> --				last_mmu_reg = mmu_reg;
> --				mlast_mmu_reg = mmmu_reg;
> --			}
> --
> --			pt++;
> --			mmu_vrt += 0x00100000;
> --		}
> --	}
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: mmu_dumpmap
> -- *
> -- * Purpose: Map a virtual address range to a physical range
> -- *
> -- * Processing:
> -- *     From the input addresses and number of sections, generate the
> -- *     appropriate entries in the page table.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --static BOOL_32 mmu_dumpmap(UNS_32 vrt,
> --						   UNS_32 phy,
> --						   UNS_32 sections,
> --						   UNS_32 cache) 
> --{
> --	BOOL_32 processed = FALSE;
> --	UNS_32 mmu_phy, mmu_vrt, tmp1 = 0, tmp2, *pt;
> --	UNS_8 hexaddr [16];
> --
> --	/* Verify address boundaries are sectional */
> --	mmu_vrt = vrt & ~ARM922T_L2D_SN_BASE_MASK;
> --	mmu_phy = phy & ~ARM922T_L2D_SN_BASE_MASK;
> --	if ((mmu_vrt != 0) || (mmu_phy != 0)) 
> --	{
> --		term_dat_out_crlf(map1_err_msg);
> --	}
> --	else 
> --	{
> --		/* Verify that address range and section count will not
> --		   exceed address range of device */
> --		tmp1 = vrt >> 20;
> --		tmp1 = (tmp1 + sections) - 1;
> --		tmp2 = phy >> 20;
> --		tmp2 = (tmp2 + sections) - 1;
> --		if ((tmp1 < 4096) && (tmp2 < 4096)) 
> --		{
> --			/* Good address range and good section count */
> --			processed = TRUE;
> --		}
> --		else 
> --		{
> --			term_dat_out_crlf(map2_err_msg);
> --		}
> --	}
> --	
> --	/* Generate static part of MMU word */
> --	if (cache == 0) 
> --	{
> --		/* Section mapped with cache disabled */
> --		tmp1 = ARM922T_L1D_TYPE_SECTION;
> --	}
> --	else if (cache == 1)
> --	{
> --		/* Section mapped with cache enabled */
> --		tmp1 = (ARM922T_L1D_BUFFERABLE | ARM922T_L1D_CACHEABLE |
> --			ARM922T_L1D_TYPE_SECTION);
> --	}
> --	else if (cache == 2)
> --	{
> --		/* Section unmapped */
> --		tmp1 = ARM922T_L1D_TYPE_FAULT;
> --	}
> --	tmp1 |= ARM922T_L1D_AP_ALL;
> --
> --	/* Offset into page table for virtual address */
> --	tmp2 = (vrt >> 20);
> --	pt = cp15_get_ttb() + tmp2;
> --
> --	/* Loop until all sections are complete */
> --	while ((sections > 0) && (processed == TRUE)) 
> --	{
> --		/* Add in physical address */
> --		tmp2 = tmp1 | (phy & ARM922T_L2D_SN_BASE_MASK);
> --
> --		/* Save new section descriptor for virtual address */
> --		*pt = tmp2;
> --
> --		/* Output message shown the map */
> --		term_dat_out(phya_msg);
> --		str_makehex(hexaddr, phy, 8);
> --		term_dat_out(hexaddr);
> --		if (cache == 2) 
> --		{
> --			term_dat_out(unmapped_msg);
> --		}
> --		else 
> --		{
> --			term_dat_out(mapped_msg);
> --		}
> --		str_makehex(hexaddr, vrt, 8);
> --		term_dat_out(hexaddr);
> --		if (cache == 1) 
> --		{
> --			term_dat_out(cached_msg);
> --		}
> --		term_dat_out_crlf((UNS_8 *) "");
> --
> --		/* Next section and page table entry*/
> --		phy += 0x00100000;
> --		vrt += 0x00100000;
> --		pt++;
> --		sections--;
> --	}
> --
> --	return processed;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_mmuinfo
> -- *
> -- * Purpose: Display MMU information
> -- *
> -- * Processing:
> -- *     See function. 
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --static BOOL_32 cmd_mmuinfo(void) 
> --{
> --	mmu_dumpinfo();
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_map
> -- *
> -- * Purpose: Map a physical address region to a virtual region
> -- *
> -- * Processing:
> -- *     See function. 
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --BOOL_32 cmd_map(void) 
> --{
> --	UNS_32 phy, virt, sects, ce = 0;
> --
> --	/* Get arguments */
> --	virt = cmd_get_field_val(1);
> --	phy = cmd_get_field_val(2);
> --	sects = cmd_get_field_val(3);
> --	ce = cmd_get_field_val(4);
> --
> --	if (ce <= 2) 
> --	{
> --		mmu_dumpmap(virt, phy, sects, ce);
> --	}
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_inval
> -- *
> -- * Purpose: MMU cache flush and invalidate
> -- *
> -- * Processing:
> -- *     See function. 
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --BOOL_32 cmd_inval(void) 
> --{
> --	dcache_flush();
> --	icache_inval();
> --	term_dat_out(caches_msg);
> --	term_dat_out(inval_msg);
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_dcache
> -- *
> -- * Purpose: MMU data cache enable and disable
> -- *
> -- * Processing:
> -- *     If the value passed in the parser is 1, enable the data cache,
> -- *     otherwise disable the data cache.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --BOOL_32 cmd_dcache(void) 
> --{
> --	UNS_32 cenable;
> --	UNS_8 *ppar;
> --
> --	/* Get argument */
> --	cenable = cmd_get_field_val(1);
> --
> --	switch (cenable)
> --	{
> --		case 0:
> --			dcache_flush();
> --			cp15_set_dcache(0);
> --			ppar = disabled_msg;
> --			break;
> --
> --		case 1:
> --			cp15_invalidate_cache();
> --			cp15_set_dcache(1);
> --			ppar = enabled_msg;
> --			break;
> --
> --		case 2:
> --		default:
> --			dcache_flush();
> --			ppar = flushed_msg;
> --			break;
> --	}
> --
> --	term_dat_out(dcache_msg);
> --	term_dat_out_crlf(ppar);
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_icache
> -- *
> -- * Purpose: MMU instruction cache enable and disable
> -- *
> -- * Processing:
> -- *     If the value passed in the parser is 1, enable the instruction
> -- *     cache, otherwise disable the instruction cache.
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --BOOL_32 cmd_icache(void)
> --{
> --	UNS_32 cenable;
> --	UNS_8 *ppar;
> --
> --	/* Get argument */
> --	cenable = cmd_get_field_val(1);
> --
> --	if (cenable == 1) 
> --	{
> --		dcache_flush();
> --		cp15_invalidate_cache();
> --		cp15_set_icache(1);
> --		ppar = enabled_msg;
> --	}
> --	else
> --	{
> --		cp15_set_icache(0);
> --		ppar = disabled_msg;
> --	}
> --
> --	term_dat_out(icache_msg);
> --	term_dat_out_crlf(ppar);
> --
> --	return TRUE;
> --}
> --
> --
> --/***********************************************************************
> -- *
> -- * Function: cmd_mmuenab
> -- *
> -- * Purpose: Enable or disable MMU
> -- *
> -- * Processing:
> -- *     See function. 
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: TRUE if the command was processed, otherwise FALSE
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --BOOL_32 cmd_mmuenab(void) 
> --{
> --	UNS_8 *ppar;
> --	UNS_32 cenable;
> --
> --	term_dat_out_crlf((UNS_8 *) "Warning: Changing MMU status on "
> --		" cached and buffered code can cause system crashes.");
> --
> --	/* Get argument */
> --	cenable = cmd_get_field_val(1);
> --
> --	if (cenable == 1) 
> --	{
> --		if ((cp15_get_mmu_control_reg() & ARM922T_MMU_CONTROL_C) != 0)
> --		{
> --			cp15_invalidate_cache();
> --		}
> --
> --		cp15_set_mmu(1);
> --		ppar = enabled_msg;
> --	}
> --	else
> --	{
> --		cp15_dcache_flush();
> --		cp15_write_buffer_flush();
> --		cp15_invalidate_cache();
> --		cp15_set_mmu(0);
> --		ppar = disabled_msg;
> --	}
> --
> --	term_dat_out(mmu_msg);
> --	term_dat_out_crlf(ppar);
> --
> --	return TRUE;
> --}
> --
> --/***********************************************************************
> -- *
> -- * Function: mmu_cmd_group_init
> -- *
> -- * Purpose: Initialize MMU command group
> -- *
> -- * Processing:
> -- *     See function. 
> -- *
> -- * Parameters: None
> -- *
> -- * Outputs: None
> -- *
> -- * Returns: Nothin
> -- *
> -- * Notes: None
> -- *
> -- **********************************************************************/
> --void mmu_cmd_group_init(void)
> --{
> --	/* Add MMU group */
> --	cmd_add_group(&mmu_group);
> --
> --	/* Add commands to the MMU group */
> --	cmd_add_new_command(&mmu_group, &core_dcache_cmd);
> --	cmd_add_new_command(&mmu_group, &core_icache_cmd);
> --	cmd_add_new_command(&mmu_group, &core_inval_cmd);
> --	cmd_add_new_command(&mmu_group, &core_mmuenab_cmd);
> --	cmd_add_new_command(&mmu_group, &core_map_cmd);
> --	cmd_add_new_command(&mmu_group, &core_mmuinfo_cmd);
> --}
> diff --git a/boot/lpc32xxcdl/0003-libnosys_gnu.patch b/boot/lpc32xxcdl/0003-libnosys_gnu.patch
> deleted file mode 100644
> index cfd77bead6..0000000000
> --- a/boot/lpc32xxcdl/0003-libnosys_gnu.patch
> +++ /dev/null
> @@ -1,188 +0,0 @@
> -Fix compilation and eabi issues
> -
> -Since we are not linking with libc anymore, we need to define our own memset,
> -strlen and memcpy. Also, as we are using a *libc compiler, we need to "handle"
> -exceptions (mostly division by 0) by defining raise() and
> -__aeabi_unwind_cpp_pr0.
> -
> -Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
> ----
> - csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c  |   41 +++++++++++++++++++++++
> - csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c |   41 +++++++++++++++++++++++
> - csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c |   41 +++++++++++++++++++++++
> - 3 files changed, 123 insertions(+), 0 deletions(-)
> -
> -diff --git a/csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c b/csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c
> -index 385b0ab..f1f0a0a 100644
> ---- a/csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c
> -+++ b/csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c
> -@@ -25,6 +25,7 @@
> - #include <errno.h>
> - #include <sys/times.h>
> - #include <sys/stat.h>
> -+#include <sys/types.h>
> - 
> - /* errno definition */
> - #undef errno
> -@@ -125,4 +126,44 @@ int _write(int file, char *ptr, int len){
> -     return 0;
> - }
> - 
> -+void * memset(void * s,int c,size_t count)
> -+{
> -+        char *xs = (char *) s;
> -+
> -+        while (count--)
> -+                *xs++ = c;
> -+
> -+        return s;
> -+}
> -+
> -+
> -+size_t strlen(const char * s)
> -+{
> -+        const char *sc;
> -+
> -+        for (sc = s; *sc != '\0'; ++sc)
> -+                /* nothing */;
> -+        return sc - s;
> -+}
> -+
> -+void * memcpy(void * dest,const void *src,size_t count)
> -+{
> -+        char *tmp = (char *) dest, *s = (char *) src;
> -+
> -+        while (count--)
> -+                *tmp++ = *s++;
> -+
> -+        return dest;
> -+}
> -+
> -+
> -+/* Dummy functions to avoid linker complaints */
> -+void __aeabi_unwind_cpp_pr0(void)
> -+{
> -+};
> -+
> -+void raise(void)
> -+{
> -+};
> -+
> - #endif /*__GNUC__*/
> -diff --git a/csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c b/csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c
> -index 385b0ab..f1f0a0a 100644
> ---- a/csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c
> -+++ b/csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c
> -@@ -25,6 +25,7 @@
> - #include <errno.h>
> - #include <sys/times.h>
> - #include <sys/stat.h>
> -+#include <sys/types.h>
> - 
> - /* errno definition */
> - #undef errno
> -@@ -125,4 +126,44 @@ int _write(int file, char *ptr, int len){
> -     return 0;
> - }
> - 
> -+void * memset(void * s,int c,size_t count)
> -+{
> -+        char *xs = (char *) s;
> -+
> -+        while (count--)
> -+                *xs++ = c;
> -+
> -+        return s;
> -+}
> -+
> -+
> -+size_t strlen(const char * s)
> -+{
> -+        const char *sc;
> -+
> -+        for (sc = s; *sc != '\0'; ++sc)
> -+                /* nothing */;
> -+        return sc - s;
> -+}
> -+
> -+void * memcpy(void * dest,const void *src,size_t count)
> -+{
> -+        char *tmp = (char *) dest, *s = (char *) src;
> -+
> -+        while (count--)
> -+                *tmp++ = *s++;
> -+
> -+        return dest;
> -+}
> -+
> -+
> -+/* Dummy functions to avoid linker complaints */
> -+void __aeabi_unwind_cpp_pr0(void)
> -+{
> -+};
> -+
> -+void raise(void)
> -+{
> -+};
> -+
> - #endif /*__GNUC__*/
> -diff --git a/csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c b/csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c
> -index cfdb674..6b50c60 100644
> ---- a/csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c
> -+++ b/csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c
> -@@ -25,6 +25,7 @@
> - #include <errno.h>
> - #include <sys/times.h>
> - #include <sys/stat.h>
> -+#include <sys/types.h>
> - 
> - /* errno definition */
> - #undef errno
> -@@ -125,4 +126,44 @@ int _write(int file, char *ptr, int len){
> -     return 0;
> - }
> - 
> -+void * memset(void * s,int c,size_t count)
> -+{
> -+        char *xs = (char *) s;
> -+
> -+        while (count--)
> -+                *xs++ = c;
> -+
> -+        return s;
> -+}
> -+
> -+
> -+size_t strlen(const char * s)
> -+{
> -+        const char *sc;
> -+
> -+        for (sc = s; *sc != '\0'; ++sc)
> -+                /* nothing */;
> -+        return sc - s;
> -+}
> -+
> -+void * memcpy(void * dest,const void *src,size_t count)
> -+{
> -+        char *tmp = (char *) dest, *s = (char *) src;
> -+
> -+        while (count--)
> -+                *tmp++ = *s++;
> -+
> -+        return dest;
> -+}
> -+
> -+
> -+/* Dummy functions to avoid linker complaints */
> -+void __aeabi_unwind_cpp_pr0(void)
> -+{
> -+};
> -+
> -+void raise(void)
> -+{
> -+};
> -+
> - #endif /*__GNUC__*/
> --- 
> -1.7.7.3
> -
> diff --git a/boot/lpc32xxcdl/0004-slashes.patch b/boot/lpc32xxcdl/0004-slashes.patch
> deleted file mode 100644
> index 94c184780e..0000000000
> --- a/boot/lpc32xxcdl/0004-slashes.patch
> +++ /dev/null
> @@ -1,521 +0,0 @@
> -Use slashes instead of backslashes
> -
> -Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
> ----
> - .../bsps/common/examples/buildfiles/makefile       |   10 +++---
> - .../startup/examples/burners/makefile.burner       |   16 +++++-----
> - csps/lpc32xx/bsps/ea3250/source/makefile           |   10 +++---
> - csps/lpc32xx/bsps/fdi3250/source/makefile          |   12 ++++----
> - csps/lpc32xx/bsps/phy3250/examples/makefile        |    2 +-
> - csps/lpc32xx/bsps/phy3250/source/makefile          |    2 +-
> - .../examples/Burners/nor/kickstart/makefile        |    2 +-
> - .../startup/examples/Burners/nor/norerase/makefile |    2 +-
> - .../startup/examples/Burners/nor/s1lapp/makefile   |    2 +-
> - .../examples/Burners/spi/kickstart/makefile        |    2 +-
> - csps/lpc32xx/source/makefile                       |   10 +++---
> - lpc/source/makefile                                |   10 +++---
> - makefile                                           |    2 +-
> - makerule/common/make.rules.environment             |   30 ++++++++++----------
> - makerule/lpc32xx/make.lpc32xx.gnu                  |    2 +-
> - makerule/lpc32xx/make.lpc32xx.iar                  |   12 ++++----
> - makerule/lpc32xx/make.lpc32xx.keil                 |    6 ++--
> - makerule/lpc32xx/make.lpc32xx.rvw                  |    2 +-
> - 18 files changed, 67 insertions(+), 67 deletions(-)
> -
> -diff --git a/csps/lpc32xx/bsps/common/examples/buildfiles/makefile b/csps/lpc32xx/bsps/common/examples/buildfiles/makefile
> -index cf4977c..1da2201 100644
> ---- a/csps/lpc32xx/bsps/common/examples/buildfiles/makefile
> -+++ b/csps/lpc32xx/bsps/common/examples/buildfiles/makefile
> -@@ -25,16 +25,16 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> --AFLAGS +=-I..\Include
> --CFLAGS +=-I..\Include
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> -+AFLAGS +=-I../Include
> -+CFLAGS +=-I../Include
> - 
> - ########################################################################
> - #
> -@@ -42,6 +42,6 @@ CFLAGS +=-I..\Include
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - 
> -diff --git a/csps/lpc32xx/bsps/common/startup/examples/burners/makefile.burner b/csps/lpc32xx/bsps/common/startup/examples/burners/makefile.burner
> -index fca3947..18bd703 100644
> ---- a/csps/lpc32xx/bsps/common/startup/examples/burners/makefile.burner
> -+++ b/csps/lpc32xx/bsps/common/startup/examples/burners/makefile.burner
> -@@ -22,9 +22,9 @@
> - #
> - ########################################################################
> - 
> --COMMON_BASE := $(NXPMCU_SOFTWARE)\csps\$(CSP)\bsps\common
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> --include $(COMMON_BASE)\startup\examples\buildfiles\make.env
> -+COMMON_BASE := $(NXPMCU_SOFTWARE)/csps/$(CSP)/bsps/common
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> -+include $(COMMON_BASE)/startup/examples/buildfiles/make.env
> - 
> - ########################################################################
> - # ARM Realview
> -@@ -38,7 +38,7 @@ AFLAGS += --predefine "USE_ALL_STACKS SETL {TRUE}"
> - #AFLAGS += --predefine "RW_RELOC SETL {TRUE}"
> - 
> - # This runs from IRAM
> --LDSCRIPT =$(COMMON_BASE)\startup\examples\buildfiles\ldscript_iram_rvw.ld
> -+LDSCRIPT =$(COMMON_BASE)/startup/examples/buildfiles/ldscript_iram_rvw.ld
> - LDFLAGS = --remove
> - MAP = --map --info=totals,sizes,unused --symbols --list
> - endif
> -@@ -55,7 +55,7 @@ AFLAGS += --predefine "USE_ALL_STACKS SETL {TRUE}"
> - #AFLAGS += --predefine "RW_RELOC SETL {TRUE}"
> - 
> - # This runs from IRAM
> --LDSCRIPT =$(COMMON_BASE)\startup\examples\buildfiles\ldscript_iram_rvw.ld
> -+LDSCRIPT =$(COMMON_BASE)/startup/examples/buildfiles/ldscript_iram_rvw.ld
> - LDFLAGS = --remove
> - MAP = --map --info=totals,sizes,unused --symbols --list
> - endif
> -@@ -72,7 +72,7 @@ AFLAGS += --defsym USE_ALL_STACKS=1
> - #AFLAGS += --defsym RW_RELOC=1
> - 
> - # This runs from IRAM
> --LDSCRIPT =$(COMMON_BASE)\startup\examples\buildfiles\ldscript_iram_gnu.ld
> -+LDSCRIPT =$(COMMON_BASE)/startup/examples/buildfiles/ldscript_iram_gnu.ld
> - 
> - endif
> - 
> -@@ -108,7 +108,7 @@ endif
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> - 
> - ########################################################################
> - #
> -@@ -157,6 +157,6 @@ endif
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - .PHONY: debug bin
> -diff --git a/csps/lpc32xx/bsps/ea3250/source/makefile b/csps/lpc32xx/bsps/ea3250/source/makefile
> -index 7cada25..2899b20 100644
> ---- a/csps/lpc32xx/bsps/ea3250/source/makefile
> -+++ b/csps/lpc32xx/bsps/ea3250/source/makefile
> -@@ -22,16 +22,16 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> --AFLAGS +=-I..\Include
> --CFLAGS +=-I..\Include
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> -+AFLAGS +=-I../Include
> -+CFLAGS +=-I../Include
> - 
> - ########################################################################
> - #
> -@@ -64,7 +64,7 @@ realclean: lib_realclean
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - .PHONY: all lib_clean lib_realclean
> - 
> -diff --git a/csps/lpc32xx/bsps/fdi3250/source/makefile b/csps/lpc32xx/bsps/fdi3250/source/makefile
> -index 4e153bb..11e4b63 100644
> ---- a/csps/lpc32xx/bsps/fdi3250/source/makefile
> -+++ b/csps/lpc32xx/bsps/fdi3250/source/makefile
> -@@ -22,16 +22,16 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> --AFLAGS +=-I..\Include
> --CFLAGS +=-I..\Include
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> -+AFLAGS +=-I../Include
> -+CFLAGS +=-I../Include
> - 
> - ########################################################################
> - #
> -@@ -53,7 +53,7 @@ lib_clean:
> - # delete all targets this Makefile can make and all built libraries
> - # linked in
> - lib_realclean: 
> --	-@$(RM) $(BSP_LIB_DIR)\*.a
> -+	-@$(RM) $(BSP_LIB_DIR)/*.a
> - 	-@$(RMDIR) $(BSP_LIB_DIR)
> - 	
> - clean: lib_clean
> -@@ -65,7 +65,7 @@ realclean: lib_realclean
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - .PHONY: all lib_clean lib_realclean
> - 
> -diff --git a/csps/lpc32xx/bsps/phy3250/examples/makefile b/csps/lpc32xx/bsps/phy3250/examples/makefile
> -index b939252..e7feaa6 100644
> ---- a/csps/lpc32xx/bsps/phy3250/examples/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/examples/makefile
> -@@ -25,7 +25,7 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - SUBDIRS = adc dram_self_refresh hstimer hsuart i2c kscan lcd_colorbars
> - SUBDIRS += lcd_tsc mi2c mstimer pwm pwm_simple rtc sdcard sdcard_dma
> -diff --git a/csps/lpc32xx/bsps/phy3250/source/makefile b/csps/lpc32xx/bsps/phy3250/source/makefile
> -index 7c48e7d..750b776 100644
> ---- a/csps/lpc32xx/bsps/phy3250/source/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/source/makefile
> -@@ -32,7 +32,7 @@ include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> - AFLAGS +=-I../Include
> - CFLAGS +=-I../Include
> - 
> -diff --git a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/kickstart/makefile b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/kickstart/makefile
> -index 01e2b38..526d6cc 100644
> ---- a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/kickstart/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/kickstart/makefile
> -@@ -78,7 +78,7 @@ endif
> - 
> - ########################################################################
> - #
> --# Compiler\linker specific stuff
> -+# Compiler/linker specific stuff
> - #
> - ########################################################################
> - 
> -diff --git a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/norerase/makefile b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/norerase/makefile
> -index ce329f5..e81b8db 100644
> ---- a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/norerase/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/norerase/makefile
> -@@ -77,7 +77,7 @@ endif
> - 
> - ########################################################################
> - #
> --# Compiler\linker specific stuff
> -+# Compiler/linker specific stuff
> - #
> - ########################################################################
> - 
> -diff --git a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/s1lapp/makefile b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/s1lapp/makefile
> -index 4426fc7..196faec 100644
> ---- a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/s1lapp/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/nor/s1lapp/makefile
> -@@ -77,7 +77,7 @@ endif
> - 
> - ########################################################################
> - #
> --# Compiler\linker specific stuff
> -+# Compiler/linker specific stuff
> - #
> - ########################################################################
> - 
> -diff --git a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/spi/kickstart/makefile b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/spi/kickstart/makefile
> -index dc73b64..39fc304 100644
> ---- a/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/spi/kickstart/makefile
> -+++ b/csps/lpc32xx/bsps/phy3250/startup/examples/Burners/spi/kickstart/makefile
> -@@ -78,7 +78,7 @@ endif
> - 
> - ########################################################################
> - #
> --# Compiler\linker specific stuff
> -+# Compiler/linker specific stuff
> - #
> - ########################################################################
> - 
> -diff --git a/csps/lpc32xx/source/makefile b/csps/lpc32xx/source/makefile
> -index 8e05456..16bd944 100644
> ---- a/csps/lpc32xx/source/makefile
> -+++ b/csps/lpc32xx/source/makefile
> -@@ -25,16 +25,16 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> --AFLAGS +=-I..\Include
> --CFLAGS +=-I..\Include
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> -+AFLAGS +=-I../Include
> -+CFLAGS +=-I../Include
> - 
> - 
> - ########################################################################
> -@@ -68,7 +68,7 @@ realclean: lib_realclean
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - .PHONY: all lib_clean lib_realclean
> - 
> -diff --git a/lpc/source/makefile b/lpc/source/makefile
> -index 2860db9..ae7d612 100644
> ---- a/lpc/source/makefile
> -+++ b/lpc/source/makefile
> -@@ -25,16 +25,16 @@
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> - # Pick up the assembler and C source files in the directory  
> - #
> - ########################################################################
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.ftypes
> --AFLAGS +=-I..\Include
> --CFLAGS +=-I..\Include
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.ftypes
> -+AFLAGS +=-I../Include
> -+CFLAGS +=-I../Include
> - 
> - ########################################################################
> - #
> -@@ -67,7 +67,7 @@ realclean: lib_realclean
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.build
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.build
> - 
> - .PHONY: all lib_clean lib_realclean
> - 
> -diff --git a/makefile b/makefile
> -index 8645fcc..86fa6bc 100644
> ---- a/makefile
> -+++ b/makefile
> -@@ -34,7 +34,7 @@ TARGETS_CLN	=gen_clean csp_clean bsp_clean
> - #
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\$(CSP)\make.$(CSP).$(TOOL)
> -+include $(NXPMCU_SOFTWARE)/makerule/$(CSP)/make.$(CSP).$(TOOL)
> - 
> - ########################################################################
> - #
> -diff --git a/makerule/common/make.rules.environment b/makerule/common/make.rules.environment
> -index d5737fe..4e6df48 100644
> ---- a/makerule/common/make.rules.environment
> -+++ b/makerule/common/make.rules.environment
> -@@ -52,7 +52,7 @@ ASTYLE          =astyle --options=$(BUILD_ROOT)/tools/astyle.cfg
> - #
> - ########################################################################
> -   
> --CSP_LIB_DIR  =$(BUILD_ROOT)\csps\$(CSP)\lib
> -+CSP_LIB_DIR  =$(BUILD_ROOT)/csps/$(CSP)/lib
> - 
> - ########################################################################
> - #
> -@@ -60,7 +60,7 @@ CSP_LIB_DIR  =$(BUILD_ROOT)\csps\$(CSP)\lib
> - #
> - ########################################################################
> - 
> --BSP_LIB_DIR =$(BUILD_ROOT)\csps\$(CSP)\bsps\$(BSP)\lib
> -+BSP_LIB_DIR =$(BUILD_ROOT)/csps/$(CSP)/bsps/$(BSP)/lib
> - 
> - ########################################################################
> - #
> -@@ -68,7 +68,7 @@ BSP_LIB_DIR =$(BUILD_ROOT)\csps\$(CSP)\bsps\$(BSP)\lib
> - #
> - ########################################################################
> - 
> --GEN_LIB_DIR =$(BUILD_ROOT)\$(GEN)\lib
> -+GEN_LIB_DIR =$(BUILD_ROOT)/$(GEN)/lib
> - 
> - ########################################################################
> - # 
> -@@ -76,9 +76,9 @@ GEN_LIB_DIR =$(BUILD_ROOT)\$(GEN)\lib
> - # 
> - ########################################################################
> - 
> --CSP_DIR     =$(BUILD_ROOT)\csps\$(CSP)
> --CSP_SRC_DIR =$(CSP_DIR)\source
> --CSP_INC_DIR =$(CSP_DIR)\include
> -+CSP_DIR     =$(BUILD_ROOT)/csps/$(CSP)
> -+CSP_SRC_DIR =$(CSP_DIR)/source
> -+CSP_INC_DIR =$(CSP_DIR)/include
> - 
> - ########################################################################
> - # 
> -@@ -86,9 +86,9 @@ CSP_INC_DIR =$(CSP_DIR)\include
> - # 
> - ########################################################################
> - 
> --BSP_DIR     =$(BUILD_ROOT)\csps\$(CSP)\bsps\$(BSP)
> --BSP_SRC_DIR =$(BSP_DIR)\source
> --BSP_INC_DIR =$(BSP_DIR)\include
> -+BSP_DIR     =$(BUILD_ROOT)/csps/$(CSP)/bsps/$(BSP)
> -+BSP_SRC_DIR =$(BSP_DIR)/source
> -+BSP_INC_DIR =$(BSP_DIR)/include
> - 
> - ########################################################################
> - # 
> -@@ -96,9 +96,9 @@ BSP_INC_DIR =$(BSP_DIR)\include
> - # 
> - ########################################################################
> - 
> --GEN_DIR     =$(BUILD_ROOT)\$(GEN)
> --GEN_SRC_DIR =$(GEN_DIR)\source
> --GEN_INC_DIR =$(GEN_DIR)\include
> -+GEN_DIR     =$(BUILD_ROOT)/$(GEN)
> -+GEN_SRC_DIR =$(GEN_DIR)/source
> -+GEN_INC_DIR =$(GEN_DIR)/include
> - 
> - ########################################################################
> - #
> -@@ -151,6 +151,6 @@ endif
> - # 
> - ########################################################################
> - 
> --TARGET_CSP_LIB =$(CSP_LIB_DIR)\$(CSP_ARCHIVE)
> --TARGET_BSP_LIB =$(BSP_LIB_DIR)\$(BSP_ARCHIVE)
> --TARGET_GEN_LIB =$(GEN_LIB_DIR)\$(GEN_ARCHIVE)
> -+TARGET_CSP_LIB =$(CSP_LIB_DIR)/$(CSP_ARCHIVE)
> -+TARGET_BSP_LIB =$(BSP_LIB_DIR)/$(BSP_ARCHIVE)
> -+TARGET_GEN_LIB =$(GEN_LIB_DIR)/$(GEN_ARCHIVE)
> -diff --git a/makerule/lpc32xx/make.lpc32xx.gnu b/makerule/lpc32xx/make.lpc32xx.gnu
> -index 3277d99..d80b98d 100644
> ---- a/makerule/lpc32xx/make.lpc32xx.gnu
> -+++ b/makerule/lpc32xx/make.lpc32xx.gnu
> -@@ -19,7 +19,7 @@
> - # use without further testing or modification. 
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.environment
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.environment
> - 
> - CPU      = arm926ej-s
> - CFLAGS   = -mcpu=arm926ej-s -Wall -Os
> -diff --git a/makerule/lpc32xx/make.lpc32xx.iar b/makerule/lpc32xx/make.lpc32xx.iar
> -index 238ebbf..27d163f 100644
> ---- a/makerule/lpc32xx/make.lpc32xx.iar
> -+++ b/makerule/lpc32xx/make.lpc32xx.iar
> -@@ -19,12 +19,12 @@
> - # use without further testing or modification. 
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.environment
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.environment
> - 
> --IARBASE   = $(IAR_ROOT)\ARM
> --IARTOOLS  = $(IARBASE)\bin
> --IAR_LIB   = $(IARBASE)\lib
> --IAR_INC   = $(IARBASE)\inc
> -+IARBASE   = $(IAR_ROOT)/ARM
> -+IARTOOLS  = $(IARBASE)/bin
> -+IAR_LIB   = $(IARBASE)/lib
> -+IAR_INC   = $(IARBASE)/inc
> - CC        = iccarm
> - CCP       = iccarm
> - AS        = iasmarm
> -@@ -36,7 +36,7 @@ CFLAGS    += -I"$(IAR_INC)"
> - AFLAGS    = --cpu 5TEJ
> - LDFLAGS   = 
> - LK        = "$(TARGET_GEN_LIB)" "$(TARGET_CSP_LIB)" "$(TARGET_BSP_LIB)"
> --;LK        += "$(IAR_LIB)\dl4tpannl8f.r79"
> -+;LK        += "$(IAR_LIB)/dl4tpannl8f.r79"
> - MAP       = --map
> - LDESC     = --config
> - ENTRY     = --entry
> -diff --git a/makerule/lpc32xx/make.lpc32xx.keil b/makerule/lpc32xx/make.lpc32xx.keil
> -index dd27583..7334d3f 100644
> ---- a/makerule/lpc32xx/make.lpc32xx.keil
> -+++ b/makerule/lpc32xx/make.lpc32xx.keil
> -@@ -19,7 +19,7 @@
> - # use without further testing or modification. 
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.environment
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.environment
> - 
> - CC        =armcc
> - CCP       =armcc
> -@@ -27,11 +27,11 @@ AS        =armasm
> - LD        =armlink
> - AR        =armar -r -s
> - CFLAGS    =--arm -O3 -g --device DARMP3 -D__MICROLIB 
> --CFLAGS    +=-I$(KEIL_RVCT)\inc -I$(CSP_INC_DIR) -I$(BSP_INC_DIR) -I$(GEN_INC_DIR) 
> -+CFLAGS    +=-I$(KEIL_RVCT)/inc -I$(CSP_INC_DIR) -I$(BSP_INC_DIR) -I$(GEN_INC_DIR) 
> - AFLAGS    =--arm --device=DARMP3 
> - AFLAGS    +=-I$(CSP_INC_DIR) -I$(BSP_INC_DIR) -I$(GEN_INC_DIR)
> - LDFLAGS   =--noremove
> --LK        =--device DARMP3 --libpath $(KEIL_RVCT)\lib --scan $(TARGET_CSP_LIB)
> -+LK        =--device DARMP3 --libpath $(KEIL_RVCT)/lib --scan $(TARGET_CSP_LIB)
> - LK        +=--scan $(TARGET_BSP_LIB) 
> - LK        +=--scan $(TARGET_GEN_LIB)
> - MAP       =--map --list
> -diff --git a/makerule/lpc32xx/make.lpc32xx.rvw b/makerule/lpc32xx/make.lpc32xx.rvw
> -index 59961dd..2419976 100644
> ---- a/makerule/lpc32xx/make.lpc32xx.rvw
> -+++ b/makerule/lpc32xx/make.lpc32xx.rvw
> -@@ -19,7 +19,7 @@
> - # use without further testing or modification. 
> - ########################################################################
> - 
> --include $(NXPMCU_SOFTWARE)\makerule\common\make.rules.environment
> -+include $(NXPMCU_SOFTWARE)/makerule/common/make.rules.environment
> - 
> - CC        =armcc
> - CCP       =armcpp
> --- 
> -1.7.7.3
> -
> diff --git a/boot/lpc32xxcdl/Config.in b/boot/lpc32xxcdl/Config.in
> deleted file mode 100644
> index 97137aa7d4..0000000000
> --- a/boot/lpc32xxcdl/Config.in
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -config BR2_TARGET_LPC32XXCDL
> -	bool "LPC32XX CDL (kickstart and S1L)"
> -	depends on BR2_arm926t
> -
> -if BR2_TARGET_LPC32XXCDL
> -
> -config BR2_TARGET_LPC32XXCDL_BOARDNAME
> -	string "LPC32xx board name"
> -
> -endif #BR2_TARGET_LPC32XXCDL
> diff --git a/boot/lpc32xxcdl/lpc32xxcdl.hash b/boot/lpc32xxcdl/lpc32xxcdl.hash
> deleted file mode 100644
> index 8c6b73d63f..0000000000
> --- a/boot/lpc32xxcdl/lpc32xxcdl.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed
> -sha256  ded3fa936a96d3fb8188ca6214f57b5208bd49e5416bd69f38bfc810b34197bc  lpc32xx_cdl-v2.11.zip
> diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
> deleted file mode 100644
> index 9f5cd27f50..0000000000
> --- a/boot/lpc32xxcdl/lpc32xxcdl.mk
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -################################################################################
> -#
> -# lpc32xxcdl
> -#
> -################################################################################
> -
> -LPC32XXCDL_VERSION = 2.11
> -LPC32XXCDL_SOURCE = lpc32xx_cdl-v$(LPC32XXCDL_VERSION).zip
> -LPC32XXCDL_SITE = https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/lpcware-archive/61/2
> -
> -LPC32XXCDL_INSTALL_TARGET = NO
> -LPC32XXCDL_INSTALL_IMAGES = YES
> -
> -ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"ea3250")
> -LPC32XXCDL_KICKSTART = kickstart/nand
> -LPC32XXCDL_KICKSTART_BURNER = nand/kickstart
> -LPC32XXCDL_S1L = s1l
> -LPC32XXCDL_S1L_BURNER = nand/s1lapp
> -endif
> -
> -ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"phy3250")
> -LPC32XXCDL_KICKSTART = kickstart/kickstart_nand
> -LPC32XXCDL_KICKSTART_BURNER = nand/kickstart
> -LPC32XXCDL_S1L = s1l/s1l_nand_boot
> -LPC32XXCDL_S1L_BURNER = nand/s1lapp
> -endif
> -
> -ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"fdi3250")
> -LPC32XXCDL_KICKSTART = kickstart/nand
> -LPC32XXCDL_KICKSTART_BURNER = nand/kickstart_jtag
> -LPC32XXCDL_S1L = s1l
> -LPC32XXCDL_S1L_BURNER = nand/s1lapp_jtag
> -endif
> -
> -LPC32XXCDL_BUILD_FLAGS = \
> -	CROSS_COMPILE=$(TARGET_CROSS) \
> -	NXPMCU_WINBASE=$(@D) \
> -	NXPMCU_SOFTWARE=$(@D) \
> -	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) \
> -	CSP=lpc32xx TOOL=gnu GEN=lpc
> -
> -LPC32XXCDL_BOARD_STARTUP_DIR = \
> -	csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/
> -
> -# Source files are with dos newlines, which our patch infrastructure doesn't
> -# handle. Work around it by converting the affected files to unix newlines
> -# before patching
> -define LPC32XXCDL_EXTRACT_CMDS
> -	unzip $(LPC32XXCDL_DL_DIR)/$(LPC32XXCDL_SOURCE) -d $(@D)
> -	mv $(@D)/lpc3xxx_cdl/* $(@D)
> -	rmdir $(@D)/lpc3xxx_cdl/
> -	sed -n 's|^[+-]\{3\} [^/]\+\([^ \t]*\)\(.*\)|$(@D)\1|p' \
> -		boot/lpc32xxcdl/*.patch| sort -u | xargs $(SED) 's/\x0D$$//'
> -endef
> -
> -define LPC32XXCDL_BUILD_CMDS
> -	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)
> -	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)
> -	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_KICKSTART)
> -	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_S1L_BURNER)
> -	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)
> -endef
> -
> -define LPC32XXCDL_INSTALL_IMAGES_CMDS
> -	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)/*gnu.bin $(BINARIES_DIR)
> -	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_KICKSTART)/*gnu.bin $(BINARIES_DIR)
> -	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_S1L_BURNER)/*gnu.bin $(BINARIES_DIR)
> -	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)/*gnu.bin $(BINARIES_DIR)
> -endef
> -
> -$(eval $(generic-package))
> -- 
> 2.41.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
