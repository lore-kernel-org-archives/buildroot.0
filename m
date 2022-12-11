Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57658813D9;
	Sun, 11 Dec 2022 13:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57658813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZZZC39sWAiA; Sun, 11 Dec 2022 13:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FA181388;
	Sun, 11 Dec 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FA181388
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1E51BF3AA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECAAC80C64
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAAC80C64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sGtk6w7josR for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:34:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB46780BE0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB46780BE0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:34:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 952EC1BF205;
 Sun, 11 Dec 2022 13:34:11 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:34:10 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211143410.18339b46@windsurf>
In-Reply-To: <20221208211722.4101146-1-christian@paral.in>
References: <20221208211722.4101146-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670765651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoDmeCESdUXZJx4gNQDOfiA0ooHzPb3YwisQfQo3IYc=;
 b=G0rAsG8tue3mSUe6w5j4vEWY1H3CK1n8VEJO6NkXEW9drqTDEwc5c1R4G+nNsSjsASmKiV
 SrcHpd+WdDp8BN6rygNvG51zYrJw9ZymiJjGZ4QhzC4O431KPw9jEJ49DiS884iMnJU0j4
 K4y54gW0WsvFnUTJOhaht/nIq0ZvU6YnweV3vsYQlIhZ5FpX+70rtNjZsaVoIjKxXGSHX0
 NvXJ5UPVo58/51HIC4KxaAK+iZXLxVAiJOgsHUBXTJJBVyHjyB2P20G7YtlI8PfrpG6I4n
 32+M4CBPFqh/07vfYCQavFjGEBjQlD9QFMPG7ORfsSdX2koICPLUftXOgSOnFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G0rAsG8t
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.6.12
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Dec 2022 13:17:22 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> CVE-2022-23471: https://github.com/advisories/GHSA-2qjp-425j-52j9
> 
> and other bugfixes, see:
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.12
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
