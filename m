Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FACFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7FD41111;
	Thu, 20 Nov 2025 20:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6IQO8uRx4Hr; Thu, 20 Nov 2025 20:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC94C4279D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC94C4279D;
	Thu, 20 Nov 2025 20:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDB8C122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01964279D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkS68LjHIrbu for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:52:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB99E41111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB99E41111
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB99E41111
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:52:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 88FD54E41811;
 Thu, 20 Nov 2025 20:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 499EA606F6;
 Thu, 20 Nov 2025 20:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0AD2B10371BC9; Thu, 20 Nov 2025 21:52:47 +0100 (CET)
Date: Thu, 20 Nov 2025 21:52:46 +0100
To: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Arnout Vandecappelle
 (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20251120215246.0bed6b94@windsurf>
In-Reply-To: <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
 <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763671968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=V3H/vmL9WuLW/Wr+cbmWljpgD42pqsqyzj7f90MCW24=;
 b=a5dkJrg0sDxcoofxP4nDUNlFEGs1si56VeRe9ay4Dx0tT/haiVW0tpFrqko1nrM9B4+RHU
 00kWWeWmb6K1cXrUr0gIgJLSNzLVyO45Iba0pUx6nngo1hNuscj8Nnwmo/xoStsOK4QeOA
 G5iCC6dK9kCD+G83hGuiKLNH/3fE5I9IUaxCX2cfU9hj3m9WEmbarqef7Ar6alibxqlUUY
 k1wQUJmsvbf2K9UPI8aLFkTvhSTlJiVdISeJWNvaEJFMeeWvkSR1DqIQh5Sb9l0mCzEO7t
 zT0xZwKvdX7BOZl+JZ8NaXKh489ZatuOzSpgEPhWXQrLIQVGauK6rFaFIv774g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a5dkJrg0
Subject: Re: [Buildroot] [PATCH 07/18 v3] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Sorry, I am late to the party. I haven't followed this whole work, but
this specific patch is causing an issue on my side, see below.

On Mon,  1 Sep 2025 11:01:16 +0200
"Yann E. MORIN via buildroot" <buildroot@buildroot.org> wrote:

> -# The directory to check for merged-usr
> -root="${1}"
> +opts="type:"
> +ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1

You're introducing the use of "getopt" here, which is part of
util-linux, and not necessarily installed by default in distributions.
For example the minimal Fedora 42 container that I use for Buildroot
builds now fails to complete a Buildroot build with:

support/scripts/check-merged: line 38: getopt: command not found
make: *** [Makefile:758: target-finalize] Error 1

One option is to check for getopt in support/dependencies and update
the documentation to make installing util-linux a requirement.

However, in several other shell scripts (such as dl-wrapper), we use
getopts which is a bash built-in. For the sake of consistency, it would
probably be better to also use getopts here. Do you think it would be
possible?

Thanks a lot for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
