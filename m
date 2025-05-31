Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A694C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 08:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1478A83CB9;
	Sat, 31 May 2025 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_CgeznP6FAz; Sat, 31 May 2025 08:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B70183CBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B70183CBC;
	Sat, 31 May 2025 08:36:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A2DC117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CE1483CBC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkTvKo_tuzMv for <buildroot@buildroot.org>;
 Sat, 31 May 2025 08:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B5FA83CB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5FA83CB9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B5FA83CB9
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:36:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 070B41FCEF;
 Sat, 31 May 2025 08:36:18 +0000 (UTC)
Date: Sat, 31 May 2025 10:36:17 +0200
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: buildroot@buildroot.org, Kanak Shilledar <kanakshilledar111@protonmail.com>
Message-ID: <20250531103617.069a4919@windsurf>
In-Reply-To: <20250517130424.588257-1-kanakshilledar111@protonmail.com>
References: <20250517130424.588257-1-kanakshilledar111@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepkhgrnhgrkhhshhhilhhlvggurghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrg
 hdprhgtphhtthhopehkrghnrghkshhhihhllhgvuggrrhduuddusehprhhothhonhhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748680579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PbaLlIIt64IUpdyweGSJMS6ty5FA0gJ04vyljIh+qQ=;
 b=m4suLyldqBtyyCCldXB63fUCRDAGnRDcXMfc/PG3Z8OnCZBxoMcRpd4ozm8rojMkcjFutp
 ZGnYNPWze7l2JDcFjaWyKTM6Cj7MI6ACJ+RHggs7XZu4aiWFxLFvW4qIw6tLf1JptgfCk+
 MqEdqYeTqNjbzi6TpcQGJL/psPQzR8CH/MGeAbpDgWY4LLKh3qucFC+YTKryOart+vHtWk
 q8OQ7xl4Xa9hyKlyk6pe17rTR+ti6lcDdKc823y6K3BnUWiWY/tUDyZqXvy+wmWc1Qa676
 VK8TIT1clktkN8x9uvYwqDfczOMZRPphUsAggJ93KgPQg+Dzd+bfYyI6fx0GEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m4suLyld
Subject: Re: [Buildroot] [PATCH 1/1] package/spieed-lpi4abin: upgrade to
 newer version
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

Hello Kanak,

On Sat, 17 May 2025 18:34:24 +0530
Kanak Shilledar <kanakshilledar@gmail.com> wrote:

> upgrade the package to the newest version.
> changed the commit hash.
> 
> Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
> ---
>  package/sipeed-lpi4abin/sipeed-lpi4abin.hash | 2 +-
>  package/sipeed-lpi4abin/sipeed-lpi4abin.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch. There was a typo in the commit title: you wrote
"spieed", but it's "sipeed". Also the commit message you provided isn't
very helpful as it only describes the contents of the patch which is
obvious by reading it. So I've replaced it by a much more useful
description of what are the upstream changes between the two versions:

    package/sipeed-lpi4abin: upgrade to newer version
    
    One single commit upstream:
    
        sbi: add debian prebuilt v1.6 & remove vendor 0.9 sbi & update mainline opensbi
    
          * mainline opensbi commit: 140844b3bd4a6f2919ccd2ff5e93c6222a4f71fb
          * mainline opensbi-h commit: 83f3e406cf48a0228c0e0738758d48ccfcbb6ae9
    
    Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
