Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0884C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 16:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3581F610A6;
	Tue, 25 Jul 2023 16:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3581F610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLUJfh9SSP2i; Tue, 25 Jul 2023 16:48:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC4D610BF;
	Tue, 25 Jul 2023 16:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC4D610BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1A71BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41542401FA
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41542401FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewwUY4lTv7Fo for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 16:48:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEAF94026D
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 16:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEAF94026D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 901DDC0003;
 Tue, 25 Jul 2023 16:48:21 +0000 (UTC)
Date: Tue, 25 Jul 2023 18:48:20 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230725184820.7f32e85a@windsurf>
In-Reply-To: <CA+h8R2oEYmst=mCd-QQFg-r37W46DbNjwTH+pvuM56EsZp0CGw@mail.gmail.com>
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-4-christian@aperture.us>
 <20230722231336.760d74ea@windsurf>
 <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
 <20230723002803.12e6545a@windsurf>
 <CA+h8R2oEYmst=mCd-QQFg-r37W46DbNjwTH+pvuM56EsZp0CGw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690303702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXyOFaHlyfrRcTsfXCG77stkR3q55xlCrlyiHoZzfbY=;
 b=TYZtMfqlhJb4QC5/o7CTPcavPMds7zPO3v8gOljOZOHhFcna0LGUMpNCwp55dib5R93rfM
 lK2X2Dn+dmdRS5f0035QBRNhk9u5mA1HCSrbpBy0hlzqApTl713jJQ19kwgv/dbhBR8qN/
 qDKz1bl5avIaURAopIfXMdABWQYwck8ebSqxGfdzxhwldF22EdceSY3RZObGD9bIGoNGSS
 UJGcUpm1Mr9khn/gt3ara3oS7fweVt0u8jtHHR7cxdQWg3uZSLiybQnuHMEpeskJ+CoK5u
 8Wq2+iwluKB1CUvOG7p17kSY0VBV6OtNGr5x7Hgx4g4F8gesVyEYHY4KZCnhPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TYZtMfql
Subject: Re: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 22 Jul 2023 20:22:18 -0700
Christian Stewart <christian@aperture.us> wrote:

> What if we do the following:
> 
>  1. Merge this patch which enables using the host Go compiler on
> architectures that aren't supported by host go bootstrap.
>  2. Author and merge another series which adds the binary version of
> host-go, still falling back on #1 when neither the bootstrap nor the binary
> download (external toolchain) is supported.

I think like we do for Rust, we want to give the user the choice of
using a Go compiler built from source, or a pre-compiled Go compiler.

Other than that, your plan looks OK to me!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
