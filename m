Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6560C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9850810B6;
	Tue, 20 May 2025 17:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuQdVkmGECU7; Tue, 20 May 2025 17:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0118C80E96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0118C80E96;
	Tue, 20 May 2025 17:15:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94C3BD4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E0240A55
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4Yp5mwbBzoj for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D7B640A0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7B640A0E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D7B640A0E
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:15:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EAAA819F54D;
 Tue, 20 May 2025 19:15:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:15:37 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:15:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518201754.149656-1-kadambini.nema@gmail.com>
References: <20250518201754.149656-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ac59088383f588ac1aea9fd4db97e2ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761339;
 bh=kwO00wZ+ayM+C0BCvFTFUu0jtFiFsTBT85id+ag1FVg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oft1QFFcjfjw3aBgO1dyjzBfFvfHNLYP0B7h+tauJBFPuxUL4nbSc8vUfz9FoKlrf
 gXxvQ2LqwXuZSLywOYXzo0Yn6m21GV52Eh35o14gRUa2Y+JwnZLvUxJiBYSgqlG+41
 KJPfmP860zGfo499qMH2luMUZWHjg7B+PMUKZ7VcIG86fQ1U/jkYnjqXVpkEWNXWEl
 YzbzFl6U2CFRDYZ/60PxSNEuR9YRBKPpaZhUTtWczguCuiOGdKT9Mv0KTzPr3tzCMx
 WAroeQl6agYIXCwEgxsyVnIqXfzG0weQ/PYZeUGya39T0B3QaSkPzj4YZ617z/9lae
 HcnOX2I2ddjKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Oft1QFFc
Subject: Re: [Buildroot] [PATCH 1/1] package/lshw: bump version to B.02.20
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

On 18/05/2025 22:17, Kadambini Nema wrote:
> Changelog:
> https://github.com/lyonel/lshw/compare/d76afbaaf40e953243da921844cddff8185324f3...B.02.20
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
