Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D2BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E26080ED1;
	Wed,  5 Feb 2025 10:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcaD28yworfc; Wed,  5 Feb 2025 10:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8C880DB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8C880DB2;
	Wed,  5 Feb 2025 10:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7BE112A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8EE80ED1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nebu7Gmx7vdc for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77F4280DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77F4280DB2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77F4280DB2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:54:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BEC7431F3;
 Wed,  5 Feb 2025 10:54:34 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:54:33 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205115433.24a2e63c@windsurf>
In-Reply-To: <20241219053053.2389046-2-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-2-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegheefvdfhudevudeggeeuvdfhkeekfffftdeljefhhfeuvddvtdefgeehleekgfenucffohhmrghinhepfihikhhiphgvughirgdrohhrghdpthgvnhhsihhlihgtrgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738752874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wx5XxTWwkrNykGMZEJBi0iP2DzUg790c1hMDrgvDq8=;
 b=kfNpbmg03s8m1FEqeMFV8ab0Sa1HhZ4uUytPOLqbqb0dikh6EiLfarZ7mwyk6QBlzU2mIQ
 r5MkjfsjhJbueRpZibMa/jy6LWreTfyD7PDYniQ9EDfKDYvSFRfzHZlCBY+kUO/LSR9wir
 8XSWz0N3bDWe/9RNYR463yorQ6ZsXfPmnK5cuns3Tavhj905FCUN0ksV/wpdE7SfXaWtoK
 SpuKm5qbr+/OhY4RYSLGxSzCost2Gw0TNiJJP0t+3ac9bVFv6hQuSaCvFivJgB5dPj4qXv
 IMO+dTQddRAXkZwA+NSFlIStdIxheveSgRP4QKMKRgdXloQMn9s9WBO2Z6yrfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kfNpbmg0
Subject: Re: [Buildroot] [RFC v2 01/14] arch: add hexagon architecture
 support
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

On Wed, 18 Dec 2024 21:30:40 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>

A non-empty commit log would be useful here, at least to introduce the
CPU architecture main characteristics, use-cases, why Buildroot matters
for this CPU architecture, etc.

> ---
>  arch/Config.in         | 10 +++++++
>  arch/Config.in.hexagon | 63 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 arch/Config.in.hexagon

Please add yourself as the maintainer of  this CPU architecture in the
DEVELOPERS as part of this patch. I see you did it in a separate patch,
but we like to have changes in the DEVELOPERS file together with the
commit adding the changes.

> 
> diff --git a/arch/Config.in b/arch/Config.in
> index e57f4b2baa..fe863e50a7 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -254,6 +254,12 @@ config BR2_xtensa
>  	  http://en.wikipedia.org/wiki/Xtensa
>  	  http://www.tensilica.com/
>  
> +config BR2_hexagon

Please comply with alphabetic ordering of the CPU architectures.

> +	bool "Hexagon"
> +	select BR2_USE_MMU
> +	help
> +	  Hexagon is a Qualcomm DSP processor.
> +
>  endchoice

Another issue is that right after applying this patch, Buildroot allows
me to build an internal toolchain for this architecture (with upstream
gcc, binutils, glibc/uclibc/musl). My understanding is that this most
likely won't work, so it needs to be somehow disabled. So you need your
architecture to select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT so that
building with a Buildroot toolchain is not offered.

To be honest, I am not sure we want to support an architecture that can
only be built using an external toolchain.

Also, does Hexagon has support in gcc/binutils ? Adding this new
architecture *and* supporting it only with Clang is really doing two
big things at once, which is only going to complicate stuff a lot.

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
