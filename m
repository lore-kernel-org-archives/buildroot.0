Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA22EEB56D
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879F74037A;
	Fri,  8 Sep 2023 20:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879F74037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcvslLYrmcIN; Fri,  8 Sep 2023 20:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F50403AC;
	Fri,  8 Sep 2023 20:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F50403AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 173171BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE71403AC
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFE71403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyJFdKLGLJb8 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:19:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 348E04037A
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 348E04037A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0039840007;
 Fri,  8 Sep 2023 20:19:42 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:19:42 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230908221942.20e46576@windsurf>
In-Reply-To: <20230907104545.1385064-1-christian@aperture.us>
References: <20230907104545.1385064-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694204383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcPXrEGyagNnv14EJdus/B7cLa2e2A2O5HEcck6198k=;
 b=iheu5VP2TDMnqYiLikx1zGMrj24sNrsfX5iXuBZXLPwwHaYsXNZwc5ByswKUSlm9hgztG/
 ktL4lySgm8vYOl7rLVS6GTdK2FzvuKfhWYkLksdO/XTzIN77d4TBDVB6e0vz+oKso3WZeN
 3jQrorxFmcX3n0wHlEGxdAqiXDOUP/lVeVsYv/Ui5jeT31ceJD1EB7WYOdItsHzjoeI+I1
 4shGb8/UKgdz38A6CTbsvqF18Y/cP08OInnodtXg0JafB4z/97zOKNf6ctpbGmA9en9u3F
 5bKg1MHS0SjkkCqfiINwiCkCWum6x4B7z5ttX+abOEfY8BLKBFMrVvmzUSvlzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iheu5VP2
Subject: Re: [Buildroot] [PATCH v1 1/1] package/conmon: bump version to 2.1.8
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Sep 2023 03:45:45 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Bug fixes.
> 
> https://github.com/containers/conmon/releases/tag/v2.1.8
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/conmon/conmon.hash | 2 +-
>  package/conmon/conmon.mk   | 2 +-
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
