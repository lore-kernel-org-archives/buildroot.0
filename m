Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744CCC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 08:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C39D6078C;
	Sat, 31 May 2025 08:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r56u-QTL1uVM; Sat, 31 May 2025 08:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AC4607AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AC4607AC;
	Sat, 31 May 2025 08:26:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86FF1117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D06C607AC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lvD5r4eYSik for <buildroot@buildroot.org>;
 Sat, 31 May 2025 08:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 497EB6078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497EB6078C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 497EB6078C
 for <buildroot@buildroot.org>; Sat, 31 May 2025 08:26:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B4CB43122;
 Sat, 31 May 2025 08:26:23 +0000 (UTC)
Date: Sat, 31 May 2025 10:26:21 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
Message-ID: <20250531102621.043c9e75@windsurf>
In-Reply-To: <20250516074455.1473051-1-adam.duskett@amarulasolutions.com>
References: <20250516074455.1473051-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrsggvlhhishhkohesohhpvghnqdhnrghnughrrgdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748679983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQAZpjAvxIPzkcrJDDzy+c2k63nl0rpTdtT8GGyaTyc=;
 b=YwreieACkudFrsswca82llja4I0qNyqibfrdfpCjAs2QbGWO2fjqO8YJt4aB4n1UOCbTJN
 kktsKZj+AiBcNXRctBsBmuJ49t5ciVc7PHea+xlL3Cqyo+ImeSgzjkls2QjBHvQ0tQmqNg
 ZimLfdXujUQI/GAfyWjdEPiL8SZz5KSE3nTAah+O0hErzthVBdpKcosTsSv/evsHoWcEHW
 S4oaNKTMi6fjoJ7vwHKCxwybNdW/OZQl5o+qC6ljoTMskSvt5RZ19wLApWXsrbNFHfY1TY
 Nt35lstJIyLF22OZa+uRJCsRTipUzAQCW9IJdhdXlBR2DOL5w03JJr0Kk4GxvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YwreieAC
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: bump version to 126
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

On Fri, 16 May 2025 09:44:55 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Drop the -Djs_engine=duktape option as mozjs support has been removed entirely
> and as such, the option no longer exists.
> 
> Tested with `./support/testing/run-tests tests.package.test_polkit`
> Both tests pass.
> 
> Also tested with `./utils/test-pkg -p polkit -a`
> 40 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/polkit/polkit.hash | 2 +-
>  package/polkit/polkit.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
