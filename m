Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A365BC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520EF403A2;
	Mon,  5 Feb 2024 21:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520EF403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfJwPzF7eEj4; Mon,  5 Feb 2024 21:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 362E840B7C;
	Mon,  5 Feb 2024 21:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 362E840B7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8172D1BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C64F40B5B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C64F40B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaHbBYWB-iOF for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:28:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4DC740B6E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4DC740B6E
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFD4BE0003;
 Mon,  5 Feb 2024 21:28:36 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:28:36 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240205222836.3b363b8c@windsurf>
In-Reply-To: <20240121205718.155549-1-adam.duskett@amarulasolutions.com>
References: <20240121205718.155549-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqFBiJbLu8mCV25327iJSlGPZq2VXRYvc1zytdNT3M8=;
 b=mmj0pjhbYOaN2eYIDIxpr3ITFTcHP2jvZhO7RFDeBsmDMMufgNSbK7ZOsfy8DfXMpLrALS
 VEnsZgDU76DJwPz/x6bLyRa2maKYgVWVJaDBMNapOnPyDuFB042ZVtl8csWR8o3G0fhDFc
 i3MF+4ia9eMXvTUo3yMrAh9mTAwpxySvqZNS6SACyBSaelOPkdO856NvZbMEJJnfzFg2LS
 Qcn/fgwPShFXmgkRmsZvb7JOvWfSbsoh9ttqzF0Hy6PMYf9ZMkXCKvfiqMRq5KvdHSeL2s
 dOFzXhHdiNcxWZiPaf6GE8xyNWOZ7J3U5uknoLkM0MqNUoXS3CA/XSs38KDMsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmj0pjhb
Subject: Re: [Buildroot] [PATCH 1/1] package/flutter-pi: enable vulkan if
 possible
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

Hello Adam,

On Sun, 21 Jan 2024 13:57:18 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Enable the flutter-pi vulkan option if a suitable driver is enabled.
> Currently, only Mesa provides Vulkan drivers. As such, gating the feature
> behind the BR2_PACKAGE_MESA3D_VULKAN_DRIVER option is reasonable at the moment
> and is done by three other packages already:
> flutter-engine, ivi-home screen, and wlroots.
> 
> Furthermore, a dependency on BR2_PACKAGE_VULKAN_LOADER is needed as the
> vulkan-loader package provides the vulkan.pc file, which the configure step
> relies upon.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-pi/flutter-pi.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks. Of course, at some point it would be nice to
a vulkan virtual package, but let's do that when we have two supported
Vulkan implementations.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
