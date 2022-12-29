Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26C340245;
	Thu, 29 Dec 2022 08:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26C340245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFbGLSE2btYH; Thu, 29 Dec 2022 08:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07ED5401DE;
	Thu, 29 Dec 2022 08:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ED5401DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCB051BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961B340578
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961B340578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFmraBSLyOdh for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F38040573
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F38040573
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:51:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA7DFE000A;
 Thu, 29 Dec 2022 08:51:33 +0000 (UTC)
Date: Thu, 29 Dec 2022 09:51:32 +0100
To: Robert Marko via buildroot <buildroot@buildroot.org>
Message-ID: <20221229095132.6bc83481@windsurf>
In-Reply-To: <20221219121838.1833159-1-robert.marko@sartura.hr>
References: <20221219121838.1833159-1-robert.marko@sartura.hr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672303894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VV5sEkBSTjGFHsNQJZ8wicmwqGuySNWFTf5ezTQetV4=;
 b=kyMQv/7JJ+FOvlEr6KjOTmPEVzUa3LbC8wDiKouO3OYibYZL3MLEEtQcqaPz25hyuX5jhC
 E6ubi4z+eQ2t7Xfe2dJKUrL6mz7S/qQT/R7I5/FZw5zPxvo7UUbMF0CiJhRPysFoIkuuvK
 ixcoZLaS2qvxaFdvNPdpKSDRWEllDDfgAZDYZzonBd9YZGcZs4Kp7W92z8Y9b27HTnrZpW
 cyHbEDYPsd8xzWTMfbVc/Wi4d8O3wjxuBBG/Ie9UHr78KaWkpL9E1tbKx+peeR/scOeubP
 C6JG8RvhJuRx6FYbtqhcqze82bbBjAWXARWf05XeYePGmI24eXKX5Mlw00MXoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kyMQv/7J
Subject: Re: [Buildroot] [PATCH] package/hostapd: enable 802.11ax support
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
Cc: Robert Marko <robert.marko@sartura.hr>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Dec 2022 13:18:38 +0100
Robert Marko via buildroot <buildroot@buildroot.org> wrote:

> Hostapd has 802.11ax support, however its currently disabled by default.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  package/hostapd/hostapd.mk | 1 +
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
