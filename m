Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0334C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08128295A;
	Tue, 21 Feb 2023 08:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08128295A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ze_t8CPGww_E; Tue, 21 Feb 2023 08:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01AB18293D;
	Tue, 21 Feb 2023 08:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01AB18293D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFA8B1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC35342D20
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC35342D20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuSa1eS2t6yX for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:40:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6259042D1B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6259042D1B
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:40:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1CCB54000F;
 Tue, 21 Feb 2023 08:40:50 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:40:50 +0100
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20230221094050.22a51eb7@windsurf>
In-Reply-To: <20230216084714.85507-1-nolange79@gmail.com>
References: <20230216084714.85507-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPZDAWD7O8jy9iyd3Z+RRo21X3ZHheN40TEfRMgQ4r8=;
 b=ipY4BX4iVAD/IahQTGLHIs0wXH2BNflJvU3IB7LE8AS2e1AqVQoMZsucg+2Ialwv9ToJa1
 RiX4jECNLJEChgQwhzMoVImQrz5K9WyGVwtjirMqExxL80KlCpvYPDdgqqX92RSGAKK7dU
 laok4DcEFYV+1DgPfUAQzNoJbCovRdj5NBrIuqj2o32huO1bJIW8kzYDbs0VRpgf0zsV4l
 bM93y4qKLcLJKOli66UeNzfwjQQhdfKtmZN/1qMCIavoQmS9a9uzWtn0hlBndpUnSxh+Fp
 WaQl0MlnqzNxlLfgYjX2pn1gSevEv/esd6RRJVyxd7H/3RGcaeILwa+NHieDyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ipY4BX4i
Subject: Re: [Buildroot] [PATCH v2] package/zstd: bump to version 1.5.4
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 16 Feb 2023 09:47:13 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> The LICENSE text has changed, nominally the copyright owner changed
> from "Facebook" to "Meta Platforms, Inc. and affiliates",
> reflecting the name change of that company.
> 
> Add upstream patch to fix zstd-dll build.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2: recreate upstream patch with git-formatpatch
> ---
>  ...-dll-build-missing-dependencies-3496.patch | 321 ++++++++++++++++++
>  package/zstd/zstd.hash                        |   6 +-
>  package/zstd/zstd.mk                          |   2 +-
>  3 files changed, 325 insertions(+), 4 deletions(-)
>  create mode 100644 package/zstd/0001-Fix-zstd-dll-build-missing-dependencies-3496.patch

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
