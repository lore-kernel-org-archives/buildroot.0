Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281DDC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80F88217D;
	Sat, 23 Dec 2023 21:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80F88217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d30XvMITDQZe; Sat, 23 Dec 2023 21:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED24821FE;
	Sat, 23 Dec 2023 21:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED24821FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 071141BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2AE941809
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2AE941809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CR_YabpDD25Q for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:25:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B48EC417FB
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B48EC417FB
Received: by mail.gandi.net (Postfix) with ESMTPSA id E83B9C0002;
 Sat, 23 Dec 2023 21:25:40 +0000 (UTC)
Date: Sat, 23 Dec 2023 22:25:40 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231223222540.3512d2f9@windsurf>
In-Reply-To: <20231203041841.492885-2-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703366741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owXquT8k/UBUzdab22ma79o3sRRMd5KK87XtfVV5E/I=;
 b=kiQp02oZjlL9u7BF+IGwRcR7BGR1/EuHiz9tNdSVBcR3tVK71OEwV5Gjh85+/dpt/ICcgz
 NCwdQ3hEf0K3m5JjxzTcsHuhUt5ZwXJw1guWJK+RZiE/9QAtlkSHKAP23PuMxBRxnhjm5q
 IVGQcO5POfdaCcUOG9wL2kNO/QoX+YwbaZmjoOvngSnLOh0JnL9c/8hSaQ3Ee+KbjGhcfG
 Dtsr23s1ayKSrKwopWsG3/iqOrobJLi8MGuFnORL5+afwMywtDE2ZsvONVKpPI6eGr7bqw
 GA0a+C6KioHhojweDrSCTvAbLRuTjK5Ji+igTzRqajFX0JgKnGbzg1KO6cAAtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kiQp02oZ
Subject: Re: [Buildroot] [PATCH 2/6] package/google-breakpad: disable uclibc
 support
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

On Sat,  2 Dec 2023 21:18:35 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> The google-breakpad package uses stab.h which is not included in uClibc.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  Config.in                         | 2 +-
>  package/google-breakpad/Config.in | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master after adding a reference to the autobuilder issue
that it is fixing. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
