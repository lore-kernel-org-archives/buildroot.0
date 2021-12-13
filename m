Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE34C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 17:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4393E60087;
	Mon, 13 Dec 2021 17:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqN2Z1aLLA-R; Mon, 13 Dec 2021 17:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63ADC600C6;
	Mon, 13 Dec 2021 17:37:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 362701BF3C4
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D22400C5
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LBmHkPkYZpB for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 17:36:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B397040001
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 17:36:58 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 131so40074776ybc.7
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IlTgkxhK8KJAbmFbsf95PzqC+0M9GD+eYQAjQGSQv1A=;
 b=J7xZU2LF05JZ3K443CGxaL7MmCL9DvmdqooJFd3M/YfjQj0tBbntLboo9D0MBxleL3
 eya0z99miJ2vyK0q9a/uasSrxrv7PA0W5pxZ0NoPK7L9icex5Y8lL00TPmyj//3PcZEL
 pXjDASm/n4GgqG5cnXdV5LMQN/2VS0+Q6/UzzGAd2WpRMXER2NipRRo+NkMNX71tZ7RR
 F4k0N0wJIQMeIyd5CSwjrgpeYSsIqo10R5vyRRhiGMm7PK9QU8BkXM4RA78kJJO3iVgP
 9JtCFsWlSWB+lI0v5sQcelYyzpKWCHMwD7JsDtoqNkFhnGSi9bN0hHFTWs74euzKiao4
 qeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlTgkxhK8KJAbmFbsf95PzqC+0M9GD+eYQAjQGSQv1A=;
 b=wcKWvC8/VgUwSrPuh6ft89SD+JjX0by7SPPuFDBvGvbtk3F10wEPiOU7/dK8bRQkYU
 TpUf1MiKJIdl7rK3+KjlERqm2CxsXtNLKlBOKMbdHQTSrqTQukc8B5CSGTUIQh6NfTeT
 dejL/G6U/ySONAQOX4pZbBp/R93pNJSZohMP1OKTlPBGCI1mWMH4JQytfhSEQM5XZ9D/
 ojJ8AYTqNmkVVadFMNz7vQaLz1V6dV4LWUx7k9yD0Ys5NNT9k9G1HZg+LiVcms8xiPH4
 vpzehuICEoXbqjR6QDRG1clf+FTUt50qFg+0nrxn54EbDB4xjYK6kYnP67E1JPPRWAc2
 F7Jg==
X-Gm-Message-State: AOAM531XbS2a99TRdIGmKrd4Y3dZbLDGgjCQRVw+yVlzmI8gxs4fqwFV
 1kMb/acB87WW+Kiug0AnrxmB23cZk/Xyr9QyFzgDKmejN5oFTw==
X-Google-Smtp-Source: ABdhPJwKa6Fojf8n269Pvr7odgqLBKa5pLKSuOap5UAtqyWdZ9Ul/mO4NthJQEzLTv3DbuYdVZZPgifx2gpOCsWBy2k=
X-Received: by 2002:a5b:402:: with SMTP id m2mr32653315ybp.38.1639417017316;
 Mon, 13 Dec 2021 09:36:57 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
 <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
 <75921499-5a1e-4b26-84a8-481e409091f2@mind.be>
In-Reply-To: <75921499-5a1e-4b26-84a8-481e409091f2@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 13 Dec 2021 18:36:45 +0100
Message-ID: <CAOiXNkBXdhBhPRbQ9RYXwq9DkB1ccG-sjy=1j4P9wF9Gq3gtAw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Sat, 11 Dec 2021 at 09:35, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 09/12/2021 18:02, Andrey Nechypurenko wrote:
> > Hello Thomas,
> >
> >>> I am currently playing with Avenger96 Board which is powered by
> >>> ST32MP157 with A7 and M4 cores. Part of my system is the firmware for
> >>> the M4 microcontroller which should be compiled with a corresponding
> >>> variant of gcc (not the one used to compile the rest of the system)
> >>> and placed in /lib/firmware in the rootfs/image.
> >>>
> >>> I am wondering if this kind of scenario (two different
> >>> cross-compilers) is supported by Buildroot and if yes, is there any
> >>> documentation on how to do it? If there is no "standard" way to
> >>> achieve this, I would appreciate any recommendations.
> >>
> >> Yes, it is possible by installing a separate bare-metal compiler using
> >> an additional host package in Buildroot.
> >>
> >> You can see https://github.com/bootlin/buildroot-external-st is able to
> >> build the M4 examples from ST. Note that this BR2_EXTERNAL works with a
> >> few patches on Buildroot itself, available at
> >> https://github.com/bootlin/buildroot/commits/st/2021.02. One of the
> >> change is precisely on the bare metal toolchain package.
> >
> > Thank you for the links. Will definitely take a look at it.
> >
> > In the meantime, I came up with the following solution and wondered what
> > would you say about it. First, I made host package which downloads and
> > installs M4 toolchain from ARM site (inspired by
> > https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee )
> >
> > Config.in.host:
> >
> > ################################################################################
> > #
> > # gcc-arm-none-eabi
> > #
> > ################################################################################
> >
> > config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
> >      bool
> >      default y
> >
> >
> > config BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI
> >      bool "host gcc-arm-none-eabi"
> >      depends on BR2_PACKAGE_HOST_GCC_ARM_NONE_EABI_SUPPORTS
> >      help
> >        The GNU Embedded Toolchain for Arm is a ready-to-use, open source
> >        suite of tools for C, C++ and Assembly programming targeting Arm
> >        Cortex-M and Cortex-R family of processors. It includes the GNU
> >        Compiler (GCC) and is available free of charge directly from Arm
> >        for embedded software development on Windows, Linux and Mac OS X
> >        operating systems.
> >
> >        https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads
> >
> >
> > gcc-arm-none-eabi.mk:
> >
> > ################################################################################
> > #
> > # GNU Arm Embedded Toolchain
> > #
> > ################################################################################
> >
> > GCC_ARM_NONE_EABI_VERSION = 10.3-2021.10
> >
> > GCC_ARM_NONE_EABI_SOURCE =
> > gcc-arm-none-eabi-$(GCC_ARM_NONE_EABI_VERSION)-$(HOSTARCH)-linux.tar.bz2
> > GCC_ARM_NONE_EABI_SITE =
> > https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(GCC_ARM_NONE_EABI_VERSION)
> >
> > GCC_ARM_NONE_EABI_LICENSE = GPL-2.0+, LGPL-2.1+
> > GCC_ARM_NONE_EABI_LICENSE_FILES = share/doc/gcc-arm-none-eabi/license.txt
> >
> > # This is a prebuilt toolchain, we only extract it to the host
> > GCC_ARM_NONE_EABI_INSTALLDIR = $(HOST_DIR)/share/gcc-arm-none-eabi
> >
> > define HOST_GCC_ARM_NONE_EABI_INSTALL_CMDS
> >      mkdir -p $(GCC_ARM_NONE_EABI_INSTALLDIR)
> >      cp -dpfr $(@D)/* $(GCC_ARM_NONE_EABI_INSTALLDIR)
> > endef
> >
> > $(eval $(host-generic-package))
> >
> > Then I define toolchain file for CMake and made the following .mk file for
> > my M4 application (defined as a separate Buildroot package):
> >
> > comcu.mk:
> >
> > ################################################################################
> > #
> > ## comcu
> > #
> > #################################################################################
> >
> > COMCU_SITE = $(TOPDIR)/../src/comcu
> > COMCU_SITE_METHOD = local
> >
> > COMCU_CONF_OPTS = \
> >      -DTOOLCHAIN_DIR=$(HOST_DIR)/share/gcc-arm-none-eabi \
> >      -DCMAKE_TOOLCHAIN_FILE=cmake/TOOLCHAIN_arm_none_eabi_cortex_m4.cmake \
> >      -DUSE_HAL_DRIVER=ON \
> >      -DUSE_LL_DRIVER=OFF \
> >      -DUSE_OPENAMP=ON \
> >      -DUSE_STM32_USB_FS_LIB=OFF \
> >      -DUSE_FREERTOS=OFF \
> >      -DUSE_SEMIHOSTING=OFF \
> >      -DUSE_STTERM=OFF \
> >      -DUSE_DBGUART=OFF \
> >      -DUSE_GDB=OFF \
> >      -DUSE_OVERCLOCKING=OFF \
> >      -DUSE_TINY_PRINTF=OFF \
> >      -DSRC=Src \
> >      -DGITHUB_DRIVERS=OFF
> >
> > $(eval $(cmake-package))
>
>   I wonder if we really want to use cmake-package here... The cmake-package
> infrastructure is geared towards building for the target, not for some other
> CPU. The fact that you need to override the toolchain file is indicative of this
> problem.

Could you please elaborate on it a little bit? My understanding is that
independent of what build-system (cmake or whatever else) is used, somehow
you need to say that other toolchain should be used to compile particular
package. CMake's way of doing it is to use the toolchain file. Somehow I can
not see any big disadvantages with it. Similarly I can not see any big
advantages of using other build-systems. They will need to do the same but
with different syntax.

The only reason why I used cmake here is because this is what provided by ST
as an example. The CMake file is not trivial with all these
CMSIS/HAL/BSP/Cube/... things. Since I do not see any big advantages from
using other build system, I can not find enough motivation to spend time on
converting cmake staff to something different. That is why I would
appreciate if you can provide more details on why cmake could be a bad idea
in this case.


Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
