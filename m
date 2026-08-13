Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1137CC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7685B40CD2;
	Thu, 13 Aug 2026 19:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqUZQbLaVmeN; Thu, 13 Aug 2026 19:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7331D40CC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649776;
	bh=btr9lb43CA+o+T2lrVZbkA8loNusu6z6LiJBXB7OfFc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kGSDlQfDxue6iw/y7zGDyhKu/IvBNgvlmmh9GTrxMNWdYsAkjz/QAUxbeHppN69n2
	 YMmYJBolF+Qb+aqo7SwgPMoDvqg30bBkwJOimhbduGnqgPkM0TQEu40iw/vCn4pxpC
	 qJfrX4Q0FLO5vtWud/rQW3t9y33h+je7pue4Kal7v31CztDzrzURP3nu3zf4Kx61tw
	 N8t+RHzsdbcDuhwU1ETGxEtG8IRXXE0E0GlvinGikxZ/gkrgai/P9coHhtJ+t9171F
	 6QnH/swFxDkyP7u78l/AKb8EHVF1wVa2OAZZd6B0Bgjswm9TUMIQ4VEZg1yodVWNWB
	 ZYggJ57a6GL9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7331D40CC4;
	Thu, 13 Aug 2026 19:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4642B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0F140CC4
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcXJSTHZC3LF for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BE3640CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE3640CC3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BE3640CC3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:36:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E12AC5FFAA;
 Thu, 13 Aug 2026 21:36:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 21:36:08 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 21:36:08 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260812143235.386341-1-thomas.perale@mind.be>
References: <20260812143235.386341-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <a7f86a8976e8c2cb46f808e057eb0d8f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to v9.2.0943
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

On 12/08/2026 16:32, Thomas Perale via buildroot wrote:
> See the release announcement:
> 
> - https://www.vim.org/vim-9.2-released.php
> 
> It fixes the following vulnerabilities:
> 
> - CVE-2026-28417
> - CVE-2026-28418
> - CVE-2026-28419
> - CVE-2026-28420
> - CVE-2026-28421
> - CVE-2026-28422
> - CVE-2026-32249
> - CVE-2026-33412
> - CVE-2026-34714
> - CVE-2026-34982
> - CVE-2026-35177
> - CVE-2026-39881
> - CVE-2026-41411
> - CVE-2026-42307
> - CVE-2026-44656
> - CVE-2026-45130
> - CVE-2026-46483
> - CVE-2026-47162
> - CVE-2026-47167
> - CVE-2026-52858
> - CVE-2026-52859
> - CVE-2026-52860
> - CVE-2026-55693
> - CVE-2026-55892
> - CVE-2026-55895
> - CVE-2026-57451
> - CVE-2026-57452
> - CVE-2026-57453
> - CVE-2026-57455
> - CVE-2026-57456
> - CVE-2026-59856
> - CVE-2026-59857
> - CVE-2026-59858
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
