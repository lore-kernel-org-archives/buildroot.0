Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55674C0015E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC9F40A0E;
	Fri, 14 Jul 2023 21:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC9F40A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-B5Sy6q7Mbg; Fri, 14 Jul 2023 21:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F8F40A92;
	Fri, 14 Jul 2023 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F8F40A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B85501BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F73840327
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F73840327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjSZ3ZLCZHGt for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65D66405B0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65D66405B0
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50C561C0002;
 Fri, 14 Jul 2023 21:26:31 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:26:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714232630.54df1bdf@windsurf>
In-Reply-To: <20230714182400.3801854-1-bernd@kuhls.net>
References: <20230714182400.3801854-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ya2jAitGUyqMqTj5Tse6CpPOeTM4WIRFQfVqPXXv7hk=;
 b=oEpOH5A0hXasIUC9qLqB4fi4rJVWaJn9taqiHtsCic+QwihFvXAMjnEsSr2pewMV55AniP
 HiSi7lf+u0y1+MnK+zyq23SIQz2UkbhxF/V+j+qITWkY/eKU2QnoAChaPj2mOr9Xb/itI2
 BF7FW8fp+gQzAfKu/yzW/7Xb8et2rrJxLlmFAwYwRtH+dSKBpvbHR9XO+5wGjTHGfaXxr4
 KiHmLE3cr8MJT8XGry5aeXaNnOhRGqPM+mf9PFVDuwy3BiDy1UUIBX0UGSgue6ChlokAP1
 nRtWZdgaUs0ubGpHsI5umGRnoyXnwKvRB/0tJGBFEt5J17nl1Il4fgk8V1i+Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oEpOH5A0
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: increase default
 target ubifs image size
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

On Fri, 14 Jul 2023 20:24:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The new value is calculated based on:
> ROOTFS_SIZE = 5G (see commit 3c98eb26db6501a373cc405c80505ba72fde9e96)
> BR2_TARGET_ROOTFS_UBIFS_LEBSIZE = 0x1f800
> 
> 5G / 0x1f800 = 41610
> 
> Fixes:
> http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Suggested by Thomas:
> https://lists.buildroot.org/pipermail/buildroot/2023-July/670125.html

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
