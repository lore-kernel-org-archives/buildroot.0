Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDEBD116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452D281157;
	Fri, 28 Nov 2025 20:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OqhZSdpJ410; Fri, 28 Nov 2025 20:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EC0780BE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC0780BE9;
	Fri, 28 Nov 2025 20:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AD51708
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6145680BE9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSd2dPZ9qgHM for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 506FF80B9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506FF80B9E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 506FF80B9E
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8C8092003B4;
 Fri, 28 Nov 2025 21:23:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:23:58 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:23:58 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251124172519.3135368-1-buildroot@bubu1.eu>
References: <20251124172519.3135368-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <b68be196924ab3c16abf1269f79b763e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361440;
 bh=5RTR4hr3i9+2jEjTpoU+VIodBNATpffNl0m5x1nDb7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NrAXwYb3H6ZAuxFEJbnW6DVACjlTjQDdl3GM+XHlgk0dMchG/UfWpoWcjZxtKIel7
 hWUPiIKUQEqdq+EZODPs8ByUeEDL9Z+BdbKie0WxV8RSweZOLQDmtgVQKZPCOPV6/E
 J8gm8Q8adYGlLVIaXhYcrlm+8Kf7P8/s+wwJd6KxjQlTIhCK8+wYATWxpI9goSeLtS
 P3Ej9ROK4mrbx8ZOr9E1g6QVAAEMPdVAI0Y5EQYX7FYz0CXPBdqvKTqnFavhpheyyH
 iQrXm4gbTLfrLwLOw3j/sw498W7JjisGDbAUWXg4U1R5fbgArLZ1YsP4iltM0yek1h
 oBttRtZJsnlUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NrAXwYb3
Subject: Re: [Buildroot] [PATCH] package/python-idna: bump to 3.11
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

On 24/11/2025 18:25, Marcus Hoffmann via buildroot wrote:
> Changes: https://github.com/kjd/idna/blob/v3.11/HISTORY.rst
> 
> LICENSE.md hash changes due to copyright year update in:
> https://github.com/kjd/idna/commit/17f30a644563860262436a552d99e3ab0c505da4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
