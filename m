Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2737C67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FFAC8135F;
	Thu, 27 Oct 2022 06:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFAC8135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n473TIMEPvt; Thu, 27 Oct 2022 06:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0915B81348;
	Thu, 27 Oct 2022 06:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0915B81348
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6A01BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B9F81289
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B9F81289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ti35MfmFMH9 for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:54:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE7758135C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE7758135C
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:54:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8907F4000B;
 Thu, 27 Oct 2022 06:54:03 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:54:02 +0200
To: Danilo <mail@dbrgn.ch>
Message-ID: <20221027085402.4a8142b0@windsurf>
In-Reply-To: <20221026230917.5092886c@c3po>
References: <20221026230917.5092886c@c3po>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0evP2kJiSiR0pW7wsKvk4tCVLyMCdmN0N4+4Rmjgyo=;
 b=X7MQQHVrWHo3MY2TXaPJE+OTmBJDvh1wJEJMco2Ob6c7ZJCgdN/GwaovFioxVV5nOOBUQR
 33Kr+L8NkCOcwa7ZDyskOpUE+9iy0Mckq2eSSe61tHby2YPpJFRAcIVggqyBBl9yWAXfwY
 JZGL7ggXWhFFm3lms1r29yCkO++yQeGDDtJ3/htCr+jYXpAu8+P4po2OhEJf5Ya1sqlJ5x
 JjrRnhIa5luytvtd8fy0xSUqwHjUoqCtrV/dM0hIxP9LFNHokrF+5xpKYc0bXEZA6SED1B
 rSO4bKbZVJdHZ5AELBvC6sZaLirxb+uV2cad+EoSxdyimgtOssUtW+Wbr9IM2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X7MQQHVr
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: bump version to 1.6.1
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

On Wed, 26 Oct 2022 23:09:17 +0200
Danilo <mail@dbrgn.ch> wrote:

> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>  package/tealdeer/tealdeer.hash | 2 +-
>  package/tealdeer/tealdeer.mk   | 2 +-
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
