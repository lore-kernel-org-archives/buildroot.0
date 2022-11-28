Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006ACC4167D
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 09:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631D9410B8;
	Mon, 28 Nov 2022 09:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631D9410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbaZsDjUdVng; Mon, 28 Nov 2022 09:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495C541516;
	Mon, 28 Nov 2022 09:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495C541516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36BE51BF3C8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF25581E09
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF25581E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36AszOl9rais for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 09:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FDD81DF8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99FDD81DF8
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:55:39 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9030140013;
 Mon, 28 Nov 2022 09:55:36 +0000 (UTC)
Date: Mon, 28 Nov 2022 10:55:35 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221128105535.5a2c0798@booty>
In-Reply-To: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
References: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669629336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZKAOg5VJ6yPLs3kpPY2ABQ1nWobLwh4no/zDWWNL98=;
 b=TwjZaPhKMt/x0bVBLffz/EYMQpT6KP3FAfkaL1nI8f/fBJI63WLoYSmrkNn3Ulv5LbX0tl
 3aXy6LjxQ2JZziI8VyoFM+fLw8n77pb0w9ddWLiEKntJlnOktNwmve2NMJI8MX5xNVd0Zp
 qK3o8x3aQWgZNQMrI7I5Iafcl8SsxfeZX1RE9Apt6AX4c2SzA83gY6YUf2PhwkqnG65XnW
 q03Sq1hA+k361E0GaCIfwfinyqY23YnqHirxJJNvRje2wTbIpZMF/9cxVUfE53/8mY5G6k
 l9KILPrmO91RUWPdwMMTWE9QBu34HfL+MlYBALyBYDyNaEdJBO5q9nfd+OkVMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TwjZaPhK
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure on
 PowerPC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Sun, 27 Nov 2022 14:28:55 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch(pending upstream[0]) to fix build failure with PowerPC due
> to a package re-defition of get_ra() that is only defined in Linux PowerPC
> implementation.
> 
> [0]: https://github.com/lwfinger/rtl8188eu/pull/432
> 
> Fixes:
> http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...uild-failure-on-PowerPc-architecture.patch | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> 
> diff --git a/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> new file mode 100644
> index 0000000000..b16a312c7e
> --- /dev/null
> +++ b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> @@ -0,0 +1,106 @@
> +From 2a91a721d634a2eca131628b5c9c028af20037af Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 27 Nov 2022 14:20:43 +0100
> +Subject: [PATCH] Fix build failure on PowerPc architecture
> +
> +In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
> +that has a completely different purpose. So let's rename local get_ra()
> +to wifi_get_ra() to make it different from Linux's get_ra().
> +
> +[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm
> +
> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/432
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thank you!

I have posted some change request to the commit message on your patch
for upstream, but the patch content itself looks good, so I guess for
the Buildroot needs this is enough:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
