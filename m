Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC9CCCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC94C40667;
	Thu, 16 Oct 2025 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbqsJZiOC-Sr; Thu, 16 Oct 2025 20:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F336340655
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F336340655;
	Thu, 16 Oct 2025 20:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64482968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AECF4037F
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUV9ocLFvzc1 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43CA14035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43CA14035C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43CA14035C
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:38:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F10C75FFB7;
 Thu, 16 Oct 2025 22:38:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Oct 2025 22:38:42 +0200
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 22:38:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251014190326.3589194-1-bernd@kuhls.net>
References: <20251014190326.3589194-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5106d17d92b13eee733e904608e198b8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760647125;
 bh=oEgOUoq29SuyDx+onUb63PedFHlQ/FyC2ybYjLPAeNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OfDNqmHAU/zTsucdXVQ/wl+0WJ7x98wqFqT66OmEcM1gTqmDPWsfM3YibvwBub/NB
 laPFKPxmhO0yDZ3VTuZDYe4HIxo9pnHNZgab0bgyKVha20RwERz1QUheyE+e4xoEmh
 Zg/Byc214s643U42RmOcXS3ibdKzF9o2M4Mce0yFkKcg4KqO2UEYvuGZz8lhSPrRqE
 9rXFiFQabNp9qFuR9vd4GHJlcSmrbbP/5g/st494OewAxjcjMXpQv7WLJZWhvtRKDx
 HFDeMjFHr6PtpZ2+hVjuqq4idhhJxaLOvH4oR/HYPcAXHrzMNYeEggTN3u3YXXlPvN
 a/V2a9Xwy8gtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OfDNqmHA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump version
 to 3.3.1
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

On 14/10/2025 21:03, Bernd Kuhls wrote:
> Release notes:
> https://github.com/oauthlib/oauthlib/releases/tag/v3.3.0
> https://github.com/oauthlib/oauthlib/releases/tag/v3.3.1
> 
> Updated license hash due to upstream commits:
> https://github.com/oauthlib/oauthlib/commit/1137a2fbedb586f105c6512dabe3da17d0f8f88a
> https://github.com/oauthlib/oauthlib/commit/059875a888d2200e43e18b818eda8442b2c3d0cc
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
