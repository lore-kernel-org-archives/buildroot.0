Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621A3C6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8EE40643;
	Sat, 17 Sep 2022 08:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D8EE40643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8F0Ud4oOtSn; Sat, 17 Sep 2022 08:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1136B4018F;
	Sat, 17 Sep 2022 08:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1136B4018F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61BE31BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAE4832E7
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAE4832E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ux9VtZs1xlw2 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065768284B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 065768284B
 for <buildroot@busybox.net>; Sat, 17 Sep 2022 08:17:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6474100002;
 Sat, 17 Sep 2022 08:17:16 +0000 (UTC)
Date: Sat, 17 Sep 2022 10:17:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220917101715.1b66b7cd@windsurf>
In-Reply-To: <20220913181852.2703410-1-francois.perrad@gadz.org>
References: <20220913181852.2703410-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663402637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLQCk66BLN3Vahb93ZHnj0UNzsoNcjg6YcV3lpaFwJo=;
 b=eZdeo2wQDOPpKJKREDU0J4UKxQYqc8Ds4Rh8TVGp/2fMPCDQVMiH6m11TF0AtawoNc++ne
 BuI0gc+DHSDuMPrKDD8uzHMYcvmcm3Qa+xlbvg1SAzURFhI1yH5AmmD57l2D/dzA4ozF0T
 1NSznHDdI4Zoy+dxq0JRhpIUKAkONY2G+Qs70Bx5VkQcFaLjqEcq72v0V5MKhPHkf+Pcw5
 aw9ntoQeiuGH5yXsfqDgBKE1m5p3PvJV1yEHGjkm5uBM+e1KEvLb5CEiICRHb5h/bVDAqk
 Ztcov3BvWhTWw+UtPK4CSyy1fBtIS85iF+HnM77OWgujO/GAfTXLEnkS/FYZjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eZdeo2wQ
Subject: Re: [Buildroot] [PATCH] package/libxslt: bump to version 1.1.37
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Sep 2022 20:18:52 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libxslt/libxslt.hash | 4 ++--
>  package/libxslt/libxslt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
