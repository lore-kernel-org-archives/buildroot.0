Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B7ECCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C64260853;
	Sun,  9 Nov 2025 17:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCHpQOsikTHO; Sun,  9 Nov 2025 17:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7126607FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7126607FA;
	Sun,  9 Nov 2025 17:51:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A7125D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4630C402F3
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joBnUpunJ-kE for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08C7D402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C7D402EA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08C7D402EA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:51:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 20BEC2003DD;
 Sun,  9 Nov 2025 18:51:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 18:51:50 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 18:51:50 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20251108105720.2582873-1-dario.binacchi@amarulasolutions.com>
References: <20251108105720.2582873-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4eda348e1d66aab75bd71d60fcfecd81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762710712;
 bh=RtDtSK/gpodn/i2y7zggyhj7zcciPzvgadPB2vHa9WM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X4LDKoJi897SXQxqaFzGhzH/NMryU4pAI41lN3N51WamB91A6dcCATKnPDtAoO8ZV
 E33LPITxyk9nicetmsMyb4ZxBRO3tF7ol2WZUokU5JILBNPWyQx1yNXEwF9kd6M8Ft
 GLc2oLFWirwlfSwdRl5iV59xL1jGhaiHxyX4rQ9LgO2nOOQns1L28U74rvpt7wJYS5
 lLd8SjQq0AuFLARi7OqYnpctKtVwUewes74wNHLFIvJcoOFlz1sqXcYS3fqg3ix3DK
 dHkYHlOY7U8tk7kxTVRXyZxHMS38Tc4GRJp96oLL9NTpzU4ZZhTAgBf5XMyjyn3vYo
 bu53xKFG+a1Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X4LDKoJi
Subject: Re: [Buildroot] [PATCH 1/1] package/cctz: bump to version 2.5
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

On 08/11/2025 11:57, Dario Binacchi wrote:
> Release notes:
> https://github.com/google/cctz/releases/tag/v2.5
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
