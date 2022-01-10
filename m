Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F601C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2981782BC8;
	Mon, 10 Jan 2022 14:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSAdt8bM1ngh; Mon, 10 Jan 2022 14:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7340C829FE;
	Mon, 10 Jan 2022 14:13:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910C31BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FD5E4092F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3KtuDO366QbB for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 978B94092E
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:13:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 61EAC19F5B2;
 Mon, 10 Jan 2022 15:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641824033;
 bh=Ruv7TsJju/fdqzeNt4PlxZss408FjaXG6LAANfcbPdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCSQRwRAx0Yp/z/zqWE0s8Om2wg0xRCDd2pA2gbxSp4DXXl1/7hZAqx9E5Vveu8XU
 xosG5Oy1Pb9qMmoGzudPwp5e1r9TBgQtVvGvh6oOF5bs5YeeMAP/eYdwr+2LWQ5yD8
 dpmfxwRbbs3FQ5r0zfAHqz/U34e5TBMOdIyRO6o5zifEAkafMzrI2YarEkB1CtI8cd
 cgSlG7+Zti/ZMZCXYxSXMC86gTklHGmvgzkUvnms26oZkpiihNEFDL+rhHyopkM4aJ
 31ApXLG8Z+k/7Leq+VxrxKNXGeeiNyZqxobf+Mm3pxWo2C4rX34Sv/ND+1okmU/YmM
 uLYaavQImMrBQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 15:13:49 +0100
Date: Mon, 10 Jan 2022 15:13:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Message-ID: <20220110141349.GP1477939@scaer>
References: <20220110134229.1381-1-santosh.multhalli@rockwellcollins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110134229.1381-1-santosh.multhalli@rockwellcollins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] Removed Santosh Multhalli
 (santosh.multhalli@rockwellcollins.com) as active developer of valjson
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
Cc: matthew.weber@collins.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Santosh, All,

On 2022-01-10 19:12 +0530, Santosh Multhalli spake thusly:
> Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>

Applied to master, thanks.

Thanks you for taking care of it until now! :-)

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 215506c71c..3a530aa3f2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1761,8 +1761,6 @@ F:	package/urg/
>  F:	package/ussp-push/
>  F:	support/misc/toolchainfile.cmake.in
>  
> -N:	Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
> -F:	package/valijson/
>  
>  N:	Scott Fan <fancp2007@gmail.com>
>  F:	package/libssh/
> -- 
> 2.25.1
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
