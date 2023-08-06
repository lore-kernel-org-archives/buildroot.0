Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE0EC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C2A81EA8;
	Sun,  6 Aug 2023 12:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C2A81EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9t8qTdAOku7p; Sun,  6 Aug 2023 12:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC9481375;
	Sun,  6 Aug 2023 12:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC9481375
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAB11BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D72F24014B
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72F24014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmlSjjQfuQPF for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:15:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36665402E4
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36665402E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21CCC1BF207;
 Sun,  6 Aug 2023 12:15:25 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:15:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806141525.3c03a4e0@windsurf>
In-Reply-To: <20230802203146.765631-1-bernd@kuhls.net>
References: <20230802203146.765631-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691324126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8BGuW6YL+0GGrwvkiFRLbtKWVWnupA1Gm3vaftVI2Y=;
 b=mUlqd9GmyIxFxs/jVB18r6jQRDK+ZxcNxZjf7rK82Hr5jHGKxxKE4J4lSmqnjYZWbuW1yB
 XYh8tfDj5SEkSlfDJku3zyYxeM7s7WlW9nNHuviSYdcA1p15db6U26R4e/q+ZwDRPhqaro
 rckB8LRSR0Q07CsFRSm+60FaEWmG0m0NGzPJZwf2f5UkgxS8moWMrg44ef5JNJTSIK1YNv
 I8gNcLWvvez++AIK1ctg/mbwOaLn1qposhWKYRvVtNxnFC81JwjJup0HP+L96CvWbCnR2i
 4TRPVMDHAA7m7BT8ID7Xx/Pf+7Ph352ugbI90QNVJlciWwjm3lD+kfAcQXy/dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mUlqd9Gm
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: force arm mode
 instead of Thumb mode
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

Hello Bernd,

On Wed,  2 Aug 2023 22:31:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/68b/68bf2291201ef1882d8e8d3eca2b1a5ad731e4b0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  boot/at91dataflashboot/at91dataflashboot.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

You forgot to explain in the commit since when the issue has been
occurring. So I've added some explanation about this in the commit log
when applying:

  https://gitlab.com/buildroot.org/buildroot/-/commit/07acc00add7ac09114f3c01b85d794a31c68229c

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
