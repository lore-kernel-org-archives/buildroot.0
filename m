Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2126C0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 19:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D68417F8;
	Fri, 11 Aug 2023 19:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D68417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tilh3cR8vzr; Fri, 11 Aug 2023 19:02:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C0FA4049A;
	Fri, 11 Aug 2023 19:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C0FA4049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 313ED1BF342
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCE24049A
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 19:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCE24049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etrWwRRI-QxV for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 19:02:32 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06A4D400EF
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 19:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A4D400EF
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 9251BA0C35;
 Fri, 11 Aug 2023 21:02:29 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 7392D801C7;
 Fri, 11 Aug 2023 21:02:29 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 33D3C100135;
 Fri, 11 Aug 2023 21:02:28 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 21:02:28 +0200
Message-ID: <10318288.nUPlyArG6x@kilian-aisec>
In-Reply-To: <20230811162546.8088-2-robertoxmed@gmail.com>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <20230811162546.8088-2-robertoxmed@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1118
X-purgate-ID: 154282::1691780549-5DFFD7B6-36E67075/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691780549;
 bh=o458y+BURCAQp4TuGv79oPbLi0LeONGa1/kdAuY8ALw=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=aXegunUbqkNwBgMxGfssqny82H9uPEmP6TdvkqO7ahwDw8e8bnsMdffFCW3Jq8Pb8
 Q+OhoPn1RqOkrpUjZWFfq7wyKoGDJeAsFTYAE/pn12ZwV2PcDE854BtgsMcd6ATerX
 wxN0WNLEqM28zavdxQUDxpHpvdQ0YlbcXU3nCriA6zAKHlv/WKUzBCx/vFkZycZit2
 N2Sro7dEngc9IcEBGb6+KEjZLO8Fr/JbpNjBI5+dTGDVQOnp7XF2O86XHFiyDKpn+9
 zWMR4r7RPdCPxZ5Zwau+QUHJ8bFUz40RmrDuO5Wb+/F21xQ33YtX3i/CyX6MG+GnSZ
 kDBtKRAuNy+2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=aXegunUb
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roberto,

here are a few things, which could be improved:

[--SNIP--]

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6ffa3ee693..5ebabd01cb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2546,6 +2546,10 @@ F:	package/mhz/
>  N:	Robert Rose <robertroyrose@gmail.com>
>  F:	package/grpc/
> 
> +N:	Roberto Medina <robertoxmed@gmail.com>
> +F:	configs/roc_pc_rk3399_defconfig
> +F:	board/firefly/roc-rk3399

I think when it comes to repositories (i.e., board/firefly/roc-rk3399) it is 
best practice to add a trailing space. I guess this way one can easily 
distinguish directories from single files.

[--SNIP--]

In the defconfig:

> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"

I think 2022.04 is actually the current default version of buildroot. So 
unless you have reason to freeze it to this version on purpose (e.g., because 
older and newer versions are known to be not working with this board - which I 
don't believe is the case) you could simply omit these two lines.

[--SNIP--]

Best regards,
Kilian Zinnecker




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
