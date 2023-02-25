Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49BAC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECC940BB2;
	Sat, 25 Feb 2023 09:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ECC940BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQCMGAPs_my9; Sat, 25 Feb 2023 09:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0C740BCD;
	Sat, 25 Feb 2023 09:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0C740BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02CA81BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C34C881ED4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34C881ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcgA_YyAKWQm for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:52:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBF081EBC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADBF081EBC
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:52:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B503EC0004;
 Sat, 25 Feb 2023 09:52:26 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:52:26 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225105226.0e62e4cb@windsurf>
In-Reply-To: <20230223225942.313435-1-fontaine.fabrice@gmail.com>
References: <20230223225942.313435-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaNhJ68EdVcM7CpAcEqjecnhi0bSWU+7elxf5Ddxo5g=;
 b=JqUnp1FrVJqm5Ct1bxWVu6TeJQWeyxfgy6dL38hPxTj1y06JChSPrO9z4eK1wZoaHJY0d6
 ZQaeJEUtPLkUg4w5A3n22BRP3Ge+VPpSCrljUx2qqJ0NwJiz8pZaSOOjyz99RpwAvxfzUI
 cx/D9sXytDMMFr1uUS9ggkj0k9S/WcG+udESTshhizSd0JPa+uXSCCG24byN6wiOH4d04i
 HwsMihRDUys8SCeH9x5bTYWr7OZ2EBnWomIR4SidClwH9UwgsOk4yVH5JbK8tptsCaZig7
 J3Q+AuaS4YxzkNuc6BNfKKHxYMuctGyYOsmhOaeh8zlFwuZSMA+EA3jYK/lYJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JqUnp1Fr
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require MD5 perl package for netsurf
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Feb 2023 23:59:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure:
> 
> Can't locate object method "hexhash" via package "MD5" at utils/git-testament.pl line 47
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3dddcbbe7f6ecae5a2db6fac11fb659719452f73
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 4 ++++
>  1 file changed, 4 insertions(+)

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
