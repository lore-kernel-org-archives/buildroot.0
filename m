Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C92C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 10:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645E560E7C;
	Sun, 31 Jul 2022 10:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645E560E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHff3TB2VWHN; Sun, 31 Jul 2022 10:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E7E960E6B;
	Sun, 31 Jul 2022 10:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7E960E6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42C0C1BF30A
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 10:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C8FB60E6B
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 10:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C8FB60E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40O1wu8gn-y9 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 10:10:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4C960E61
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F4C960E61
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 10:10:32 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id I5u2o6IGjrvmbI5u3oSafQ; Sun, 31 Jul 2022 12:10:31 +0200
Message-ID: <b9966345-bafc-1656-d67c-90fc2bbb738c@benettiengineering.com>
Date: Sun, 31 Jul 2022 12:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-3-x-shi@ti.com>
 <f8d347ce-9c81-6ffd-a44e-ccfd72af7739@benettiengineering.com>
 <20220731102737.3eb2525d@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220731102737.3eb2525d@windsurf>
X-CMAE-Envelope: MS4xfIsh+7EZOTW3IvEsuxjIBjhFBOA4UHdG7z27/QuEkDqRCQ5pr7VSu76sBYTxH1ulNNw85zlUNA2jaE1t8WR7B/cebuxhuxfUkzLhvKav30t1jOixV9S7
 SEZ1CAOKlwk+u9s31A7FnuDmI0uVaP+r6H3sQxIc/egeNYhWGWLHKaMdMd74ubPLmsm5F+VhHXXN1VVzaN079MnhL7X+t5ptAQ6VtIakIo3/uwztsc5dWwew
 SBlmChFBk70jAj6+ic+pqEsRsAFKBN2FxBPOUnapxL57Jzt8dWPQy9LX8ymU9SPHauu1/YT45vjPkofwOyhX5/Lc+xAzE1qe7n3lPZVMmj3QL0hWJcsSLky9
 yrYSJhvM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659262231; bh=xmDpuZCe1drN94bD5JKcbIj6QHE5HteqWa/MiUQQdKc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=eA+h6eUKHvMZFMyTx+U+DaOBgUn4JeQEnc2kEebNiaFerxc6PxxUN6lRNfjaeKPw4
 3H9bv3oDVabtBl6HhHDSfVisM4Zxek2hJ73grZtVCTYApOLuPjM11M2awAplbnrOgf
 9NroSDk79Y07dnjgB/9z0mYMAc99mt0fJza6qAmMFN1Lz9AAAI1OtH44u7JVh3gabb
 UCaiddASX788v2iIsZeMQBVAWi1SsFM1N3p7Z/Dk/ViGv9tnUN4KColQ4i4P5MDnIp
 K7RTgd8j+qWqI7nNj9QUKRVh9TRO50GtVoUfKyUMpOkaU/QSL0C5n1H2GBKyyuuRkn
 x5VFOgdul68PA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eA+h6eUK
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
Cc: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org,
 Suniel Mahesh <sunil@amarulasolutions.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 31/07/22 10:27, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Sun, 31 Jul 2022 02:54:09 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
> 
>>> +config BR2_TARGET_TI_K3_R5_LOADER_BOARD
>>> +	string "Board to configure for"
>>> +	depends on BR2_TARGET_TI_K3_R5_LOADER
>>> +	help
>>> +	  Specify the board to configure the bootloader for.
>>> +	  This should be the name of a board under board/ti
>>> +	  For example, "am64x_evm".
>>
>> Here ^^^ I would substitute "config" with "choice", this way everything
>> is easier from the user point of view. On patch 4/4 you're adding 2
>> boards, so I think it makes sense to add every possible choice(2 for the
>> moment).
> 
> I am afraid I will disagree here. For this type of option, we
> definitely prefer to have a free-form string rather than an exhaustive
> list of possible options. See U-Boot/Linux/Barebox and other packages
> that have configurable defconfigs.
> 
> So please keep the string option.
> 
> 
>>> +TI_K3_R5_LOADER_VERSION = 2022.10-rc1
>>
>> -rc1 version is the possibly buggiest version you can pick. There are
>> other 2 possible solutions:
>> 1. use 2022.07 and backport all needed patches on a dedicated
>> repository instead of using official u-boot repository
>> 2. wait a bit for at least rc2/3(soon) and later when 2022.10 is
>> released, bump it
> 
> I'd say it's fine for the time being to have -rc1, with the assumption
> that as soon as 2022.10 is out, we bump to it. After all, this package
> is very specific to TI boards, so if this -rc1 has been tested as
> working in this particular context, that's fine.
> 
>>> +TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
>>> +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
>>> +TI_K3_R5_LOADER_LICENSE = GPL-2.0+
>>> +TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
>>> +TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
>>> +TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
>>> +TI_K3_R5_LOADER_INSTALL_IMAGES = YES
>>> +TI_K3_R5_LOADER_DEPENDENCIES = \
>>> +	host-pkgconf \
>>> +	$(BR2_MAKE_HOST_DEPENDENCY) \
>>
>> What is this ^^^ needed for?
> 
> I guess this is mainly because it's copy/pasted from uboot.mk, and the
> explanation is:
> 
> # u-boot 2020.01+ needs make 4.0+
> 
>>> +	host-arm-gnu-toolchain
>>> +
>>> +TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
>>
>> This ^^^ looks superflous, you can directly use $(BR2_MAKE) below
> 
> This is also modeled after uboot.mk, though I would agree with you.
> 
>>> +TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
>>> +	toolchain \
>>> +	$(BR2_MAKE_HOST_DEPENDENCY) \
>>> +	$(BR2_BISON_HOST_DEPENDENCY) \
>>> +	$(BR2_FLEX_HOST_DEPENDENCY)
>>
>> "toolchain" should imply all above _HOST_DEPENDENCY. But here you're
>> using host-arm-gnu-toolchain, so toolchain shouldn't be needed, or yes?
> 
> Again, this is modeled after uboot.mk. But indeed, here the toolchain
> dependency does not make sense, since CROSS_COMPILE points to the
> toolchain installed by host-arm-gnu-toolchain. So here, we should
> replace "toolchain" by "host-arm-gnu-toolchain".
> 
>>> +TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
>>
>> This ^^^ can be avoided too since you use it one line below with a
>> suffix only
> 
> I think it's fine, as it makes the following line more readable.
> 
>>> +TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(TI_K3_R5_LOADER_BOARD)_r5_defconfig
>>> +TI_K3_R5_LOADER_MAKE_OPTS += \
>>> +	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
>>> +	ARCH=arm
>>
>> What is the reason why you need to use arm-gnu-toolchain to build u-boot
>> SPL? Can you please explain it in commit log?
> 
> This has been explained already in previous iterations of the patch
> series.
> 
> This package is about building a special U-Boot, which targets a
> Cortex-R5 core, that acts as a kind of "co-processor". Since the main
> processor is an ARM64 core, and an ARM64 toolchain can only be 64-bit
> code, we need a separate toolchain to be able to build ARM 32-bit code
> for the Cortex-R5 core.

Oh, thank you for the explanation, I didn't go so in depth, now
the entire situation changes. I had to go more in depth before
reviewing.

>>> +define TI_K3_R5_LOADER_BUILD_CMDS
>>> +	$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
>>> +endef
>>> +
>>> +define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
>>> +	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
>>> +endef
>>> +
>>> +$(eval $(kconfig-package))
>>
>> Why do you use kconfig-package? You reimplement anyway BUILD_CMDS and
>> INSTALL_IMAGES_CMDS, so generic-package should be fine.
> 
> kconfig-package is special, it does not implement BUILD_CMDS,
> INSTALL_TARGET_CMDS or INSTALL_IMAGES_CMDS. Look at uboot.mk, linux.mk,
> busybox.mk and others that use kconfig-package. kconfig-package only
> provides logic for the configuration step, with xxx-menuconfig,
> xxx-xconfig, xxx-savedefconfig targets and all, but implementing the
> BUILD_CMDS and others CMDS variables is left to the package .mk file.

Ah, so it fits perfectly for this case.

Thank you Thomas for explaining. I went too fast on reviewing.

Kind regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
