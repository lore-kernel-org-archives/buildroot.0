Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A9EC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4512982E9D;
	Wed, 23 Apr 2025 19:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Pqy-NHNBVQp; Wed, 23 Apr 2025 19:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70B268303C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70B268303C;
	Wed, 23 Apr 2025 19:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CB21BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99B118303C
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp10SCCkaqcu for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B06E782E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06E782E9D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B06E782E9D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:16:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0128413F879;
 Wed, 23 Apr 2025 21:16:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:16:15 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:16:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>
In-Reply-To: <20250422085337.901025-1-elmehdi.younes@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <bef79a4d86d78dac9badf6e2a9ef067b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745435778;
 bh=4sCGCDS0AOZ0TwQ2p4JXqV/zq/5KaDAig1MJES1mZ0g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lSnxyC+ADp4SltB4982M4aQkjHnaCBugyuqmonT4WcrJyuoYP8/2/WwckmjvYlRFz
 ZPzKgQOm3tbYf03y0+xwRidhi3iigcu3Xl+uIZ0l8DBMHcCaKsvjwGpkROZt/zA9rT
 RT3YtoBWpg9TCRBRKf+QD9rcj8P9BORCDY9bGr82N7ESVJ9BMiedCrSp0xGFwJ/8ZG
 Wqe3Cols9faa9BKWWUC7n0cByXJdJBiAvvqwiYJzjuFupAeb3Qhml0b+2CThKm1uWY
 +Ac+GuC9np5vx9M7M+0BG7bJLwUchaJe6LmYTnHuFp91Vymxt7u7mjexhaC0iNpKPI
 cGFBsitbNw2gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lSnxyC+A
Subject: Re: [Buildroot] [PATCH 1/2] package/bat:bump to version 0.25.0
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

On 22/04/2025 10:53, El Mehdi YOUNES via buildroot wrote:
> Changelog:
> https://github.com/sharkdp/bat/blob/master/CHANGELOG.md
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
