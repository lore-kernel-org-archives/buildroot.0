Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A6EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 345A740364;
	Sat,  4 Nov 2023 20:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 345A740364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGT9blv-zer1; Sat,  4 Nov 2023 20:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C4F4036E;
	Sat,  4 Nov 2023 20:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C4F4036E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAF4A1BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82DC660E13
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DC660E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9q7txr3zUSb for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:26:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4477D60C00
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4477D60C00
Received: by mail.gandi.net (Postfix) with ESMTPSA id 322DF40003;
 Sat,  4 Nov 2023 20:26:05 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:26:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231104212604.68ea02de@windsurf>
In-Reply-To: <20231003122200.2677353-1-bernd@kuhls.net>
References: <20231003122200.2677353-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRtCVB6kX7eLJ++vhAFgeotufG/v8VQcyKiwDKvnBWY=;
 b=aP+3JzOdQB5XL1SGcD3e7vblpjqB3cdu7uChqwOy1iWshZpvfpyM4DI6A5m6pkqbqtzWTx
 XW498bQS78QuvUh8k7uUfseCiBZZwxAlfTdVUogG+dVRueoChamB91Ek1z4LMPMr7JLNFO
 CaclYtNCeuTminogC9szaQ4A07gHpO9J+uhzEbX39WKwiVvt0drlt89Z82yPzh6kCNKSDz
 3Ri+XmmNDyRIjv7A3sLpliXxhKneotPdCj8a+qOoiItyhWwiM3kz4YXtcckkN19fAsh7ya
 o7QtozbHhFZ28gbzRvpHMywVdddBngKkZmj3Lr1zJGL9zedioLmsJX9fWMdN6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aP+3JzOd
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 23.3
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

On Tue,  3 Oct 2023 14:22:00 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> http://stellarium.org/release/2023/09/25/stellarium-23.3.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/stellarium/stellarium.hash | 2 +-
>  package/stellarium/stellarium.mk   | 2 +-
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
