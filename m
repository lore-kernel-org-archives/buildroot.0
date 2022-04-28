Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF591C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950F741BF0;
	Thu, 28 Apr 2022 21:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkWcud4CNGTu; Thu, 28 Apr 2022 21:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB81541BE9;
	Thu, 28 Apr 2022 21:35:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7351BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 675F083E82
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSlk1qA0acD0 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:35:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BEC283E81
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:35:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60A7EE0005;
 Thu, 28 Apr 2022 21:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651181745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0K8UKl70ZmPsb1N/9ZgzBkLLWMd5713NehxtusH4a8=;
 b=lCCvHoZH6/sbF3P6Z/MJeSPp5HE0Q2evIT0y0MP42hfc6GPBPE3wGcsZ5II2tzQ6gHaWDb
 aX/ebROkh4AScyorlNuRJQ+eTwqNHhXxCAIP+NJgq3e1vjppI3F+PZEvIwDxQhm6Sf5R6J
 egn+Z62Z+C7Z5S7LvedSPlLMlWnlBYDUoSoaM2qasla9RFEzlWYdIY9uRDBVXdnZCVONH3
 ghKZHZdiyzqpFp+rPwD9OE7vbwz4NPGuF8b1Ff1Pjj6vlBLZz/HA3ZF8fuIBVOIvx/5t8h
 vIVG64ObT5T+LgLAY6T9uL+9KsBZ88qPrhS2ScNIx+PzKX8mqj8bsxwiMSfswg==
Date: Thu, 28 Apr 2022 23:35:44 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220428233544.58ad8a57@windsurf>
In-Reply-To: <20220428211355.3933644-1-bernd.kuhls@t-online.de>
References: <20220428211355.3933644-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to
 0.22.1
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

On Thu, 28 Apr 2022 23:13:55 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> http://stellarium.org/release/2022/04/16/stellarium-0.22.1.html
> 
> Removed backported patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...uilding-Stellarium-without-scripting.patch | 49 -------------------
>  package/stellarium/stellarium.hash            |  4 +-
>  package/stellarium/stellarium.mk              |  2 +-
>  3 files changed, 3 insertions(+), 52 deletions(-)
>  delete mode 100644 package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch

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
