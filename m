Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A2C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 16:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11CD80B37;
	Tue,  6 May 2025 16:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKRjTqITIV64; Tue,  6 May 2025 16:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D1A80B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D1A80B6D;
	Tue,  6 May 2025 16:03:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 725E420F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5815940498
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNt3jCOVi-zP for <buildroot@buildroot.org>;
 Tue,  6 May 2025 16:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96456403FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96456403FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96456403FF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:03:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A7704B0055E;
 Tue,  6 May 2025 18:03:49 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:47440])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 18:03:49 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 18:03:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250506131252.4170-1-alexander.i.mukhin@gmail.com>
References: <20250506131252.4170-1-alexander.i.mukhin@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c019059349525d68bae7cb7416ce30df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746547430;
 bh=Zz/Tj4jaD89xi3ouSThJE/ZWVoLnC4t9M4KRySbmxF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rQff/A8WLRscQbQZVFLc34BSmAxHrGLCnzp4iSQb4zKSGzr48t1bVD0YEkT/d9V7T
 U6mWJRbswTFZlkpsuNoE9HC6p4ptIsqC1+K1MYbpqMaeschKA0tP+0xygr68wpyezm
 Jsy+aCQnKFkTm64EzbfLdSKPyuOU6pFWGWbUq1dnqX+3aRazXYbTXGFMtqGIUif5Df
 TvbR7Y+ESMVrmUqF79ruwZdvgv/3HjMSXjkiqq0n1/sNjYNrTr1Y6whaSoVNdEUhG3
 P20sc2rfPMdhBcMp6nbQXv/Nr7ydw1B0UJ40PPg5ggMIVqMvAbZnXzOvkBRoeuLYt6
 0GSt9NSpWRpNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rQff/A8W
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Alexander Mukhin
 from tinyproxy and zfs
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

On 06/05/2025 15:12, Alexander Mukhin wrote:
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
