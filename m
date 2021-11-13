Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B64C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:09:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5491560EFE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5491560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7EEF40170;
	Sat, 13 Nov 2021 21:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zS-1RuW2CWF; Sat, 13 Nov 2021 21:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF17400C5;
	Sat, 13 Nov 2021 21:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44FF31BF2CE
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3209480D54
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03_IasRfVZSy for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 21:09:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 059C080D3F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 21:09:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E273F20039F;
 Sat, 13 Nov 2021 22:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636837758;
 bh=1Uozrl+5AxB0XZqizC3KeD09ke2PJJYVD/Kg34fw+9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EFmrPmraQPLAsvU99Kj0dlWKnSTdOpglr5LVO7SeESjzbYXsqw72Uer9wgCx8Bb9u
 oODS14JFkHifnk0+Xz/UZRY+XRUGYKQhVD8hiBJjFbaG581ylqEkkF4hE1Inn4owAH
 Cy3UAyiayWiW9RF7B6c9ytqg1zfZu4bhdcjwu2MC2blszBtGUjrsIIzPKCfyH2OwmD
 QuvMhduLPCy1ta6r5Rz2DZMxyyV7XzQfhU6IgWWe/rH3/XtlDitEFIihiX/vfAibFM
 O24aDwNvA6bx3k1PSQ3NWFtkcu3GhwiEENzaQev7EE12AiLV53wQurJHHam6HbYx7c
 T+P39oiDyje+Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 22:09:11 +0100
Date: Sat, 13 Nov 2021 22:09:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20211113210911.GV247986@scaer>
References: <20211113143857.2741808-1-festevam@gmail.com>
 <20211113180650.45de409e@windsurf>
 <CAOMZO5ACPGfYjga2d8O3SV+cQaM3e9VVPZ_ioR3dpZ84O8J_wg@mail.gmail.com>
 <20211113210219.GU247986@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113210219.GU247986@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH RESEND] imx/genimage: Place the rootfs at a
 proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabio, All,

On 2021-11-13 22:02 +0100, Yann E. MORIN spake thusly:
> On 2021-11-13 15:11 -0300, Fabio Estevam spake thusly:
> > On Sat, Nov 13, 2021 at 2:06 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > I don't see the relationship between BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > > and changing the offset of the rootfs to avoid rootfs corruption.
> > When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
> > board/freescale/common/imx/genimage.cfg.template is used as per the logic
> > inside board/freescale/common/imx/post-image.sh.
> > 
> > board/freescale/common/imx/genimage.cfg.template correctly puts the
> > rootfs at a safe offset.
> > 
> > With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
> > board/freescale/common/imx/genimage.cfg.template_no_boot_part is used and no
> > offset to the rootfs is given, which may cause U-Boot environment
> > area to write into the rootfs
> > area, causing the rootfs corruption.
> 
> Ah, that indeed explains the case. This type of exp[lanations definitely
> should be in the commit log.
> 
> However, please not that there are two cases for

s/not/note/

> BR2_LINUX_KERNEL_INSTALL_TARGET=y:
> 
>     if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>         echo "genimage.cfg.template_no_boot_part_spl"
>     else
>         echo "genimage.cfg.template_no_boot_part"
>     fi
> 
> And this patch only addresses the second one.

Of course, I checked the case where we do not put the kernel in target/,
and both the SPL and non-SPL cases do have an 8MiB offset for the 'boot'
partition...

Regards,
Yann E. MORIN.

> Could you respin, fixing the second template, and including these
> extended explanations in the commit log, please?
> 
> Regards,
> Yann E. MORIN.

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
