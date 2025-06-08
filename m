Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCDAC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 15:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A6D60B43;
	Sun,  8 Jun 2025 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haDTDEgu7-ig; Sun,  8 Jun 2025 15:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E833B60F5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E833B60F5C;
	Sun,  8 Jun 2025 15:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C74C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 15:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAEBE813B5
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 15:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUYriXmPODH2 for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 15:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CFC9812BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFC9812BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CFC9812BE
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 15:14:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CEEAB13F8C2;
 Sun,  8 Jun 2025 17:14:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 17:14:42 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 17:14:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250531002216.595139-1-kadambini.nema@gmail.com>
References: <20250531002216.595139-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <47333bb8db7c8a97aeb7802e956f6ca9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749395687;
 bh=LKd73n+XmH3GSly/LH+muI2D4p4pH9l79izoDryybDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DVYSPNdf3NSwid2tywmqTXlYCh1nqfirL14lIVCF21IyfmIT4BFTxH1Ug98aZxnkZ
 uFK5w0AUPQ6ctFnuFQXZYL8oDR9w4nUptrwtzjxW85dTVQtV76qCnE8QbY1jR/Fi3a
 1+BoFokeBOGxKvFS0+c9OG+MMNOLuFUDZYGMkk3D4N57EIUpuQKhKajwk1RT1tNpN1
 ctEPdPExM7nhv3ap8Hn5VgrodKcntBl65Ug8bMAxzri525LMdG06riweCnolL7TWei
 EoT3a5ck7tB/P4UAy/qAZNQzqBXIu17VVUzcru8Ye/TUPS1Pms85EtdtR8JuA2MNR2
 57Z7A1uptjx8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DVYSPNdf
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: update to 14.3.0
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

On 31/05/2025 02:22, Kadambini Nema wrote:
> Release announcement:
> https://gcc.gnu.org/pipermail/gcc-announce/2025/000186.html
> 
> List of bugs which were resolved in 14.3.0:
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.3
> 
> Drop upstream patch 
> 0003-libquadmath-Fix-up-libquadmath-math-sqrtq.c-compilat.patch
> https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-14&id=8581982e8c977f7158d5fed5131caf0aae330403
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, after rebasing and fixing conflicts.

I also fixed the dropped patch upstream merge URL, which was incorrect. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/e9227311d9a63c9a829316e2ffb91cb70ed127f1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
