Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4205C5B543
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F0940A1E;
	Fri, 30 May 2025 19:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eyn6H0w5hHgb; Fri, 30 May 2025 19:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81CBA40A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CBA40A73;
	Fri, 30 May 2025 19:32:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68901234
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB2582AED
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-JTSgBpP1Xf for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 508AE829DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508AE829DB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 508AE829DB
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A088442C3;
 Fri, 30 May 2025 19:32:01 +0000 (UTC)
Date: Fri, 30 May 2025 21:31:59 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250530213159.20aa3ad9@windsurf>
In-Reply-To: <20250529230851.3709212-1-ju.o@free.fr>
References: <20250529230851.3709212-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleekieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvieehieeiveekhfevheeuheekueetjefgheejfefhveevuddvfeeiueefgefhnecuffhomhgrihhnpegrrhhmrdgtohhmpdhgnhhurdhorhhgpdhrrggugigrrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748633521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewXK/uJ8azZfhxmyV40B/16wAmnI3D8aqo9krFbunmI=;
 b=hHp6kohPDXUNGMn2FstKapbZSSNLI/mTiQAEAE2xPbjdYqNulvzsHcw7rrn4+uBogjdDGx
 tBnATUYtEuo+esRX8wwgfPD8ZGtoseZg9EixroY0zB+btrN1yyHT0ztmn/PTT/chW+xsMd
 cIccPHHiv6PblaOFx/uAZobAV1jsRW3iAkhTkJcrs6+LMoz7tHH/b79Ez5stEsp2x9+nOA
 kUEc8Kn8IGfcLOKCzlMYsFfC2a0cO/dOQmj9CG3iZyOTk6oehTD9hSCHFn3joO/aolDuJ+
 nLMvjkDlo4RyeEdQQL0qhbnDYZNomLrORPYkuGnBdrItgNJgqq2O7AoklarAMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hHp6kohP
Subject: Re: [Buildroot] [PATCH next 1/1] arch/arm: add the Cortex-A720 core
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

On Fri, 30 May 2025 01:08:51 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit adds the Cortex-A720 core, which is a armv9.2a ISA.
> See: [1] [2].
> 
> This CPU support was added in GCC 14. See [3] [4].
> 
> Cortex-A720 processors are included in boards such as the
> Radxa Orion O6. See [5].
> 
> This CPU supports Aarch64 only at all exception levels (EL0 to EL3).
> 
> [1] https://developer.arm.com/Processors/Cortex-A720
> [2] https://developer.arm.com/documentation/102530/0002/The-Cortex-A720--core/Cortex-A720--core-features
> [3] https://gcc.gnu.org/gcc-14/changes.html#aarch64
> [4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-14.1.0#l180
> [5] https://radxa.com/products/orion/o6/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  arch/Config.in.arm | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
