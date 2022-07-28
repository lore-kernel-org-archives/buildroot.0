Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E11FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55E6832FF;
	Thu, 28 Jul 2022 07:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55E6832FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6rstiaIjwie; Thu, 28 Jul 2022 07:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE91D832D9;
	Thu, 28 Jul 2022 07:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE91D832D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 075FC1BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A068E832D9
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A068E832D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qm58uzmmFzCq for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:31:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4DF832D1
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B4DF832D1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:31:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA6A5240007;
 Thu, 28 Jul 2022 07:30:58 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:30:57 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220728093057.070f5acc@windsurf>
In-Reply-To: <20220728021444.135820-1-sen@phobosdpl.com>
References: <20220728021444.135820-1-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658993459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wt2623NmH1fpk8vxuvWUQsNvo5FXxj1S8Qz4JBI2cZM=;
 b=NuA0Te/Ly62h71eoPo7Sot13cx9Xd2ej/ZBD7qSg2itBWyjWAbt1fHJ/HmPF/mABHNkRWG
 zEkW459CVNhPdPj+9vRK6bErHOGTpHQ+j7S1OK2+PERsq+bucT90/bhKEWcWh5Ajyfgut5
 mGGmIyUJ6MTXhuQf0q9e+7+mFgFVRnrN4hkEkENH4McgpzhrJLZmu1Yp4b/aSu0PNg/dDa
 XiCjdOaemJHXaqepD6qq1dxAGqwwDEuIcW+/7D5qEGziJvS5MTCpx3GbJvtqI/zHHdstTI
 si7Hybx88yE76mb4h0IQzicDl63gEdHwD1qGVlRQ43rVqpVulrUpeGMudz1P2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NuA0Te/L
Subject: Re: [Buildroot] [PATCH 0/2] support/scripts/pkg-stats: fix
 row/column ordering issues
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

Hello Sen,

On Wed, 27 Jul 2022 21:14:42 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> This is because I'm not sure whether you are supposed to rev patches that
> have already been committed.

Nope, you are expected to do exactly what you did: rebase your
remaining contributions on the latest master, so that you resend only
the remaining of the work that has not been merged so far.

> Sen Hastings (2):
>   support/scripts/pkg-stats: fix rows with duplicate package class names
>   support/scripts/pkg-stats: fixed sortGrid() performance

Both applied, thanks a lot for the quick turnaround!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
