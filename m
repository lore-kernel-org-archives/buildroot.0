Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BEFC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5D7881F0C;
	Sat, 29 Jul 2023 22:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D7881F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOwMIYb6GNXY; Sat, 29 Jul 2023 22:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AADD81EDB;
	Sat, 29 Jul 2023 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AADD81EDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE201BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 596E360F69
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 596E360F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPngFChrMvdI for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:08:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B19260F68
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B19260F68
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A7840002;
 Sat, 29 Jul 2023 22:08:52 +0000 (UTC)
Date: Sun, 30 Jul 2023 00:08:51 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230730000851.6faa3391@windsurf>
In-Reply-To: <20230501123211.18167-1-buildroot@heine.tech>
References: <20230501123211.18167-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690668537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4q4RUqY4+WJUO2o+0WqADw45HJ9+2vYKz1XNc6kJDE=;
 b=lHifowp0wYvVOeWXaCw/HOldW85fBQ9wSpJaxYTgKRYCuVZW8rJT1bBQcG8znTWUw7dGrT
 ZqZD1JHqRVvAYYWw6yW/bUKwacHGacTxlWmUTkVW3z1Cjamwkn4aQVNCMGHS5C7Ypdyc8R
 if9fp9b+UEUi0ogo3Xv2feTjdyPbNjIrRQgp1O6CUA9cfoJ2TMSrUPgxr+7aPpnS+8yHlv
 KRYkjMQ7uHAPtRyBdH4T+8R+wkbDnem54GKDodnIuyCCSaibcpp9Fg3GS7uI1H23wDBlZE
 W09hkcOjQwQ7QRWzGkMAPhqcBPKoKc2TMzjlmnJrJ93+wxH0KxAngI2P6YbaWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lHifowp0
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: fix NEON build with
 gcc-12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Mon,  1 May 2023 14:32:03 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> since gcc-12 gcc complains about attributes in between decl-specifiers.
> This code is NEON specific so it should not appear on builds for other systems.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Could you provide in the commit log a defconfig that exhibits the
issue, since there's apparently no autobuilder failure for this issue.

> diff --git a/package/wpewebkit/0002-change-position-of-alignas.patch b/package/wpewebkit/0002-change-position-of-alignas.patch
> new file mode 100644
> index 0000000000..5a1564c4c1
> --- /dev/null
> +++ b/package/wpewebkit/0002-change-position-of-alignas.patch
> @@ -0,0 +1,33 @@
> +From e2a3e36c8df59d83de0a48b806cad5bb5515a658 Mon Sep 17 00:00:00 2001
> +From: Michael Nosthoff <michael.nosthoff@iba-group.com>
> +Date: Tue, 18 Apr 2023 19:47:03 +0200
> +Subject: [PATCH] change position of alignas
> +
> +fixes:
> +Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error: standard attributes in middle of decl-specifiers
> +   38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
> +      |        ^~~~~~~
> +
> +on gcc-12
> +
> +Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

We need an Upstream: tag in new patches, so it really needs to be
submitted upstream.

Adrian, could you provide some guidance here?

I guess the ultimate upstream is https://github.com/WebKit/WebKit/ and
then changes in WebKit at some point get propagated into WPEWebkit?

Could you submit a pull request to upstream WebKit ?

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
