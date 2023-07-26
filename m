Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3706AC001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DE9612BD;
	Wed, 26 Jul 2023 21:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1DE9612BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-UPYO0_l96U; Wed, 26 Jul 2023 21:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06FDE607C7;
	Wed, 26 Jul 2023 21:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06FDE607C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CBBE1BF980
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24B4B41E73
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24B4B41E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRMty-g-8eaJ for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:45:55 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01AD241E6A
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01AD241E6A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89e8:4a89:fcd4:1b18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D9F2F5FFA3;
 Wed, 26 Jul 2023 23:45:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jul 2023 23:45:46 +0200
Date: Wed, 26 Jul 2023 23:45:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230726214546.GE3544423@scaer>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
 <20230726180433.7561-4-kilian.zinnecker@mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726180433.7561-4-kilian.zinnecker@mail.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690407953;
 bh=QvdA13lcgB0AUac9EirgY9Rw32tWlv2ePvfrMQxX5Us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkPGcuSiewZTq/ndcID+0L9QDppf6USiRVK8MnWaFMfdpn3ldpLWHEBa2DMY4D9mZ
 UpUdSZ42pUe1bcxlHPBuD2cgpQq2J4TKjM3QiHSN2awwzoJKZl3YpBZEIJB+TgqBpG
 iDlRvkTuZEIukPXznDZwEfkcQnayjB9TOpuaEHNNHkbANPrAUNSQu9NJyhJ0VRhEu6
 g2JHQW/PgpFUVbIwsPhGL+NcjBzM1Oe6GAgeVel7P9toNIHSK35uQUOzcwO7SSAnrQ
 KqIv7BH5n0zqZRJSLxFvP/LQtCTUANyMeZTNlosBaFU1E9B+IE7yqy5/qhYZ9eLfXL
 vRJdWpjbQu7nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mkPGcuSi
Subject: Re: [Buildroot] [PATCH v8 3/3] configs/rock5b: new defconfig
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kilian, All,

On 2023-07-26 20:04 +0200, Kilian Zinnecker via buildroot spake thusly:
> This patch adds the defconfig file needed to build u-boot, kernel
> and rootfs for the Rock 5B. In addition it adds a kernel config
> fragment file, which activates the needed ethernet driver support.
> It also adds a readme and post image scripts, needed to generate an
> sdcard.img file, which can be flashed on an SD card to boot the
> Radxa Rock 5B.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
[--SNIP--]
> diff --git a/board/radxa/rock5b/post-image.sh b/board/radxa/rock5b/post-image.sh
> new file mode 100755
> index 0000000000..c0f63ab3a2
> --- /dev/null
> +++ b/board/radxa/rock5b/post-image.sh
> @@ -0,0 +1,6 @@
> +#!/usr/bin/env bash
> +
> +gzip -fk ${BINARIES_DIR}/Image
> +cp board/radxa/rock5b/rock5b.its ${BINARIES_DIR}
> +(cd $BINARIES_DIR && mkimage -f rock5b.its image.itb)
> +support/scripts/genimage.sh -c board/radxa/rock5b/genimage.cfg

    $ make check-package
    board/radxa/rock5b/post-image.sh:0: run 'shellcheck' and fix the warnings

I fixed those errors. I also made the script "set -e" so it exits on
error on the first error.

I've also dropped the custom version, which in fact was not custom.

Applied to master, thanks.

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
