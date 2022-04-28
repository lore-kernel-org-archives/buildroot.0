Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56E7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D85883F13;
	Thu, 28 Apr 2022 21:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQhjJmdCxfAQ; Thu, 28 Apr 2022 21:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E7C83EBF;
	Thu, 28 Apr 2022 21:22:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38A971BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3652161172
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vk1-_n7VEBED for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:22:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE2FA607CE
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:22:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3394C0002;
 Thu, 28 Apr 2022 21:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nW2eSCQTOTPSnRElngARB2BnB1Yt4+F16ldhH9wAbts=;
 b=C4C2VTQ2tlfu5OHruqTJ4A255sILEUoNMfvKJKt4pEUNFGmtePxZD0wc4Q/+C0JfabH6Ho
 WlBtnUVOj6JhE1tmcBi3qqzREpUXg2/Pb3SupmlHot0JAg17XtycYqjnlLUTrXwLrR5lv4
 zeazx0b+4plmVY9VCtRQ7U4bQbZTtq50CEdmUQwowwEMsm1Eps+oqT0aeihFzt+qQH5oap
 zU3bizvOM1I8nynjBd/juii4DvqKEC9AZtkfjW1oTfzXcVcieoL0NXAhFudCnbNBn2E72A
 Cs6q9Zse5FfSzD1mPYTVftEu4+Cd37OfDxZ1ts/fjOpWxMkDJjFSfbjf6w8vnw==
Date: Thu, 28 Apr 2022 23:22:51 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220428232251.223edbe6@windsurf>
In-Reply-To: <20220428201720.3150467-1-bernd.kuhls@t-online.de>
References: <20220428201720.3150467-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: bump version to 3.0.17.4
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 22:17:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: http://www.videolan.org/vlc/releases/3.0.17.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.hash | 8 ++++----
>  package/vlc/vlc.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
