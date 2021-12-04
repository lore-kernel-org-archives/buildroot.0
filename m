Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5A4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A0BC60A86;
	Sat,  4 Dec 2021 22:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBuVYQeJDFdI; Sat,  4 Dec 2021 22:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A6B60A6A;
	Sat,  4 Dec 2021 22:55:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93D4A1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 905C160A6A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osHurelIimN6 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:55:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2785360A4F
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:55:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2E48C5FF6C;
 Sat,  4 Dec 2021 23:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638658525;
 bh=WKuUInxM7Q4B+Z8xXecHmjrBDMqAAq85Xto89gflOQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/wTXJuax9NPVu1RdxSU1yEHgG0f66UF/kJGTu+9SyTvDc20jt8RIHogEjvjctMqm
 0xptUqrYZggaFj5l1ilNWj2vvKRFEjTx7W4L8yFuZ7FAiIkkokgVdd90/1x8Pk18Ur
 8Kfo2roL5OT3h57Tbu0vX7jiWjttgqMGNq+NoO5QQG7a1xfZ4eWL7k3ZPEgckbBu/M
 gabGbRXkcUvTi91RH1sCB9TqHWzBmlY3A01Z0aWkNiyxd8IceIQLO6Ypb+/1XxzTMl
 7xp24CJldbZtBAWlfwOUMKm87SKf2+r8sv6S6/MCAJcp8IZq0OTQVaGwnPdTryYIiI
 GI0E+Kk3EqkBA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 23:55:16 +0100
Date: Sat, 4 Dec 2021 23:55:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211204225516.GI472627@scaer>
References: <cover.1638573387.git.yann.morin.1998@free.fr>
 <82bf2ffa3ad531e8e93cf4b2f65193438b8b7199.1638573387.git.yann.morin.1998@free.fr>
 <87h7boatgn.fsf@dell.be.48ers.dk> <87czmcatdd.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czmcatdd.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/mender-grubenv: fix grub module
 checks
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
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-12-04 23:38 +0100, Peter Korsgaard spake thusly:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> From: Adam Duskett <aduskett@gmail.com>
>  >> Commit b68810e70cbd (boot/grub2: add support to build multiple Grub2
>  >> configurations in the same build) broke mender-grubenv by splititng up
>  >> BR2_TARGET_GRUB2_BUILTIN_MODULES into two separate symbols, one for
>  >> legacy boot and one for EFI boot.
> 
>  >> +++ b/package/mender-grubenv/mender-grubenv.mk
>  >> @@ -13,7 +13,7 @@ MENDER_GRUBENV_LICENSE_FILES = LICENSE
>  >> MENDER_GRUBENV_DEPENDENCIES = grub2
>  >> MENDER_GRUBENV_INSTALL_IMAGES = YES
>  
>  >> -ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
>  >> +ifeq ($(BR2_TARGET_GRUB_LEGACY)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
>  >> MENDER_GRUBENV_ENV_DIR = /boot/grub
> 
>  > Should this not be BR2_TARGET_GRUB2_HAS_LEGACY_BOOT?

Gah. This is a place I forgot to fix after I renamed the variables.

> In fact, what seems to have been committed is:
> ifeq ($(BR2_TARGET_GRUB_LEGACY),y)
> What happened to the _ARM_UBOOT part?

The _ARM_UBOOT is implied because it selects _HAS_LEGACY_BOOT:

    https://git.buildroot.org/buildroot/tree/boot/grub2/Config.in#n73

    config BR2_TARGET_GRUB2_ARM_UBOOT
        bool "arm-uboot"
        depends on BR2_arm
        select BR2_TARGET_GRUB2_HAS_LEGACY_BOOT

I'll apply a fixup commit, sorry for the mess... :-/

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
