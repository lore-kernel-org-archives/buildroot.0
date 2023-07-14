Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C89EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A3B6141A;
	Fri, 14 Jul 2023 10:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A3B6141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNpT8zQpNBkc; Fri, 14 Jul 2023 10:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8628F61458;
	Fri, 14 Jul 2023 10:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8628F61458
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3C261BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA0D8841B0
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA0D8841B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqmmJEEz6XMm for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B72841AC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B72841AC
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EACB1240004;
 Fri, 14 Jul 2023 10:21:52 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:52 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714122152.4793da68@windsurf>
In-Reply-To: <20230713213325.105157-1-ju.o@free.fr>
References: <20230713213325.105157-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2KHS0lGAykm4ofXBVotNqh4RtRk5A1NxafQjKERCAI=;
 b=XsW42LWtvYR44tgs0A4ZhE2A2nkmRABpKTnRjAT6Ugbcg+0W0F0ZQHcHEDTAemWVGe7ym+
 kzVQUDY8dTbyna45vDDMZEIdubvjV80SL1/a6YDay6SuhY9mR5uWa1OQgp5kymsoTK9viD
 mEWZ+6HprUubUPa9xHRGuaGx9eBvVClfvph4uYNQy46jeOkOTddcAd0E0rh1C0VYgm5BwZ
 ndmRPzCPdLxsrnCk+71ODtxcWNoBw4YjXrctlyX3uu85UT0TW8ipN5PfUDvh8i0Sz8aRtJ
 p4xtt8UJ/lFZgrZHmghsLXDSlGENRMNL4vmwVP265Nmm7ccu8dk41QCG2/3xow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XsW42LWt
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_zstd.py: new runtime test
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

On Thu, 13 Jul 2023 23:33:25 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_zstd.py | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 support/testing/tests/package/test_zstd.py

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
