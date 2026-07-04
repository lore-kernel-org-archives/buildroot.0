Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2489DC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31EF408B3;
	Sat,  4 Jul 2026 17:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmXpJu_w9C3Q; Sat,  4 Jul 2026 17:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EFB408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783185503;
	bh=ZdBoHWssoRRRUlOmyYC57+9AV+xkJ192R9vwL5VaumE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bIHi3TpZdGv+4GO93hoEfuwO5TC1yFbK5vefBQEKrLmAlRLUPHTm9CvtuTm7BP2q+
	 MCA2xonYc60fwMezfj6b8Q9N9QVygoqp9qsw2Ld7R1wiOxDjgY9RufepDhWvG27DSH
	 iOMjxsYbUWKSjB7Uy+zHfhCpe96OreykD6CPhOTUywUYIO7fhS/N21aio2c9aPFVhp
	 jefK6Zh7u5q7ynHexiPXXcsMsIeKHiX4IpoNqa6QLO0MPF/Xv0uM9H9cnVVYMcAr6Z
	 V8TT/SmYuiCr9OYLyt/To6P6tHeh8mcT33mKz5M0Odj1rxtBOPrdE+G+waJjFH1+mv
	 yY2hHHShWmd2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EFB408B2;
	Sat,  4 Jul 2026 17:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC328363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A240340128
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvQ5BqEC3ax3 for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD82B40125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD82B40125
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD82B40125
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:18:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CB156780372;
 Sat,  4 Jul 2026 19:18:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 19:18:14 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 19:18:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260703193308.3694911-1-bernd@kuhls.net>
References: <20260703193308.3694911-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <18ff87359680dd581addc2421c852e0b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783185498;
 bh=tiz7LCZ2RMW6ecuhrItkphO8vhalwpifH8TefzwvFqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hAMNyqcMi268mB8sCONmr0Eb+YEkEUxsfb6abBKyr4hu/JUj2k/Fa6oFpxSLIGGUf
 NOaEmAJ/GRnEwDBD2rDJv1f+YiGin+elWehHwClHbJ3D1vOcY29ceRGlmP9kejNo1w
 k03VC4yRuiKMKZBctcQOGg3gBphwVGP9A1za1sr03LsNlh0n4BfoJvgu7Zk4xJsZTN
 5+Mzx8ZXxCh1FAgHiAzxqlveN9sFdItbyCIvThr64x5syx7tSKKt0YI8+DZxsbYRlQ
 yA7mff5VH7fs3NjY4PXS8r5txyWMCodJLqlNjvdbc0NoY5kAko3PInIz9PCraIyUf0
 EmQJCOWrOB+Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hAMNyqcM
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.4
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

On 03/07/2026 21:33, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
