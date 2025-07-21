Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A6FC83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF3F428A1;
	Mon, 21 Jul 2025 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWqBVU1HMZS4; Mon, 21 Jul 2025 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC05D42879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC05D42879;
	Mon, 21 Jul 2025 21:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73FB4E0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655AE4024A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iB3B3PNKTmF8 for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EAF84008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAF84008F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EAF84008F
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:06:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7F70D780375;
 Mon, 21 Jul 2025 23:06:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 23:06:13 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 23:06:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>
In-Reply-To: <20250701193705.761121-2-giulio.benetti@benettiengineering.com>
References: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
 <20250701193705.761121-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <51214ab05e8ac77dd64c95947e564152@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753131976;
 bh=XqJufoWH3dEt8Yru7gttMarRUQvb42rIy1rIHfqKMJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C1t8iE037wAGbDIz+sTzJ+/iTWQBSgMtmOMGilrsMf8zktrNAFTC932Kc544MMrrA
 3OcqCdRHTAOKuzB2pD4WH80yRCzFTTYLREkBd/431cXooobAvnY+PFhlVuXWwrRRIr
 0IDi7JQlwo6OPoOO6j2DhnB9zr8GCp62Ucv0uyyOznk7W29b4HgFF1azoNMWziEBfa
 0/DwgKe8xveBj4C188amxBd/cZ5+TMTc5UBw6S9SzFMDFPgxGskxMF43usCJiCRhYT
 aCNN+8UrE+yk/zQh6yplrIeYfvKV/D+tN/UWXaahfOiAV+Qngtdix8NwoG8nQihcEH
 Ag+wf4Z48Q09A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C1t8iE03
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: fix build failure with
 Linux 6.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/07/2025 21:37, Giulio Benetti wrote:
> Benetti Engineering just took over Larry Finger(lwfinger)'s repository
> rtl8723bu since Larry unfortunately passed away[0](RIP) and there are
> pending PRs that will never be checked as stated here[1]. So basically 
> move
> github user to benetti-engineering-sas and update version with latest 
> that
> fixes build failure with Linux version 6.15. And of course let's update
> package's URL due to the moving.
> 
> [0]: https://lwn.net/Articles/979419/
> [1]: https://github.com/lwfinger/rtl8723bu/issues/206
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
