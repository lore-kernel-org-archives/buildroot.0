Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC67C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F00401ED;
	Wed, 20 Jul 2022 11:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F00401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UL8VRjkEt6uR; Wed, 20 Jul 2022 11:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B7840396;
	Wed, 20 Jul 2022 11:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B7840396
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5721BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 278F68266A
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278F68266A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IvbPhHgsGFK for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:51:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98CE8828B5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98CE8828B5
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:51:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7353260004;
 Wed, 20 Jul 2022 11:51:54 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:51:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720135152.0b3508cf@windsurf>
In-Reply-To: <20220707054948.479212-1-fontaine.fabrice@gmail.com>
References: <20220707054948.479212-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658317914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jUPQuPUIS/5qgrf4RHeKIJRemGrACIQnAMX61lds/c=;
 b=Myt0uuUWhirOlYNTCDjNHGwUGE/cyDEyu6ZDN50ESrrsITBBZvnrwIt2ONy0ct9Hx5mEqN
 JPYgiY6iS76vVk0OkU5/NGel5uy8OO1hEMitE/zBTq5ciKpfzDkoOzqpq1W6aiZS3USiyA
 Ikba9u6s2P3uP+3avfVKU/BOAyTgTRcHd4hjd3twmOj5arVNWd5BXE3e9s3X9WU3YgKcLI
 dHHfxz2FVi8STpzOh8cZe0NQi9azpMB3821kScpbbBnoOXM+wAWfICRc214JHIECTABBeJ
 ySUtn8qC4kSr3/IN4FaHmbSnR9aNooMDPo57oJR2UZbfG2IRqgvZbJY4NOC27w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Myt0uuUW
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libopenssl: fix BR2_OPTIMIZE_FAST build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  7 Jul 2022 07:49:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop unneeded SED hacks (including build_tests) to fix the following
> build failure with BR2_OPTIMIZE_FAST:
> 
> In file included from crypto/async/arch/../async_local.h:30,
>                  from crypto/async/arch/async_null.c:11:
> crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
>    32 |     ucontext_t fibre;
>       |     ^~~~~~~~~~
> 
> While at it, also "drop parentheses as all it does is spawn a useless
> sub-shell" as noticed by Yann E. Morin
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3ce202f11a821940ff55eafa1dc7cea54b8c0da2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Drop SED hacks and useless parentheses

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
