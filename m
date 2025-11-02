Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C1CCFA03
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D39E8527C;
	Sun,  2 Nov 2025 11:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYeUtdVckVi8; Sun,  2 Nov 2025 11:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C27284C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C27284C7E;
	Sun,  2 Nov 2025 11:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 481802A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A3D184C7E
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BgzxuN3r8-p for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68EA584C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68EA584C4E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68EA584C4E
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B230219F522;
 Sun,  2 Nov 2025 12:55:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 12:55:33 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 12:55:33 +0100
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20251102105005.109179-1-paguilar@paguilar.org>
References: <20251102105005.109179-1-paguilar@paguilar.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <f138fd9dd45964ee58fce520f03c6a3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762084534;
 bh=xKpbIsv6Kov83OXuNHL/yx+HlxiP3UMn8VOK8w+Um4k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VT9ArniJ3sFZgE6ntL6sSi55E09XPs6uf7A3gBZzFG+Sv6M+MDsobp0z/rVlPb5TZ
 e2frzO1xXTyUAGlvEq3eGAKcC1gj6AHFza9KpxWCPCE9bXVqJ0xrcp7WGcPAPnOxdj
 Qr7E8oJI+oQCMfF7odgTH1RxYiFYe7KmwcZIsTHnqbFrDcvBrv6QCRr++nEbcMuFZV
 V7yIaCZk83J7FoAwzEQuLVDrxtXe2pIKZKtcs907MjPMuj+x75mPWGnuyW+Ud08kvb
 MUxPVCgXpGc2HshuCvUUF/9ko79aW2luq8nwrinhDA8jUUqV3t6bKWAj3Oo7GU4a0C
 boOdmIPP4u0HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VT9ArniJ
Subject: Re: [Buildroot] [PATCH 1/1] packages/libunistring: bump to version
 1.4.1
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

On 02/11/2025 11:50, Pedro Aguilar wrote:
> https://savannah.gnu.org/projects/libunistring/
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
