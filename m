Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CA7EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7749E60B32;
	Sun, 20 Aug 2023 20:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7749E60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sqZoqZo9fgO; Sun, 20 Aug 2023 20:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51FE60B1C;
	Sun, 20 Aug 2023 20:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51FE60B1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 940881BF2F7
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B049415D1
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B049415D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vO2wn-kh0BY for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 20:55:22 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36B98414CE
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B98414CE
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 6390AA01F9;
 Sun, 20 Aug 2023 22:55:20 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 3B1C7801A9;
 Sun, 20 Aug 2023 22:55:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 034E3241233;
 Sun, 20 Aug 2023 22:55:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 22:55:19 +0200
Message-ID: <1942911.PYKUYFuaPT@kilian-aisec>
In-Reply-To: <20230820195921.GS1778688@scaer>
References: <20230820190438.101920-1-kilian.zinnecker@mail.de>
 <10326829.nUPlyArG6x@kilian-aisec> <20230820195921.GS1778688@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1438
X-purgate-ID: 154282::1692564920-F4FF8660-08301090/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692564920;
 bh=6rbjTrBfJ+evWG4X2ue1rFDfmPZEE9gz0YusN2VeDO0=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=bHL8xRHzA2Xk2+3mCgYX9sYW3/rxJNrGl3Y9IDssTeBBdTNJYmPismataKMgaYtN2
 dj6y3fIpHQGj8ax/LUN5xH32lHqFWIb/x8KKD+jrb02wi89ohy4hTYayRyzs+CHmiP
 tfPMpPyhZd16xC0Iz0h7Aynh3DULTB+0FbHgB9iGUlbtOirhC0bzqccr0MrI7/phTQ
 cpmrtfXzSPn9qRkMenBGt1kER4hXhKBnZ1HSmL2oBsRj+kL9gGfseyQ5b9yCkvNMzd
 2WJYOxCv/KM02Er6ZC1IHXDrYbRLDhceBa2piaGfxLkeAme1jwScSMD+OP1ypIeCcJ
 24LrWalcmXKCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=bHL8xRHz
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/rock5b: Add patches to fix
 gcc12 warnings
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

> On 2023-08-20 21:42 +0200, Kilian Zinnecker via buildroot spake thusly:
> > Thanks as well. I don't yet fully understand how the git branches in open
> > source projects work, i.e., what exactly gets into the "next" branch
> > (i.e.,
> > how the next branch is actually defined) and what gets a release candidate
> > "rc" tag. However, I just wanted to add that imho this patch then should
> > also get into the next rc for 2023.08, because else the freshly
> > introduced Rock 5B support in 2023.08 will be broken.
> 
> I guess every project has their own branch management.
> 
> In Buildroot, we have a three-month release cycle. The first two months,
> there' only master which gets commits. The third month, master only get
> fixes, and the 'next' branch gets new features. About every week in the
> third month, we tag an rc release on master, and eventually we tag the
> release. Then next is merged in to master, and we start a new cycle.
> 
> It may happen that, after an rc is tagged on master, we merge it into
> next, so that next also gets critical fixes from master. We don;t do it
> very often, though...

Great explanation, thanks!

> And now that I wrote the above, I remember we should have something the
> manual... Yes, we do:
>     https://buildroot.org/downloads/manual/manual.html#RELENG

Yes, I will try to look there first in the future.

Best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
