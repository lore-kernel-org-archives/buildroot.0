Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF8FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:32:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015E160E52
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 015E160E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A1C4403DD;
	Mon, 25 Oct 2021 20:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW16APPJXu1w; Mon, 25 Oct 2021 20:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C384014B;
	Mon, 25 Oct 2021 20:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A72441BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 949B54014B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KZfgNsloc0k for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53FC0400F0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:32:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:88a7:5655:8f62:bf4c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5D8E619F57C;
 Mon, 25 Oct 2021 22:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635193966;
 bh=tE7Aq9D/4CT67lrRnoBKvtudXcryhjKHCSnZrrZ95d0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPalLKaRWBYG23vXtHQ/plpk5gszwuO/tDhErOpufN53+MTUQEfjr6gygkpVBevV2
 lQ3JJC1qDK54L2XMI4I7tIZUR6+IrM7F+qsIYdnwwzdtzvVqBVQ1a0qI3EPzBsHSsa
 y9zsw+L21QrkQex6r8U9l3w5HfrYMLYtt+EL0fwWGOJ10lEPeoccXVATYWak7foIx4
 82aTgReE+wKHOcW6cZoCEl/1LqLy8F7sKtsXGU/8oLZe3Lsp1q30qoWaXODoNgr8ri
 Zc0zsOgKNB15hR3ILMGbgpMRATWYUza10xcM7+VcLpTGEoC+yWbVxO1kwRmDJ89KkM
 XNZ/xjbJKgCzw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Oct 2021 22:32:31 +0200
Date: Mon, 25 Oct 2021 22:32:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211025203231.GU2400@scaer>
References: <20211025200049.381077-1-aduskett@gmail.com>
 <6ea1c190-a20e-9be2-09c6-3e050174c090@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ea1c190-a20e-9be2-09c6-3e050174c090@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: bump host gcc
 requirements: propagate to all reverse dependencies
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
Cc: Daniel Price <daniel.price@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-10-25 22:19 +0200, Arnout Vandecappelle spake thusly:
> On 25/10/2021 22:00, Adam Duskett wrote:
> >qemu now requires gcc >= 7.5, however, as there is no BR2_HOST_GCC_AT_LEAST_7_5,
> >set the host gcc requirements to 8.
> >
> >In addition:
> >   - Propagate the host gcc dependency to gobject-introspection as it was missing
> >     to begin with.
> >   - Propagate the host gcc dependency to nodejs
> >   - Add a missing comment in package/qemu/Config.in.host explaining the host gcc
> >     requirements if host gcc < 8.
> >
> >Fixes:
> >http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652
> >
> >Signed-off-by: Adam Duskett <aduskett@gmail.com>
> >---
> >  package/gobject-introspection/Config.in | 3 ++-
> >  package/nodejs/Config.in                | 6 +++---
> >  package/qemu/Config.in.host             | 7 ++++++-
> >  3 files changed, 11 insertions(+), 5 deletions(-)
> >
> >diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> >index bacf44363c..15b6bc3bfa 100644
> >--- a/package/gobject-introspection/Config.in
> >+++ b/package/gobject-introspection/Config.in
> >@@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
> >  	# compile errors with locale.c. As such, require 4.9 until this
> >  	# can be verified.
> >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> >+	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
> 
>  Ha, Yann just applied [1] so this will need to be refreshed...

Yes, we were talking about that with Adam on IRC just at the same time
he was sending it. V2 has already been posted, now! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
