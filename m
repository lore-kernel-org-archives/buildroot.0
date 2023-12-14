Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAB9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A10983C29;
	Thu, 14 Dec 2023 07:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A10983C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJ2-A3WNzUkR; Thu, 14 Dec 2023 07:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E103F81AC1;
	Thu, 14 Dec 2023 07:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E103F81AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AAC41BF5B5
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23119409E0
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23119409E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKWEwvYuboDU for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:58:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF708409B1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF708409B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 972FB1BF207;
 Thu, 14 Dec 2023 07:58:55 +0000 (UTC)
Date: Thu, 14 Dec 2023 08:58:54 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231214085854.558ce0c1@windsurf>
In-Reply-To: <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
 <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702540735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SH2n3uusuHqbu6ZwgJvPu9hCLlHiTYih7ebszgUR8OQ=;
 b=S1GjTp/xULGHep684WAnZpLxZy3DpM9KPFei7ZWNYswM6f4hOZ4jiWZREq4IzRPnCmd9xr
 4Nzo7F/4SKz7oG/O0I+eC96gdLErfBU1RJ6tRRC+dZKwE3Vo1meuQuBF7jwqUyXkm7fv0U
 /GtWpfeAnREkLLkz3/c4keSxSelXJZQ4zFC1bLusH8gMv7ONFm6sfsUginIgODPUyWzPVu
 2afUrJ+ERhnIKwWcf/ATrdXu35EX9MD3uZhxhbcEQZqSUiJ7QDwaKiDEbotPjPGYiNGqei
 kjCTVf8nzSkFjANBKzAmQlIqu1G4Wsrun11RXGysgqVB6p1QOBYDCUD6jbjXEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S1GjTp/x
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 14 Dec 2023 07:51:03 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Since we are not sure about this, I will go ahead and try to upstream
> the patch to the newlib community, and see what they say.

Thing is you will have to explain very clearly what we need a different
value, and I'm not sure we have such a clear explanation (at least I
don't have it).

> If there is a reason, perhaps they can help us with implementing a
> configurable solution, as you suggest.  In any case, I think working
> to upstream a proper solution is still better than my fixup solution.
>  I only implemented the fixup solution as it was quicker than
> spending many hours learning the newlib configure script.  Now that
> you have found the root of the problem, I think patching it upstream
> is the best option.

Many hours to add a --with-option? It should take 10 minutes or so.

> By the way, since the bare-metal toolchain no longer has a default
> architecture, all of the config files in patches 7 and 9 need the
> following line added:
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Correct. There was no reason to have this as the default.

> Will I need to submit a v9 for this, or could you just add this
> config for me to each of the zynqmp and versal config files?

We'll see how we merge things. Perhaps a v9 will not be needed, and
I'll fix things up when applying.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
