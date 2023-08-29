Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A41C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1284481420;
	Tue, 29 Aug 2023 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1284481420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIy4TZNfCLsh; Tue, 29 Aug 2023 12:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED69B81423;
	Tue, 29 Aug 2023 12:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED69B81423
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50DEF1BF4E7
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2727141030
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 12:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2727141030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azhs9jeMNXCR for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 12:34:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 361534101F
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361534101F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 617C61BF20D;
 Tue, 29 Aug 2023 12:34:00 +0000 (UTC)
Date: Tue, 29 Aug 2023 14:33:59 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230829143359.3093b17f@windsurf>
In-Reply-To: <20230828185628.946326-1-aduskett@gmail.com>
References: <20230828185628.946326-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693312441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm5kVjScLnMrXGF4DT6Ug+iOwHBlF9NIOf7soI6TOa4=;
 b=G1rraXtzqMoUDTx6lcK9S8Jh+D9autzd7BgyP60Zx6gonjEVWWqROT1G2X8oap2zhEgS00
 godHNGsPTc65BLOWnqvTngXF7G8PvhRTq6p6EZ1PSXhjE8ZbJkEKxeMrFcUm72DpUKGQIn
 t/BcCjS09fumdElfdncvyGZblAN3hS7cqkc+jQ3vITvYMeM00EhUTgaHxlpCXNYF3nO0T1
 9JcAOf0aaK4QXzoO4hjw9F3wl9bM+SkkJKQzIP/mMPJRy9/OlBKqgTrh6GLKkwt+WTJ7On
 h1j/WIP72WXgRFx3ME1rcwt9FJK58+0Oos6m1Sm9OX7m5cUmkh0c2Rl7b1SPAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G1rraXtz
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openjdk{-bin}: security bump
 versions to 11.0.19+7 and 17.0.7+7
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 28 Aug 2023 12:56:28 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> For details, see the announcements:
> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021900.html
> https://mail.openjdk.org/pipermail/jdk-updates-dev/2023-April/021899.html

>  ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
>  OPENJDK_VERSION_MAJOR = 17
> -OPENJDK_VERSION_MINOR = 0.7+7
> +OPENJDK_VERSION_MINOR = 0.8+7
>  else
>  OPENJDK_VERSION_MAJOR = 11
> -OPENJDK_VERSION_MINOR = 0.19+7
> +OPENJDK_VERSION_MINOR = 0.20+8
>  endif
>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
>  OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))

Something is wrong between your commit log/description and what the
commit is doing. The commit log is pointing to a bump to 11.0.19+7, but
we're already at 11.0.19+7 in Buildroot (your patch is updating to
11.0.20+8), and the commit log points to a bump to 17.0.7+7, but we're
already at 17.0.7+7 in Buildroot (your patch is updating to 17.0.8+7).

And therefore, the changelogs that you point to in your commit log,
that describe several CVEs as being fixed are not relevant to your
commit: they are related to the versions already in Buildroot.

Could you double check this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
