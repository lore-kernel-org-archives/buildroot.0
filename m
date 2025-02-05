Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3700C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85EC383A49;
	Wed,  5 Feb 2025 14:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhjY0Jg-jSfC; Wed,  5 Feb 2025 14:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 840A783A51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840A783A51;
	Wed,  5 Feb 2025 14:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4277912F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FFD8401D2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id es6BGfvL2iaR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF30C40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF30C40132
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF30C40132
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:33:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99B7D443C6;
 Wed,  5 Feb 2025 14:33:54 +0000 (UTC)
Date: Wed, 5 Feb 2025 15:33:53 +0100
To: Ian Merin via buildroot <buildroot@buildroot.org>
Cc: Ian Merin <Ian.Merin@entrust.com>, "jezz@sysmic.org" <jezz@sysmic.org>
Message-ID: <20250205153353.1f380f10@windsurf>
In-Reply-To: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB2788D839BE96640DA8286B62FFEE2@BN7PR11MB2788.namprd11.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopefkrghnrdfovghrihhnsegvnhhtrhhushhtrdgtohhmpdhrtghpthhtohepjhgviiiisehshihsmhhitgdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738766034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJszAjdGhJD3+9NS4+fEzo+BGR91AWujLN+xYaeDa1A=;
 b=bPIPFHz+IFBYcX0PBclt+5j8JyebqYDF9FdZukClBE9t9Rxbi/eYDuXxU8yLj0c0ZuwUWC
 v1IN94KEkDQjhl0jDJf6SoMd4kLDsrmWWgLwOeooLPx9KZ+rMjmrEGnXg3tsHf8r6LvY19
 wWsSPw0GNBxejK9RijuAft/XlcY9En//vtVBcSp0OA4jLgCGx1UU+xSfco/eJUYGEpF2oH
 hnDVE6D7ynM4OVReOt+sWhMN7YKKOHLwtswFXPS5dS29NvfJIomf+QP4UuNmDspJiUBKh3
 nK2QpXbwf0so+66xRMoI8lINOgHOP+JFumENmnOUZU/CXX7NtEsjHkt/dvAIjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bPIPFHz+
Subject: Re: [Buildroot] [PATCH] package/lxc: add libapparmor optional
 dependency
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

Hello Ian,

Thanks for your patch!

On Wed, 29 Jan 2025 19:46:22 +0000
Ian Merin via buildroot <buildroot@buildroot.org> wrote:

> From e56f77419a6516fef7f63746120755400948e5d3 Mon Sep 17 00:00:00 2001
> From: Ian Merin <Ian.Merin@ncipher.com>
> Date: Wed, 29 Jan 2025 11:15:20 -0500
> Subject: [PATCH] package/lxc: add libapparmor optional dependency

You didn't use git send-email to send your patch, which made it
difficult to apply. Indeed, it looks like you pasted the output of "git
format-patch" into the body of an e-mail, making the resulting e-mail
unapplicable by "git am".

> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index b2afb978e6..d2227c3760 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -13,7 +13,6 @@ LXC_DEPENDENCIES = host-pkgconf
> LXC_INSTALL_STAGING = YES
> 
> LXC_CONF_OPTS = \
> -       -Dapparmor=false \
>        -Dexamples=false \
>        -Dman=false
> 
> @@ -21,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> LXC_DEPENDENCIES += bash-completion
> endif
> 
> +ifeq ($(BR2_PACKAGE_APPARMOR),y)

           ^^^^^^^^ This option doesn't exist, so this never triggers.
           The option is named BR2_PACKAGE_LIBAPPARMOR.

I fixed both issues and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
