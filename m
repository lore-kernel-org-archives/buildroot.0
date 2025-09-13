Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C570CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 10:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCE8617B1;
	Sat, 13 Sep 2025 10:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sQGOaaQDDME; Sat, 13 Sep 2025 10:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2BF617A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2BF617A5;
	Sat, 13 Sep 2025 10:48:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF2D92E
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20CE0617A5
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpA-9vwbW9ni for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 10:48:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 487E1616AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 487E1616AC
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 487E1616AC
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:48:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5A2E920039E;
 Sat, 13 Sep 2025 12:48:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 12:48:24 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 12:48:24 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Petr
 Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250912212302.1057923-3-giulio.benetti@benettiengineering.com>
References: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
 <20250912212302.1057923-3-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <da2b19416673c843e5e1a84ceec80683@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757760507;
 bh=gxGXAPTY6PXy99T5cp1g+hhcfyE2LRlxqr4m+xRbnC0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t579lmiaGu2E57Ui6eeMeoiOe0c3PuCowvES7VBu0MPN5svk8ETYqvfqdcCgjBEdb
 YgGf9s60lfsHT0RxdkMMy2eKA+/j4D7qQ8hzQ/E/ViTvRoxa5mLiYdE51/x3WSY3Q+
 HB6C3VSM05v/LVaFVeptt8U1CXgnJGJ42mY7LjPnqVR0BUPGrSwnFDHeCGqNivpZVE
 1hTZbbe1veFmnnO+/WmhtyQvyBv1+iOWc12b+24PI1R+QXBRAJZUutKQ+iUkZc5isS
 YnGY7v7FrH/faRkl8ruoDNtS249KvLcOsWq+et/8Dvf3ACSKKDyExk+dI2ZW3HBas9
 OG2EqEIK7VfxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t579lmia
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.116
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

On 12/09/2025 23:22, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_116.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
