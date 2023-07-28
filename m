Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C29FC001E0
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BEB8455B;
	Fri, 28 Jul 2023 19:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BEB8455B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH4z5NcTE1Iz; Fri, 28 Jul 2023 19:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1323D84558;
	Fri, 28 Jul 2023 19:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1323D84558
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B66F51BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8A5614CB
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F8A5614CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4uBQk24zCtw for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:25:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7764C60AB2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7764C60AB2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B4920003;
 Fri, 28 Jul 2023 19:25:44 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:25:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728212543.1bcc6145@windsurf>
In-Reply-To: <20230728172026.3337541-1-bernd@kuhls.net>
References: <20230728172026.3337541-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKCIbdxSyhNs+xx7oq7SLaFMqaOCpOrqoYLG3CrqnFw=;
 b=bvzYRpYelMgCS8zw8j5GHWSxNIqtZ0p3jyZl82z+AuAmYVVE9I7FUufh8izYgBgEEaUZ2N
 LPQPMPCQULkISOipJyuE+20g2cvcS1wNFc762OrJk6m9IGAB6DL0W9Q8NIwI6x+xiL5Vyk
 cXVnAtt2jErpALbxEtpJF9Rt2OGIV16B7g/FXn7Z3YnYYy+IzAYDfQu4XcVHU6pPruMzQf
 UxI970Rooo/RWPI77FfNufsYbI4A8+Nn+D6xdk+N8L6rvWW98D+4N5LjAgFIrcno+SmpCK
 7wT9owbySO+bTJAaBLcHHpuNn7Mrt8ZoPOOB5P5m6WBoxM2q2yyi+bIK/7WfOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bvzYRpYe
Subject: Re: [Buildroot] [PATCH 1/1] package/php: force arm mode instead of
 Thumb mode
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

On Fri, 28 Jul 2023 19:20:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fix the following build failure:
> /tmp/ccqcLrVb.s:4053: Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
> /tmp/ccqcLrVb.s:4076: Error: selected processor does not support `umlal r0,r3,r1,r2' in Thumb mode
> /tmp/ccqcLrVb.s:8644: Error: selected processor does not support `umlal r0,r3,r2,r4' in Thumb mode
> 
> Fixes:
> http://autobuild.buildroot.net/results/1d09a0a58cbc1712416de746d57d4532df580673/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/php/php.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
