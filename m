Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA64C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F28ED82060;
	Wed,  5 Feb 2025 14:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtEgLOe3hawl; Wed,  5 Feb 2025 14:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0F04820DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F04820DC;
	Wed,  5 Feb 2025 14:10:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1C0CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A76A60B0E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n76-DThKTRvO for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA0C760AE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0C760AE4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA0C760AE4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DADD3443D2;
 Wed,  5 Feb 2025 14:10:45 +0000 (UTC)
Date: Wed, 5 Feb 2025 15:10:45 +0100
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>
Message-ID: <20250205151045.7b741715@windsurf>
In-Reply-To: <20250130161119.83312-2-olivier.benjamin@bootlin.com>
References: <f6a5318b-2939-4517-a74b-112c39c0194b@bootlin.com>
 <20250130161119.83312-1-olivier.benjamin@bootlin.com>
 <20250130161119.83312-2-olivier.benjamin@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehphhhilhdrvghitghhihhnghgvrhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738764646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8hJZqNaAtScX/SbVcXOyDAvxcsl5BfYXNO6owqhlJY=;
 b=ZUBLZHGs8UDZiwYEOSunGQT7BHPCs5CNrI0Y5H+icsb5fFAHL5U9T7NWrsRpVh8OdFPRdu
 5ub0J8iAhuBzXQTyUSm2K5IO+y3nsHv2+Qm3rR3thtzldx2TMPTaKm6CIrv51NpIOZWmrw
 R7ywynEYApty8scpYEg8zuBMNZhECu2swaG19hGr9OoaMcXXL4+LA/9f3wVV5t3qBeMRDg
 7SKtQgwHo8HKu3JWBsMu2+B8q+zw/NUWnB7K6hS4IU8P1EB7H2mkQo+bdGhTlnfjfSWnyh
 nQS6phq7mpQ1rORAbBGDfpSvF5qC08oTj/DoNgIlGBGIOHqOnSWtUWN7SEtUXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZUBLZHGs
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: add support for two
 configure options
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

Hello Olivier,

Thanks for the patch! Something was wrong in your setup: your cover
letter had [PATCH v2 1/1] while it should have been [PATCH v2 0/1], and
this patch had [PATCH 1/1] while it should have had [PATCH v2 1/1].

I.e, this series should have looked like this:

 [PATCH v2 0/1] Title of your cover letter
    [PATCH v2 1/1] package/psplash: ...

However, for a single patch, a cover letter is really useless.

See below some more comments.

On Thu, 30 Jan 2025 17:07:39 +0100
Olivier Benjamin <olivier.benjamin@bootlin.com> wrote:

> Add support for two configure options:
>   --disable-progress-bar, via BR2_PACKAGE_PSPLAH_PROGRESS_BAR
>   --disable-startup-msg, via BR2_PACKAGE_PSPLASH_STARTUP_MSG
> 
> Both buildroot options will default to 'y' to be compatible with
> the previous behaviour, since those were enable by default by

                                              ^^^^ enabled

> not specifying the disable config flag.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

> +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR), y)

                                             ^^ no space here

> +PSPLASH_CONF_OPTS +=

We want this non-empty and explicit, i.e --enable-progress-bar

> +else
> +PSPLASH_CONF_OPTS += --disable-progress-bar
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG), y)

Same.

> +PSPLASH_CONF_OPTS +=

Same.

I fixed those minor issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
