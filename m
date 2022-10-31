Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D4CC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1E260B26;
	Mon, 31 Oct 2022 09:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1E260B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAMeGhjOX1ib; Mon, 31 Oct 2022 09:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4612260B24;
	Mon, 31 Oct 2022 09:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4612260B24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC381BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019B8402D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019B8402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjFISiF1r_FY for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:49:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3DBF402D1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3DBF402D1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:49:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1A132B00579;
 Mon, 31 Oct 2022 10:48:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:48:55 +0100
Date: Mon, 31 Oct 2022 10:48:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tan En De <ende.tan@starfivetech.com>
Message-ID: <20221031094855.GM1058960@scaer>
References: <20221031082841.2781656-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031082841.2781656-1-ende.tan@starfivetech.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667209739;
 bh=D14zyp/sohW2ybBOFCFdlrPy1WruUV+ULOLrRKng+GU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYz2xYIjuig7CszZjkMVKMGACxqe9JkO8m+5GLftfrQEx1N5gxG6/em5PfU0JifYB
 mRKTW8BgLGBSO/YdhKhwe5kfyd/Qv3HGyYI3qUNtMYkONf26MuZphCiuH2wH9RXq+t
 CfCwmC2Bo/GbID5ZEt6SYOTLpIfBULFORjm64GfNOkeYDGnB6sFItMsQuu4NGIG/9P
 p+NSqLYrgFROeh2wwMMEosDWoEaTuaKF+VYn1J+ODIkV0Mj4920a7Kyr4MwRYHf/Lb
 MPDuM5noLKGboW01n/8+xIEyU/VwGU6RXWXs/n2n9rJKnYMJWetQczDTFmexFyRmgZ
 DxzdK/Gvp0Rvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eYz2xYIj
Subject: Re: [Buildroot] [1/1] DEVELOPERS: add myself for package/libkcapi
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tan, All,

On 2022-10-31 16:28 +0800, Tan En De spake thusly:
> Add myself to help maintaining package/libkcapi.
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> As mentioned in the reply:
> https://lore.kernel.org/all/20221030114529.607f4e73@windsurf/
> Notice that I'm using ende.tan@starfivetech.com instead of
> ende.tan@linux.starfivetech.com because my company has changed SMTP
> server (the latter is still accessible).
> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c4d23cd293..90c28b375e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2775,6 +2775,9 @@ F:	package/most/
>  N:	TIAN Yuanhao <tianyuanhao3@163.com>
>  F:	package/open-isns/
>  
> +N:	Tan En De <ende.tan@starfivetech.com>
> +F:	package/libkcapi/
> +
>  N:	Theo Debrouwere <t.debrouwere@televic.com>
>  F:	board/beagleboardx15/
>  F:	configs/beagleboardx15_defconfig
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
