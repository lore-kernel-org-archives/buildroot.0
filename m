Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6BDC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C0C84343;
	Sat, 17 Sep 2022 12:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C0C84343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKpEyvFLpKKH; Sat, 17 Sep 2022 12:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41B3A84316;
	Sat, 17 Sep 2022 12:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B3A84316
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2572C1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5EE541D97
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EE541D97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtEQ2lgt9ilf for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:50:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8427941D81
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8427941D81
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:50:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29AD9FF803;
 Sat, 17 Sep 2022 12:50:22 +0000 (UTC)
Date: Sat, 17 Sep 2022 14:50:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220917145021.1f31806c@windsurf>
In-Reply-To: <20220916185137.462176-1-giulio.benetti@benettiengineering.com>
References: <20220916185137.462176-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663419023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qucTFCO4eXRvjNgF9OsQ2kl89STsNVoujGPF7DVSs8w=;
 b=Z4RMlAGOYbuul/6d5B9o1GO6dehpd02xt8PT9FH8I/+J0pFea/1H4liomIPdHTvQmAO8cM
 Uh8D5ZH16IPFs83GDqJChm15qW6HjpHO+eQ6Wpcgl1ycl1q/pZnUvZqua00TUxWy5VkHFu
 nuQCviQO0Q1UMs7Joh4wzHM5NiFbIAN2gTM0bvp5PMKpwNROuEvr3JZxY2jNndLwwAbmRZ
 5zZgFbjQKy/rqpQW5Kf0wRAkFTfD51HCaWZ4ro7BHJyo105L4WU1Y6a8J+o907sgkmO1/z
 I7MsoVEjNvEwiyha+IDa9YuRLA8O/LBr9RPF8En0nxhRkF9CMGYocwUev9hR+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z4RMlAGO
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds/rtl8723ds: fix build
 failure due to missing Linux CONFIG_MMC
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Sep 2022 20:51:37 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This Wi-Fi module has an SDIO interface so we need to make sure Linux has
> CONFIG_MMC(that include SDIO APIs) enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1bb/1bb71019b7edd7f195223a85c81f70e5a60518f0/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8723ds/rtl8723ds.mk | 1 +
>  1 file changed, 1 insertion(+)

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
