Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420FC3ABCD
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 12:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 015E680F7D;
	Mon, 12 May 2025 12:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z43nMGnDiTZd; Mon, 12 May 2025 12:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F11D581A5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F11D581A5F;
	Mon, 12 May 2025 12:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EDC017D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FAE481765
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbqsZt3fAqTX for <buildroot@buildroot.org>;
 Mon, 12 May 2025 12:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9245C81756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9245C81756
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9245C81756
 for <buildroot@buildroot.org>; Mon, 12 May 2025 12:07:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87A943900;
 Mon, 12 May 2025 12:07:32 +0000 (UTC)
Date: Mon, 12 May 2025 14:07:32 +0200
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>
Message-ID: <20250512140732.6f179e4a@windsurf>
In-Reply-To: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
References: <20250507114042.96291-1-olivier.benjamin@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveekudevheduveetieejhffffeeujeetteejuddthfeigeejueejvefhtdfgfedunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehphhhilhdrvghitghhihhnghgvrhesghhmrghilhdrt
 ghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747051653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Y58/aVY+7PSlEc+NYr4lnL9njtB/fZkBqx3ixo63kk=;
 b=Icw4sEDgeAnrqjlc9T0YeM8eW/yfR8HH3NBHh20XrFhfIov6umo339zg6beCaAMUChTiOF
 +2bXIA37d3Y6IHM5gF0X6IwRZ7zzAMSeQcpBkfp28UluzNGaqSd2//MaflYuMbaVQ9g6M3
 F7CqhuPPyWFQXRquDL+huX+11UOh9XITVWvVbXB1ROrmcUiG9hJ4gOIlFSdz7ziU2YXMXu
 K0jH2WrGjyB9cX3y9Ao6Ci0omUJ4AR8sMbEL0NZUqaSwRTMuGl95rNIngvryCMfAavvZ8w
 SOYoLv7xvDxZHvSTHBqHvEi94mmTek565tfFTXog92V/P8yUKtOUJyqHeG5XWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Icw4sEDg
Subject: Re: [Buildroot] [PATCH 1/1] package/psplash: add support for
 fullscreen config option
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

On Wed,  7 May 2025 13:40:41 +0200
Olivier Benjamin <olivier.benjamin@bootlin.com> wrote:

> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index 61162fa583..ca39cd0ee3 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -47,6 +47,12 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
>  	help
>  	  Enable text banner output on startup.
>  
> +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
> +	bool "use fullscreen mode"
> +	default n

"default n" is useless, as it's... the default.

> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 62268e778b..bb249e7de8 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -31,6 +31,12 @@ else
>  PSPLASH_CONF_OPTS += --disable-startup-msg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
> +else
> +PSPLASH_CONF_OPTS += --disable-img-fullscreen
> +endif

The explicit --enable-<foo> is apparently causing problems, due to bugs
in the upstream configure.ac:

  https://gitlab.com/buildroot.org/buildroot/-/issues/112

Could you have a look?

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
