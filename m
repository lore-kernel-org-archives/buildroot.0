Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1C3CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A1240E30;
	Sun, 12 Oct 2025 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LfjHN9fqcWg; Sun, 12 Oct 2025 16:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBED40E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBED40E1C;
	Sun, 12 Oct 2025 16:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 924F4BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD2E605F9
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3_2x3ZPToUp for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9AB0605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9AB0605E0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9AB0605E0
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:28:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A091478035E;
 Sun, 12 Oct 2025 18:28:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 18:28:34 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 18:28:34 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>, linux-amarula@amarulasolutions.com
In-Reply-To: <20251012150059.2419462-1-dario.binacchi@amarulasolutions.com>
References: <20251012150059.2419462-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <40187bc67eeef507bb9004920291fbe9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760286518;
 bh=CkR5zNBhbWuKRTB4RBWEbFvPh6h9kbe/itX7JQ7e70g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DKzHSjATV7Yi8w/rO26y9yLBN1IHMxBlylJA7MRGv+0B+sUG60Pjvgkq5vftUm6gT
 M+uR6s7ne0DSOfujYlr1sZ1fw78pLVJ9A3WuP6hl2GgOl4lgjoLIEBVcI+cre0/M/3
 5R3FTNa0XURmno7VApzDNYC9RAmRvoDtQNAezX2Kn92tVjiUR+VvJ7hHwidHGY1KmN
 Z/qcqjavrvT0PPmGizyyINnajpT1qLUV3dL/j1k1o8u/tgZZy8eOG42RnivGya9FDW
 S0a+zm3d6azF5p4/rirF7V1uW2WspuOhtFJuUT1gb2Iqz5tMu2whYs1ItDpZGz35Ri
 6KnkLLYEe6iuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DKzHSjAT
Subject: Re: [Buildroot] [PATCH 1/1] package/gumbo-parser: bump to version
 0.13.2
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

On 12/10/2025 17:00, Dario Binacchi wrote:
> Release notes:
> https://codeberg.org/gumbo-parser/gumbo-parser/releases/tag/0.13.2
> 
> The removed patch has been merged with commit [1].
> 
> [1] 
> https://codeberg.org/gumbo-parser/gumbo-parser/commit/b66e1679441acfa67f2d68ecf35fe4e1d1e13394
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
