Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB3BCFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1E74083E;
	Sun, 30 Nov 2025 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1nV2m0dPKFr; Sun, 30 Nov 2025 16:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8113C4084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8113C4084B;
	Sun, 30 Nov 2025 16:27:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C636219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE97B60648
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNcSP2_vR3ZX for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 16:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB12D606AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB12D606AF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB12D606AF
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 16:27:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 448170921; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 16:27:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPkGV-0000000EFPY-0m33;
 Sun, 30 Nov 2025 17:27:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <20251130081822.578947-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 30 Nov 2025 09:18:22 +0100")
References: <20251130081822.578947-1-bernd@kuhls.net>
Date: Sun, 30 Nov 2025 17:27:11 +0100
Message-ID: <87h5ubiizk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=d5nLP24/31DK7B+stuDmIMXC8sggdocyBS6M9mjercaC5d+odXFNZ1qi4H6CuQfv9qcSyktXdcQOrEFfnuJvi6VtY2soXyF78qhce02XT3wb9gqIB7DZmBsdXQDHRSO5yZQbRVGg8Lx1bhq0P/BidBQNpw1ggWsNtu4KGaE8r/6azq8IRFU59rTXzhbiYQ0nyg7tE5qSMFQjAioGylbPrsTT0rj3znX6dGUvTFG/AE6i8szLcMKB6reiuaDch6nOD3X8O5u+27MUDSZDQsSH5tr9c+QkkcamTlVrv2CJXwUx/hj78nryo3NEOI9SfWZCuj6eNnB8GyZSvxoYWpv2mA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=CiGV/gdHKlpjxsgBKxGEZU+UAcd5RDYEWz+6/XJy9p4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=d5nLP24/
Subject: Re: [Buildroot] [PATCH 1/1] package/libteam: add upstream patch to
 fix build with newer gcc
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

 > Fixes:
 > https://autobuild.buildroot.net/results/a4c/a4c4c4135cffe607269cc0fdb36e4b2c86e7fe33/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
