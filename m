Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B2FCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0C480F6A;
	Fri, 10 Oct 2025 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enoQH2NfgLZ3; Fri, 10 Oct 2025 17:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 475A780F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475A780F65;
	Fri, 10 Oct 2025 17:06:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D11F226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2F680F65
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37mcy3NbWbqW for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D29C980EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D29C980EA7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D29C980EA7
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:06:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B3271B005A4;
 Fri, 10 Oct 2025 19:06:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 19:06:44 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 19:06:44 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251004205800.582688-1-giulio.benetti@benettiengineering.com>
References: <20251004205800.582688-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ca183c39cc8b7f9c1a58a99c23ea48f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760116005;
 bh=Bs5YPk4pzsryuhZVNYUJFv0YOst/STatVdAyngUVsnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=box0eeWUNEJxXRYVqwGZZtHTH8hjoMysnU8QjUyzjHpkdZumC8xRegCyNM7XDmC16
 aPf/gu6BxMwEtIuf7e8xuTk4Zd4pzxSrz3owTarMJxo4AY9WU733T3QdSDMPY+9hVQ
 +b1JFqQzQ2Bvsr2Af95W2LXkJwD3Thd3rT4y/n7Wq9sb+7ilePoFqTNdELtF2pZu+p
 Gs7SOiI7J/Td8UvH38gHuiVokz/qGW55vJyYa94wxfkbYOiNAU70n5JykTj3Wp030I
 lIDGV3No5DOoJB0yccsiqZoGZ+prwSzfPrFqUUGtfsLBx/pZq6f5KNZ4ceb4DTE4v9
 Cwqzv0HpDEb9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=box0eeWU
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2025-10-04
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

On 04/10/2025 22:58, Giulio Benetti wrote:
> This version builds up to Linux version 6.17.
> 
> Fixes:
> still not happened
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
