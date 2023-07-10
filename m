Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA02EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DA0B417F6;
	Mon, 10 Jul 2023 18:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA0B417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfOjwaGH9Uds; Mon, 10 Jul 2023 18:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 023E0417EC;
	Mon, 10 Jul 2023 18:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 023E0417EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2C91BF3AE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A2581F7B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A2581F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_VMia7-8snu for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:25:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9E781F78
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9E781F78
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:25:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6E03C0004;
 Mon, 10 Jul 2023 18:25:33 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:25:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710202532.38f9c860@windsurf>
In-Reply-To: <20230625214919.588809-1-bernd@kuhls.net>
References: <20230625214919.588809-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689013534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sa5GfFuURac4dpB8ta+gEp8tHQ2FjsQt/Qlx9Cw1rpA=;
 b=CG/suJfbi3q95A7mL8g22alLc3oot8TH1Nc90Ms9bBQbzb38zOfiSfNVlEAHllF8LYbebh
 ozrR84oSTL3IHvIxV+k2V/YkZjV3wN6h/V5RHresBCrYOOdBCgkchDH52NcD8Au/KKKpVN
 /4fdpRPyfN1k42Qz+qRxwVAXtsIN8ITQfE0H+T43ZvTaiWQHJq5ApUwToRBtrIojCRv9nI
 zafkEPs0VftTG0SW4Y9RCeMWYI1zmPuHwRV5xZUAsKyW/LaM6haul8emeaYaOKkRWnxVV0
 Wfh+w1hbS1PyEuB3dfP0VrYRUynzxzSNp49a8jMy/YCNaefGCkp9fu7bwaPZIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CG/suJfb
Subject: Re: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-zattoo: bump
 version to 20.3.10-Nexus
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

On Sun, 25 Jun 2023 23:49:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: squashed with previous patch which was not yet applied (Arnout)

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
