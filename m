Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EA4C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FA9409A8;
	Mon,  7 Aug 2023 21:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FA9409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ecDSUg3Dnoe; Mon,  7 Aug 2023 21:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43645409A0;
	Mon,  7 Aug 2023 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43645409A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB47E1BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B453060E49
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B453060E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5cq08V8WvOe for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:22:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CE2260E32
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE2260E32
Received: by mail.gandi.net (Postfix) with ESMTPSA id 743F5E0005;
 Mon,  7 Aug 2023 21:22:13 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:22:12 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230807232212.6491ef38@windsurf>
In-Reply-To: <20230807081407.4167545-1-marcus.folkesson@gmail.com>
References: <20230807081407.4167545-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691443333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HUOPmCJa/q/SKCBxjiIDlxHu52TPQbH2BKkmq+zD30=;
 b=gcUCXHfa5b2wWDNeadbOYPxLfMlJaB8d9IkhLLMFg2xiLDyOQNJ0hKNN1F8fo7ip0RqXAv
 KWnFyNxjDQ+ykGnW/dvgB6iXGWSEvn3G+f5RVJ8+pXmP7sT4nuxahyEVCJIxzpNl8xi3X8
 ymSRHcC9N26ya4BmIGh4Nd5wS63W8UqL+wgdIbsEWnZauJvddG3ivCdqiKw+uKxTi87CiM
 8s8IKRf++kGEPlD6WhiFfH1hVibWrinATTSWjiD2LOdFa2oWAY1gbTq9E7Jd5RHQU6YZdh
 B2gwIjLYTi6jB4B88ToqmaEQzIE2BH3m67ucTv2dk3tNGrEOMNb6bUnIYp9ksw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gcUCXHfa
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.1.0
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Aug 2023 10:14:07 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libcamera/libcamera.hash | 2 +-
>  package/libcamera/libcamera.mk   | 2 +-
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
