Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB35C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:02:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB8B60F6E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EB8B60F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC6B80E3F;
	Sat, 13 Nov 2021 21:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W733EpSVKP4n; Sat, 13 Nov 2021 21:02:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1888A80E3B;
	Sat, 13 Nov 2021 21:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 947911BF859
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD4780E3B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMRTir9o33k6 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 21:02:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F71580CC5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 21:02:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A73AB20039E;
 Sat, 13 Nov 2021 22:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636837345;
 bh=yM7kj/0aulPM5gxhk/88y9xCxUAYUkeZUQtVOOjU6g4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFq76qK3QLxMzTU0Hiute8wVsHBsGXOCqWt01lzfMnpaHmw8m/TbSrZ9aDvnwqK+9
 WyHnM8ce9PJyZdXslJKIEPy8b+Amt/3p7eRCLqoY4bzX2aWmDJyIojjb1Yw7LdNq41
 GJquZp69xnUjFw61SNtatLPGB6zxIqNSEh26Ezn2HsyHAUNPi8AS/me8qUHHAPh7vI
 vGkInhLjnkOnLsiVtMajzETtV9ZQGf8zt6mLWBTyJIgUJc0lyjgIcytTObvZFI94Mc
 FxRMan/x60uzkgyKSDOJjz9Q1lO8uKuZoZYXtjYuI8nHkiKtL5KjyndxRkqU7RSOu7
 og9d/hPgA8HPw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 22:02:19 +0100
Date: Sat, 13 Nov 2021 22:02:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20211113210219.GU247986@scaer>
References: <20211113143857.2741808-1-festevam@gmail.com>
 <20211113180650.45de409e@windsurf>
 <CAOMZO5ACPGfYjga2d8O3SV+cQaM3e9VVPZ_ioR3dpZ84O8J_wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5ACPGfYjga2d8O3SV+cQaM3e9VVPZ_ioR3dpZ84O8J_wg@mail.gmail.com>
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

On 2021-11-13 15:11 -0300, Fabio Estevam spake thusly:
> Hi Thomas,
> 
> On Sat, Nov 13, 2021 at 2:06 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
> > I don't see the relationship between BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > and changing the offset of the rootfs to avoid rootfs corruption.
> >
> > All what BR2_LINUX_KERNEL_INSTALL_TARGET=y does it add the kernel image
> > into the /boot directory of the rootfs. It makes the rootfs larger for
> > sure, but it would still start at the same place.
> >
> > Are you sure there's any relationship with
> > BR2_LINUX_KERNEL_INSTALL_TARGET=y here?
> 
> Yes, this problem only happens with BR2_LINUX_KERNEL_INSTALL_TARGET=y.
> 
> When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
> board/freescale/common/imx/genimage.cfg.template is used as per the logic
> inside board/freescale/common/imx/post-image.sh.
> 
> board/freescale/common/imx/genimage.cfg.template correctly puts the
> rootfs at a safe offset.
> 
> With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
> board/freescale/common/imx/genimage.cfg.template_no_boot_part is used and no
> offset to the rootfs is given, which may cause U-Boot environment
> area to write into the rootfs
> area, causing the rootfs corruption.

Ah, that indeed explains the case. This type of exp[lanations definitely
should be in the commit log.

However, please not that there are two cases for
BR2_LINUX_KERNEL_INSTALL_TARGET=y:

    if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
        echo "genimage.cfg.template_no_boot_part_spl"
    else
        echo "genimage.cfg.template_no_boot_part"
    fi

And this patch only addresses the second one.

Could you respin, fixing the second template, and including these
extended explanations in the commit log, please?

Regards,
Yann E. MORIN.

> Please let me know if you need more information as this problem is
> easy to reproduce.
> 
> Regards,
> 
> Fabio Estevam
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
