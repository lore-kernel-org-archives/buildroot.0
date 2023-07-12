Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53866EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 14:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B79BE41516;
	Wed, 12 Jul 2023 14:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B79BE41516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13yCPRdoTaSu; Wed, 12 Jul 2023 14:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F4040B9C;
	Wed, 12 Jul 2023 14:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F4040B9C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60D811BF97D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 14:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D27141936
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 14:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D27141936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Av6wR9CdQV3n for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 14:40:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5A5418E4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD5A5418E4
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 14:40:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83E506000C;
 Wed, 12 Jul 2023 14:40:09 +0000 (UTC)
Date: Wed, 12 Jul 2023 16:40:08 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230712164008.72db3693@windsurf>
In-Reply-To: <7230b196-162f-c7f6-bced-47fcc7d4979a@smile.fr>
References: <20230611115748.801929-1-romain.naour@gmail.com>
 <20230712120557.143513ff@windsurf>
 <4be832e6-521d-67a7-17c0-6f3bcac3587b@smile.fr>
 <7230b196-162f-c7f6-bced-47fcc7d4979a@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689172810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXO2U7FriNqqzrv/0N6GOreYfi034bGIHlTxOh9qLRE=;
 b=DrPfXWxZFcc1r9wlveuX2jViVXGwlA7/Ru9aj4PJ4chEKT6IUZaPMRM0P7bLshvJV0tQwu
 HZdziTBrVq22q8cFN6Yd02rI8KFo9CbXEhrQeuBYNvKs2vVtKM498aWwerS6HKRL/LLmjU
 UVubOHuY8YRdtDJD2DmOW3Uu+tVlmfMRbCkahBzZEYpJxiEwwe6+n33r8+d+WBV9dzwdnf
 G66lESz6nsLeAG2Kro2GhibL+8RP1/5bXXdu4OxJDjIYHWn+DZJR2fGET0i/wSMLitMpbA
 R5ADTTn0Igz3x9gVWRRepXBFIL7yb8qDmFJ+XzpcHXBDOF2+X2q5fEuJ9BqH6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DrPfXWxZ
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestGlxinfo: bump
 kernel version to 6.1.x
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Jul 2023 16:09:38 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Indeed, reverting the mesa3d-demos bump fixes the issue.
> The glut library seems not correctly detected by this new release.
> 
> mesa-demos 9.0.0
> 
> Run-time dependency glut found: NO (tried pkgconfig and cmake)
> Has header "GL/glut.h" : NO
> 
> mesa-demos 8.5.0
> 
> Run-time dependency glu found: YES 9.0.2

So it's a regression caused by commit
80304d9911f34f8a0173a4f37d52f93177478cc7 from Bernd. Bernd, could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
