Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9E5C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 10:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE546416D0;
	Sun, 24 Dec 2023 10:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE546416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3PpZRoUokMU; Sun, 24 Dec 2023 10:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29920416D2;
	Sun, 24 Dec 2023 10:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29920416D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 721FB1BF228
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51CD940137
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CD940137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llfF_PLX6oS2 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 10:59:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4A9B400C4
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A9B400C4
Received: by mail.gandi.net (Postfix) with ESMTPSA id C606520003;
 Sun, 24 Dec 2023 10:59:11 +0000 (UTC)
Date: Sun, 24 Dec 2023 11:59:11 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231224115911.0f3f687b@windsurf>
In-Reply-To: <20231203041841.492885-5-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-5-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703415552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHe93YHs60q//8/GVgQSTD0nFrUreZuQ5kIFbI5SjA8=;
 b=Kggh1KOIVFwUYAUGZwnfHggZjkxWY+g48xxTglh1aVOChMw37ePF1Z53/vNZinWR843uiJ
 vMfDtg3rm4SsEubhqEE5ZUexQcIE+spoClJTUxHm00vRZl17mgd0Jrm8iYWAunsEU2t5em
 MUePSwEfn3gVFElg4KYGb+oDSswqdGeRaeYqxYddcLtFdvfVE+mFFcEdW1ErNcFynev6eV
 j8/S1kvxx2I4rZLrj6lJazsXh/jwdMURJ1PhbRYjteIPpjQTjwH2E+AUt5NW7qXbcVeIem
 dkOTT/Q7LUi/X1TgPAfUaVsG4ki8MX/AQQq86HsNrFmfWpUfCwvFao7eHJVAGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kggh1KOI
Subject: Re: [Buildroot] [PATCH 5/6] package/google-breakpad: add
 0002-dont-include-stab.h.patch
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Sat,  2 Dec 2023 21:18:38 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> diff --git a/package/google-breakpad/0002-dont-include-stab.h.patch b/package/google-breakpad/0002-dont-include-stab.h.patch
> new file mode 100644
> index 0000000000..0817f1928f
> --- /dev/null
> +++ b/package/google-breakpad/0002-dont-include-stab.h.patch
> @@ -0,0 +1,103 @@
> +From 569af712da94637091080943f6a0d69ccb35864e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 14 Sep 2017 23:24:08 -0700
> +Subject: [PATCH] don't include stab.h
> +
> +From openembeddeds patch found at the following path:
> +meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
> +
> +  - Backported to c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
> +  - Added || defined(__UCLIBC__) in stabs_reader.h, as uClibc provides the
> +    a.out.h file but does not include the N_* macros.
> +
> +Upstream: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +[Backported to c85eb4a59b618f3beaad5445ceb1f865ffa8efdf]
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

I am not too sure about wanting to include this patch. The patch has
been written in 2017 apparently, and it says "Upstream: Pending", but I
couldn't find it having been submitted anywhere. So it's really a patch
that apparently has never been submitted upstream, which we would carry
forever. So unless someone has a particular interested in getting
google-breakpad to work on uClibc systems, who would take care of
taking the time to upstream this change, I'd prefer to keep
google-breakpad available only for glibc configurations for now. If the
patch was being submitted upstream, I would be fully OK to include it
in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
