Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8CCC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3922421D6;
	Fri, 28 Jul 2023 20:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3922421D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQK-BhVDCHnl; Fri, 28 Jul 2023 20:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03556421C4;
	Fri, 28 Jul 2023 20:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03556421C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6BCF1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B2E8451B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71B2E8451B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jy0H4Z4opZ1q for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:11:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E384384519
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E384384519
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDCFEC0003;
 Fri, 28 Jul 2023 20:11:17 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:11:16 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230728221116.6f4faaf9@windsurf>
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3tkHM9oPs/n/SoogL4ynEEaxZRvbRoJ8AKwAPXsr9Q=;
 b=RuPam5TzdFyEkiECvmZb03yxtL02QIaPkCMTtUF+MiN/lCzi5NMJW2wmKMKZb/8lVQXX97
 jyEfyunl1vB5M4j6eiLae8fvZ09zkHCIh5B7Z+yL0RuOvylewe6vhL2nNzHf/EbZHF8nbs
 2V47TOAJ55ZDE/H7d4BEfXUd1eXt9+wXtYbaOlGbaN3ZeVEYOLBSlxaJchlBIVEY+L+PWO
 +qELoXGee7olUspuvSJE2oiaYHUFyCQ/29T4lYMv1v2NQ1sqkog7z8yrCOg+xaOuBRttai
 vRuAyWTeSJXjH+Xu/XYO1jhOoyOTOhi4skpodiM8aTcTF0LCqmXa7mnFAne21Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RuPam5Tz
Subject: Re: [Buildroot] [PATCH v2 1/8] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_13 blind option
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

On Fri, 28 Jul 2023 00:25:37 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> In order to add gcc 13 support for internal and external toolchain in
> follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_13 symbol.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Entire series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
