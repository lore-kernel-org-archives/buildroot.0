Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF0C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B9440720;
	Tue,  6 May 2025 20:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6qqhZFCWDvD; Tue,  6 May 2025 20:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62DE40728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62DE40728;
	Tue,  6 May 2025 20:13:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 457A91A3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37136405E8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXP619KGbtLv for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 607F44012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 607F44012A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 607F44012A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:13:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0B1B319FC04;
 Tue,  6 May 2025 22:13:23 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:34968])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 22:13:23 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 22:13:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250430122131.2795844-1-dario.binacchi@amarulasolutions.com>
References: <20250430122131.2795844-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d87e0d41f9bd9b5baaf78079f9720acd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746562406;
 bh=C49LSp1cXtrz8PC75/ZrIVaNGRQneRtjPPiCiaJjJdM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lpyEerP4o5de7LMaBFOZ7AirnuENk0xdPj9+bHon1mFmtVPlwzsWaeciBDj2SnXnN
 TWXfeBRDHphnNMKMP7ch+FkPD6zlAX5QNAye7VXz+QoVQtCCjJDQnJSgbs34rXdXK/
 Vm6mAkAyZrPXBo4c1bgY04HTL4F2+M1UOZMD9r6mT8fHAslLmzEvvLhXU++RpwkDLU
 JSgCEQauDyXErLgehHoXz85A8VHgX9HTAcetKx83hm8dhZbdlA3rpmZzaetBBuDoKj
 d22rq8dUBuefsJumoKLdN/eMfSRMOpKPEQu24uYOcTUkqB8zNx52BC3gyG1a+c+K9C
 V3dcnYr+ryCow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lpyEerP4
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version
 6.13.11
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

On 30/04/2025 14:21, Dario Binacchi wrote:
> Release notes:
> https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v6.13.11
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
