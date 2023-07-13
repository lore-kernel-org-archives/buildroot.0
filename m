Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDF4C001DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 374A8417D6;
	Thu, 13 Jul 2023 20:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374A8417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nx94Qp2ZMKZW; Thu, 13 Jul 2023 20:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B06141796;
	Thu, 13 Jul 2023 20:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B06141796
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78EC81BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F56E83EDD
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F56E83EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bozKxbFP90gp for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:26:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3FCA83EDF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3FCA83EDF
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:26:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AB7240009;
 Thu, 13 Jul 2023 20:26:03 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:26:02 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230713222602.74bdb3b0@windsurf>
In-Reply-To: <20230713102320.124607-1-giulio.benetti@benettiengineering.com>
References: <20230713102320.124607-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689279963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ha94FUnb844psfnYd+Z/MoDJI1Bd2usWlLBk0rAznd4=;
 b=SSe1N8MauAkoncHnpgMJC+i2h9P4F2gqab8Zpcs7nkXeNs2bsNJ6UrWnUnJycsINdu0ED1
 1bM7lzZvy4rf1m5vAkxAnivW29j0qCMRXDaT2hUqnIUcE9gLj9tBwrZVciM+f9kF2NE5tD
 WkCvcMJ8GHfJiesJwy/lTVdMN8ihqaQM6IllzKtc22Gz5LiWTFnJ0LY6UR4ZzQrDyuPkwd
 pVfhk81CJymWRwd4lRCMvr8tj+y3HY+nEEzptE1IvXkrbxXzTCXPRwmb3bQuv/gS5qDTTL
 mTYeJMFebG779hXGylMWqmRrXujdf3O6mME0+Z8ZMGER9ldipwQVtIC3Rq57gA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SSe1N8Ma
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2023-07-13
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

On Thu, 13 Jul 2023 12:23:20 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With this patch Linux 6.3 is supported.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
