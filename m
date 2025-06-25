Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C62AC7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DAEF809E7;
	Wed, 25 Jun 2025 17:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq5rFE9ZVvGw; Wed, 25 Jun 2025 17:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79AFB84253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79AFB84253;
	Wed, 25 Jun 2025 17:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48A0A154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E5DB8425C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSKSarHz2u18 for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4301384253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4301384253
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4301384253
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:20:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F411DB005A6;
 Wed, 25 Jun 2025 19:20:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:20:38 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:20:38 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250624134625.2394898-1-buildroot@bubu1.eu>
References: <20250624134625.2394898-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <0998563b544362c8923c03b6109cc5d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750872042;
 bh=wG9bUXOJdTMA8Cmdzma5SW6rqWGnUKdrJnpBiLzd+Tw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ToD8eG+J5YN9wQ2IcmBuKJ6v0Abz4nquQZ54QvDaem3bZNU7+Vuzn6vKFVoLt3v4h
 JD76ceCDnae3dtPBSvk3cDAPN36DFhihH05JUtbuIITOpvq4cnQrwtStCv0P2GUAfo
 gXF8jV1ClOyp4wNugUdDRYqfrLfboJIcqnf4zBuF3mTlG9byMbtptnQW10t5rVp7YR
 iBrQMazuXD+HoDD/REgWz5pmtl1qHowDd8iju2weAWl+nitT3k+x+xc/eytMUUieYs
 z80k7drNG1hsNqj48OPmgh+wpLThce4IIHBEAIX2vr4Bzv//5SsglDVRlPP6vwseYa
 Ji48gQ4XWq5RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ToD8eG+J
Subject: Re: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 2.10.1
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

On 24/06/2025 15:46, Marcus Hoffmann via buildroot wrote:
> Release notes:
> * https://github.com/pydantic/pydantic-settings/releases/tag/2.10.1
> * https://github.com/pydantic/pydantic-settings/releases/tag/2.10.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
