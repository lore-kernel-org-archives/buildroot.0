Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CBCEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314A06141B;
	Fri, 14 Jul 2023 10:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314A06141B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rl-1jjHLEFNN; Fri, 14 Jul 2023 10:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62AAA61461;
	Fri, 14 Jul 2023 10:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62AAA61461
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0D071BF983
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EEE61438
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EEE61438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL0stFACCNJP for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:22:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11FE661411
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11FE661411
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:22:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51E9260004;
 Fri, 14 Jul 2023 10:22:01 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:22:00 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714122200.2436d6ea@windsurf>
In-Reply-To: <20230713213256.105060-1-ju.o@free.fr>
References: <20230713213256.105060-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVbszoRY/K9BQKvz/yt+aoB4h+eACidcgRWfAdB1WTw=;
 b=V1RDp6Ck1q3ZgeO06/5D0013gxUj6MOEP1qWkUkdlJkQLMvY1fFyDTLbPGcaBdCy8j4w6m
 6hhg1R7Em0+dM02qXpceZyKCHANckYlj0iFng/8WKIKiPQyw1F7igs8bMi6GnibRZk7G7K
 2w1wwFHkBQgNSfLkOLiiGdCOusDzssHPZz1s1VmYW2Bus/CQsG2VUJQPzAx/VjCuVgEU7Q
 BenIqz03VvaKkyfJ/SDR8RQHskTcpztokMa5rSOfxEahlbZfjl2M4get9NDN3N1Px9lB7Z
 IY8Jl/+iq4xWY5O3NSOh1RHbRCDhyYtGsCutjycyn8IrKfNprdF/yjdS12Z2RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V1RDp6Ck
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_brotli.py: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jul 2023 23:32:56 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_brotli.py | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 support/testing/tests/package/test_brotli.py

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
