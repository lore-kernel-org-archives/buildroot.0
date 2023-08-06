Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021CAC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D87817C3;
	Sun,  6 Aug 2023 12:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D87817C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcxqJDmOu236; Sun,  6 Aug 2023 12:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D57FC8186B;
	Sun,  6 Aug 2023 12:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57FC8186B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 121351BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302E04086E
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 302E04086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1ahI_ENMaM1 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:08:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87FB540650
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87FB540650
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42983E0003;
 Sun,  6 Aug 2023 12:08:05 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:08:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806140804.1112a435@windsurf>
In-Reply-To: <20230803041312.33933-1-bernd@kuhls.net>
References: <20230803041312.33933-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3q2HGNsMSOIQjDooVZmXcCzDk9znZ+2az6v0pfBEFhY=;
 b=Yl2Oi1/1vzPO1+jmTij1gzqR5RcMIwujFhsZgm02GRVbeDq69uumoFWy5kn40EPC9eoi4q
 fQyYuQE1lCwhl4MggiRsIurrjWpUz3d63Xzj5+e/GUVn7KuYVwz4s8maurzHGlZjIGyJuw
 z3Ki5hWaKvuVWwDQnEkvMFkA0lwOumRyA/MBhhFAXUJhR2kxZOSGIY6Pl2hfa8jwkABiST
 1wtzkwCQxPs0wc8yfwfWTe6WloPmhgrRSzVXgSgw7xlGj4qXX+3XRgOD3ljwWav0ULUlPb
 37Xh7SA7EfoFl7LpyLp18TFF4WuFI8AgyACGgymSzIUNBmVMQx1SssaWKALpBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yl2Oi1/1
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.5
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Aug 2023 06:13:12 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-August/000726.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
