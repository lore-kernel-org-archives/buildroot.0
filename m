Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A0AC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 20:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD55260BF1;
	Mon,  7 Nov 2022 20:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD55260BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSwm773NUNuj; Mon,  7 Nov 2022 20:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE46460BE7;
	Mon,  7 Nov 2022 20:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE46460BE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00BF41BF27C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD20360BE7
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD20360BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5AKuyJpsqKf for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 20:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B2960BDB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1B2960BDB
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 20:19:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F293119F591;
 Mon,  7 Nov 2022 21:19:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:19:22 +0100
Date: Mon, 7 Nov 2022 21:19:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221107201922.GJ3918838@scaer>
References: <20221106102046.13138-1-heiko.thiery@gmail.com>
 <20221106102046.13138-3-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106102046.13138-3-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667852365;
 bh=lQd6DugsUeQxta4xPQil3kmso9uGyDoJ+GjP8lrtwsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPbyruADWvKqrWEvvaWhBE2k8IuxrettFsk4m6rVdWVcmCo+XNlohmO942bcfFH/H
 viAN+UL/72lNsQzI7u0zhOCqdDmOa16qwzQN0RBKvV3+yRWyzifmVNvLHdoYOVac7R
 ccj29V5t46C7WIx/9pZFHKSKadyJBZ4TxQi8pU9GZ+KUd7kr3vvygvXc4tobs9u4jd
 poYb4EKq50YyA7CIm8Cb2QnSbOR9a5IEV+DIMDThyQSZll4DWIMFYOmg5FKzfG5QLv
 SUxTnu5m+DpX+WLdzbOKxlLxdO+hOL1Vx+hdKTyaOOe2pQkDuq5bQrOuL4C7WW2L/S
 abhcQ5UHdmZUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QPbyruAD
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to
 configs/kontron_smarc_sal28_defconfig
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

Heiko, All,

On 2022-11-06 11:20 +0100, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2613624f4b..9bd98da5ef 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1243,8 +1243,10 @@ F:	package/volk/
>  
>  N:	Heiko Thiery <heiko.thiery@gmail.com>
>  F:	board/kontron/bl-imx8mm/
> +F:	board/kontron/smarc-sal28/
>  F:	board/kontron/pitx-imx8m/
>  F:	configs/kontron_bl_imx8mm_defconfig
> +F:	configs/kontron_smarc_sal28_defconfig
>  F:	configs/kontron_pitx_imx8m_defconfig
>  F:	package/altera-stapl/
>  F:	package/ipmitool/
> -- 
> 2.20.1
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
