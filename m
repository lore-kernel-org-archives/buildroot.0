Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC82C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 20:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65C5410B4;
	Sat, 18 Jan 2025 20:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrSnFkDPImZB; Sat, 18 Jan 2025 20:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8D0410CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8D0410CA;
	Sat, 18 Jan 2025 20:19:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4963669
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF038496F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89be1JOT2mHX for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 20:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 835C3849F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 835C3849F3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 835C3849F3
 for <buildroot@busybox.net>; Sat, 18 Jan 2025 20:19:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B1BE22003C6;
 Sat, 18 Jan 2025 21:19:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49152])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 21:19:40 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 21:19:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250117174611.2612416-1-francois.perrad@gadz.org>
References: <20250117174611.2612416-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <60d7522e2df3a82dfcbc421831776781@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737231581;
 bh=t2DTc/5M6lBkc62QXgi0Cv0PnZ9iwRTnw2Wdd/OG8J0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lrb60BbKtSKRmffGplK3Tl3zW0GRcRQRbcPZlB4nLhqzgUD0sZC9zqMitVSomcX0A
 uq7ztKnyoRp7Nnlz/yFc2z+Q4CbcLrdxLZPv3/ydoWXkr6uOzSV2+jv7mhcELCUG7Y
 yDusesnCekr0mxGtF52A8JEOhH//qOFgDG/22V1fz8DoioBfusRZJV+JX2kWDe/Vxa
 5K+/JkZxPH64l5PNRmPbh6yPiCpuqdMF2C7JGEWG2vZmVSXLrVZFzDUQZCyhqrkqN0
 VaC3sKIt2g9rrG+Z36jgQYHKseOPE9htFbipN5xJX0jgZ99wjGiDa27hs1/3JI0O1E
 +y+T/dQGqHY1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lrb60BbK
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 a4f56a459a588ae768801074b46ba0adcfb49eb1
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

On 17/01/2025 18:46, Francois Perrad wrote:
> diff COPYRIGHT:
>     -Copyright (C) 2005-2023 Mike Pall. All rights reserved.
>     +Copyright (C) 2005-2025 Mike Pall. All rights reserved.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
