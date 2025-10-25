Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74465CCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 09:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9EB8064D;
	Sat, 25 Oct 2025 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHsdBUDH5par; Sat, 25 Oct 2025 09:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62541805BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62541805BD;
	Sat, 25 Oct 2025 09:33:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20053976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 09:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D3AF4040E
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 09:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLGuXxJh1BBi for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 09:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 303394040B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303394040B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 303394040B
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 09:33:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 80105B00548;
 Sat, 25 Oct 2025 11:33:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 11:33:46 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 11:33:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251020165249.1714204-1-dario.binacchi@amarulasolutions.com>
References: <20251020165249.1714204-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2ae9000b61c62ec8291b18ef6bbf297d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761384827;
 bh=uIIQwFLFGiWx8wzTIgyxcujt87J+3btqagAPKHVaYxg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fU6ZzLO+nZKoV17D3VFaM6FqP4OD0Vh/LNSefFcfio0VobANryF8qf9lYligeKDkz
 DfI+EmHi0oPMgz2RIcN/bZRG6oqQeD+wu0dIqaUl2YmWP1pIwv7oBhsVRXjC3lx65K
 3d4mNCKreQ8aKAOToVThIOYDQZEUEoyPscMKRp0mGEhhGxzf7qIMhGh/wTFZY5lF6c
 uTVdGLv0YuNne97eU864wt3wKxgXRQ5zjIPANti4l5bOpFeNc50atzfsQr4uckayC4
 lAnmT8v4L+lAIarrbUlyYp6+VKCQ6hMBy8U2w6c1tGSGNZ7NyQXOAgOl2QSLWYyapq
 l/2Is8Tyy9tjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fU6ZzLO+
Subject: Re: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.3
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

On 20/10/2025 18:52, Dario Binacchi wrote:
> Release notes:
> https://github.com/pocketpy/pocketpy/releases/tag/v2.1.3
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
