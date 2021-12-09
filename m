Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C87C43219
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 17:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0265429F3;
	Thu,  9 Dec 2021 17:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-1WwROdj0TH; Thu,  9 Dec 2021 17:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A06429F1;
	Thu,  9 Dec 2021 17:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B04B1BF335
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28E10418F6
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 17:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHKD9Pf_qsvi for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 17:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1FDE418F5
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 17:02:40 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 131so15154670ybc.7
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6NDbO6fb0mGhicso6XgWPNXprNbzkBPK372Zu5iaorQ=;
 b=nmgtQ5iq4ou1sdevl5Nfc4d2cuNen7Gre1xM+9w28UDcjCru3rw0ZdNYFrcKHPknDS
 6L2QAkMmtnCxKe4vOKAbMUFGpDmWR/wmBtexSJrjsUQtLaDyn3BWSqmKQ9OQbUGzx20s
 q9YAYj0VvtZBIbountNf+y3f9a56WOu7w2MPa/F34xmC1W9G6TUMZdFlLenYAyHbJIsw
 Aswuq7bAZzjRjvFf2+9FINIGARYQt64Q40DXX37Ytdat4L9WjGBzWLGx2au5jr7a7qIr
 uozFuvoz5H+DRUcISrz166LMkytcxiVk77kTeG4fzabK80liD0eTDnJED2jzheMgUxcg
 Lz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6NDbO6fb0mGhicso6XgWPNXprNbzkBPK372Zu5iaorQ=;
 b=ha5sE2sC/XIENSWaA3m+ou/df6pGfT71fTQsdADZT10LnmhMObx5gaOgmxFZnRNJ2y
 UZ7dzFH4yxx9A5IMons2KEdxo3wnMEvG3340PPPPNzBF/C3AZ2VNeTYkRgxU/0HmLPjv
 IEY1QVrGYITv/PHdbitzXp0XhSGarWNq5+0c5JnqFPNz5Nf1miD2SkL8Fb9gujsoku1l
 vLHDgRKWR/LKeLsYlM7GIOP/BL3KKCbRBToPpLBF8QvLLNubvjxB/5hcDFhrkJ0Z3i5J
 phcrvoqn5Xe9i8YR6p0YA6rzDUxY3hXXNk1WDfsku8idvLjlrFlWNn+DJ/wScqEaUf0H
 02qg==
X-Gm-Message-State: AOAM531dYz6u1OEoGXGzuOgy2PmRiQAwYaXOyA9zdmHUy+2PkGu2r6F5
 FDl01mt3zdMcBPCC7hr/ce6yfXk/oew3VhatV4+f5bMaadw=
X-Google-Smtp-Source: ABdhPJxauIk+I8UuhToGej44uFxNZyz8CnsXcv7rtP+ro95fSHViQBqIwafJCg6lEYakTA1J9B4LdX80s3E71vhJLno=
X-Received: by 2002:a25:bfd2:: with SMTP id q18mr7860308ybm.542.1639069359471; 
 Thu, 09 Dec 2021 09:02:39 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
In-Reply-To: <20211209151054.3799fb4e@windsurf>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Thu, 9 Dec 2021 18:02:27 +0100
Message-ID: <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Building packages for Cortex M4
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

>> I am currently playing with Avenger96 Board which is powered by
>> ST32MP157 with A7 and M4 cores. Part of my system is the firmware for
>> the M4 microcontroller which should be compiled with a corresponding
>> variant of gcc (not the one used to compile the rest of the system)
>> and placed in /lib/firmware in the rootfs/image.
>>
>> I am wondering if this kind of scenario (two different
>> cross-compilers) is supported by Buildroot and if yes, is there any
>> documentation on how to do it? If there is no "standard" way to
>> achieve this, I would appreciate any recommendations.
>
> Yes, it is possible by installing a separate bare-metal compiler using
> an additional host package in Buildroot.
>
> You can see https://github.com/bootlin/buildroot-external-st is able to
> build the M4 examples from ST. Note that this BR2_EXTERNAL works with a
> few patches on Buildroot itself, available at
> https://github.com/bootlin/buildroot/commits/st/2021.02. One of the
> change is precisely on the bare metal toolchain package.

Thank you for the links. Will definitely take a look at it.

In the meantime, I came up with the following solution and wondered what
would you say about it. First, I made host package which downloads and
installs M4 toolchain from ARM site (inspired by
https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee )

Config.in.host:

################################################################################
#
# gcc-arm-none-eabi
#
################################################################################

config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
    bool
    default y


config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI
    bool "host gcc-arm-none-eabi"
    depends on BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
    help
      The GNU Embedded Toolchain for Arm is a ready-to-use, open source
      suite of tools for C, C++ and Assembly programming targeting Arm
      Cortex-M and Cortex-R family of processors. It includes the GNU
      Compiler (GCC) and is available free of charge directly from Arm
      for embedded software development on Windows, Linux and Mac OS X
      operating systems.

      https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads


gcc-arm-none-eabi.mk:

################################################################################
#
# GNU Arm Embedded Toolchain
#
################################################################################

GCC_ARM_NONE_EABI_VERSION = 10.3-2021.10

GCC_ARM_NONE_EABI_SOURCE =
gcc-arm-none-eabi-$(GCC_ARM_NONE_EABI_VERSION)-$(HOSTARCH)-linux.tar.bz2
GCC_ARM_NONE_EABI_SITE =
https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(GCC_ARM_NONE_EABI_VERSION)

GCC_ARM_NONE_EABI_LICENSE = GPL-2.0+, LGPL-2.1+
GCC_ARM_NONE_EABI_LICENSE_FILES = share/doc/gcc-arm-none-eabi/license.txt

# This is a prebuilt toolchain, we only extract it to the host
GCC_ARM_NONE_EABI_INSTALLDIR = $(HOST_DIR)/share/gcc-arm-none-eabi

define HOST_GCC_ARM_NONE_EABI_INSTALL_CMDS
    mkdir -p $(GCC_ARM_NONE_EABI_INSTALLDIR)
    cp -dpfr $(@D)/* $(GCC_ARM_NONE_EABI_INSTALLDIR)
endef

$(eval $(host-generic-package))

Then I define toolchain file for CMake and made the following .mk file for
my M4 application (defined as a separate Buildroot package):

comcu.mk:

################################################################################
#
## comcu
#
#################################################################################

COMCU_SITE = $(TOPDIR)/../src/comcu
COMCU_SITE_METHOD = local

COMCU_CONF_OPTS = \
    -DTOOLCHAIN_DIR=$(HOST_DIR)/share/gcc-arm-none-eabi \
    -DCMAKE_TOOLCHAIN_FILE=cmake/TOOLCHAIN_arm_none_eabi_cortex_m4.cmake \
    -DUSE_HAL_DRIVER=ON \
    -DUSE_LL_DRIVER=OFF \
    -DUSE_OPENAMP=ON \
    -DUSE_STM32_USB_FS_LIB=OFF \
    -DUSE_FREERTOS=OFF \
    -DUSE_SEMIHOSTING=OFF \
    -DUSE_STTERM=OFF \
    -DUSE_DBGUART=OFF \
    -DUSE_GDB=OFF \
    -DUSE_OVERCLOCKING=OFF \
    -DUSE_TINY_PRINTF=OFF \
    -DSRC=Src \
    -DGITHUB_DRIVERS=OFF

$(eval $(cmake-package))

Except for a couple of small errors in the CMakeLists.txt which need yet to be
fixed, it looks like this solution would work for me.

What do you think about it?


Thank you very much,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
