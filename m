Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07507C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF45417C1;
	Mon,  7 Jul 2025 20:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAIZ0kngVj-m; Mon,  7 Jul 2025 20:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F07604192D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F07604192D;
	Mon,  7 Jul 2025 20:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD0491BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4F041922
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvFjbJ-dOG1L for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17FB1417C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FB1417C1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17FB1417C1
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:19:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 05F38780316;
 Mon,  7 Jul 2025 22:19:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 22:19:22 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 22:19:22 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250707130243.4179971-1-yegorslists@googlemail.com>
References: <20250707130243.4179971-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <08eac8d77a38ef8c1bc5d75e09c1a23a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751919565;
 bh=bWcPagQHOzVVnyomZjHzpVaA3YjL8QR1mZzuUCvPf00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OBkZHNdrufdJ3f0DGkyoz7phaZveyK0eGmZ/y35O3cPe5Zf1noC0/5Bxwx0mY95Km
 jk2iXWcPkNmDbPO79Rs7eP8S5F1gp7Reivrv7cdVuQC8y/SvQT/hyzf+r6E51hm7D5
 aX6ulU/9fTrUR764Bd2Dv5N+nkfdo6/JSCPaL2Z99QZyCnz3QdsDW1JfXYpB3df3Uf
 ZPJcEmUPIAJqlG3JwQqUUwThsh71ghfn2czxiG9wq056rpE2fAblt79zDdR/yrE6P7
 UoATEfEEO2OGMfGBjrtcAfjA2CnDm8j6mOPTUpHZLTdm64FmUwGXTdF+IxyZpy4wWH
 ICo/vC98rXRQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OBkZHNdr
Subject: Re: [Buildroot] [PATCH] package/socketcand: bump to version
 0.4.2-122-g6dd5d33d4645ab221e8cd265c08607366e21ddf1
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

On 07/07/2025 15:02, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Switch to meson build system.
> 
> Remove an upstreamed patch.
> 
> The license files are now gathered in the LICENSES folder.
> 
> Add support for the libsocketcan library.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

For info, I changed _VERSION to use a
"git describe --tags --abbrev=40" format. This align better with
the non annotated tags published at:
https://github.com/linux-can/socketcand/tags

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6d23852980d2ce92804de2c4fced38317fba6952

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
