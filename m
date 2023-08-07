Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6997FC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAF681E4A;
	Mon,  7 Aug 2023 20:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AAF681E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPS3fBP7C-9a; Mon,  7 Aug 2023 20:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5619581E44;
	Mon,  7 Aug 2023 20:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5619581E44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08A6C1BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D59536104F
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D59536104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YUYWP3iK-5U for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:09:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD1F261044
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1F261044
Received: by mail.gandi.net (Postfix) with ESMTPSA id E946260005;
 Mon,  7 Aug 2023 20:09:25 +0000 (UTC)
Date: Mon, 7 Aug 2023 22:09:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230807220924.6aeacd56@windsurf>
In-Reply-To: <ZND9hxOZvMoUHrgQ@waldemar-brodkorb.de>
References: <ZND9hxOZvMoUHrgQ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691438966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IAZ7ah2UBNhBftBRjsygoZOO9U0F0h2fr/PE2Wskww=;
 b=pWZFDG5JYGA2iZ2d4TUsbejm9+a4y+m8J20+g24pEga8szahVoxW3NRkIArdb7xTHiCgvL
 Xrqp4xr3KYovgQl5dxBe6Xa+AQEM9QA7Bt9rA4f8LSSt20ADcdkzckGYMutqEtjkmihvHi
 +4wroO6kdKXNawTQbL+NAOA45vjXxF5ynAQM2YLhTS22FlYIJnqFpcBU9vVu+2OxiayIQ2
 inLfbJnWKZO8MqFbiRjvZnNENwZfdjnloAEdf5xyMQhG0IoV0diJfblpyti+IzYQUdBR0E
 DZDMkhfOJWYdmwsFOQj6qzHL3ZUFnzj+JqdLmIFWhuVsCvdSVFD2xd1o/XbRgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pWZFDG5J
Subject: Re: [Buildroot] [PATCH] package/mpg123: fix linking error
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

Hello Waldemar,

On Mon, 7 Aug 2023 16:19:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes following build errors:
> http://autobuild.buildroot.net/?reason=mpg123-1.31.3

Should be a pointer to a specific build issue, because
http://autobuild.buildroot.net/?reason=mpg123-1.31.3 points to several
issues, and in 5 years when we will look at this, we will no longer
know which issue it refers to.

Also, it should be just "Fixes:"

Finally, and probably even more importantly: we really, really, really
want an explanation of since when the problem has appeared, so that we
know if this commit needs to be backported to a stable branch or not.

Could you do this research and submit an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
