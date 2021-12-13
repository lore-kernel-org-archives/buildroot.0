Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C99C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 17:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6E460595;
	Mon, 13 Dec 2021 17:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXoZngQxe8on; Mon, 13 Dec 2021 17:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8070C60596;
	Mon, 13 Dec 2021 17:52:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB06E1BF3C4
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A042E400C5
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 17:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaJHVVFm1ADO for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 17:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D01ED40001
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 17:52:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b516:f6a7:f8a5:a82e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3536D2003D0;
 Mon, 13 Dec 2021 18:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639417943;
 bh=SWyKU0/tFwNDla0kZ7f0IhswUKgNxvQl75YT+u07PZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h09xFdm52auyaWk3zJFxroDecfLb+wdic7cUkfmsuirnDEdvcfgVMWQF2Z55AOvk9
 LHMBjh76n2+9oREHYJL4Vmj3im3fHEurS0zarw+AQSN6TuAwVDdxaGbjiEl3qhJKDx
 FXRJgbFyZsSs5ttihetuWYU7UBCTwRf6ws8pg2aM4Mnpk/fydwtJb9i3KZs2MW0Je+
 GYUqXHw9I4xv33F2+ufZT2XQjBt1qYZPZ1rQ/ByQPqA4vKIDTx0rS9pMcDo1Oqy/ht
 xtp0CerggC6ucMYMafryhEyFJqIRc/9mRW7l0xo+SkYI/bYmE+fvERfIaZUxHfn+6U
 JRU0e8zeyaqUQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 18:52:10 +0100
Date: Mon, 13 Dec 2021 18:52:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20211213175210.GE2603@scaer>
References: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
 <20211209151054.3799fb4e@windsurf>
 <CAOiXNkBvvsC2g5GR0r6fMHQRVpUGHpZHeQNQvJYOODcp5XVorg@mail.gmail.com>
 <75921499-5a1e-4b26-84a8-481e409091f2@mind.be>
 <CAOiXNkBXdhBhPRbQ9RYXwq9DkB1ccG-sjy=1j4P9wF9Gq3gtAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOiXNkBXdhBhPRbQ9RYXwq9DkB1ccG-sjy=1j4P9wF9Gq3gtAw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andrey, All,

On 2021-12-13 18:36 +0100, Andrey Nechypurenko spake thusly:
> On Sat, 11 Dec 2021 at 09:35, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 09/12/2021 18:02, Andrey Nechypurenko wrote:
[--SNIP--]
> > > comcu.mk:
> > >
> > > ################################################################################
> > > #
> > > ## comcu
> > > #
> > > #################################################################################
> > >
> > > COMCU_SITE = $(TOPDIR)/../src/comcu
> > > COMCU_SITE_METHOD = local
> > >
> > > COMCU_CONF_OPTS = \
> > >      -DTOOLCHAIN_DIR=$(HOST_DIR)/share/gcc-arm-none-eabi \
> > >      -DCMAKE_TOOLCHAIN_FILE=cmake/TOOLCHAIN_arm_none_eabi_cortex_m4.cmake \
> > >      -DUSE_HAL_DRIVER=ON \
> > >      -DUSE_LL_DRIVER=OFF \
> > >      -DUSE_OPENAMP=ON \
> > >      -DUSE_STM32_USB_FS_LIB=OFF \
> > >      -DUSE_FREERTOS=OFF \
> > >      -DUSE_SEMIHOSTING=OFF \
> > >      -DUSE_STTERM=OFF \
> > >      -DUSE_DBGUART=OFF \
> > >      -DUSE_GDB=OFF \
> > >      -DUSE_OVERCLOCKING=OFF \
> > >      -DUSE_TINY_PRINTF=OFF \
> > >      -DSRC=Src \
> > >      -DGITHUB_DRIVERS=OFF
> > >
> > > $(eval $(cmake-package))
> >
> >   I wonder if we really want to use cmake-package here... The cmake-package
> > infrastructure is geared towards building for the target, not for some other
> > CPU. The fact that you need to override the toolchain file is indicative of this
> > problem.
> 
> Could you please elaborate on it a little bit? My understanding is that
> independent of what build-system (cmake or whatever else) is used, somehow
> you need to say that other toolchain should be used to compile particular
> package. CMake's way of doing it is to use the toolchain file. Somehow I can
> not see any big disadvantages with it. Similarly I can not see any big
> advantages of using other build-systems. They will need to do the same but
> with different syntax.
> 
> The only reason why I used cmake here is because this is what provided by ST
> as an example. The CMake file is not trivial with all these
> CMSIS/HAL/BSP/Cube/... things. Since I do not see any big advantages from
> using other build system, I can not find enough motivation to spend time on
> converting cmake staff to something different. That is why I would
> appreciate if you can provide more details on why cmake could be a bad idea
> in this case.

What Arnout was wondering about, is not about using cmake or not; it was
about using the cmake-package infrastructure in Buildroot or not.

I.e., what he was basically suggesting between the lines, was to make
that a generic package, something along the lines of:

    COMCU_DEPENDENCIES = host-cmake

    define COMCU_CONFIGURE_CMDS
        $(BR2_CMAKE) $(@D) \
            -DTOOLCHAIN_DIR=$(HOST_DIR)/share/gcc-arm-none-eabi \
            -DCMAKE_TOOLCHAIN_FILE=cmake/TOOLCHAIN_arm_none_eabi_cortex_m4.cmake \
            [etc...]
    endef

    define COMCU_BUILD_CMDS
        $(MAKE) -C $(@D)
    endef

    define COMCU_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install/fast
    endef

    $(eval $(generic-package))

And I do agree with him, in that our cmake infra is made only for
building stuff that runs on the architecture that is defined in
Buildroot's configuration, not to build firmwares that run in add-on
CPUs...

However, I can also see that the way you did it also makes the package
drastically simpler that repeating a good part of the cmake-package
infra, so I am a bit torn...

 would still think that it would be better to do a generic-package,
because the cmake-pakcage infra can very well get additional "features"
that would render it unusable for using with another toolchain file.
And I would like to avoid introducing a precedent...

So I'm back with Arnout: make that a generic-package.

Regards,
Yann E. MORIN.

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
