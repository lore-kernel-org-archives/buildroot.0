Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03673CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CA384051;
	Mon, 18 Aug 2025 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hw_-4BQpVNUd; Mon, 18 Aug 2025 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3AB084038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3AB084038;
	Mon, 18 Aug 2025 12:50:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EDD5E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 12:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73BD540ED1
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 12:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9h4Ho2V5Ok2 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 12:50:11 +0000 (UTC)
X-Greylist: delayed 339 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 12:50:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97E7841DDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E7841DDE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97E7841DDE
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 12:50:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 99B764E40C03;
 Mon, 18 Aug 2025 12:44:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6910A606A6;
 Mon, 18 Aug 2025 12:44:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF47C1C228734; 
 Mon, 18 Aug 2025 14:44:19 +0200 (CEST)
Date: Mon, 18 Aug 2025 14:44:18 +0200
To: "uuidxx@163.com" <uuidxx@163.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>
Message-ID: <20250818144418.3c302498@windsurf>
In-Reply-To: <OSZPR01MB78684A807471544850FF3A6FFD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <OSZPR01MB78684A807471544850FF3A6FFD31A@OSZPR01MB7868.jpnprd01.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755521068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Pe47kz3mQLTGKlHGoXoL1TeurtX+3cU3G7bYEyReZl0=;
 b=arWjo7sH9Qi7a0TJ7IFS4o9W9Fe1/gdKVL2UKAWhQLF29lH9E6dm/jZG7q7fLy5W0m0U9j
 6/73kuRkWJgkL/6rzD3YypM8amFFYYBdUSDrEN0PeA9YJF16GegVU78gInITN1DrVzFppS
 e9/LVZK6Anu/RujE/pNMVBlrD47/QxHlkOA2X7QsQJaZ1mpkvmZJuMOli6PyRUlCW1YSiX
 ulO9BBKQhefm/R4utIuiBKCGZyN7tJyYiXVHMpUVt4uEEofF/RwvKgXyMHUar8F8f7yZrn
 5rtRotI1lSSmN5q3d0AQzKvK5UegDlV1qLQBYI06aGLqA1Ip/x/LoRtgecF3Rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=arWjo7sH
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc 15
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

Hello Frank,

Thanks for your patch!

On Mon, 18 Aug 2025 11:54:43 +0000
"uuidxx@163.com" <uuidxx@163.com> wrote:

> Sorry, I'm not familiar with the buildroot contribution process yet.
> 
> The patch in the previous version was incorrect.

No problem, but don't include such messages in the commit log itself.
If you want such messages about why there is a v2, put them after the
"---" below your Signed-off-by.

> This patch will create a patch to fix issues that arise when building with gcc15.

Could you point to the autobuilder issue being fixed by adding:

Fixes:

  https://autobuild.buildroot.net/results/a1a5aad2ccc69aeff586d7a83620f10d51ccfdb6/


> diff --git a/package/lrzsz/0005-fix-build-with-gcc15.patch b/package/lrzsz/0005-fix-build-with-gcc15.patch
> new file mode 100644
> index 0000000000..d964a1a31f
> --- /dev/null
> +++ b/package/lrzsz/0005-fix-build-with-gcc15.patch
> @@ -0,0 +1,82 @@
> +From a33f1700fb9b2af731b30468267a1693999889b4 Mon Sep 17 00:00:00 2001
> +From: Frank Chung <uuidxx@163.com>
> +Date: Mon, 18 Aug 2025 14:39:46 +0800
> +Subject: [PATCH 2/2] fix build with gcc15

Please generate patches with git format-patch -N so that the 2/2
doesn't appear in [PATCH 2/2].

> +From: https://github.com/UweOhse/lrzsz/pull/8

Please use:

Upstream: https://github.com/UweOhse/lrzsz/pull/8

Could you send a v3 with those minor details fixed?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
