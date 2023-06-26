Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9603EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D45415A9;
	Mon, 26 Jun 2023 17:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D45415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFYicCAXwMFc; Mon, 26 Jun 2023 17:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BD3415B1;
	Mon, 26 Jun 2023 17:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BD3415B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC8D1BF37B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0733B415B8
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0733B415B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DLwH6wg1Ofk for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:13:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC62E415B1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC62E415B1
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:13:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:88cf:b268:1dd:7043])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 51A992003F3;
 Mon, 26 Jun 2023 19:12:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Jun 2023 19:12:58 +0200
Date: Mon, 26 Jun 2023 19:12:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20230626171258.GF646621@scaer>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
 <20230626160030.93063-10-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626160030.93063-10-bmeng.cn@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687799583;
 bh=ZCtsdAg/IbyX0FLQ2Vspny287mgJgVmbZH7oMnedXHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkjCMLoYgry7w86DberB/VcrAI4f5l7qR1AGuDjZMM+co1UwH8tQHSQpscPKkndpI
 GtemSG5MMssc1OkkdmwiAuqiZCbSvji43dZzYseeSRDPd6ZoTtcmTJqY++sBUVLWGQ
 I7Y93W0teEFUQOZI+fOOnmfko7pBtvz84I/Cp1ZSMpOsNE/ldgkeXLIENoX53cvBCy
 cih/fWk/MGD7L8DTDE561iJfqIBfu1MJ4ZkGKZReoWt4WzH6uEGoQfaEGUJ/dZT5iC
 mi/YAwUkrAJ376DO9DinCoA35AGtHN/Vf/sDHTuFz1M015bUvbuWHOsSlKy+1XMVtj
 Ht8LkCpeA602g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gkjCMLoY
Subject: Re: [Buildroot] [PATCH 09/10] board/sifive: hifive-unleashed:
 Update rootfs offset
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
> As the rootfs size is set to 60M, let's put it right on the 4M offset
> in the SD card, so that the generated sdcard.img can be exactly 64M.

As much I like power-of-two numbers, is there a technical reason to hit
exactly 64MiB?

Regards,
Yann E. MORIN.

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  board/sifive/hifive-unleashed/genimage_sdcard.cfg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
> index 079ac5ed26..99e3525a8c 100644
> --- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
> +++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
> @@ -17,6 +17,7 @@ image sdcard.img {
>  
>  	partition rootfs {
>  		image = "rootfs.ext4"
> +		offset = 4076K
>  		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
>  		bootable = true
>  	}
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
