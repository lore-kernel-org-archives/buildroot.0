Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCF4C27C76
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CD6E81E21;
	Sat, 28 Jan 2023 20:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD6E81E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6ugAkkK6yuv; Sat, 28 Jan 2023 20:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF37C819BE;
	Sat, 28 Jan 2023 20:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF37C819BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3C91BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 050B940447
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050B940447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EexYO0vi5ZmK for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:02:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0757B40137
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0757B40137
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:02:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A49431C0006;
 Sat, 28 Jan 2023 20:01:58 +0000 (UTC)
Date: Sat, 28 Jan 2023 21:01:57 +0100
To: Jerry Kooyman via buildroot <buildroot@buildroot.org>
Message-ID: <20230128210157.0b13b413@windsurf>
In-Reply-To: <20230125182818.566214-1-jerry.kooyman@entrust.com>
References: <20230125182818.566214-1-jerry.kooyman@entrust.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674936119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ua+tRfi16+G6aIdlQrAswtSJoCCpHkNi7bbshRDX8n0=;
 b=ewEnY4Aklj8HKwEQMmX3rBgeSrFxkJStmJhm54aDBKz4uUKZYwqm1c/iKnGA5HY2lzFkbs
 w9DGMEYgu7vhda4XCIIB12CdxtuA2C/pDrN10NX/zXcpPdq5UBWfB/tqvJXNcYWn6Dqeqy
 MIna2Qg08mBF5MH2GYPUDJy7iLtxS0GHsfoZoF/vUbnAB8c+gPqzBMoPPLs5sURRg/z9id
 mj9S382lgOU/aEQBHAfV2CxvcGlaKz514qcmmpE5MwOyUy4Y74/2b8BPqBfnKImeX6/MJY
 R9+Obm8v+ukUkaYVRMF6CJ/4llzaMYkTZMl7yPwSvoV9VpLei6W9ltyW8+0bjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ewEnY4Ak
Subject: Re: [Buildroot] [PATCH] boot/uboot: add BR2_TARGET_UBOOT_NEEDS_XXD
 option
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
Cc: jerry.kooyman@entrust.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Jan 2023 12:28:18 -0600
Jerry Kooyman via buildroot <buildroot@buildroot.org> wrote:

> From: Jerry Kooyman <jerry.kooyman@entrust.com>
> 
> A host dependency to xxd is required if the U-Boot board
> configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
> introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_XXD
> to solve this problem. xxd is provided by host-vim.

Thanks, looks good, but we need your Signed-off-by line here. Could you
resend with your Signed-off-by line added?

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
