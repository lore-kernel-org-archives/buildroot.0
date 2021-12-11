Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDC0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F385642601;
	Sat, 11 Dec 2021 08:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qtEmaf83usA; Sat, 11 Dec 2021 08:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E242603;
	Sat, 11 Dec 2021 08:35:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF6681BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC8FA401DC
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgztDqjx05Pz for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 571334018B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:35:19 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o20so37179874eds.10
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 00:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qWUwkHtmLJs2vrP37zItNE3k4vKEd9fwY5mHpA4sCBo=;
 b=HzTQ7ttJKOVjDvpCiWrnk8IhYF5UwqZU2IyNFyc4kKguFVWNDYN67qdP/vIEvumAp3
 lEiyQ3vkHVGzq+RmhBxJmmnrybxvBG5FyyvZOVgn/j9ngUrRz8wd1emWBaNqds0bZsrr
 oRtkp1BUgkC0Jrbm1PyCs3vAxFKGvAbNhqxWhaWZOa0zadEcNjeg8VL3oNfdG0eNY9zg
 3CuYsUSqypOPA4GWdfysHmb0m6yQlWr8V3z5LQi2c0qyL90RkDzFV6dJbKobyGpLkuUY
 0KCv1QOG1by7AF35GChrlQtPMA2Bjpvl5rL6cM4K/WRBNGvovtz26u0IakLJE52iYL85
 u8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qWUwkHtmLJs2vrP37zItNE3k4vKEd9fwY5mHpA4sCBo=;
 b=VGXIdAeWapNhfUAB4r2Sl/kYbgYlHzB8ZIM00GE/4686e7c16h8oHLPySu9SWzNrjl
 /+CsqOrKWVdyadkMcxj/aTFG+/8PorVqaiTGyZhFIDuQxBsNgW3VNErgwZMkrD6Ud4Y3
 Se6pNf9+c7g5oygFx43nnT2SVthPLuvvxtw76/CTmUHRZ10n3aCj96p9dfcbUAA1gFhi
 vsznZhERJQTVDabzlhHQla50Tf0j28UqUx88ko7CFzdx+ycQbP4OFfSdAPycRnrDDns7
 rWD7bH0vPQ+Na2boxpXYiU93X9U79w6QEsM0ES1mmGMPp4QKV1RnOClEgzlrNw++xfdv
 raww==
X-Gm-Message-State: AOAM532i+l+A6pWwxwa0qESwhwmEMt0VTEaov4ecTRRwZqwEUzfL0xob
 yJz9mB/CqmaBn96JOz0aWEyRpg==
X-Google-Smtp-Source: ABdhPJyj4lQ9nxcfWd8Qkl4lsxWWPS2BAmsqw+lt9G0darNpQImTTWKzVHj/xr2LbO88reHZaKFhgA==
X-Received: by 2002:a17:906:ece9:: with SMTP id
 qt9mr28865232ejb.362.1639211717554; 
 Sat, 11 Dec 2021 00:35:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i4sm2313279ejz.122.2021.12.11.00.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 00:35:17 -0800 (PST)
Message-ID: <75921499-5a1e-4b26-84a8-481e409091f2@mind.be>
Date: Sat, 11 Dec 2021 09:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Andrey Nechypurenko <andreynech@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
 <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
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
Cc: =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 18:02, Andrey Nechypurenko wrote:
> Hello Thomas,
> 
>>> I am currently playing with Avenger96 Board which is powered by
>>> ST32MP157 with A7 and M4 cores. Part of my system is the firmware for
>>> the M4 microcontroller which should be compiled with a corresponding
>>> variant of gcc (not the one used to compile the rest of the system)
>>> and placed in /lib/firmware in the rootfs/image.
>>>
>>> I am wondering if this kind of scenario (two different
>>> cross-compilers) is supported by Buildroot and if yes, is there any
>>> documentation on how to do it? If there is no "standard" way to
>>> achieve this, I would appreciate any recommendations.
>>
>> Yes, it is possible by installing a separate bare-metal compiler using
>> an additional host package in Buildroot.
>>
>> You can see https://github.com/bootlin/buildroot-external-st is able to
>> build the M4 examples from ST. Note that this BR2_EXTERNAL works with a
>> few patches on Buildroot itself, available at
>> https://github.com/bootlin/buildroot/commits/st/2021.02. One of the
>> change is precisely on the bare metal toolchain package.
> 
> Thank you for the links. Will definitely take a look at it.
> 
> In the meantime, I came up with the following solution and wondered what
> would you say about it. First, I made host package which downloads and
> installs M4 toolchain from ARM site (inspired by
> https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee )
> 
> Config.in.host:
> 
> ################################################################################
> #
> # gcc-arm-none-eabi
> #
> ################################################################################
> 
> config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
>      bool
>      default y
> 
> 
> config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI
>      bool "host gcc-arm-none-eabi"
>      depends on BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
>      help
>        The GNU Embedded Toolchain for Arm is a ready-to-use, open source
>        suite of tools for C, C++ and Assembly programming targeting Arm
>        Cortex-M and Cortex-R family of processors. It includes the GNU
>        Compiler (GCC) and is available free of charge directly from Arm
>        for embedded software development on Windows, Linux and Mac OS X
>        operating systems.
> 
>        https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads
> 
> 
> gcc-arm-none-eabi.mk:
> 
> ################################################################################
> #
> # GNU Arm Embedded Toolchain
> #
> ################################################################################
> 
> GCC_ARM_NONE_EABI_VERSION = 10.3-2021.10
> 
> GCC_ARM_NONE_EABI_SOURCE =
> gcc-arm-none-eabi-$(GCC_ARM_NONE_EABI_VERSION)-$(HOSTARCH)-linux.tar.bz2
> GCC_ARM_NONE_EABI_SITE =
> https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(GCC_ARM_NONE_EABI_VERSION)
> 
> GCC_ARM_NONE_EABI_LICENSE = GPL-2.0+, LGPL-2.1+
> GCC_ARM_NONE_EABI_LICENSE_FILES = share/doc/gcc-arm-none-eabi/license.txt
> 
> # This is a prebuilt toolchain, we only extract it to the host
> GCC_ARM_NONE_EABI_INSTALLDIR = $(HOST_DIR)/share/gcc-arm-none-eabi
> 
> define HOST_GCC_ARM_NONE_EABI_INSTALL_CMDS
>      mkdir -p $(GCC_ARM_NONE_EABI_INSTALLDIR)
>      cp -dpfr $(@D)/* $(GCC_ARM_NONE_EABI_INSTALLDIR)
> endef
> 
> $(eval $(host-generic-package))
> 
> Then I define toolchain file for CMake and made the following .mk file for
> my M4 application (defined as a separate Buildroot package):
> 
> comcu.mk:
> 
> ################################################################################
> #
> ## comcu
> #
> #################################################################################
> 
> COMCU_SITE = $(TOPDIR)/../src/comcu
> COMCU_SITE_METHOD = local
> 
> COMCU_CONF_OPTS = \
>      -DTOOLCHAIN_DIR=$(HOST_DIR)/share/gcc-arm-none-eabi \
>      -DCMAKE_TOOLCHAIN_FILE=cmake/TOOLCHAIN_arm_none_eabi_cortex_m4.cmake \
>      -DUSE_HAL_DRIVER=ON \
>      -DUSE_LL_DRIVER=OFF \
>      -DUSE_OPENAMP=ON \
>      -DUSE_STM32_USB_FS_LIB=OFF \
>      -DUSE_FREERTOS=OFF \
>      -DUSE_SEMIHOSTING=OFF \
>      -DUSE_STTERM=OFF \
>      -DUSE_DBGUART=OFF \
>      -DUSE_GDB=OFF \
>      -DUSE_OVERCLOCKING=OFF \
>      -DUSE_TINY_PRINTF=OFF \
>      -DSRC=Src \
>      -DGITHUB_DRIVERS=OFF
> 
> $(eval $(cmake-package))

  I wonder if we really want to use cmake-package here... The cmake-package 
infrastructure is geared towards building for the target, not for some other 
CPU. The fact that you need to override the toolchain file is indicative of this 
problem.

  On the other hand, if overriding the toolchain file is really the only thing 
that needs to change, then perhaps using cmake-package is fine.

  Yann usually has some good opinions on philosophical stuff like this.

  Regards,
  Arnout


> 
> Except for a couple of small errors in the CMakeLists.txt which need yet to be
> fixed, it looks like this solution would work for me.
> 
> What do you think about it?
> 
> 
> Thank you very much,
> Andrey.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
