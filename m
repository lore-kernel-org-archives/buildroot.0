Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176FFEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E4261458;
	Fri, 14 Jul 2023 10:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E4261458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwj-z8Dj9-5i; Fri, 14 Jul 2023 10:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF9661462;
	Fri, 14 Jul 2023 10:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF9661462
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB3481BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C327A421B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C327A421B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTr2Onm9-ovr for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3907421A2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3907421A2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01E2A240004;
 Fri, 14 Jul 2023 10:21:56 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:56 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230714122156.4bcda0d3@windsurf>
In-Reply-To: <20230713213313.105116-1-ju.o@free.fr>
References: <20230713213313.105116-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2l0BDkUjFMENTZd3hLcWzaYRYSlnHG/8NwrYy3iG5k8=;
 b=EXgAwjNdoeWqyYcCy44SJOn3ZIU79goehsXF3wHMk88KyP0c9hmbwfuFUbqUZGYhOXxCNc
 JGdCO7fQNiKydPbJ6sv7zMzCAsUMF1iZ4U2mljv6eORUmz76VjKM2fcKEuXcU+S6FxW1FJ
 U97fiZne+JHsxh7FKBpB/aaOXB8Tm4MBSdXVmiu4QMBrD2O8eMqnrOKMqKr2+HfOS9TntM
 BNXC/8GP3iHALZv46Mu08muXoYQ7RYezD2mCEeakQAa5INbLjchPXEwIAdbLLvVyjJL7H4
 Bj/fEt4Jm+DKGfasKI14MfsBVEKNL5nac/Y6DONoA6rqM76HnbjLDps6EmDN8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EXgAwjNd
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_lz4.py: new runtime test
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

On Thu, 13 Jul 2023 23:33:13 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                |  1 +
>  support/testing/tests/package/test_lz4.py | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>  create mode 100644 support/testing/tests/package/test_lz4.py

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
