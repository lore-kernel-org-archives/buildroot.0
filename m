Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC324C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8404860B55;
	Wed,  8 Nov 2023 22:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8404860B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jt9dGIv3B5Jo; Wed,  8 Nov 2023 22:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBC5B60B5D;
	Wed,  8 Nov 2023 22:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC5B60B5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1531BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6690540140
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6690540140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmWCZRepzVcG for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:05:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 066B440114
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 066B440114
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9179420007;
 Wed,  8 Nov 2023 22:05:14 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:05:13 +0100
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20231108230513.6c99d8dc@windsurf>
In-Reply-To: <f53be617-ff47-0675-edc8-ae5a36a67716@mind.be>
References: <20231007205749.443600-1-yann.morin.1998@free.fr>
 <f53be617-ff47-0675-edc8-ae5a36a67716@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699481115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsZxk/ku7S0YjbHg7+1YWoqEMDSCXxbiPG4Ta1HY/do=;
 b=cNcNF5BZooq48Ze5saekFPUWtNLLjkhwgOHhLYqfZd9QApTrJMPDZ5U9mQYO5vOwt5gbl9
 hAYQHsPIcX20j9aMKzIfOZomCcaoDf/dl7Z4a/4qUvGU/yNN68pSX49zvKysp7txF39zwo
 tRVrZPEwTb4aLsyFAEmPoYkWZBDuVMsGnfU0js9Is/r/+chJcB9RReddJEWMU4mzt7CZ1Q
 nzV/TPcy0ODh9nVjLFecJhTpXxkLwHKv7FHDfouIkvbQrkVrUTc/o2AXCmrs4N0lc+1gQQ
 HDVY+Yl9SswDAIpVtS0YWBf8INleth2i/p9qbv2xLlGcozH7y3aqGOnU9wGS7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNcNF5BZ
Subject: Re: [Buildroot] [PATCH] support/bootlin-toolchains: don't depend on
 non-existent gcc version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 8 Oct 2023 11:32:38 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> > However, when the toolchain is using the latest gcc version currently
> > known to Buildroot, this generates a dependency on a non-existing gcc
> > version. For example, a toolchain using gcc 13, the most recent version
> > currently known to Buildroot, this would generate a dependency against
> > BR2_ARCH_NEEDS_GCC_AT_LEAST_14, which does not exist yet.  
> 
>   That means, however, that if we add GCC 14, we need to remember to add the 
> condition to the Bootlin toolchains again... Of course, that can easily be 
> solved by regenerating them, but we don't currently do that when adding a new 
> GCC version.
> 
>   So really, I would feel more comfortable just adding the symbols for GCC 14 
> support already.

Yes, I think I agree too. Otherwise, we will never remember that we
need to re-generate the Bootlin toolchain files when the next
BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz. And actually, it kind of makes sense
to have the BR2_ARCH_NEEDS_GCC_AT_LEAST_14 option available early on:
gcc 13.x toolchains should indeed say that they are not relevant if the
arch needs gcc 14. gcc 14.x may not exist yet, but the gcc 13.x
toolchain exists, and should say "I'm not good if your arch is so new
that it needs a new compiler than the one I provide".

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
