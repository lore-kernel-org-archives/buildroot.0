Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFBAEB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 05:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2048441145;
	Wed,  9 Aug 2023 05:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2048441145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzNSkQPDSxEP; Wed,  9 Aug 2023 05:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBC541061;
	Wed,  9 Aug 2023 05:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBC541061
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5107A1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 05:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29EB34102E
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 05:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29EB34102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fd3bJ7Ly_QCz for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 05:31:14 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32EE3404B4
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 05:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32EE3404B4
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 61AF5A055D;
 Wed,  9 Aug 2023 07:31:12 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix02.mail.de (Postfix) with ESMTP id 44F92A00E2;
 Wed,  9 Aug 2023 07:31:12 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 562DEA01A4;
 Wed,  9 Aug 2023 07:31:11 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 09 Aug 2023 07:31:10 +0200
Message-ID: <4501534.LvFx2qVVIh@kilian-aisec>
In-Reply-To: <20230808231913.1d0a98e1@windsurf>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
 <1860848.tdWV9SEqCh@kilian-aisec> <20230808231913.1d0a98e1@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 672
X-purgate-ID: 154282::1691559072-8E7FA647-14F339B5/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691559072;
 bh=x1nqzk1i+Qfxw6l/KhBH9FDCF5gwVpXLC3Gxy25Taow=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=YT4pdWBfMM9KOZZkxD/yY0IFkaVbHtnXCq72rulbpPO9g8RmCRTNyfJUzb0RiM/Ia
 WsFaQ3m7roP5qcRFj6np6Mv/Wwqafz7kkYcOqw/xQ6zWNB/fREwdwX+uzVQIiexqo3
 0ZFoCBr4ShKUJcKLqMYPYCEXbrPrzGLgE0O4N5lNUJVuRCMa6J6iHmmrDDGaDYfWSJ
 g5m88O1tCGRSMCN2Pdl3e5lZS9zj6xhIGI2o3OekQ5My4O6tYhpiM6b02SVo/oxjHH
 2b+D8PcJdzRHSPQLH1R9PhCDJaHqW4cZN/AeEgu6cN/HFi1HpfDRTC8MRoXIxqZMMK
 HerVArGb+dEXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=YT4pdWBf
Subject: Re: [Buildroot] [PATCH 0/2] Fix Rock 5B build,
 broken by gcc 12 warnings
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[--SNIP--]

> > I think both patches should be applied. However, the first patch alone
> > should already cause to fix the build itself. (Tbh. I did not test it
> > though.)
> Would be good to test before sending patches :-)

I actually did test the patches, but only both patches together. But yes, now 
thinking about it, it makes sense to me to also test them incrementally 
applied. After all a single patch should probably contain one sound change, 
which should not break anything, if applied alone.

I now tested patch 1/2 alone (i.e., without patch 2/2) and building as well as 
booting the image works.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
