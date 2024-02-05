Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6FC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BA840C02;
	Mon,  5 Feb 2024 21:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BA840C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhTglJdq7BfE; Mon,  5 Feb 2024 21:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F25140BFB;
	Mon,  5 Feb 2024 21:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F25140BFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31B5E1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F219681E13
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F219681E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiiGAL8wiOMf for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:29:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 880BC81E10
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880BC81E10
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0C0220002;
 Mon,  5 Feb 2024 21:29:50 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:29:49 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>, Paul Cercueil
 <paul@crapouillou.net>
Message-ID: <20240205222949.2805f50f@windsurf>
In-Reply-To: <20240121204252.152952-2-adam.duskett@amarulasolutions.com>
References: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
 <20240121204252.152952-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjzH2zcyRiRTpIEqepTkvnRjc0X78RL9YQMWEWnYB+U=;
 b=H/WhvjZHalw5CmVy0STFTPmBncukv3YYaZ1u1SC0aDYOkk+FqYuIsgacVVNiXLXJ7GUKS1
 fUt4DD8xNpdlq24/Ya6+XWru9aRlWwYR+N/3TSN/N8e0luLMa4rngPdQMDQENo4AO5Z08N
 fMnguSpRmcoKKHWCvFoHX3TthV+NwZeUpuURBYu8sy7bdVcVbpPbRgQEec7SkPDOwr6DMf
 AAaECbcjdHk6hYEVxfLbRsTWoOOIonbpaOJXVir9WbJ4CrqP9ZGBnvo9A17oFx5i0djymH
 pES1PpVzO50YZTwb8Rm9veGa/Qe0oUQzAp9/YDoWx+2pjuJ6jziphry9/Ik3bA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H/WhvjZH
Subject: Re: [Buildroot] [PATCH 2/2] package/wlroots: Update patch with
 upstream status
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

+Paul Cercueil in Cc, see below.

On Sun, 21 Jan 2024 13:42:52 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> package/wlroots/0001-Add-feature-macros-to-more-C-files-.patch has been
> rejected upstream, and the initial pull request was moved to the
> freedesktop gitlab. Update the patch to reflect these changes.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks, applied!

Paul: could you follow-up with upstream (either wlroots, or uclibc, or
both) to try to find an acceptable solution so that some day we can
drop this patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
