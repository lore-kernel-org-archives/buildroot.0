Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51AEEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E40D410CA;
	Sun, 20 Aug 2023 21:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E40D410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdxMTKTvzW5E; Sun, 20 Aug 2023 21:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1D541499;
	Sun, 20 Aug 2023 21:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1D541499
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2BE1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD3F54032C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD3F54032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtQX1u1K8FXl for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:36:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2B7240136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B7240136
Received: by mail.gandi.net (Postfix) with ESMTPSA id B595160003;
 Sun, 20 Aug 2023 21:36:36 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:36:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230820233635.1be035f5@windsurf>
In-Reply-To: <20230820165654.275913-1-ju.o@free.fr>
References: <20230820165654.275913-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692567397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FV/YCdNw5l2Od9Q6+OGUYenCdS0IggPWUoBKvtdLUE=;
 b=S2WW/2blPFKxX+qE4WnlwPJdSOcYge5S5BAnzpUyuwQ9UUJycleP0Z0CswsFjjOG0Jz8TO
 uvj4TfzgQB/nzFdD4kMlAl5x63NjoJI9Y9uk4XIhwMaGeplyssOAsWdUnZCwc3K8TVhH0E
 SOzTd1GIgb0NKUTS+yNbXSsnffwG6D6LEiHWJs+X21j+3Q7izLVH4sErlJnODAXRFdQwFK
 /+uFbCYALDxCYzERp4azQVc3CZrrqMv76F5BYoSGHTzoAu2e6MVhvEZmxKlO7JfkugXDd5
 lni0g914FCe32/Ssi7h1v0M2rHNdEPzCYlS9ka932pf2i5aX+MY69Iq56U/BRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S2WW/2bl
Subject: Re: [Buildroot] [PATCH next 1/1] package/octave: bump package to
 version 8.3.0
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

On Sun, 20 Aug 2023 18:56:54 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release note:
> https://octave.org/news/release/2023/08/08/octave-8.3.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit bf2d7f8 with commands:

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
