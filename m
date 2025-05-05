Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78855C3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD8E40571;
	Mon,  5 May 2025 21:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfa6Grj03Sl9; Mon,  5 May 2025 21:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D8D4057A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D8D4057A;
	Mon,  5 May 2025 21:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA837D5
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC287400E7
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6WhRovDovNT for <buildroot@buildroot.org>;
 Mon,  5 May 2025 21:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFFAB40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFAB40026
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFFAB40026
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:43:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2BB45B00576;
 Mon,  5 May 2025 23:43:12 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:38676])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 23:43:12 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 23:43:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250501071955.10446-1-kadambini.nema@gmail.com>
References: <20250501071955.10446-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <305b9b5e874d9254de7f6c98a2f1cae7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746481393;
 bh=yqwi6J0raz5LqHpZtdYnAe3Yx/0l4o46ynQJhIRxXWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GdW67PnaRr2stnMZn2kadj5dc9XyDAti8478w7E/nTtgFXL4wBN+v0Yfz0vi4ImWQ
 CRX31nrEDHizT56pR3CSUgidoTI71XKce+fiwiHp01ErnATjwPBCvQDPvtbo7/rMyc
 V4QI9rQ51dfRxmb2jV7ChgC26Uk4VtD83fGGn6kRC2W6s7VmXLbrwU7yBFfd5MEwU3
 JnzkX+4/heU6kv/QDnCBoHdmlEFrhmUfEifoAs7GflgHYuGLflLC7JjUNGBPPKUCMb
 Eq0bAnJSaANlD+yPGpXBVF0+0UYG+O2jGuHm9dJQLe/O6JF3wAsxen0/kV33WqZPWQ
 rcu04M5oHlQ4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GdW67Pna
Subject: Re: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.48
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

On 01/05/2025 09:19, Kadambini Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-mtools/2025-02/msg00019.html
> 
> Changelog:
> https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.48/NEWS?view=markup
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
