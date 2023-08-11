Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D160CC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3B141E84;
	Fri, 11 Aug 2023 22:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3B141E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoHmYcX1lBmI; Fri, 11 Aug 2023 22:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7676E41E82;
	Fri, 11 Aug 2023 22:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7676E41E82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9C0C1BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9320D84060
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9320D84060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CB9-bFU1AlCF for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:26:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 251568404C
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251568404C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F95B240002;
 Fri, 11 Aug 2023 22:26:35 +0000 (UTC)
Date: Sat, 12 Aug 2023 00:26:34 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230812002634.45f2eff2@windsurf>
In-Reply-To: <de5cac45-aa70-b155-d7b6-f29006d4214b@mind.be>
References: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
 <de5cac45-aa70-b155-d7b6-f29006d4214b@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691792796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdWVifMQnA+2c6HtpSAC25A+QNFEZ8tJaCwwfqvukDk=;
 b=G94ioHP7sKAB4lkeUtmkrQz3DUmw+St/PD7e4V9t+btIQyvYTWrBWRfXi1ZK1v2cQUffRz
 zPlu6HsETxPng9QtnsjbAaqHRTnLOnVQP/Bj7BfnR9RZovRYFXtYd7btKB6kVyoId2c7kW
 rk9vBQ9o6y5qWGp5rXoGTKxqOtU3sPr4HKf9Tty0Ez9O/YGDISa7CgjVP4Ux/0SDniP5DN
 OWRUbwkZXnQ8PLm0hcBZRktxc4Mru8gtb9MfFF0J9sx0MJMC3G32wuwMqJKax18pvLeiQ7
 hnfuOFGRUlL9+igDdh/R0ZA88a1BQyFmpeii9Sw/ZcA2a6cluY2b8AlGcgVP5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G94ioHP7
Subject: Re: [Buildroot] [PATCH] package/crun: allow building with uClibc
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
Cc: Christian Stewart <christian@aperture.us>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 22:06:40 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   I believe this is going to create problems again, because we have a few 
> toolchain configurations that are used in the autobuilders and that have really 
> old uClibc versions.
> 
>   As I said in a previous mail, we may want to drop these and move to bootlin 
> toolchains instead. But then, for some of them there is no bootlin toolchain 
> equivalent...
> 
>   Also, those autobuilder toolchains make sure we still have some testing of old 
> GCC versions, which we probably do want to keep.
> 
>   So, we should either:
> 
> - update all the autobuilder toolchains with newer uClibc;
> - switch those toolchains to bootlin toolchains;
> - switch those toolchains to internal toolchains;
> - add autobuilder exceptions;
> - add some Kconfig construct to identify fexecve availability.

The autobuilders are now doing fully random testing I believe, so they
are no longer testing some of those "special toolchains" we used to
have. They are either using well-known external toolchains, or building
internal toolchains.

In any case, I don't think we should worry too much about uClibc
features, and assume that people should have a recent uClibc, with the
uClibc configuration as it is in Buildroot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
