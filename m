Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A923EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9311283CD0;
	Thu, 17 Aug 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9311283CD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fulQOyjtzISP; Thu, 17 Aug 2023 10:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2DBF83CCD;
	Thu, 17 Aug 2023 10:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DBF83CCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA1521BF2EF
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 10:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EEC441824
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 10:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EEC441824
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dX04lZOTy50H for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 10:25:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CF9141823
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 10:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF9141823
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC5E7240005;
 Thu, 17 Aug 2023 10:25:27 +0000 (UTC)
Date: Thu, 17 Aug 2023 12:25:27 +0200
To: Javad Rahimipetroudi <javad321javad@gmail.com>
Message-ID: <20230817122527.135f953e@windsurf>
In-Reply-To: <CAL245auhJf41LJk6b38DSqWVOSVM5qi+aLdOwNDmCuwab7fEXQ@mail.gmail.com>
References: <20230315091729.1771792-1-javad321javad@gmail.com>
 <20230809233822.334dbbb5@windsurf>
 <CAL245auhJf41LJk6b38DSqWVOSVM5qi+aLdOwNDmCuwab7fEXQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692267928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2NNlUaprKppKyQ+0d3B91ffgNGfPPGjrpes6Gr96m8=;
 b=YTr6d1oWQNMd2OwcrVNopSipdDmpQdPldNoqSs9OAYD9wiNTltKU9WJQC5DXhen2dBy5/H
 Bgr8DTobBCx5SZKc4N3xF1QYMCdtlC1HB9iGSTX1WJN2MVnn+/4J6/yM4OasD8RvHBI8VS
 /k2zEKdNmPMrmSrxW3I8e85CZZS0wMXS4kW/Upt3RGODqm6LtocKnxt/z2QH/9PpnGGOOf
 0OQL6bwLRLSDGMVLGDKJ3J0kOfKqzTeUrSMUSW5cgepptvkeHplxvN/lvTVop1Esv7w+CL
 c9IKAxve2QqAT6ja3Krpu1Zoddv17jgT+l2lZuITOtFL/3rvKxSozBv2Gr2eoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YTr6d1oW
Subject: Re: [Buildroot] [PATCH 1/3] configs/orangepi_pc2: add board support
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

On Mon, 14 Aug 2023 09:33:59 +0330
Javad Rahimipetroudi <javad321javad@gmail.com> wrote:

> Sure, I have updated the kernel, TF-A and Uboot.
> However, I have faced a problem with "/dev" management after upgrading
> the packages. When it is in "Dynamic using devtmpfs only" mode, no
> kernel module is loaded after boot. But in "Dynamic using devtmpfs +
> mdev" everything works fine. Can I put it in this mode?

Well, this is normal, devtmpfs is only a virtual filesystem that
creates entries in /dev. It is not involved in automatic module
loading. If you want automatic module loading, you need either mdev or
udev/eudev. And it's indeed fine to enable mdev in defconfigs that need
it.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
