Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351DC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142AF40F9D;
	Mon, 28 Jul 2025 21:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhdVC9bKe5Xt; Mon, 28 Jul 2025 21:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE5A40F3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE5A40F3F;
	Mon, 28 Jul 2025 21:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED63D78
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FE5881248
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRvBC6QRen3T for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 21:02:56 +0000 (UTC)
X-Greylist: delayed 367 seconds by postgrey-1.37 at util1-new.osuosl.org;
 Mon, 28 Jul 2025 21:02:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD58980EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD58980EEF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD58980EEF
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 21:02:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB7ED44A0F;
 Mon, 28 Jul 2025 21:02:51 +0000 (UTC)
Date: Mon, 28 Jul 2025 23:02:50 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20250728230250.0fde7bb5@windsurf>
In-Reply-To: <20250722175858.2860511-1-ju.o@free.fr>
References: <20250722175858.2860511-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeejjefhueelteeguefgudehffdttefgheekjeefueduhfektedtueeiteeuieenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvghlvggrshgvpghnohhtvghsrdhmugdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesf
 hhrvggvrdhfrh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753736572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZR9PSDTE3gogQsAH3FUKP6nFxinlUVFP8dR5MMq47Y=;
 b=dGZWKNBq2cG+zWVpUdecc6chL9QatE7Vc9AGTPRMb1/10ACtOW8owhqiZ7ezRqjlHWncqd
 bsIjHXjYhD262FTFiEp1FvVmtjoTqeoUUur/S0C1JUnYYx5DcySE3xkWHilREnxTjTaRAE
 RtAdaxJvMM8gcOv70XfESSemN+swfQUYvQXwxRyt5M/2e5MUxOh1sLG9J8jbTqLzGn3IuF
 u9GAv/MmDRuV8MyKk4OAfkgwrLRSnI1ZlClDcH5YInKMZ1b5/gSjcN/7kUFiHY8wurRsPE
 my6DOZU5rEUvafDsqiYtwiYjPNhCwzoBjFp09n5yQgvslJ9vltw6OIE0s/Bdzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dGZWKNBq
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.15.2
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

On Tue, 22 Jul 2025 19:58:58 +0200
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> For change log since 4.15.1, see:
> https://github.com/Z3Prover/z3/blob/z3-4.15.2/RELEASE_NOTES.md#version-4152
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
