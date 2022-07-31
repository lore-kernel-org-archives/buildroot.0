Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696E7C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 08:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD39460E67;
	Sun, 31 Jul 2022 08:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD39460E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzc7R66c8GZq; Sun, 31 Jul 2022 08:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A267760E42;
	Sun, 31 Jul 2022 08:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A267760E42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E52EC1BF395
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 942A582F20
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 08:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942A582F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjH4r2-YsAQO for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 08:27:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A36682D0C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A36682D0C
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 08:27:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59E7E20004;
 Sun, 31 Jul 2022 08:27:39 +0000 (UTC)
Date: Sun, 31 Jul 2022 10:27:37 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220731102737.3eb2525d@windsurf>
In-Reply-To: <f8d347ce-9c81-6ffd-a44e-ccfd72af7739@benettiengineering.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-3-x-shi@ti.com>
 <f8d347ce-9c81-6ffd-a44e-ccfd72af7739@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659256060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVNxLLo6jHlFZom4xTWFaoX2RAPjU8GCAkezIyIe6YM=;
 b=dLvE14z39M589n/j0DIzgCakd3aBpQHz5HidDXrZLVj2sOOBQo5eBkO4Q6QPs1ZNaXjCcV
 yhnXW1N2oE3022E1OdvhXZH12J8zRxJDKUFH4JsR3zEatKq07Y0brfXiCRxij6i2Moc//6
 O6ybYRwrriP+btzbHyH1D0gnphPYmUUSqDZROFOK4Zh0JYZNCzmZ4mdHtQuHG098aieSOx
 OtKdnaN7/dIVtl5ZFQhqK1z+IzskJJCUNinEsU/wMCq1WU6kzOjsFNgEOETDkG4DjIb90p
 bFO3VleyJPMikwT2BTpjHwv9PEKbTP7U9RPjINH04NGnQmSWe0BccqGsUmR0Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLvE14z3
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/ti-k3-r5-loader: add new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 31 Jul 2022 02:54:09 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:


> > +config BR2_TARGET_TI_K3_R5_LOADER_BOARD
> > +	string "Board to configure for"
> > +	depends on BR2_TARGET_TI_K3_R5_LOADER
> > +	help
> > +	  Specify the board to configure the bootloader for.
> > +	  This should be the name of a board under board/ti
> > +	  For example, "am64x_evm".  
> 
> Here ^^^ I would substitute "config" with "choice", this way everything
> is easier from the user point of view. On patch 4/4 you're adding 2
> boards, so I think it makes sense to add every possible choice(2 for the
> moment).

I am afraid I will disagree here. For this type of option, we
definitely prefer to have a free-form string rather than an exhaustive
list of possible options. See U-Boot/Linux/Barebox and other packages
that have configurable defconfigs.

So please keep the string option.


> > +TI_K3_R5_LOADER_VERSION = 2022.10-rc1  
> 
> -rc1 version is the possibly buggiest version you can pick. There are
> other 2 possible solutions:
> 1. use 2022.07 and backport all needed patches on a dedicated
> repository instead of using official u-boot repository
> 2. wait a bit for at least rc2/3(soon) and later when 2022.10 is
> released, bump it

I'd say it's fine for the time being to have -rc1, with the assumption
that as soon as 2022.10 is out, we bump to it. After all, this package
is very specific to TI boards, so if this -rc1 has been tested as
working in this particular context, that's fine.

> > +TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
> > +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
> > +TI_K3_R5_LOADER_LICENSE = GPL-2.0+
> > +TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
> > +TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
> > +TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
> > +TI_K3_R5_LOADER_INSTALL_IMAGES = YES
> > +TI_K3_R5_LOADER_DEPENDENCIES = \
> > +	host-pkgconf \
> > +	$(BR2_MAKE_HOST_DEPENDENCY) \  
> 
> What is this ^^^ needed for?

I guess this is mainly because it's copy/pasted from uboot.mk, and the
explanation is:

# u-boot 2020.01+ needs make 4.0+

> > +	host-arm-gnu-toolchain
> > +
> > +TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)  
> 
> This ^^^ looks superflous, you can directly use $(BR2_MAKE) below

This is also modeled after uboot.mk, though I would agree with you.

> > +TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
> > +	toolchain \
> > +	$(BR2_MAKE_HOST_DEPENDENCY) \
> > +	$(BR2_BISON_HOST_DEPENDENCY) \
> > +	$(BR2_FLEX_HOST_DEPENDENCY)  
> 
> "toolchain" should imply all above _HOST_DEPENDENCY. But here you're
> using host-arm-gnu-toolchain, so toolchain shouldn't be needed, or yes?

Again, this is modeled after uboot.mk. But indeed, here the toolchain
dependency does not make sense, since CROSS_COMPILE points to the
toolchain installed by host-arm-gnu-toolchain. So here, we should
replace "toolchain" by "host-arm-gnu-toolchain".

> > +TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))  
> 
> This ^^^ can be avoided too since you use it one line below with a
> suffix only

I think it's fine, as it makes the following line more readable.

> > +TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(TI_K3_R5_LOADER_BOARD)_r5_defconfig
> > +TI_K3_R5_LOADER_MAKE_OPTS += \
> > +	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
> > +	ARCH=arm  
> 
> What is the reason why you need to use arm-gnu-toolchain to build u-boot 
> SPL? Can you please explain it in commit log?

This has been explained already in previous iterations of the patch
series.

This package is about building a special U-Boot, which targets a
Cortex-R5 core, that acts as a kind of "co-processor". Since the main
processor is an ARM64 core, and an ARM64 toolchain can only be 64-bit
code, we need a separate toolchain to be able to build ARM 32-bit code
for the Cortex-R5 core.

> > +define TI_K3_R5_LOADER_BUILD_CMDS
> > +	$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> > +endef
> > +
> > +define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> > +	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> > +endef
> > +
> > +$(eval $(kconfig-package))  
> 
> Why do you use kconfig-package? You reimplement anyway BUILD_CMDS and
> INSTALL_IMAGES_CMDS, so generic-package should be fine.

kconfig-package is special, it does not implement BUILD_CMDS,
INSTALL_TARGET_CMDS or INSTALL_IMAGES_CMDS. Look at uboot.mk, linux.mk,
busybox.mk and others that use kconfig-package. kconfig-package only
provides logic for the configuration step, with xxx-menuconfig,
xxx-xconfig, xxx-savedefconfig targets and all, but implementing the
BUILD_CMDS and others CMDS variables is left to the package .mk file.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
