Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7E9C04A94
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059BA60ACF;
	Sun, 30 Jul 2023 11:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 059BA60ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRlXtzbPcHPq; Sun, 30 Jul 2023 11:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D2F160A97;
	Sun, 30 Jul 2023 11:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D2F160A97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 074541BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE841410E0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE841410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPnTp43E63ln for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:00:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFB18409A7
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 11:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB18409A7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84E4B240003;
 Sun, 30 Jul 2023 11:00:08 +0000 (UTC)
Date: Sun, 30 Jul 2023 13:00:07 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230730130007.711b7b37@windsurf>
In-Reply-To: <20230103200046.96070-2-ju.o@free.fr>
References: <20230103200046.96070-1-ju.o@free.fr>
 <20230103200046.96070-2-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690714814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifFG/SM6Ed2i/aO7tvMYXnEt15+Q9fZLwliixGE9QMU=;
 b=aqt70vixtSYs65fkBKJ3/UvXSXeeMF0V4x3JHYWWq+cjqyMoCeCBcShk458N4ul/L9zYLV
 c0XAA6BFWjvNFRsYlmNibYZFCXXt5oO56IuemkFbVm9sgXtuVZBnTPcRv7y5WDbvOoWSwU
 EhpwKire2BJzKT5QSAbtbqTkPj/fsPb/XNK79zUYA/LFr3EVgvd6htP4T6su5FWe4T2pWR
 LUEwmCNrKOiL1Bdmg9SLsZf/2w4T6ki8y7mrTGQ/xQG5Q1Av2ESk8mYbaOR6qE6SqHJwnf
 nchTHUsRZy2s7rUW7xRSBUiFK9dJdg7LJ498i4CrtGlB1SIG596HIjFO0C7JSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aqt70vix
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_fluidsynth.py: new runtime test
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

On Tue,  3 Jan 2023 21:00:46 +0100
Julien Olivain <ju.o@free.fr> wrote:

> +class TestFluidsynth(infra.basetest.BRTest):
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
> +    # armv5 and based on qemu versatilepb which is limited to 256MB of
> +    # RAM.  The test needs 1GB of RAM (larger initrd and soundfond is

                                                             ^^^^^^^^ typo here

Applied with the minor typo fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
