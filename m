Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA1EE20B9
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55AFB41AA8;
	Fri,  6 Feb 2026 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82BOgwYW_G-m; Fri,  6 Feb 2026 17:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B6641A6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770398419;
	bh=jW4FJnbnDhi3fMy3u5n4D4ISTDgV60NorRzfUpCqQM0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0u1l0CLPYXHJ2S9xd4fSN6JZ02xn87X5B5OnW9CIxU1FFT5bWA7RHCMqUnl5byvy
	 eCJ15hoyfL0xAsX2BaRrEeUT2f+oAh0yGkhx1TbENux1WzYuKUYflbFa1A4Nk3urbU
	 qD7ITeCt2Pqdmw/Qgzf8wtKjqDz9BZkzCDtgkPNbnucXn5Y3H048+MJ7wgVqTo2f2q
	 5z1VLmONgWfILlUOkZ+62AYDDNuhf16UefNWaQ2PEQ1QFecEvepYi5V1hxT29H51T7
	 uqMvYn81izrdopC+rrbQkAJwDA5BRhsPZm+iblD8pU6ewRJb0kl+hy+xZFc7ZhyKGk
	 c6lsrY//AOPrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B6641A6E;
	Fri,  6 Feb 2026 17:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC54D2EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9ECF61116
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZitWV5cmVhy for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B97E76110F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97E76110F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B97E76110F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:20:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -838779320; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Feb 2026 17:20:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1voPUw-0000000FLyd-2vp4;
 Fri, 06 Feb 2026 18:20:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260205192304.1728256-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 5 Feb 2026 20:23:04 +0100")
References: <20260205192304.1728256-1-bernd@kuhls.net>
Date: Fri, 06 Feb 2026 18:20:02 +0100
Message-ID: <87pl6hokl9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TZ3Uf8SDgqCNXLjaqEclbcfb8s2RJ2A4hYcz8PDb7kdsgFgYfCV2iT0W/lP4uyCjbQjBu29Ap4g6G3SurSIYFJ37ey6kU/K8EX5s65nJwZAqo72eHz2PnCcj7fV5nmotm7ZBRzIgw0qwyjk5zH3VRRiYWpp/PXZc265vs54PKNv2BHwAHKhbMTV0J3g8w14VNSoqPXGveJEh0VTfgrN6FkZpY0FD5VhQcgiZi4E8Qr6Kby/0KrgS37l+6wK42mXOxo7sLULAsu+/DMPMikavepRsSj8ADIEtxZilI90ZKm4u5NECaysKIgGziWuQir8D7dVp4FL8Cxy0HdCVQAE4AQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=9gZUg0JKpi/KseD3REMyxy4WLu6YjYSrBAAx/WBrpps=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=TZ3Uf8SD
Subject: Re: [Buildroot] [PATCH 1/1] package/libzip: bump version to 1.11.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://libzip.org/news/
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
