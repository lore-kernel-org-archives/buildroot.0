Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D257C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E2940339;
	Fri,  3 Nov 2023 19:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E2940339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4SLcsED4PSn; Fri,  3 Nov 2023 19:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7C7940347;
	Fri,  3 Nov 2023 19:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C7940347
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35BBA1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001F940347
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 001F940347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJANsdTQsa7O for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:30:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A29402DC
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A29402DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80F8AC0007;
 Fri,  3 Nov 2023 19:30:02 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:30:01 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103203001.6360f22b@windsurf>
In-Reply-To: <20231102185411.51382-4-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
 <20231102185411.51382-4-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699039802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agC6y7aa8Xr3GsjfR2IUz9XVaClItsb0Rfq3KkAUoMM=;
 b=fgY+wbY3255a9+rjHlpbbhG5Filose1TytnCcszUtBKNxeWm/MSfK4DOiVOWGjpfG1QK4Q
 ElHgH5Bz1uttiGSIU2Fs3PmXvybpmqV7uNsocMg6Pe8K9iSY9ZhmjCtAK0rlq5ON5W/yIi
 MRQl8udnyGMRauN11UwkzKnB+zG4fLEuMhS0m43T9lJ6mfSMbJcDOHirrZmevKYLB1wrG0
 puGyY5qay5FGg2xb6tFX9yCwS8c2Z/pEQj4baJTPh/YQkraK7qtEG4nLocm8Eqj+omcngo
 ayu0eM5QlEJqwux32t7QYK4lDtkxbGYOraDMRV+e3Z2vk38uKoBapizmg0l8eQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fgY+wbY3
Subject: Re: [Buildroot] [PATCH 4/5] package/flutter-pi: bump version to
 8f4e9726a18b32822b6e7faf19c044f88bded570
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

On Thu,  2 Nov 2023 12:54:10 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

>  - Drop upstream 0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch
>  - Disable new charset converter plugin.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  ...er_surface-properly-fallback-to-surf.patch | 59 -------------------
>  package/flutter-pi/flutter-pi.hash            |  2 +-
>  package/flutter-pi/flutter-pi.mk              |  3 +-
>  3 files changed, 3 insertions(+), 61 deletions(-)
>  delete mode 100644 package/flutter-pi/0001-src-egl_gbm_render_surface-properly-fallback-to-surf.patch

I don't get the same hash:

ERROR: expected: ecb1557020afc22b30a4361230a4ed09be2493d420fed5e89cd93698a008a2fd
ERROR: got     : e76b06bb5e93546b16c85f1f9e01c71a550cb05909e16b67eb0b03690ea38e6f

Could you double check?

I marked this patch and PATCH 5/5 as Changes Requested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
