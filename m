Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C1CC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515D483BB8;
	Wed,  5 Feb 2025 11:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaazQ9P9v6-l; Wed,  5 Feb 2025 11:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5275E83BA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5275E83BA3;
	Wed,  5 Feb 2025 11:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A239CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 005DC83B7B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHSA8RgxL7me for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F63A83BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F63A83BC8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F63A83BC8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:33:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0735433F8;
 Wed,  5 Feb 2025 11:33:07 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:33:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205123307.7b663b91@windsurf>
In-Reply-To: <20241219053053.2389046-15-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-15-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738755187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqqDQZqFiD/DTyWt5FvtaAe0u8Yg29hHjxKs9120aKM=;
 b=KpDvQ6PXqToXKo15dRt3gRfsBsALE/K8HIrKx3zg4BcRV1Zwfm3fcDq7hmEZoUhetdtYho
 M5LKeA1zZlQnfCqpd2/H7raJZpBheRr+RJfftgehQwQ+S5bqiDTi7FDIRaqsKVzqXWVhJn
 UhPVJvvH8nLPyNU0xo1qlKpMtSTDwqcEXWZXRdhzXzFN+DeeWZNcCDaF8UpQBz0ae967h3
 fwscLknIPdniJt4/BmPNX9Hdl2/DWWGAExARLoMIF1yUWJzYQxUBHR1oGPPKS435rjAepF
 23/hfh3AiE0cIQt/rVqUg1urMmhXdxi+WJPQPrYAmUgGH0fguByMVTG+xRiv5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KpDvQ6PX
Subject: Re: [Buildroot] [RFC v2 14/14] package: disable -ztext
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

On Wed, 18 Dec 2024 21:30:53 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  package/Makefile.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 0d60e76bff..e4da9d2ff6 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -171,8 +171,12 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  # "-z" to be passed and the "text" keyword to be dropped otherwise. Both
>  # gcc and ld supports that, so it probably won't cause us problems.
>  ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CLANG),y)
> +TARGET_LDFLAGS += -Wl,-ztext
> +else
>  TARGET_LDFLAGS += -ztext

The problem with -Wl,-ztext, at least with gcc toolchains is that sometimes
the $(TARGET_LDFLAGS) get passed to the linker directly, and the linker
(at least from binutils) doesn't understand -Wl,-ztext, it only
understand -ztext. See Buildroot commit
bd035872be9948515ee50ae034bda4a2e044ff22.

Of course, perhaps things are different with the linker used in Clang
toolchains, I don't know.

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
