Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A35C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4213D80B3D;
	Sat, 13 May 2023 12:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4213D80B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvjM3vK3BEtd; Sat, 13 May 2023 12:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6090284485;
	Sat, 13 May 2023 12:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6090284485
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 935E21BF3EB
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78243404E9
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78243404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp1jH6npQ1bl for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BAC14034D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BAC14034D
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:38:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7814719F74E;
 Sat, 13 May 2023 14:38:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 14:38:14 +0200
Date: Sat, 13 May 2023 14:38:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20230513123814.GR2582048@scaer>
References: <20230512164248.3179932-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512164248.3179932-1-bisson.gary@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683981496;
 bh=UBQCebPBjVaJA0zgJ/JtS4MxmsDBCTKjXsQ3+LocP8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VoHzh2wwxCJZmbARAWa7t/NUsqNf+VlLQOiMbzGQ5S1YWb9ovfKca0KHRWYc0yGi3
 ECYaQl/ODo4fMefLMz5VGP4dLAixR3bfgnRjDcSqp+W7xF3FrL1ilNCTDFq3hQnsOz
 kbMMQX2KGHH7BPN/jQKiXnuz0lFJ+6bohaJBTqt4QYVtElDd6QJbKVj3mjleFSuan4
 jYGR+nzF7rNERnl465fvF3ggEpDA9YR/gCH3VfzbdC/GCjxNhfGjw3+U+g6/HG18w4
 79+asDPuQC0r6d/zOFZhsgB35ZGoIyZXRovPCpMhxDVCcU8B86gbybQolYp91zRVR7
 EoXwU5c1irtcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VoHzh2ww
Subject: Re: [Buildroot] [PATCH 0/3] Update NXP graphics libraries to
 v6.4.11.p1.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gary, All,

On 2023-05-12 18:42 +0200, Gary Bisson spake thusly:
> Hi,
> 
> This series updates the 3D & 2D GPU suppot for the NXP i.MX processors.
> 
> The version v6.4.11.p1.0 aligns with NXP release 6.1.1-1.0.0 (Yocto
> Langdale).

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> Regards,
> Gary
> 
> Gary Bisson (3):
>   package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
>     6.4.11.p1.0
>   package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p1.0
>   package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p1.0
> 
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash        | 8 ++++----
>  package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk          | 4 ++--
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash        | 8 ++++----
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk          | 4 ++--
>  .../kernel-module-imx-gpu-viv.hash                        | 2 +-
>  .../kernel-module-imx-gpu-viv.mk                          | 2 +-
>  6 files changed, 14 insertions(+), 14 deletions(-)
> 
> -- 
> 2.39.2
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
