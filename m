Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E0C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 08:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B3A838B3;
	Thu, 21 Dec 2023 08:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B3A838B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrbDdi6kM962; Thu, 21 Dec 2023 08:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5CE8386F;
	Thu, 21 Dec 2023 08:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5CE8386F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0687E1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C90F143753
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 08:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C90F143753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HdqUYQBMJo1 for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 08:32:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F68B4367D
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 08:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F68B4367D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBB9C0008;
 Thu, 21 Dec 2023 08:32:00 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:31:59 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231221093159.6f50cc83@windsurf>
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703147520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8uOoZZAH11cJ8YwVVLhWfmzVGroZX30UwMtaCS4ZZ0=;
 b=hMcjGMGDO7sRIWjX63zy3Ax+RXArLm6PObIBlmK+sfDKroducivCi1Q9fHmvS+W5MTtGd0
 dkixf5QWZbZdjeww0CLL30qBlR6TaLT2Lt5k4qayRzEH8qhWZQqegllKveoA9IdEWj/m8w
 KH8hc/P3QwLUKbUY3pegupP2E38JgUsJgVcUUa1XGqwV4LAfa2Dw3o9jDYJJ6Isg3TjRc7
 7F2D75Qsp6NF7ks8P3kh9bWTJwLdMd7c17AHHOloRpw504m/9qs7Pu3W40xUOOp7F8O9u2
 Qp2ANvCNTtJv05cq7ppmeJTyrGBynzuopkSaMVpdYmfmdFpRINNt9iHuXrF27g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hMcjGMGD
Subject: Re: [Buildroot] [PATCH v3 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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

On Wed, 20 Dec 2023 17:19:15 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> As per backend/drm/meson.build:1-7
> 
> hwdata = dependency('hwdata', required: false, native: true)
> if hwdata.found()
> 	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
> 	pnp_ids = files(hwdata_dir / 'pnp.ids')
> else
> 	pnp_ids = files('/usr/share/hwdata/pnp.ids')
> endif

But does that mean they are actually used, unconditionally, by wlroots?
Yes, this sets a path in meson, and then? Yes, they *might* be used,
but how mandatory are those pnp.ids?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
