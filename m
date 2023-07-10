Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F70CEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78F981284;
	Mon, 10 Jul 2023 17:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78F981284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agkL-1uah-7F; Mon, 10 Jul 2023 17:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A4381280;
	Mon, 10 Jul 2023 17:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A4381280
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 379D71BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1183F8126D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1183F8126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIrV-GXSz0vT for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:53:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED98981280
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED98981280
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:53:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E92B420003;
 Mon, 10 Jul 2023 17:53:39 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:53:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230710195338.6ba40839@windsurf>
In-Reply-To: <20230626181531.2312002-5-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-5-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689011621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfi2tB9uE6Exxg72C+G5oH2rdTWXB6UtADkTRNxXFoc=;
 b=NFqR2a+QHkkjUAy+O0Is2JqIkIcFv770wf+N10o0uW8/egi7vXXhvNQWO7N9WWnilgX6T7
 8W+0yJA0SKVknYMsGZq7keIm2bkbyXYKtbunQXnraH4+o1LDKBVsSwJokPEJx45VVil1sX
 d02jhRZMXrFvBKNDh9+JZoNjPNQyOkPQW+czl5rxEr5oUxSPkBWxdH/x3MioqEfVAhA3eC
 7xn+QsxV3WHdocK1INWyOVgKUIyyZG/npVxTv4ygxRkjBXbAVU/+O4aWjlwk40M43e46mq
 UyDX1gmbZgg42uS1iD4879m4TJVwely1kfnYuWmx4Te3TJamQg/ekEgzOZil5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NFqR2a+Q
Subject: Re: [Buildroot] [PATCH 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 26 Jun 2023 12:15:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Now that setuptools and its dependencies are using pep517 we can
> migrate the setuptools infrastructure itself to use the pep517
> build frontend.
> 
> As part of this we need to migrate the all python packages using
> _BUILD_OPTS to the new config settings format used by the pep517
> build frontend.
> 
> We also need to add a patch fixing a bug in python-pypa-build which
> was preventing the config settings from being passed to some of the
> pep517 build hooks.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Could you clarify the relationship between this PATCH 5/5 and the rest
of the series? They are part of the same series, so there must be some
kind of relationship, but I fail to see which one.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
