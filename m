Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10401C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 23:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B06104048D;
	Mon, 27 Jan 2025 23:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BebjXEITfItp; Mon, 27 Jan 2025 23:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914DF40499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914DF40499;
	Mon, 27 Jan 2025 23:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A17A976
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6854A403DF
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BdZvA-79BaF for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 23:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54DF340270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DF340270
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54DF340270
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 23:32:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55E73B00573;
 Tue, 28 Jan 2025 00:32:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60538])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 00:32:13 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 00:32:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: patrick.oppenlander@gmail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250127221636.5746-1-patrick.oppenlander@gmail.com>
References: <CAEg67GmDfqCn5w=XoNyTm7EDFgUOr0kZjgtnbk0A5ZtPHd7HXg@mail.gmail.com>
 <20250127221636.5746-1-patrick.oppenlander@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <473c209c541fdb0f793d38c8253bb95a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738020734;
 bh=KAONxVtExKp7zmza8QsQ3TDyVuOQIZHBe8ExS+tFffI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DC3W/p9wzD40Hm35TLUv+BzFVBuhl2fmSyUAx/stIZO/kvvacx39EHSZkleW5V/Xb
 lA0poJmb4KLMkw9a3SvJtwI1NdvQrMLUzWcos/0NbON8SAW+pJ+0d4OTFdYfAjXBUK
 Qx281+ChMIq+Sj3b+UEvaZkBzJw50hhS11uFC9yJvEkR+tvIshO+h+nRswYsEv/EGr
 5Mp6UL8X8hJQndDZ80/P++C9+4S0Pt2ywHDUtJDo2ncrJ1vZg46OCz8OtgLxWz27UC
 XKbnPzz2+csqquFWhzYR3Tsll1s9Ks6PM9syPC5WL0wqavOnja0GCG/C20ProNbP4a
 jUX2JzjbZaUhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DC3W/p9w
Subject: Re: [Buildroot] [PATCH v2] package/minisign: bump to version 0.12
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

On 27/01/2025 23:15, patrick.oppenlander@gmail.com wrote:
> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> 
> Upstream license changed to include 2025 in copyright years.
> 
> Changelog: https://github.com/jedisct1/minisign/releases/tag/0.12
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
