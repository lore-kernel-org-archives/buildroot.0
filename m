Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73EDC87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 07:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2B94135B;
	Tue, 29 Jul 2025 07:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBnEo8ziicGY; Tue, 29 Jul 2025 07:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D16412AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D16412AB;
	Tue, 29 Jul 2025 07:27:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDB415C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 07:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E79A816FA
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 07:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHemEuervwr9 for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 07:27:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 991A1816F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 991A1816F7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 991A1816F7
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 07:27:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 477C0443DD;
 Tue, 29 Jul 2025 07:27:23 +0000 (UTC)
Date: Tue, 29 Jul 2025 09:27:22 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>
Message-ID: <20250729092722.41f1c874@windsurf>
In-Reply-To: <9d24a945277dd6fe57163c14820f3fcb@free.fr>
References: <20250724202406.958337-1-ju.o@free.fr>
 <20250728225754.108b36eb@windsurf>
 <9d24a945277dd6fe57163c14820f3fcb@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753774043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7m5drlIZXIRlIkLJ7ALSFsgHXzDt5pM250lWgI4oAss=;
 b=o/9AjhbE9xjLa9I5BxPc6Z737mVH4tvY578AGmoUGoJ1F//sryDhIZENjItgDtTF3z1XXV
 jGfdWrjiDtQvKcozhs8k9RMoHWIDmmjjvB75sSX4ch2TREfkgHp6B+t69111Nkx7X+DCCT
 DqXSjRfjbqR2TurrJxs3HEd0DPxR7PqiM0pUZ86INeakQ0pF2BK7kiCh7xLG0SfV9fx7Xy
 8QULQgjijxIYThETiFxySSI/97bqWkmR+irLz6vqS0ElwNQnLBPsYQTCDZaHYU3kt/0GXO
 0al0kkXnBzKIrv+wJjYWO900D0H5rT10HBAocC1HA1GqxCyQL9SVpXcWCpzSCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o/9AjhbE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/berkeleydb: fix build with
 host gcc-15.x
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

Hello,

On Tue, 29 Jul 2025 00:20:14 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Could we track those bulk fixes (like gcc-15 build failures) with
> comments, like we do for _AUTORECONF or _IGNORE_CVES? It's not ideal,
> but at least we could more easily do cleanups later (with git grep).
> 
> Alternatively, we could add a commented link to an upstream bug
> report. This would introduce a bit more maintenance work.
> 
> What do you think?

Yeah, I don't really have a good idea either, otherwise I would have
proposed it. A patch fixing the C23 issues is more likely to be noticed
when we bump the package, but sometimes fixing all the issues is quite
annoying. So if -std=gnu99 is added, indeed some kind of annotation
could be added. Or maybe we should "git grep std=gnu99" from time to
time, and check if it's still needed? Or remember to check this when we
merge version bumps?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
