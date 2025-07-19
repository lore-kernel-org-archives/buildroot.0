Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43630C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1857281EEB;
	Sat, 19 Jul 2025 11:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnohFVmUuLEM; Sat, 19 Jul 2025 11:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617F48450E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617F48450E;
	Sat, 19 Jul 2025 11:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1A6117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D7B584511
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnQFefoxN4rJ for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFAB381EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFAB381EEB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFAB381EEB
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:12:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C3E0A780507;
 Sat, 19 Jul 2025 13:12:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 13:12:09 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 13:12:09 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>, Michael Walle
 <michael@walle.cc>
In-Reply-To: <20250715082016.109224-1-heiko.thiery@gmail.com>
References: <20250715082016.109224-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <05f3527809295db6b6a9038b493b5e16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752923535;
 bh=vsGmbN2wKj90xZLnZIcHzBWHF+MiF1ESBBaFxKM5zf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FgCmlZXQqFHySImNwUKLUny6gmaIxj1uLO2h7sIfVtMiBxRYZIWEvam/JiD1aX6Fa
 q7GcddcxfgK7tNd5476aVxqHxWsaK7z0y7w/3ERJcEN30KWaByR8kGRulybjJgux+t
 knRmtsLmsjVnOquaMTXFf22PjE4R+/omh9ftOcev/MzJcQ4AGSetkzz87McL9rhaDe
 W/wGZs3cFWp0z/A0g9KL2qgbYP6xBcXmADZPV4+yqzHfCc1koBN9gJ776HFCL/mzRN
 XiXECx8Ipc1LslyB5jUmRmTDR2mFXqgvUa9l4xy/w+lWzPb7x9kt92+jPZKD0epx94
 IT8COTQ2jaVxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FgCmlZXQ
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: add support for
 imagination vulkan driver
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

On 15/07/2025 10:20, Heiko Thiery wrote:
> This adds the experimental vulkan support for the PowerVR rogue
> architecture.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
