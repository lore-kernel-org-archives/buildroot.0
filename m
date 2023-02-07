Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A66C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 16:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3C6660FFF;
	Tue,  7 Feb 2023 16:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3C6660FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSjtJQBj15WT; Tue,  7 Feb 2023 16:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A2261000;
	Tue,  7 Feb 2023 16:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A2261000
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6E41BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 052BE4189C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 16:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052BE4189C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39DHauG0ztxC for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 16:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C559418A2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C559418A2
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 16:04:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5426E1C0011;
 Tue,  7 Feb 2023 16:04:16 +0000 (UTC)
Date: Tue, 7 Feb 2023 17:04:15 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230207170415.7e528735@windsurf>
In-Reply-To: <20221128123418.2197-3-tianyuanhao3@163.com>
References: <20221128123418.2197-1-tianyuanhao3@163.com>
 <20221128123418.2197-3-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675785856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfdhYLkjueqxUjmMWmK5qnj3vt7Ld51y41/H0YZlX/Q=;
 b=nKG+ItItfc75UaeltZKD3IU4oCwPp/QhPbB85z8InWOriXvbxLd3Sh/PWtdvo/oBN3AC3m
 2gGgVLlJ7QZFk5qDRBuHv3lfvPT7Og9XXJUrxj7JRGIRnjkjdo2+304bRNdI7b0CZLCCjq
 mP0lgfZGrAaOWSwShKtuu9V7Y67j2CZL0mS+xKxLfysSYm4TVIFvCGI67gKE/Pguo5fUnI
 5lWgg/fMhZsSh8GCnqtFxU2V0lEtunq4Z/Ztk6rI+ueYs+j4pN4Ljk4sSahE/xJ+3ZDRum
 EOuHE6rhQNk5z8j8FRFQLR0p2SBfHWgMtXv+bHzHgl9wJyhtDolWuGoEkAzdjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nKG+ItIt
Subject: Re: [Buildroot] [PATCH/next 3/6] package/tl-expected: new package
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

On Mon, 28 Nov 2022 12:34:15 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Required by micromamba.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/tl-expected/Config.in        | 12 ++++++++++++
>  package/tl-expected/tl-expected.hash |  3 +++
>  package/tl-expected/tl-expected.mk   | 20 ++++++++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/tl-expected/Config.in
>  create mode 100644 package/tl-expected/tl-expected.hash
>  create mode 100644 package/tl-expected/tl-expected.mk

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
