Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A305FC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36BC541403;
	Sat, 29 Jul 2023 20:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BC541403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAcewPgg-aRl; Sat, 29 Jul 2023 20:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1922941365;
	Sat, 29 Jul 2023 20:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1922941365
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6055A1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4684B60F49
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4684B60F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkJ3zkCYN-PH for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:59:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11C5E60F18
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C5E60F18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A9FC20002;
 Sat, 29 Jul 2023 20:59:39 +0000 (UTC)
Date: Sat, 29 Jul 2023 22:59:38 +0200
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20230729225938.69d399eb@windsurf>
In-Reply-To: <ZMV56j37ps7vOaLB@euler>
References: <20230728231839.4193379-1-colin.foster@in-advantage.com>
 <20230729094952.11722d87@windsurf> <ZMV56j37ps7vOaLB@euler>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690664380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtFmUtCv+o2/eHRhp7GgWDC+l3mQLfZ/5uAR8CiNKIU=;
 b=UJNQD9GSvAIX7M/8Es6tCclLsJkeIthLMq9dLwsfW6O08cgkJ/tL75sUrwe79vN4cK6dOv
 VHg/nuybqlqYPPWBYqo3WHzJMRuSttxEAWJ/FdAIkUtD48r16FAuOCFpLCamK83ddDtl+8
 rBqRBOKWkBAiFzbvJpxlRwNRUbYHvTx+B+SSqGd5Tll+j0sGtL19qNQFx8J+2Euynav++W
 iVaysk8fgfRYdrE6uCLc5YbElvEErcTZfW7lU62BPAp4tMTKGi1JOQbx0Kubb4JyOBvgyE
 caNwPHb4LE86rb+NITDbjrYCvWCuC8jUZg4nkPK0M9kB+Uynnanf2/WkhNa60g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UJNQD9GS
Subject: Re: [Buildroot] [PATCH V1] core: add kconfig option to archive an
 un-stripped filesystem
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

On Sat, 29 Jul 2023 13:43:22 -0700
Colin Foster <colin.foster@in-advantage.com> wrote:

> Something to consider is the file / directory sizes. From a quick
> Beaglebone build, the output/build directory is 9GB, while the
> rootfs_syms.tgz is 33MB (and it is 90MB uncompressed). I suppose I could
> compress and drag around the build directory (which compressed down to
> ~2GB) for completeness. But realistically there's a lot of baggage there
> that won't be needed.

Agreed, and that's why installing everything to staging is most likely
the way to go (staging is much smaller than output/build, and the
contents of staging are distributed within the SDK, which makes sense
for debugging purposes).

The thing is that installing everything in staging is a major change in
Buildroot... At the very least all generic-package packages need to be
modified.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
