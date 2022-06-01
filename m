Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68683C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12F11409C8;
	Wed,  1 Jun 2022 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FaIHv_swaqkA; Wed,  1 Jun 2022 20:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2B3C40920;
	Wed,  1 Jun 2022 20:23:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B58661BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB758417E2
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONeuH1TXKjWc for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 20:23:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9040C417D4
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 20:23:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 76004240008;
 Wed,  1 Jun 2022 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654114994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwoDR5gsNqZ9VQ0eMkGS1WrNZSe378nZBIPt9iXJbiI=;
 b=iBnK5bcSBDnC4eL30f7PRUH8C9Owm2F1PoTAQ9uVHd6GUxdOPR26dasntxakZth8LdU8yj
 dmA1SoRKSEurzcGRoPE/YWa8Q3FQCAfGcEIa+1IYZD0H02CecI1Uyx3hctshjMrTuYDYzC
 Uh9LW16DYAVq6/S/taizfljyfI6zzxIKwJEfHV6LwXso9zXmbAaNwoMmHVIP7DBNiYzrhe
 yhtq/rUaAkFi0VFjurz38bTI+9KmFIS6Nt0VA+5rcTZKMSOOUYMwFm4OnkkrPYKgU73Mk5
 I/E92f4QlRVT7QoiyYWgN0loHeUAf6PDnNoHq3Mk1WD882Eb5xuh35+6Nbd0dQ==
Date: Wed, 1 Jun 2022 22:23:12 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220601222312.1f2a09cb@windsurf>
In-Reply-To: <0560258fa9948d2899d3bb8dd40928af0f8c6100.camel@blach.pl>
References: <20220531185444.226429-1-grzegorz@blach.pl>
 <20220601144455.2161328a@windsurf>
 <0560258fa9948d2899d3bb8dd40928af0f8c6100.camel@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/python-falcon: Bump to version
 3.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 01 Jun 2022 20:13:19 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> On Sunday I sent 5 patches, but one of my patch hasn't been delivered
> to the mailing list, so I've sent it again.
> 
> https://patchwork.ozlabs.org/project/buildroot/list/?series=302417

OK. It's quite confusing to receive only partial series, so I recommend
to always resend complete series.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
