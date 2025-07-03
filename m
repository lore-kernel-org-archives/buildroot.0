Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC7C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304BC410A8;
	Thu,  3 Jul 2025 21:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s6caRhurhBm; Thu,  3 Jul 2025 21:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B590410BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B590410BB;
	Thu,  3 Jul 2025 21:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 664C1B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C2C5410BB
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgdcmhgpIqA1 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 21:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74045410A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74045410A8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74045410A8
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 21:19:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A0B0220048A;
 Thu,  3 Jul 2025 23:18:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 23:18:56 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 23:18:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250703210056.1519541-1-bernd@kuhls.net>
References: <20250703210056.1519541-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <75d2c092d51020218bf035aa0c8e36ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751577537;
 bh=sY9PdwJLdjMB1/Z18Tn4W9gLoHCT2SA4rL9FLq3pGCk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YvBKpNIYkHs1dtb2pRFY/GKsTbPpBNi1GgRYimBF2uylZNDsnuMSlA5aqxQSRKJGC
 4T0XmZjmnyNJ7KEp04g+QmFv4F7VGi3LK5nUcSxSF4K2I46BCPgBdq1XOc5yN8dSsg
 EO/wj5RBnI3cIZdvYfrgUVszlUUlNvUQe/RdFEcGQRjx1az6lTmPaOr+yRCdrVuyAi
 XP81jfhnXoRoicgTsL/ibPfMpO5Pr4Lc5kbPX6ztLaeqigkxh1Xqb898EyOx/4Iq40
 0iOdn5atVC30PVwU7VEYtl5ElkjtMQhUjdJWoE/tJUC7U7DemsiDcJqbmcosd7L2nu
 5VgutFNraOMQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YvBKpNIY
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.3.23
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

On 03/07/2025 23:00, Bernd Kuhls wrote:
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> 
> Fixes CVE-2025-1735, CVE-2025-6491 & CVE-2025-1220:
> https://news-web.php.net/php.announce/465
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
