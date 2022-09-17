Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B36ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48643842DE;
	Sat, 17 Sep 2022 08:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48643842DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dygpTfAFhaCp; Sat, 17 Sep 2022 08:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6092842D7;
	Sat, 17 Sep 2022 08:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6092842D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1CA1BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56A3560D4E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56A3560D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fktKkA_kmzgU for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:27:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1839A60BE4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1839A60BE4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:27:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F087620002;
 Sat, 17 Sep 2022 08:27:41 +0000 (UTC)
Date: Sat, 17 Sep 2022 10:27:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220917102740.14e8736c@windsurf>
In-Reply-To: <20220913205905.185292-1-giulio.benetti@benettiengineering.com>
References: <20220913205905.185292-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663403262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuN43DQfxUXeGVeLoPMJ3mE7QAuNJ9I0V93TX6Vpk7k=;
 b=K+kQKr7+axQDjqbsVk4QgCy/wbM6vtet3dkNgh8eny1xhLI7TJlpJgO9CReNYf/ZTSx4WD
 oGXvwp45L34QA7Z5cNnbFxdYP2vsQbc9lrCR7i+98wcFp/zHyQcpDmahobPnPigjVm1AsS
 8xaKn82rRneRF7imqDYSBPQ8YHsRpiLWD7BEQuFiYwtIGTrGIJT2g3jh7Th92cEaG+WQEe
 Q3p3CZsvwBy/eBDSjtXYF1k6uw85eRPM1JCwy/shyZ9890HW4VMTrJh3izJIUOQbkqVurG
 QRqdxgBQdI7X8W038VkkRFF0uW5cJ+8QVxnHiH4nJYwSKu1LzP8QEaYVSJI8yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+kQKr7+
Subject: Re: [Buildroot] [PATCH] package/libnspr: bump to version 4.35
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Sep 2022 22:59:05 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's drop local patch that has been upstreamed.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...-1765100-fix-build-on-mips-musl-libc.patch | 33 -------------------
>  package/libnspr/libnspr.hash                  |  4 +--
>  package/libnspr/libnspr.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 36 deletions(-)
>  delete mode 100644 package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
