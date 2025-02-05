Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D2C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC5CF83863;
	Wed,  5 Feb 2025 11:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01Ad9Ro6RGOg; Wed,  5 Feb 2025 11:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C80E82B84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C80E82B84;
	Wed,  5 Feb 2025 11:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B33BCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC7D812E7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2DJ1vGEUnXC for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09E5980F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E5980F29
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09E5980F29
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:04:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C23A1F764;
 Wed,  5 Feb 2025 11:04:14 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:04:13 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205120413.4bd3a930@windsurf>
In-Reply-To: <20241219053053.2389046-7-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-7-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738753454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v7LEz2aR2LJp1G0Z1kmIgSPXYjhDgvO9N1hnxq02m8=;
 b=mmexM+p4ozL8dYrC11vXhsfZlL5kajtia2AKNAkck8dMC49bMAu5kJdQ8prme96s9sQndI
 Yvk7Gt32v1HHoEW42jYfZr34Xia1DwXDgQ2IwgpWhGZUvx82yyTyl9swESp2vU43olOFLb
 UFVCXOHb+S86CNoR4WJTPtXkaBmLrggL96hvu2Q/sIXtPg7iRF4ueAhH/YMcLy7Ag/fuXc
 Vd0U3MZ967C3azUeF4ICrW9WvM8fIM8UzpLGEhhCoM5prfQOM/d4HTGsuZt581vCYtq2Va
 SM9GjGRRJqZt07Jlf7EPvQAB0TbfuWBq2vNMk69tCsYB6g8M+76iLLTZrKa6tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmexM+p4
Subject: Re: [Buildroot] [RFC v2 06/14] linux: add support for hexagon clang
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

On Wed, 18 Dec 2024 21:30:45 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> +ifeq ($(BR2_hexagon),y)

Not exagon related, but related to clang.

> +LINUX_MAKE_FLAGS += \
> +	AS=$(TARGET_CROSS)clang \
> +	CC=$(TARGET_CROSS)clang \
> +	LD=$(TARGET_CROSS)ld.lld \

What about AS=$(TARGET_AS), CC=$(TARGET_CC) and LD=$(TARGET_LD)
instead, and have those variables properly defined in
package/Makefile.in?

> +	LLVM_IAS=1 \
> +	LLVM=1 \
> +	$()

What is this lingering $() ?

Also, needs a non-empty commit message.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
