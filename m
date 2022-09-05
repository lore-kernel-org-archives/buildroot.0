Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6519AECAAA1
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 07:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA3EC813B5;
	Mon,  5 Sep 2022 07:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA3EC813B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1J94UBamgqn; Mon,  5 Sep 2022 07:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA1D813B2;
	Mon,  5 Sep 2022 07:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA1D813B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF2DC1BF2A4
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D73C440146
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D73C440146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15b37oJ6Ds8L for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 07:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27564012E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B27564012E
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 07:05:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9F9FE0004;
 Mon,  5 Sep 2022 07:05:51 +0000 (UTC)
Date: Mon, 5 Sep 2022 09:05:50 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220905090550.23a2a3ff@windsurf>
In-Reply-To: <20220904190218.198854-1-christian@paral.in>
References: <20220904190218.198854-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662361552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIc3g7d90Rk3rq5uKzwwKpWBAOdpnez9U3dg0BVyR0w=;
 b=KNn++528/MUogKx/FtnbFWIS4yEkzwwKj1MRBjk3xMz+8TKvV03R1KDlkh6agVJ3i4n4ts
 4URGJYm5N09fsLDof1X64AhpfFA1A/UJUCcS//e6ghusQYinxyo0aO1XpdtV4WG0t2+LAg
 jcq29d4aPSZ2ztiwjH8sqSq4KlkgFnc52T9GdmyonQ2TdC9x1ME0SKV+ySH8fo1rCNmbPO
 EKQqDjfMqGtg2eP8+Buy6+PP4dY5L2KKPP0MTcnATPiHjLqjkLSq0wmJ1LJF1DmMf2OObE
 OY+q6F0lC5ciARELbsdvxJH7p0rPIMk8Su0r4aBIGJ+iHj4+f8y7mXDRQkyGrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KNn++528
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libyaml: add host package
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
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Sep 2022 12:02:17 -0700
Christian Stewart <christian@paral.in> wrote:

> Add a Config.in.host to enable the host-libyaml package.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Why? What is the motivation for enabling host-libyaml through
menuconfig?

Note: having a visible host-python-pyyaml package as you're doing in
PATCH 2/2 does *not* require having a visible host-libyaml option.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
