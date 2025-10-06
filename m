Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8662CCAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F80061735;
	Mon,  6 Oct 2025 20:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OF0DPRaIIDa; Mon,  6 Oct 2025 20:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5887A61723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5887A61723;
	Mon,  6 Oct 2025 20:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23310272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0945C8431E
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7Fb7wOJFHHm for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E53E8426F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E53E8426F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E53E8426F
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:22:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 60CA52003B4;
 Mon,  6 Oct 2025 22:22:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Oct 2025 22:22:14 +0200
MIME-Version: 1.0
Date: Mon, 06 Oct 2025 22:22:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251004132643.2356456-1-bernd@kuhls.net>
References: <20251004132643.2356456-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <4eaf63b847de6893f0a131dc39a73168@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759782135;
 bh=DKsIu8TSSl6SyyrEjQvvoWwaOunWTOG5qiwoyg5w5a4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X2+mI0qLoJ8G5E6HhuY5sFKZjKKkF7f9q9iQO5jEd8dmFObOEyhw+Spib8AoJhT0O
 02M8Ce0uaxeFE7W+tD5XcKRcqmO5tG4fpDpUKXKp8miEVWxIJK0404Pq1atDwlX+9c
 EC9cQEDGXEHTISR+3qYdDbji/h2tSf7oSCgZp9DYNxB78EE8eNgjiXmqR2xeSwqO6/
 GB8RTljQjQnfXUnHrH+txTwvWV9bhyVbySG3ifI9Buqdeq+9pM+CfD6DWleVD6CWwv
 WypKWeF/YX+ZfEFr281INCTC2WGSkpJ1d7gKcieLXYHLvIgt2SGeqNdLx6bqkFrFnj
 KmP4nzr/mLNEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X2+mI0qL
Subject: Re: [Buildroot] [PATCH 1/1] package/libtheora: bump version to 1.2.0
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

Hi Bernd,

Thanks for the patch.

On 04/10/2025 15:26, Bernd Kuhls wrote:
> Release notes:
> https://xiph.org/press/2025/theora-release-1.2/
> https://gitlab.xiph.org/xiph/theora/-/blob/v1.2.0/CHANGES?ref_type=tags

This bump seems to introduce new build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2084250990

For reference, the previous version 1.1.1 build fine:
https://gitlab.com/jolivain/buildroot/-/pipelines/2084276305

Could you have a look please?

> Removed patch 0001 which is not needed anymore due to upstream commit:
> https://gitlab.xiph.org/xiph/theora/-/commit/14045376ee6897f20f6bb9815f246172da748e50
> 
> Removed patch 0002 which is included in this release.
> 
> Updated license hash due to upstream commit:
> https://gitlab.xiph.org/xiph/theora/-/commit/b68e2e53b30365f52204521d00b5db3d1cc439d5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
