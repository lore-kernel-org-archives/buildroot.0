Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF9C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BACC40E5A;
	Wed,  5 Feb 2025 12:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyxnkDsb5Lje; Wed,  5 Feb 2025 12:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB0B41766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB0B41766;
	Wed,  5 Feb 2025 12:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5C312F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1CBC40E5A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ib-wZB5rWNpI for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39641417EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39641417EF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39641417EF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4607E44288;
 Wed,  5 Feb 2025 12:05:09 +0000 (UTC)
Date: Wed, 5 Feb 2025 13:05:08 +0100
To: arnomessiaen@gmail.com
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20250205130508.0f0d2f78@windsurf>
In-Reply-To: <20240110163726.447025-1-arnomessiaen@gmail.com>
References: <20240110163726.447025-1-arnomessiaen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghrnhhomhgvshhsihgrvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghsrghfkhgrjeesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738757109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQJlhJVpDjl3uW2kCddFxJPGFAcEEfX5J5XU1Ro+WeA=;
 b=MStaxTrF78fCz0MjMnKpMDNeew5uCavWtXCKPVCWUmh+t/G38kIzJ7Wfp9CqIXUbae0fSV
 Bu/iQzdQLu6Kb3/TX0czx8AwBHPKJH+2bHD4iC+nx/kkprIh7wKjmMDNL5w7kazgjSlJEm
 nO3FkOU2AsTrD4aksP8ic5dUik6nKZl8DipgBnDWr9zAR0OSlmL4yKOfQnSoj6LaJ5OxYe
 3fxZ+qlBh+pL23Z27H5aPl+YQ7db9nDxFfpP+iEQ540PJKjm4uLYUiXqEMpCcLkaqda1ja
 3ygX5ezNk9JqzkwNZiGyB3eiOOrsTbNYt94CZKGJxIap2OqPhZGGX65jTrOXFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MStaxTrF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse-client: new
 package
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

On Wed, 10 Jan 2024 17:37:26 +0100
arnomessiaen@gmail.com wrote:

> From: Arno Messiaen <arnomessiaen@gmail.com>
> 
> This patch adds the python-aiohttp-sse-client package to buildroot.
> This package adds SSE client support to the aiohttp library, as
> opposed to the already exising python-aiohttp-sse package, which
> only adds sse server support.
> 
> Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>

Sorry for the delay in getting back to you. I have applied your patch
after a few changes.

However, it would be great to have a simple test for this package in
our test suite at support/testing/. Could you have a look at doing this?


> diff --git a/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch b/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
> new file mode 100644
> index 0000000000..96289797f1
> --- /dev/null
> +++ b/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
> @@ -0,0 +1,37 @@
> +From fdba1f12843d0fdbd5094144a8081244b71b2cf0 Mon Sep 17 00:00:00 2001
> +From: Arno Messiaen <arnomessiaen@gmail.com>
> +Date: Wed, 22 Nov 2023 08:12:08 +0100
> +Subject: [PATCH] setup.py: remove pytest-runner requirement
> +
> +setup.py: pytest-runner is not required to install the package
> +

This patch lacked an "Upstream:" tag. Which in this case contains "N/A"
as this is really a Buildroot-specific packaging tweak.



> diff --git a/package/python-aiohttp-sse-client/Config.in b/package/python-aiohttp-sse-client/Config.in
> new file mode 100644
> index 0000000000..a4f6a14060
> --- /dev/null
> +++ b/package/python-aiohttp-sse-client/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_AIOHTTP_SSE_CLIENT
> +	bool "python-aiohttp-sse-client"
> +	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime

I've added:

+       select BR2_PACKAGE_PYTHON_ATTRS # runtime
+       select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+       select BR2_PACKAGE_PYTHON_YARL # runtime

here. Indeed, while they are implied by aiohttp today, this might
change in the future, and those Python modules are directly listed in
aiohttp-sse-client's setup.py.

Thanks, applied with those changes!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
