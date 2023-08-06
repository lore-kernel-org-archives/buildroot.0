Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D50C00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C893605A6;
	Sun,  6 Aug 2023 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C893605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BShzaeQEJmWr; Sun,  6 Aug 2023 21:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9BFE60B21;
	Sun,  6 Aug 2023 21:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9BFE60B21
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34B8D1BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0662409EA
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0662409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGwhT2A8jq-8 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:32:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D152404AF
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D152404AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E3F660002;
 Sun,  6 Aug 2023 21:32:10 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:32:08 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230806233208.67c2657a@windsurf>
In-Reply-To: <20230806183738.257006-1-giulio.benetti@benettiengineering.com>
References: <20230806183738.257006-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691357530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMVlbCS86HghriBSd9mVREzpKak2b5c95EL23Rn8qZE=;
 b=br9XEZFL+2/8YavsAOZiH6TfU2cKZDzAKNk8ugTiK/sR5r2KJYvoLDakAHuBwoMjIjQnr7
 pLhlGIUn0JK567KI64c/McZeWulWeIr7m7NgJeZd4hx8SUPE0DdYpmPARZFYUKcVINHKfO
 ch+ub+U60KrG2FZ7EiMwJsq1wyxfEPTYuMQfpaHMq4tgBD7HuE3Lj/E33YL+Hewaix8vD9
 d4DMNYbe2KV4crjRewi5zuDTHA9rSqxR/rfcKUXXSvuJT2oBtemG/tPVkHeixew4hY9rJO
 ye2s0UtjWOX7SAm3nWmRi0h2GdXA9eEBGRJUdX5vEG0QFxzWBT8ivVTIvk0xvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=br9XEZFL
Subject: Re: [Buildroot] [PATCH] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_80786
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 20:37:38 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> openssh package fails to build for the M68K architecture with optimization
> enabled with gcc = 12.3.0 and it's still present in gcc = 13.2.0:
> http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/
> 
> It's been reported upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80786
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

But this commit is only introducing a hidden boolean option, how can it
solve any problem on its own? Can you submit this in a patch series
where it gets used at least in some place?

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
