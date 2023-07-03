Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133CEC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B373560A9B;
	Mon,  3 Jul 2023 18:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B373560A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUhb_lamvy3r; Mon,  3 Jul 2023 18:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC57760AB9;
	Mon,  3 Jul 2023 18:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC57760AB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 737B71BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCC840914
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCC840914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hO7Gi5kqYoSb for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB5C40912
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB5C40912
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:46:33 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 338F460003;
 Mon,  3 Jul 2023 18:46:32 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:46:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703204628.499dccad@windsurf>
In-Reply-To: <20230703162121.43701-1-bernd@kuhls.net>
References: <20230703162121.43701-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688409992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ekpo2Im7AmVB3R7dkEL2qFE4v8HWEVNgsKve3DKnc5E=;
 b=T8sClI6CqkpiYN4ib4ggWniHNqtyrD6gLVPO7DQhvMYoM98WgsXbwB/0Fxu4xIsR4XSLOQ
 Rg2nkjjjxAolKAk3ngH3+dYqdxTXAFKHwFT4wWGdITSglkTOFSMpmjKRp/uB0aGASvrd8G
 0I0LqYwSr9hQBV/2bGzWh+L81Zf0VMbahNlyn7xxX8tKPrNULKAubiC4hyVvxPejZy5v6q
 SliG6v7FjS689Qqfv80k6OaqoA1p/gt6sv105jqnksZ1X6Co2iljp6zaUfVSqoVqwCRcKE
 crQhLe/P8SyZk3l/i8Q1drFocDWhu4VHrXYoA11qWwMDzsTLi7qfpSCXSTD7MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T8sClI6C
Subject: Re: [Buildroot] [PATCH 1/1] package/taglib: bump to version 1.13.1
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

On Mon,  3 Jul 2023 18:21:21 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://mail.kde.org/pipermail/taglib-devel/2023-July/003066.html
> 
> Changelog:
> https://taglib.org/#taglib-1131-release---jul-1-2023
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/taglib/taglib.hash | 2 +-
>  package/taglib/taglib.mk   | 2 +-
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
