Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C29C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11EA740AEE;
	Mon,  5 Feb 2024 10:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11EA740AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xk3iI0KKfo2s; Mon,  5 Feb 2024 10:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D56640B12;
	Mon,  5 Feb 2024 10:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D56640B12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBFAA1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B49A360F7E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49A360F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c37ienh62QVV for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:57:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F11660F7B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F11660F7B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00C8140009;
 Mon,  5 Feb 2024 10:57:37 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:57:37 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240205115737.74590ae9@windsurf>
In-Reply-To: <20240130192932.888169-1-james.hilliard1@gmail.com>
References: <20240130192932.888169-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707130658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWgDP510frVwI4U/IVzgHkzQaHKXQ6CXfmabycXLwzY=;
 b=O2ymJznHVSmXxiaBKVV7eWJGAjs/v/WQSEPcCoLJ9ZbixtX8NWl6Y0S0y0o1ULB6jN0kc3
 hfLmhj30mon5LeoP9aZmI7rRSmDGC5Og59jDyHOvJkJ+cDVJd/KRdLHktQYjdRGA/8RzuV
 wzBcf9fst5bq9kEATp4nLy+UwWx3UvRwgoEtRTUULB2wuhFE+g1t1IcJrTdeiqzjjqwIYG
 eLyJ1ev65kGPzZ9KJtQAiEUMGLtDACvyM+lyZ8CIHN1T4zvTrIrUNH20LdZ/HczbgtYSlD
 zRlihP/2sP/Zj12NRsgH/4uxQzm0oqqfTmALtXZwdgP2UgNjkYuCPjWe3zLs7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O2ymJznH
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-bad: fix webrtcdsp
 plugin build
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

On Tue, 30 Jan 2024 12:29:32 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The webrtc-audio-processing package was bumped from version 0.3.1 to
> version 1.3 in commit ef0fa986eb7ff25c0a5db70ec0b62032e2d71538 which
> broke compatibility with the gst1-plugins-bad webrtcdsp plugin.
> 
> To fix this backport a commit from upstream adding support for
> webrtc-audio-processing version 1.3 to gst1-plugins-bad.
> 
> Fixes:
> output/build/gst1-plugins-bad-1.22.9/ext/webrtcdsp/meson.build:7:13: ERROR: Dependency "webrtc-audio-processing" not found, tried pkgconfig and cmake
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...e-code-for-webrtc-audio-processing-1.patch | 884 ++++++++++++++++++
>  1 file changed, 884 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-webrtcdsp-Update-code-for-webrtc-audio-processing-1.patch

Thanks for the investigation and fixing! The patch added was missing an
"Upstream:" tag, so I added that by slightly updating the reference to
the commit being backported. It's now applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
