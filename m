Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D0E936EA
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 21:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E88F60E77;
	Wed,  4 Oct 2023 21:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E88F60E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASbZTITObJkW; Wed,  4 Oct 2023 21:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486A160F1A;
	Wed,  4 Oct 2023 21:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486A160F1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 697971BF2B1
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3239E41F0E
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 21:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3239E41F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYpLUzcCEqsf for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 21:58:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ABA341F0B
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 21:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABA341F0B
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7309240004;
 Wed,  4 Oct 2023 21:58:34 +0000 (UTC)
Date: Wed, 4 Oct 2023 23:58:32 +0200
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>
Message-ID: <20231004235832.75a2eb02@windsurf>
In-Reply-To: <BN0P110MB16739C7161EECBDE65DB936FEBC5A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20230921215633.34828-1-brandon.maier@collins.com>
 <20230930172024.5aaf0df6@windsurf>
 <BN0P110MB16739C7161EECBDE65DB936FEBC5A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696456715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6ZjPvpWVb6nz5vnogm0YnSsKX3DgGmF76fUVlhss/k=;
 b=ZUHNaHfZq3L5P32NIVZNYfmGnxQpkxciK9L9+0CHKtpph9OD1EKPRtpi7zF0+YMEQii09C
 JYfarEd5gZjL5tJlMQcotvlF21UxZIVq/kbSRAoHVEe/5KAqPZVj0yUR0M3Ws7RAXxMYkA
 bUz2RRxzvL+Y/2op1Ko2lPlFMplmAroQ0l535TpuqSGuFICVeMCHvTYSACQXQA1xBzeBUu
 1rm7+xtFngEl3jUWbK/l8P7ISTUzB34fR7GYoKkORE0fcIPifRE7rJatiE9ud/UaqajmXY
 anhtLTORaspR00caVa2f2SI18uX5MyTDQiAW0KVvMDpE7ORVWdxQUxxO2GZqxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZUHNaHfZ
Subject: Re: [Buildroot] [External] Re: [PATCH 1/4] board/freescale: fix
 arm-trusted-firmware for binutils 2.39+
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
Cc: Fabio Estevam <festevam@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Brandon Maier via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2 Oct 2023 16:21:45 +0000
"Maier, Brandon L                            Collins" <Brandon.Maier@collins.com> wrote:

> > Applied to master after references to the Gitlab CI failures that are
> > fixed by this change. If you have the boards at hand, it would be even
> > nicer to upgrade to newer BSP component versions. Perhaps this is
> > something that Maeva, Stephane or Gilles can help with?  
> 
> Romain said he updated one of the i.MX boards as well. I would like
> to update the others, as I'm using latest lf-6.1.22-2.0.0 for our own
> boards. But I do not own any of those other boards to boot test, I
> could send out a patch to update the versions and verify they build
> at least.

Several persons from NXP are in Cc of this e-mail, so hopefully they
can help with the testing on those platforms.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
