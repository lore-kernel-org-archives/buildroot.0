Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC7ECA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED8C84121;
	Tue, 12 Aug 2025 21:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKsn_h-7qxdU; Tue, 12 Aug 2025 21:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DD88402E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DD88402E;
	Tue, 12 Aug 2025 21:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 100AA938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D984011A
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtQ5Jj7hfXFv for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DF7B40107
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF7B40107
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DF7B40107
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B415D19F5A7;
 Tue, 12 Aug 2025 23:41:58 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 23:41:58 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 23:41:58 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250730203947.1097409-2-thomas.petazzoni@bootlin.com>
References: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
 <20250730203947.1097409-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <35d9cd9b2d561d9e573fe19fe22957e0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755034928;
 bh=beOLpgrRLdq5n7hZcXj17p2JovrxKt3mxxlkVqE6xd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LmQnEi3kJNUW4wXgoNOw397akt6yKl34hmDY1fHZ8AcOQMLiOHvhWDT4X3uFBRvMX
 W7yLbLYMaOeTmxzPIbpKhaWxdTbh6IqH/Yn05iRsKyco6qyVjGMc9MsnxewNZqyS/e
 TLNpqc7kDxmYHYF1Dhv/nLsjWT9NpfncXQ7HM9lZHLVDkgy4Yc2RC07qTGr9Czq3sU
 /WGtrCOj3qb0Xk/IReRaKbBH//nb9m6g/cS14z9B3Kuj36HImv8+fQVsrsQ8jOftX2
 b0WAp8M5DhVW5Oi+8ftfKYddseCsbMcAIJonBJkcZOstDzu8UZKOXozRlXM8fY6UzJ
 9nRWg3/Q+q1+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LmQnEi3k
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: backport upstream fix for
 glibc 2.42 build
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

On 30/07/2025 22:39, Thomas Petazzoni via buildroot wrote:
> glibc 2.42 drops <termio.h>, so the libsanitizer code needs to be
> adjusted accordingly, by backporting upstream gcc fixes.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
