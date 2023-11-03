Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF8EC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3053402DC;
	Fri,  3 Nov 2023 19:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3053402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltCH_1hpPWr0; Fri,  3 Nov 2023 19:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C85234038D;
	Fri,  3 Nov 2023 19:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C85234038D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967411BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59BFF41B8B
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BFF41B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja6VDlyRqBIx for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:28:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 161FB41B77
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 161FB41B77
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2B7B60003;
 Fri,  3 Nov 2023 19:28:46 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:28:45 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103202845.1e53c488@windsurf>
In-Reply-To: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699039727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXK520/5LkTCKqanx/ZjrQkeviOyASq0pP8c4FZQTBQ=;
 b=LtNewtl585XtpEGCXEt3tTYxEuoP7N50dojRlw+KxffwuEMa2l0tHyUQYLiUKybWk9GyQ8
 uKi/w7e6NFn1J+ndV8ds7rBgO+xCZeWbolT9tIJEwqiq3n5yvvUATgC3Cga44JU4fTrNKA
 lvBg56C9LznYNe4N2J2SqFgejsSnYRvY/JW6PVVbxEL9BmSdrLGO0+eWYZiTbmSuc4fzs/
 EhwlJT0Fg+GLE6xPwAXLdvgAcapSgcaCojUJrABYSLA+ym7eDbFeozgVzqTpo7vonpBJYZ
 4iMiwCGBm4/aE0ONOV2lPbfjpbz+goXCWES+mtmsyccVF03tDuRbwh6eF4Io6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LtNewtl5
Subject: Re: [Buildroot] [PATCH 1/5] package/flutter-sdk-bin: bump version
 to 3.13.9
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

On Thu,  2 Nov 2023 12:54:07 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
>  package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
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
