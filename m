Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DE0CCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA5184B35;
	Fri, 31 Oct 2025 22:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkslJT0aXAwf; Fri, 31 Oct 2025 22:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0827484578
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0827484578;
	Fri, 31 Oct 2025 22:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C4432A3
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B2741B97
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypc8a4wAUNc4 for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01BB641F99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01BB641F99
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01BB641F99
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:31:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0758E19F593;
 Fri, 31 Oct 2025 23:30:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 31 Oct 2025 23:30:51 +0100
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 23:30:51 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Pedro Aguilar <paguilar@paguilar.org>
In-Reply-To: <20251031113006.2352183-1-dario.binacchi@amarulasolutions.com>
References: <20251031113006.2352183-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e2c161546839f9a30febb9c75b986218@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761949859;
 bh=58aEVCL0bXjm8OMQmEhLBoh52y3NGhkG11HafHIyuqo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HWcwUQio6xGtbO7GafqV1ivH6NzrzpNwxlCnXK9ebqIrWYYNs0ZSppBLFIYTiRlVL
 2G8eKC1yrKaKZQxulUNlY2e+09HT10k5gP7Jkt/emZQHX84VAtJyNfYII+5x6tiK0E
 zfRQnyq4aizlGxj4ZAr2UASNReer5nDs7uNNzlV03Q4wXHaJK1qLBA7vp6VYNSPllJ
 8FHfpVRbsKge+zn1eXrJr23Epopar4FWWsJbeJVYfGiR2oawSeEK/OLu9l7TguTuzw
 nc78iXAsj6QUkTZUNcZsHrRkiwzOziYsW3QVE40JM9tXvWJiFXV7GYy6InDL6EHskF
 w8XPpzadwOVIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HWcwUQio
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.10
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

On 31/10/2025 12:30, Dario Binacchi wrote:
> Release notes:
> https://github.com/ivmai/bdwgc/releases/tag/v8.2.10
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
