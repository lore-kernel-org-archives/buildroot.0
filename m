Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611EDC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E6F81F9C;
	Wed,  5 Feb 2025 10:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBQPLB0Lhypp; Wed,  5 Feb 2025 10:58:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D938218B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D938218B;
	Wed,  5 Feb 2025 10:58:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 807D9CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6387C8218B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuNIscxNiKge for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:58:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A79181F9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A79181F9C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A79181F9C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:58:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 503F82047A;
 Wed,  5 Feb 2025 10:58:15 +0000 (UTC)
Date: Wed, 5 Feb 2025 11:58:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205115814.3a75066d@windsurf>
In-Reply-To: <20241219053053.2389046-3-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-3-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738753095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ksIFbvVWNXtbrQo2JRxPoeJZ6Fcf9wdImKkGvdo8c8=;
 b=krNCna04ax67wekZicBBrv1RiPcnlfWOrnmt8aG3VqFSrSPFRQRr1P5UTSIRmYOZQ497B3
 26ztgsK9I3/6UqR7rxxJ9YmWsAF5WiSOQWAHm9YDJId880sMjoi4s02uAAHj9R17CZmT3B
 8o4/sJ4Sbvs1JW8OkMX70ISPE4y84L78qvNkwI0uyEBgOxscHFABRUHIaTgcXd1SFFvIn0
 ZKsRp8Cg1BG/tu/q9MlG26MPxtDlgt9ZS7Vq7uMWMa2Sz05uqdphd1FIHOf3TaO7BbrT2m
 X8uNiX38ERziHshjRMfLiSRKwkFrfskyrAGHJ9OffBcEnxNf54ee62UPmaaj7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=krNCna04
Subject: Re: [Buildroot] [RFC v2 02/14] toolchain/toolchain-external: add
 hexagon toolchain support
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

Hello Brian,

On Wed, 18 Dec 2024 21:30:41 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  toolchain/toolchain-external/Config.in                |  6 ++++++
>  .../toolchain-external-hexagon/Config.in              |  7 +++++++
>  .../toolchain-external-hexagon/Config.in.options      | 10 ++++++++++
>  .../toolchain-external-hexagon.hash                   |  6 ++++++
>  .../toolchain-external-hexagon.mk                     | 11 +++++++++++
>  5 files changed, 40 insertions(+)

Please update the DEVELOPERS file as part of this commit.

>  create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-hexagon/toolchain-external-hexagon.mk

I believe the toolchain should be perhaps be named
toolchain-external-linaro-hexagon toolchain. Indeed,
toolchain-external-hexagon is too generic, and could be a name for
*any* hexagon toolchain.

> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index e91aa16326..7bd5309671 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -29,6 +29,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
>  # MIPS
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
>  
> +# Hexagon
> +source "toolchain/toolchain-external/toolchain-external-hexagon/Config.in"
> +
>  # Bootlin toolchains, available for virtually all architectures
>  source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
>  
> @@ -123,6 +126,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.opt
>  # ARM big-endian
>  source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
>  
> +# Hexagon
> +source "toolchain/toolchain-external/toolchain-external-hexagon/Config.in.options"
> +
>  # MIPS
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
>  
> diff --git a/toolchain/toolchain-external/toolchain-external-hexagon/Config.in b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in
> new file mode 100644
> index 0000000000..256eeb87dc
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-hexagon/Config.in
> @@ -0,0 +1,7 @@
> +comment "Toolchains available for Hexagon DSP"
> +
> +config BR2_TOOLCHAIN_EXTERNAL_HEXAGON
> +	bool "Clang/LLVM Hexagon Toolchain"
> +	depends on BR2_HOSTARCH = "x86_64" || "aarch64"
> +	select BR2_TOOLCHAIN_EXTERNAL_CLANG

As of commit PATCH 02, this Config.in symbol doesn't exist, so you need
to adjust the order of the patches so that it gets added earlier.

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
