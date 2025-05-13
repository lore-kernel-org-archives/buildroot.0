Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBB0C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C564069D;
	Tue, 13 May 2025 21:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QDI9qzPAAsu; Tue, 13 May 2025 21:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA3B411AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA3B411AE;
	Tue, 13 May 2025 21:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B94150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B73D8112E
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGKvQfssdhlq for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:08:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A623D81177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A623D81177
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A623D81177
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:08:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8D3DD5FF95;
 Tue, 13 May 2025 23:08:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 23:08:25 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 23:08:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250512192240.235850-1-buildroot@bubu1.eu>
References: <20250512192240.235850-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <2060261f96c66cf883bd57b2556dc0e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747170507;
 bh=IThHMeBh+yvfDsYqrWToaGxOgLSfkSVeLsw8yS+cd6Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kWrORGdcs/EcPW8qEA7tuPb82fSvO6v7T+HhFia/BmCycKqpcb0uFWB1Dnqxp8T5F
 JL3ZUbMWO51X6t4sL/slg9wB6AqKV1elxncReooz+05cQanE8qQ88wm6rVlo3eq7DE
 6c9W1rwKL+WAplXz2L4EgpyhOG9gVVcFPdHmNIPMwYTwkSr27U3Kdy3Lr+qvjwHakG
 VqAmYOxvSnkEPtzBTXkIxlt8SAUvSoWMrOfF3FYSMvRoqKO7PY5i7vCwgMLrVx1+QD
 520byHYvmxT6/cp6bdr+r/AwSjgDRXIUPfclgVA2JUe/nZUyPTtsBBreqevtVhGsas
 DtO987B4BuJKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kWrORGdc
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to version
 0.34.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/05/2025 21:22, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
