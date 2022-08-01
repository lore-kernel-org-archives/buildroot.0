Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7040CC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 024C6812E7;
	Mon,  1 Aug 2022 20:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 024C6812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beC-BoKZifRb; Mon,  1 Aug 2022 20:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3612A8130D;
	Mon,  1 Aug 2022 20:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3612A8130D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11ECF1BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11B640261
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11B640261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5p6W9SADlod for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:53:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E52840348
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E52840348
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:53:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B1BB1C0002;
 Mon,  1 Aug 2022 20:53:26 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:53:25 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220801225325.38391fe1@windsurf>
In-Reply-To: <20220727081953.38627-1-ardeleanalex@gmail.com>
References: <20220727081953.38627-1-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659387207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lpzEY1Y6tLpBeNzbZlZab4TUUB6wYeZMUyEZHBC8ig4=;
 b=ehqWs1pqnR2OYEHXyXLiEfmG2BKEUGyVJrlk4zwJ23nSInq7P0gCgMwipp0UPwjgP28RqJ
 1WKgjHrOcyNHs6qy2oQP5A4+opKEiKnpEiZ0F6PfPPrKt0tbhCBAFfDGSeZEenJWq7q5gq
 Ge+zvDoJXfuJ40O9cHuzhNJIxLNZJpnLvzDsbdSqGvWYoy0ht1NCmuh2zxhSi8+p+dEK+q
 HDvO4qQQqjfqoeNC5zTW33kVEwmgntrHw3lN9ygm7KFmVJBKZZoanLm5eDPkERVCfbgbYD
 TholJxjK6tSElCp+Y9hkkzH7CZfER/n7vtkCsa7AxJNxg+enQBo3fGAKOWUMUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ehqWs1pq
Subject: Re: [Buildroot] [PATCH 1/2] package/cog: add udev dependency to drm
 platform support
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
Cc: aperez@igalia.com, michael@nosthoff.rocks, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 11:19:52 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> The DRM platform support already has the 'BR2_PACKAGE_HAS_UDEV' symbol in
> package/cog/Config.in
> 
> We just need to specify 'udev' as a dependency in the cog.mk file.
> The udev virtual package is pulled by libinput anyway, but this makes it
> more explicit.
> 
> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
