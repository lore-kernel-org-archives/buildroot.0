Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4205CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B8B80AFA;
	Mon, 17 Nov 2025 21:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6If4R1y3LY9; Mon, 17 Nov 2025 21:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1858099A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1858099A;
	Mon, 17 Nov 2025 21:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0C5E1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B3C80711
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4_KrUDQ3PgA for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0704F80748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0704F80748
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0704F80748
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A8E9C13F86A;
 Mon, 17 Nov 2025 22:14:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 22:14:23 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 22:14:23 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117201644.3299491-1-dario.binacchi@amarulasolutions.com>
References: <20251117201644.3299491-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9b8092e233733d8a69553fe5a9e08dff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763414064;
 bh=TW9tJk9jbjzzlRJ68RRtMyzwDL+03GrJYLmKrTz3iQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AvvMqNlPPm9FGX+tasMl1Dd4lYxuI8llpx1rQmW/zPIKLKMpz7JQpTOv+yZmwzgjC
 eP1l6iDs6ffti5A81yFWBnZk4KBn9dCImBqqz5acBiXCO3J1BVeHt+YctBJF94Cd5d
 lEuw6iPG/jpC98TiC0pmGJFhDsEtzKMHxoT0CQ+INFYcG7P2gq/keVS0qSW77OwXEJ
 MnxuJDYsZjAWwgwaeMauNhBV2n/SLObrEoj9SZR2wy9zuAzqe/q7OqPFM9ZBLLyaHa
 X8dtDiIFxzlNjyjzMXD1TvHahmvJ2S49BIpW1XCjcBIbWEAQBp0JfPae/wPrzp6r8N
 QZmbr+usbJfEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AvvMqNlP
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.239
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

On 17/11/2025 21:16, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.239
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
