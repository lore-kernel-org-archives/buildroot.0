Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A917BC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C4460F00;
	Mon,  3 Jul 2023 18:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C4460F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBsNGrDLfwcb; Mon,  3 Jul 2023 18:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9004F60ECA;
	Mon,  3 Jul 2023 18:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9004F60ECA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37AB1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B84E410D1
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B84E410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seTBKMKUwiRg for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61B641299
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E61B641299
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:52:11 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61D2B20003;
 Mon,  3 Jul 2023 18:52:08 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:52:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703205207.1e2c3220@windsurf>
In-Reply-To: <20230703160042.31567-1-bernd@kuhls.net>
References: <20230703160042.31567-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688410329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sczHYvkXxamnPCzd7gT/SRhkyo3JINDNiMH7BKiOXCw=;
 b=ammis+ldkvoJa7+YAOVgqyvGXdANEpHksLpG14/vr+UBDqdKJp32Oeqow1yKdAw+UKc7kI
 uGaLcWh9O0QtNC92VB4rudGj1aEi0uh5Sl+TsbXkhr3f2dnBTUvCVEJoSSDmj8Atwz21KV
 m3+XbVUleUeINb2Fu99fIXM7hxTLW5CDKPFpNfHTV+n5Sf77nJTqA5/q0xRygOM5Tmt+aX
 i7FprW/kRK4zIU0Vzd8+/+uNogHbIl4xMcN4SIPoZE0XNsdU4a7AVvEUkYXRvE6+Yp//66
 LasgX5XksP/rPEXnBiHYPcwW1n5Vx1dgZB+kRjVNkYx8gDqkbRCYTCJnaCjYvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ammis+ld
Subject: Re: [Buildroot] [PATCH 1/1] package/libcodec2: bump version to 1.1.1
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

On Mon,  3 Jul 2023 18:00:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://github.com/drowe67/codec2/releases/tag/v1.1.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcodec2/libcodec2.hash | 2 +-
>  package/libcodec2/libcodec2.mk   | 2 +-
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
