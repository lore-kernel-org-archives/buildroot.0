Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0B6EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA89C60E58;
	Mon, 26 Jun 2023 17:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA89C60E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcpxuxgk6c6q; Mon, 26 Jun 2023 17:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E0A60D5F;
	Mon, 26 Jun 2023 17:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E0A60D5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92D401BF37B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A8D1401C2
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8D1401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mztDMN4ReAfz for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:21:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DA540199
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18DA540199
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:21:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7F9C420058D;
 Mon, 26 Jun 2023 19:21:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 19:21:09 +0200
Date: Mon, 26 Jun 2023 19:21:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230626172109.GG646621@scaer>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-11-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626160030.93063-11-bmeng.cn@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687800075;
 bh=Plud8miSFCzcLUNd8Gu+RrDGsxqYJXMhD1rVQpBFQDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N3McWans8dqtLskp4zb3qRzjVlOLHGLqrKgL6Hbhjn6YfvQ0DtQTEPevqoiKg0Dtn
 nUZOr27/C405pX17C2LRAZ4xU8OGkno2CqpVpIdFdZBgDivqIloLDuPjHOyWBNzkDf
 EoFEJwrA8vvBwHyAhBfH5eTpweNqj5z/wG7pDKR1m0UEjv3p507MroPjOSGdo1q8Np
 2CE95K9/b1hggPgchXuh1vzqkPr/fMgNJbZphUrWMSzIbVDaa5kFiA49vBMgB2cGDm
 PHJwbru4xIKRIbT/GY3+jO+iwDN3e6Z/ZVMlBDdevFZbs26zDc0X6QHBKSIUeQN8Y6
 Cgl4/IIbhbGkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N3McWans
Subject: Re: [Buildroot] [PATCH 10/10] board/sifive: hifive-unleashed:
 Include QEMU instructions in readme.txt
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bin, All,

On 2023-06-27 00:00 +0800, Bin Meng spake thusly:
> From: Bin Meng <bmeng@tinylab.org>
> 
> The upstream QEMU 'sifive_u' machine supports running upstream U-Boot
> for the SiFive HiFive Unleashed board out of the box.
> 
> Add the QEMU instructions for testing in readme.txt.

Ah, is the 64MiB SDcard required to be bootable under qemu?

I.e. is it the same issue as fixed by 6f9e83f5f74d (support/testing:
test_ubi: reduce the rootfs.ubi size to 64M to match the Qemu emulated
flash device)?

Regards,
Yann E. MORIN.

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  board/sifive/hifive-unleashed/readme.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/board/sifive/hifive-unleashed/readme.txt b/board/sifive/hifive-unleashed/readme.txt
> index 3263913e9c..e9ccb26fa6 100644
> --- a/board/sifive/hifive-unleashed/readme.txt
> +++ b/board/sifive/hifive-unleashed/readme.txt
> @@ -113,3 +113,20 @@ Booting the SPI flash on the board
>  
>  Make sure that the all DIP switches are set to the off position for
>  default boot mode (MSEL mode = 0110) to boot from SPI flash.
> +
> +Testing under QEMU
> +==================
> +
> +The SD card image can be tested using QEMU:
> +
> +$ qemu-system-riscv64 -M sifive_u,msel=11 -smp 5 -m 8G \
> +    -display none -serial stdio -nic user \
> +    -bios output/images/u-boot-spl.bin \
> +    -drive file=output/images/sdcard.img,if=sd
> +
> +The SPI flash image can be tested with a slightly different command:
> +
> +$ qemu-system-riscv64 -M sifive_u,msel=6 -smp 5 -m 8G \
> +    -display none -serial stdio -nic user \
> +    -bios output/images/u-boot-spl.bin \
> +    -drive file=output/images/spi-nor.img,if=mtd
> -- 
> 2.34.1
> 
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
