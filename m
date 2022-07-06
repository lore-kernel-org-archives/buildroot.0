Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB9DC43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C95540B67;
	Wed,  6 Jul 2022 21:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C95540B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JV2X6vhB4Zno; Wed,  6 Jul 2022 21:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32DBD403E2;
	Wed,  6 Jul 2022 21:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DBD403E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54D2A1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 214CA40278
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214CA40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZTdl9Klht5N for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:17:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0B14024D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF0B14024D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:17:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00AB1240002;
 Wed,  6 Jul 2022 21:17:53 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:17:51 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220706231751.207dcbba@windsurf>
In-Reply-To: <20220701214247.97032-1-bernd.kuhls@t-online.de>
References: <20220701214247.97032-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wB/YDOuaHNVltN5Fgz8IDT2EZd4wGwYhh45Vnl5EhbE=;
 b=ZdP32ialrgGVWf71+eRRKXD+3r0a7ji2vu+l9TcJSRvfPVcsiqCtS0kRE7K+H+AMk6zmMb
 7j3J6ZtXPbl7lo3CLgEDFf6P03lkTv3YsK3O62LxMGBG58eMWiW1Ho3IJfON8kxhVr14KR
 hWGRkt6OAqpabTF8ahxyurIsm0wJmdr3yQXBMXBsZi/kI41uyy7/kl8wcrKSnt0K09s3Uc
 duHAliDZ/dsJf/rSBK/RXIqIS5fCrqJxfxW34NmM2BCXf9ghQ2McSkO8oZDAjBcwiFh29J
 sS3TNh5Ei1Z3m/j+OaBvPlTqPKgTcWrYUoet73czCKCneqLWBMY2TgWqjtjm1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZdP32ial
Subject: Re: [Buildroot] [PATCH 1/4] package/libva: bump version to 2.15.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  1 Jul 2022 23:42:44 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://github.com/intel/libva/blob/v2.15-branch/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/libva.hash | 6 +++---
>  package/libva/libva.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
