Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1618C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378F2421FE;
	Sat, 18 Dec 2021 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6sW5wPuBAzi; Sat, 18 Dec 2021 21:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD3F421F5;
	Sat, 18 Dec 2021 21:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D48C1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37C4C421F5
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdibgoomzWdO for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:00:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05051421F3
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:00:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BB1625FE03;
 Sat, 18 Dec 2021 22:00:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639861227;
 bh=oCEG2XqMCmkxzLHq/6/De8isdNuOJjSa/llihXKee1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+BASsuDldtxD96V62lg/wZKdlLiZJIkLdP3zyDzH1c2DqJiQ5oo9pg07UVyk/qvg
 LwjCe2pkIwHzHv7LUBFIHJ78uuH3P8FdyD1sz615ROkPrR3Au/etCyD1K7Aguc9MX8
 2KENlj5MBvPpta9J93cAJNTARx5/0LgCujcxhZg7CWb8ggQ3764Z8Tyh3LRKl6QphU
 tUtJ01FRgEUbfo9yHoEaGF8+LVSr+UokP2vuMxD/Z5yLAeWT2dX+CcdQV7VrZFxxlv
 FpiFsfY/+9f8sCj8cHLr88O5hPdCqmmpW2+d5hiPUPGG5Vgp1Rsc/z2UpycHhwEb1Q
 qq3Dy7NSmU94Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:00:22 +0100
Date: Sat, 18 Dec 2021 22:00:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dagg Stompler <daggs@gmx.com>
Message-ID: <20211218210022.GL2603@scaer>
References: <20211218202030.24838-1-daggs@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218202030.24838-1-daggs@gmx.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boards/odroidc2: fix genimage execution
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

Dag, All,

On 2021-12-18 22:20 +0200, Dagg Stompler spake thusly:
> fix the following error:
> ERROR: hdimage(sdcard.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition bl1 (offset 0x0, size 0xc200)
> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> which started at the genimage version bump to 15 commit.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935217
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/hardkernel/odroidc2/genimage.cfg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
> index c283b514d6..f31867a591 100644
> --- a/board/hardkernel/odroidc2/genimage.cfg
> +++ b/board/hardkernel/odroidc2/genimage.cfg
> @@ -18,6 +18,7 @@ image sdcard.img {
>  		in-partition-table = "no"
>  		image = "bl1.bin.hardkernel"
>  		offset = 0
> +		holes = {"(440; 512)"}
>  	}
> 
>  	partition u-boot {
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
