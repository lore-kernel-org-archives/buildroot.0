Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C55EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CE481F13;
	Mon, 11 Sep 2023 19:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CE481F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GuD58-_Zbf9o; Mon, 11 Sep 2023 19:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A13BC81EF1;
	Mon, 11 Sep 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A13BC81EF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 386EA1BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947F060FF3
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 947F060FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9u9QOeyQEQQT for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:53:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7928160672
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7928160672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B5D21C0007;
 Mon, 11 Sep 2023 19:53:01 +0000 (UTC)
Date: Mon, 11 Sep 2023 21:53:01 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230911215301.1b9d2576@windsurf>
In-Reply-To: <20230911192701.1423805-1-giulio.benetti@benettiengineering.com>
References: <20230911192701.1423805-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694462000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2RzWa/oxsVGMP5mymNWILKov8TX2CXM8VrjydC7xlg=;
 b=YLc71ihYFiPoVZ4DWTH8X6b2VlyLzRL1YMJZl89avzijY8luo3/ys7fZ8DfRFl3pn9vJ0v
 PdfQ4UTiJ+sWN/0obJpfWFhBWDwDjQti0nCMUtJhrfZ3suxHRzT+UI4b9bKow/6HQhh6SF
 1IxnM2f0Z+3JKrnHHkb8K8BrCI41bKjeXSPPjV+BAvIkXnvRU2T/NFKmxj4z28+wBdgLqM
 LIkf+K9UHr0zn4nw40jLNMA2djRndiZhZx1eItO/r9fK8FXgwuRIFUtc4IH1b0pWtp5jnR
 PmmuWZVcNJoUx3BJ//Co2k9tA4wgyDTAoBcBugIuB8ED8NyznWvKUFGg075MhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YLc71ihY
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.2.0
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

On Mon, 11 Sep 2023 21:27:01 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
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
