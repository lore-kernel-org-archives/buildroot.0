Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6432C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55BD5830D7;
	Wed, 28 Sep 2022 21:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55BD5830D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w374qKV20g7n; Wed, 28 Sep 2022 21:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B7982718;
	Wed, 28 Sep 2022 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B7982718
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17B6A1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72E560E2E
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72E560E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7A6LuOso_cLE for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:40:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E6860E50
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8E6860E50
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:40:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B48A1C0005;
 Wed, 28 Sep 2022 21:40:29 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:40:28 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220928234028.3db02ddf@windsurf>
In-Reply-To: <20220928063904.458429-1-buildroot@heine.tech>
References: <20220928063904.458429-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664401229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nP0j4ZQTfJwuKKm1oKWfOCCTA4W+2HxH8fcpqaxNZw=;
 b=RUyru3BLrGkr8Qr3JPqqgDCY09OYVp3a7l3lgHLkGKiTHPQpjkpJVDs9ddXcyfsHmQhHkD
 g56VfMEaMDDYsmq08ZaJZfFZxLsqQ6yn9Iu1RCVk0bzJjVuYXxWmGxflhEsUno0aRx2+YA
 XwFtAYNVS+ZnslSPJnyN3tP2I2wyjHMXsLYxLb9ux5esXRMJLAwS/ViCNbC74kZuTgbf/I
 s4eJ6MSLpQbFPxn5/DfsH9c5PTgg7Hd2BUOUWZsY5HGYiGpR1gOOCFAUHyUCV/9k2+b0nZ
 7NrMUW0yVhkizMxklEzP2JiswObgcItew8K1IcgtUhTHqNPFE617FAbmSnnJjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RUyru3BL
Subject: Re: [Buildroot] [PATCH] package/libabseil-cpp: bump version to
 20220623.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Sep 2022 08:39:01 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>  package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
