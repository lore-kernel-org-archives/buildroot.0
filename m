Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149FEC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0FB8213D;
	Tue, 29 Aug 2023 13:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0FB8213D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAHQVUQhNMA2; Tue, 29 Aug 2023 13:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F5B820FA;
	Tue, 29 Aug 2023 13:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F5B820FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89FD31BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B71F98203A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71F98203A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycC_FVFzUvae for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:26 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88C2782068
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C2782068
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E3276C178E
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:55:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5A6020014;
 Tue, 29 Aug 2023 12:53:57 +0000 (UTC)
Date: Tue, 29 Aug 2023 14:53:56 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230829145356.0225efd1@windsurf>
In-Reply-To: <20230828120419.3297803-1-marcus.folkesson@gmail.com>
References: <20230828120419.3297803-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693313638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+AfqPptwnSe6zFS4oCp6vlVvIragbYm1LCE01nOMik=;
 b=av1Isx5iuQsszAQtyKAwkKzvd92Cih4dxySldbT5XbAP/yp8ur6h4Ysv64J/hjNC8lWFLm
 JJP0FNf6dQ4rT3meNP4VDJZ62rjKWCC4u1RSCvLY0FZ4wKKnUFEk22MaXZiE9IWZDxeR/z
 pAbf81JldYDq5gBebF5COONIPe5IF+Qf7Q8QWkAXxGcVY4Z0Knc6pcwsk8Dp2woD3eOIAj
 XaRZ9GyyiZd+t9VGqyh2gicFCPy678WuJKHZ0ifMgNJwWaG9HBcmYO1s3Nt8D/L2F0Bygh
 8egypKw2tLQaTiWyJmT3k32efWm1u77RJ6vporqfEwqJWQBY8+qXX6vTe8H26w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=av1Isx5i
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2023.6
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

On Mon, 28 Aug 2023 14:04:19 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.hash | 2 +-
>  package/libostree/libostree.mk   | 2 +-
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
