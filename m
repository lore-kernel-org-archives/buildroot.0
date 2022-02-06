Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6409C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D079401ED;
	Sun,  6 Feb 2022 09:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFCYcVFbdFTo; Sun,  6 Feb 2022 09:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CE2340120;
	Sun,  6 Feb 2022 09:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DED51BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AC118191E
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u28RpYpKsYo1 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:32:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6283818C2
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:32:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 968E140002;
 Sun,  6 Feb 2022 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644139938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4PCgILFP9UP4IiMno7XjSjT2OvXog/6FvbpA8HXOms=;
 b=lE9DsdfHE6DSmV44OTSpqQn1d/rTG0RJBF3gh2HzsZyYIxQloWeSGuDzKcuY7cUfeoNOcF
 1r5Ynbs32Gcn8mkSP8pbAPhPgiI0+Lkd5GfjsYp42y6Wc3ait3B+EQxvHcCDzXFMFuqpPD
 EqqnI8hSd2ZLG+0GEp0YlzzkUCo3PuwV8S1cGF1m98oUN7/q7/g+9CmY50A9rQPGpHLASu
 5/Mem+kUyydBWBP3X343BguxgnbIWcFuppbF9/f3lryQM7Dn81ZpcAFBITMD6JB5BKIh8Z
 +IVP7af2y8jb5qI79gLIghBBOIxD5+Wjk70aGAnQF7oX8S/3HceoCY4cfzJnbg==
Date: Sun, 6 Feb 2022 10:32:16 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220206103216.6d89c19e@windsurf>
In-Reply-To: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
References: <20220203225957.3039320-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/5] Fix genimage build failure on Gitlab-CI
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Feb 2022 23:59:52 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (5):
>   board/friendlyarm/nanopc-t4:use partition-type-uuid for genimage-15
>   board/friendlyarm/nanopi-m4:use partition-type-uuid for genimage-15
>   board/pine64/rockpro64:use partition-type-uuid for genimage-15
>   board/radxa/rockpi-4:use partition-type-uuid for genimage-15
>   board/radxa/rockpi-n10:use partition-type-uuid for genimage-15

Series applied, thanks

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
