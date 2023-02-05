Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F9EC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590C481098;
	Sun,  5 Feb 2023 12:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590C481098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id domN9x2Oe5FS; Sun,  5 Feb 2023 12:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB98681200;
	Sun,  5 Feb 2023 12:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB98681200
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6C361BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5AA81298
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5AA81298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB6Sig1tpjJg for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:16:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A73E80D50
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A73E80D50
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:16:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A03B8100003;
 Sun,  5 Feb 2023 12:16:00 +0000 (UTC)
Date: Sun, 5 Feb 2023 13:15:59 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230205131559.6f79944f@windsurf>
In-Reply-To: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
References: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675599361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cya/8gMLuXMALXeKlXkuZHQnldcmvnpZ94M0hFgYgsE=;
 b=Bw+ulCV/Up4/VrGhhu4Lju2w8vKB1yQuJmSDUAuadpJkaoVgP1Eu0JrSo1a6kU9NO6IvRe
 tsjsvTPS0054IWg7fG8E9ryP4Cm2CzuId6UvatlZWK/hiq2SwCVCqSmXdHXomDSLtqsBCr
 GVi3dts3Ar2ys8qxs6wS/KAqXV23ySs076dBLjiqO6BAg1t9I69TcEx6lNqW3+dWZNxhND
 QTU1d9pUTw+uxN3wu4MJj4mrRy2451uy6M7ZvS1/Q5JnOhXqcB/b7F37//xYnsOG9Y7+6c
 2bh3NZuSlT1fQrShbIPxbzNI+Gk2XKnyh2Ep+4ZqA1NWpizmVQwKk+5/psgXpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bw+ulCV/
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: extend gcc bug
 43744 to every sh architecture
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Feb 2023 16:42:38 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

It would be nice to have a non-empty commit log, which explains which
other CPU is affected by the bug, and perhaps a defconfig that exhibits
the issue, or something like that.

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
