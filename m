Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290CFC87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 09:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C8B4141A;
	Tue, 29 Jul 2025 09:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQEm-Wfi4Z2U; Tue, 29 Jul 2025 09:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F9D41096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9F9D41096;
	Tue, 29 Jul 2025 09:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B5415C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7E9C8115C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsjUB98-0TV9 for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 09:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1F798113F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F798113F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1F798113F
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:30:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 68446352051D; Tue, 29 Jul 2025 11:30:03 +0200 (CEST)
Date: Tue, 29 Jul 2025 11:30:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aIiUmoZmDVJZptrw@waldemar-brodkorb.de>
References: <20250728212614.37531-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728212614.37531-1-petr.vorel@gmail.com>
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1753781403; bh=BvO0WiP3EyMN9SKgtBiITB+lhSXnnSc6ZjanJtBazNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wZZrM3I2ncD5utqMg9qE17h1i1gzjTqJfwdF7wiGe9shA5F2DyCFvHUmCHYnAMoPu
 ozxs/xS7Xi+vk28eXqGOQ8yZ3DwdRydPQD3PTcbP9fUw4wV8bxLgQBbMcLAG+Zq4+W
 11Js+J4ertT4RvoKuAb7jkLLSTkmluAEoUppsNdHFckYiiVRuqpXSONeJE3/GMj5NJ
 tfDFRsVyqD0wwUKfoE9dTBeVYtJaUbBPJMJXsFIxYCDIb9xIzZ966sVXst42upTtWe
 nWwpMMNFLU3nEjAfpayDyrJnbdnCX2luf2XHsb5HZoYQ19NgUM3zsoheZqujBnjil3
 /anmO9fZzCQ3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=wZZrM3I2
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Fix uclibc-ng
 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr, all,
Petr Vorel wrote,

> Backport upstream fix.
> 
> Fixes:
> https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
> https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
> https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
> https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
> https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for fixing it :)
You can add my 
Tested-By: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
