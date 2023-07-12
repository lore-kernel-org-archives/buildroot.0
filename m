Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0226EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CF441899;
	Wed, 12 Jul 2023 19:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CF441899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGcA0Jjy62dA; Wed, 12 Jul 2023 19:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79394188C;
	Wed, 12 Jul 2023 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79394188C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BBFF1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37DF160E02
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37DF160E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wQHt8HvgPo2 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:33:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB3160DA0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB3160DA0
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:33:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE57E40003;
 Wed, 12 Jul 2023 19:33:41 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:33:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230712213340.44501479@windsurf>
In-Reply-To: <20230610165813.357109-1-ju.o@free.fr>
References: <20230610165813.357109-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689190422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7mZ1ngN9On6sUG+St47X+Gupr+b9HtNG1xbEdgvOIo=;
 b=p3MwmF6nIoXf5AT1FgZzgnOk7xsTD+qkXof0rCTYxVdZazBi+hytNHuRq15hYF4VhDEFop
 UoVAgrXfPKzPyrzV/a4f+agZ5zRyRsBoysnxNopJFwjbfHog/fADitScbNsEV0En7cXlyJ
 GsD0JMv61FBhbRknbRJ2DWfrZT0ldxSKIatplon/tsMllBvUpROK7yrUlB0gC/M8KxsMge
 Ww5X5gYdtsPy7GKR0oqvWHV2buIZvTYTuN7HeBlDlbAQHsv2RnWCGNj7RSc5yvYCLb0H0G
 2U3Hl7QfOBSsj1p1nGszgXBZU//cUXMGBmM0xmGSHKcwE/xz7vKnugP5wc9Xrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p3MwmF6n
Subject: Re: [Buildroot] [PATCH 1/2] package/perftest: bump to version
 23.04.0-0.23
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

On Sat, 10 Jun 2023 18:58:12 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://github.com/linux-rdma/perftest/releases/tag/23.04.0-0.23
> 
> Note: the version scheme changed since the previous version, from
> "v4.5-0.20" to "23.04.0-0.23" (the "v" was removed).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/perftest/perftest.hash | 2 +-
>  package/perftest/perftest.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
