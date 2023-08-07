Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD17C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0360409AA;
	Mon,  7 Aug 2023 21:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0360409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfdVYlYqYiCB; Mon,  7 Aug 2023 21:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89F5409A5;
	Mon,  7 Aug 2023 21:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89F5409A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A17281BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD0081E0C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD0081E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhkhjO0R3hBP for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:22:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75E0B81E0B
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E0B81E0B
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF18D40005;
 Mon,  7 Aug 2023 21:22:17 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:22:16 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230807232216.12cd6f94@windsurf>
In-Reply-To: <20230807081504.4167712-1-marcus.folkesson@gmail.com>
References: <20230807081504.4167712-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691443337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=am2mwVC5C1ll9uhKMMlga6aQWCiddzTw7hpi+Rvo838=;
 b=EOhgUiG3g+drOHAbQCxgtWve4R8VdL5KqatAhNgUR93sh2aUghRb07MuRpHpoyk3wje3gw
 ZnJHEGP1ldky3/tVQ6gFM2Z6Ntejkzikmz+4qT72RcXm36h5zPJ1xpV3H1xY3HEMPKx7x+
 UWSMYFq4Zuxgr1zCdaD2p5RDYrkm4RaH7FuMC6EDX2xqrzPUpvT32gbKMWEY55g8eG8X2d
 3LeF5sxsHESNG4butq/GDnoOoZMz6ZNz6JgVPcWuuPSqu/VHgJD7f+nyK5o3BVDuLpv18m
 rwmxEGBZiCs3G0u0dlt365/wkSosnNWDboFq+4/KNEl2iDciNNAVNj2bYQK6bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EOhgUiG3
Subject: Re: [Buildroot] [PATCH] package/libcamera-apps: bump to version
 1.2.1
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

On Mon,  7 Aug 2023 10:15:04 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera-apps/libcamera-apps.hash | 2 +-
>  package/libcamera-apps/libcamera-apps.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
