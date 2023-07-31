Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BDBC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AE6240BAC;
	Mon, 31 Jul 2023 22:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE6240BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuVbByzryYGD; Mon, 31 Jul 2023 22:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93E5440514;
	Mon, 31 Jul 2023 22:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93E5440514
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C047E1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A081240352
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A081240352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-corPTfe5eo for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:40:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 370DA40147
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370DA40147
Received: by mail.gandi.net (Postfix) with ESMTPSA id 051E81C0006;
 Mon, 31 Jul 2023 22:40:19 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:40:18 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230801004018.7d5a5089@windsurf>
In-Reply-To: <20230718112142.1a5f19e6@windsurf>
References: <20230716165857.438323-1-bernd@kuhls.net>
 <20230718112142.1a5f19e6@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690843220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXWxumhRt8tMLPR9U36I0LT2XX0kl/xdC/5P0V1e/NQ=;
 b=iV1+1OHYhoOnL1p2q6V0meEBrE805QyqrknUJxvMeessQzXH0Ll47TJKrv20wmKqg+eU7z
 gZkqoPoLAd3bWgtPlwcZh6ZUI2vwFB+KRDjAz84XXXBCQ+dXjYHXaBxI7tYzF5fpX3ybKy
 aReBZWyAzJEubOqllZhct6e8FJ/y9Dp4a+oW6t+DtI7k2bERlgZL/6d49VaRjSy1l7N7ZV
 lJcscQ08qtUI3zlsV6bP072j+6F8eCouLvD+T6tROUQloSTqO75hyvfQD54UlDlozVotyP
 vy7xbgGiBpzbUr5sJeVd5UfIvoLBZGPYe0m3QPLa51+tX4YEloYKvo7ufVdJTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iV1+1OHY
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: fix build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue, 18 Jul 2023 11:21:42 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Sun, 16 Jul 2023 18:58:57 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > Disable unsupported options.
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>  
> 
> Which autobuilder failures, or build issues is this fixing? A bit more
> details in the commit log would be nice :-)

Could you provide some details, so that we can merge this patch? Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
