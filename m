Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4447BEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F11504186F;
	Fri, 21 Jul 2023 21:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11504186F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOwdNnE9jD7v; Fri, 21 Jul 2023 21:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F905418A0;
	Fri, 21 Jul 2023 21:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F905418A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 050551BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D325F80C2F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D325F80C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWB_-eR3aRRF for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5FA680B44
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5FA680B44
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4FFAECDE1D
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:19:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F4DB240003;
 Fri, 21 Jul 2023 21:19:28 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:19:27 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230721231927.60c53cb7@windsurf>
In-Reply-To: <20230721184804.819073-1-francois.perrad@gadz.org>
References: <20230721184804.819073-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689974369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7YRd20rK8Eyl1/wRkqBARKukrE+2bAhPM7bxN4yRKw=;
 b=SIORFbIhCPknVmoA9iwaWO93TWD2gKw4RAZdeO5vwdszidinTmVfecb9JjD+rtHHkx3zU9
 aGAlBPQUHtCR6EfwcS+I6WYtr2+FrX0QAwNw/i22J9Av9JpOGPlzpNoJef7P3NhKRo+I0V
 bCsR5EAd5UT6KOKH0Jh/NMLf/iBgX4zqywu4A/dRl02bmwxd8QLN5Iw5jjhgTl4bg1IN6B
 5iFGV3+h9afWEBl3hFpkt1ST4MaF51dMLwssULx1e1fFYCQmJ+IqvBeWY8jnwndf2s6Qb7
 HqZKCaTqTt7CqNOW/H9ckR2gtVHkGT1IYQX98tZ34nwY5AzkhhdG8BI9hoQ1Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SIORFbIh
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2023.06
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 20:48:04 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/moarvm/moarvm.hash | 2 +-
>  package/moarvm/moarvm.mk   | 2 +-
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
