Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4674CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 23:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA6F8611AE;
	Thu, 28 Apr 2022 23:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbNAdKXmJeAk; Thu, 28 Apr 2022 23:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFA2611A8;
	Thu, 28 Apr 2022 23:02:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 554471BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 23:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB9E830E2
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 23:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKwQwPKA3yi6 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 23:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E8288302F
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 23:02:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dcb4:7861:786a:5693])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 516E119F553;
 Fri, 29 Apr 2022 01:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651186934;
 bh=vvw7d0EP9Xv+Q9uxNv3tHFtjxhzg/ZzcveLMMjdaVao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+i0kYKjuGTDFC3SjiUPOJNr13Ea8+wuyCBteQ8EijPS7jUOR8g6xEswf3dlJHDz+
 8yh944n98KaBzQh127qZiNl43ZQvR83VZf37uPO+4LOY8YPx4p675EsmB+eafrPavn
 ox4vkrJpsVan7ToJHoFYrBUHQgf6e28guOPGp77Y23FDn2jLnxKVInAfPoeIkUDOgH
 wfbKxipqYRQoQoGp5+0nHdYQK2vlQly134qdtf66S9Ub91yFPOCZg44BRlBFujwQDz
 2BeMg8JnmH81OH4Dcbi6X2G2sPHWzmbDzMZLdrjfzC1l1aQlcEt+318qQC1pyGpJ3I
 0hL0N4vpR2t4w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Apr 2022 01:02:10 +0200
Date: Fri, 29 Apr 2022 01:02:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220428230210.GL3624965@scaer>
References: <20220428205548.524402-1-thomas.petazzoni@bootlin.com>
 <20220428205548.524402-4-thomas.petazzoni@bootlin.com>
 <20220428215220.GI3624965@scaer> <20220429000039.23e1a1fe@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429000039.23e1a1fe@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 4/4] package/binutils: drop version 2.32
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-29 00:00 +0200, Thomas Petazzoni spake thusly:
> On Thu, 28 Apr 2022 23:52:20 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > I was considering on not applying that one, so we could have a fallback
> > in case there were runtime issues reported with newer binutils (I could
> > only build-test your series, I lack a noMMU target).
> > 
> > But if that happens to be the case, we can revert this patch quite
> > easily.
> > 
> > so, applied to master, thanks.
> 
> Really if people still need to use binutils 2.32 and none of the newer
> binutils version work for FLAT, I would call FLAT an unmaintained
> use-case, which should lead us to drop support for it rather than
> keeping an old binutils version around.

True.

> I don't know if there's an easy way to test an ARM noMMU build in Qemu.
> https://xpack.github.io/qemu-arm/ which is a fork of Qemu, seems to
> emulate STM32F429I-Discovery, which we have support for in Buildroot.
> Not clear if the source is available, but since Qemu is GPLv2, I guess
> the source code for this fork should be available somewhere.

https://github.com/xpack-dev-tools/qemu-arm-xpack

From the README:

    Easy install

    The easiest way to install QEMU Arm is using the binary xPack,
    available as @xpack-dev-tools/qemu-arm from the npmjs.com registry.

WTF?

The qemu fork seems to be there:
    https://github.com/xpack-dev-tools/qemu

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
