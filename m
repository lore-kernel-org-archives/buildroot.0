Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A44EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 15:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88CEF81EB8;
	Sun, 20 Aug 2023 15:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CEF81EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7h4Hs7OGo-w; Sun, 20 Aug 2023 15:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB5681EB4;
	Sun, 20 Aug 2023 15:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB5681EB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72F7F1BF277
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C60281EB2
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 15:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C60281EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 881RTLH39nNJ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 15:29:53 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0F3B81EAF
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 15:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F3B81EAF
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 1B459A00B8;
 Sun, 20 Aug 2023 17:29:52 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix01.mail.de (Postfix) with ESMTP id 00D0180069;
 Sun, 20 Aug 2023 17:29:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 92D62241248;
 Sun, 20 Aug 2023 17:29:51 +0200 (CEST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Date: Sun, 20 Aug 2023 17:29:51 +0200
Message-ID: <1864236.tdWV9SEqCh@kilian-aisec>
In-Reply-To: <20230808094348.1c7a8650@windsurf>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
 <20230808094348.1c7a8650@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 704
X-purgate-ID: 154282::1692545391-E6FFC660-1BFB4D69/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692545392;
 bh=PoBU1Fv+yhWw7+7ghVjZaYdyKKoewSz/U5Wq7a+mI2o=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=W6wQu9cnDdZjRXTf8QqWa3ttKu1hntCVrJBiShiwI0+TcjLrhDJ6vAikOv/InjHra
 A5dX/HIGCQEb1H58PYFkyS6tNk5ED/eC8kKjKinrgcl9YG3Jzbp7zSrG1dbdEt4I/k
 BXCmBquYc/YbcYWQJSy2ENd0JL46Hzct+IzVNlWhhy58uAtlycAZ4AKJ7Q5pBU4Tb8
 mREtBpgCMNPOC8xSUbrOPR6uOyPAh+WcFVHiQwyfZ4BA3qP/cItcQeEXF7uozORqD1
 D6qNFygOpjtU98ie/1fl2aXev1pyM5bVXhJkkD1LKgrK3t/1qDaDS/DoMwwJrmDc01
 D6uEOJDYyzLHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=W6wQu9cn
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[--SNIP--]

> Also: gcc 11.x is currently the oldest version supported by Buildroot,
> it means that as soon as gcc 14.x is released, we will drop support for
> gcc 11.x. So clearly, the solution of sticking to gcc 11.x is not going
> to work for a very long time.

I was thinking about this again, and I personally think the most cleanest 
solution would be to simply disable the custom code parts, which throw 
warnings not accepted by gcc 12. In this particular case this basically means 
disabling WiFi support for the Rock5b. This is not nice, but I think it is the 
cleanest way untill the issues are fixed. I did send a v2 of the patches.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
