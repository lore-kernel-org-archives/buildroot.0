Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EEC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B808B41710;
	Wed,  5 Feb 2025 11:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UKyI0SEx2F1; Wed,  5 Feb 2025 11:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B7C41711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B7C41711;
	Wed,  5 Feb 2025 11:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C59FD12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A993841710
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5q3hofKgm9WX for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:05:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5614641711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5614641711
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5614641711
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:05:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6461743185;
 Wed,  5 Feb 2025 11:05:08 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:05:07 +0100
To: Brian Cain via buildroot <buildroot@buildroot.org>
Cc: Brian Cain <brian.cain@oss.qualcomm.com>
Message-ID: <20250205120507.4b07682d@windsurf>
In-Reply-To: <20241219053053.2389046-8-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
 <20241219053053.2389046-8-brian.cain@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrhhirghnrdgtrghinhesohhsshdrqhhurghltghomhhmrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738753508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXuY8hF+DN6uvfknFZ5Icw7XjDo5NOjaNnsVsgaPJJ8=;
 b=JCcX6RGMSWsdbg2O66gGJoACC2NB17T0FBu6zChRBZ8wFYWBRDWjGplnw5Smo19U+gMkik
 z26v2Tk3fhZwOWzZegv73jLv/W4IDZ55dck5RdskuMedal0mD63V9fGKqbv7VOvsrun2z4
 PKkGwHjG4wzycW2fYSjgk6TKsWr1+3/cCje+BfO22b+xXbyqX0ptS8/3vqbl+EYM/5HHhb
 roQpbBCHoC/BrUAX6PS5T4gEx4pmE/MIFAp1j2u/lo6xKuf4QpdFV8e3fmY+D8eB7GJ/aU
 rdlYToV7czoRy96XDltXzAkz4jb15relUpbVcRKl7CfvXIoPFwQHued/iTi46w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JCcX6RGM
Subject: Re: [Buildroot] [RFC v2 07/14] arch: add hexagon ARCH definition
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

On Wed, 18 Dec 2024 21:30:46 -0800
Brian Cain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  arch/Config.in.hexagon | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/Config.in.hexagon b/arch/Config.in.hexagon
> index 9a7cb62278..4cf1e59e68 100644
> --- a/arch/Config.in.hexagon
> +++ b/arch/Config.in.hexagon
> @@ -43,6 +43,12 @@ endchoice
>  config BR2_ARCH
>  	default "hexagon"
>  
> +config BR2_GCC_TARGET_ARCH
> +	default "hexagon"

Ah, that's why you get a non-empty $(GCC_TARGET_ARCH) in PATCH 05/14.
If you don't want any -march value, drop this variable.

> +config BR2_NORMALIZED_ARCH
> +	default "hexagon"

Should go in PATCH 01/14, together with the introduction of
arch/Config.in.hexagon.

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
